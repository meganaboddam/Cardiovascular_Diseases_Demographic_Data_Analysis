# Read both datasets
df <- read.csv("data/NHIS-Data.csv", stringsAsFactors = FALSE)
geo_df <- read.csv("./data/hospital-outcome-measure-lat-long.csv")

# Server part
server <- function(input, output) {

  # Second page map code
  # The following variable allow certain column names of interest in p2_data to
  # be presented in a professional manner.
  p2_presentable <- c(
    "Heart Attack Mortality Rates",
    "Heart Failure Mortality Rates",
    "Readmission Rates due to Heart Attack",
    "Readmission Rates due to Heart Failure"
  )
  p2_column_names <- c(
    "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
    "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
    "Hospital.30.Day.Readmission.Rates.from.Heart.Attack",
    "Hospital.30.Day.Readmission.Rates.from.Heart.Failure"
  )
  names(p2_column_names) <- p2_presentable
  names(p2_presentable) <- p2_column_names

  p2_map_descrip <- function(column) {
    # description requested in the input to be inserted into the popup bubble
    # in the map
    return(paste(
      p2_data$Hospital.Name, "<br>",
      p2_data$Full.Address, "<br>",
      "Phone: ", p2_data$Phone.Number, "<br>",
      p2_presentable[column], ": ", p2_data[[column]]
    ))
  }

  output$p2_map <- renderLeaflet({
    p2_data <- read.csv("./data/hospital-outcome-measure-lat-long.csv",
      stringsAsFactors = FALSE, na.strings = "Not Available"
    )
    p2_data <- na.omit(p2_data)

    # Latitude and Longitude need to be converted from chr to num
    p2_data <- mutate(p2_data, latitude_n = as.numeric(Latitude))
    p2_data <- mutate(p2_data, longitude_n = as.numeric(Longitude))
    p2_map_palette <- colorNumeric(
      palette = "viridis",
      domain = p2_data[[input$p2_map_in]]
    )
    p2_map_i <- p2_data %>%
      leaflet() %>%
      addTiles() %>%
      setView(-95, 40, 3) %>%
      # coordinates that show USA clearly
      addCircles(
        lat = ~latitude_n,
        lng = ~longitude_n,
        label = ~ paste(County.Name, ", ", State),
        popup = ~ p2_map_descrip(input$p2_map_in),
        color = ~ p2_map_palette(p2_data[[input$p2_map_in]]),
        radius = 8000
      ) %>%
      addLegend(
        position = "bottomright",
        title = "Rate",
        pal = p2_map_palette,
        values = ~ p2_data[[input$p2_map_in]],
        opacity = 1
      )
    return(p2_map_i)
  })

  # Third page gender code
  output$p3_gender <- renderPlotly({
    gender_df <- df %>%
      filter(
        Category == input$cat_var, Data_Value_Type ==
          "Age-Standardized", Break_Out_Category == "Gender",
        Break_Out == input$gender_var
      ) %>%
      group_by(Topic) %>%
      summarize(Percent = mean(Data_Value, na.rm = TRUE))

    # customize color based on input values
    if (input$gender_var == "Male") {
      color <- "skyblue"
    } else {
      color <- "pink"
    }

    if (input$cat_var == "Risk Factors") {
      y_lim <- 95
    } else {
      y_lim <- 10
    }

    plot <- ggplot(data = gender_df) +
      geom_col(mapping = aes(x = Topic, y = Percent), fill = color) +
      coord_flip() +
      scale_y_continuous(limits = c(0, y_lim)) +
      labs(x = input$cat_var)
    return(ggplotly(plot))
  })

  # Fourth page race code
  output$p4_plot <- renderPlotly({
    df <- df %>%
      filter(
        Category == input$p4_radio, Year == input$p4_year,
        Break_Out_Category == "Race"
      ) %>%
      rename(Race = Break_Out) %>%
      group_by(Race, Topic) %>%
      summarise(Percent = mean(Data_Value, na.rm = T))

    plot <- ggplot(df, aes(x = Race, y = Percent, fill = Topic)) +
      geom_bar(stat = "identity", width = .5, position = "dodge") +
      theme(axis.text.x = element_text(angle = 65, vjust = 0.6)) +
      xlab("Races") +
      ylab(input$p4_radio)
    plot <- ggplotly(plot)
    return(plot)
  })

  # Fifth page age code
  output$age_plot <- renderPlotly({
    plot_data <- df %>%
      filter(
        Category == input$categorySelection,
        Data_Value_Type == "Crude",
        Break_Out_Category == "Age",
        LocationAbbr == "US",
        Year %in% input$yearRange
      ) %>%
      rename(Age = Break_Out,
             Value = Data_Value)

    # Filtering dataframe based on input values
    if (input$categorySelection == "Risk Factors") {
      plot_data <- plot_data %>%
        filter(Topic == input$riskSelection) %>%
        select(Year, Age, Value)
    } else {
      plot_data <- plot_data %>%
        filter(Topic == input$diseaseSelection) %>%
        select(Year, Age, Value)
    }

    plot_data <- na.omit(plot_data)

    age_plot <- ggplot(
      data = plot_data,
      aes(x = Year, y = Value)
    ) +
      geom_line(aes(colour = Age)) +
      labs(
        title = "Percentage Change by Age Group",
        x = "Years", y = "Percentage (%)",
        colour = "Age group"
      )

    age_plot <- ggplotly(age_plot)
    return(age_plot)
  })

  # Outro Plots
  # The outro consists of function of rendering table
  output$p6_chart1 <- renderTable({
    gender_plot <- df %>%
      filter(Category == "Cardiovascular Diseases", Data_Value_Type ==
        "Age-Standardized", Break_Out_Category == "Gender", Topic ==
        "Major Cardiovascular Disease") %>%
      group_by(Break_Out) %>%
      summarize(Percent = mean(Data_Value, na.rm = TRUE))
    colnames(gender_plot) <- c("Gender", "Rate of Major CV")
    return(gender_plot)
  })

  output$p6_chart2 <- renderTable({
    race_plot <- df %>%
      filter(Category == "Cardiovascular Diseases", Data_Value_Type ==
        "Age-Standardized", Break_Out_Category == "Race", LocationAbbr ==
        "US", Topic == "Major Cardiovascular Disease") %>%
      group_by(Break_Out) %>%
      summarize(
        Percent = mean(Data_Value, na.rm = TRUE)
      )
    colnames(race_plot) <- c("Race", "Rate of Major CV")
    return(race_plot)
  })

  output$p6_chart3 <- renderTable({
    plot_age <- df %>%
      filter(
        Category == "Cardiovascular Diseases", Break_Out_Category == "Age",
        LocationAbbr == "US", Topic == "Major Cardiovascular Disease"
      ) %>%
      group_by(Break_Out) %>%
      summarize(
        Percent = mean(Data_Value, na.rm = TRUE)
      )
    colnames(plot_age) <- c("Age Group", "Rate of Major CV")
    return(plot_age)
  })
}
