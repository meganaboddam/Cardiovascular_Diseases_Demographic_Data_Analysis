p2_data <- read.csv("./data/hospital-outcome-measure-lat-long.csv",
  stringsAsFactors = FALSE, na.strings = "Not Available"
)
p2_data <- na.omit(p2_data)

# Latitude and Longitude need to be converted from chr to num
p2_data <- mutate(p2_data, latitude_n = as.numeric(Latitude))
p2_data <- mutate(p2_data, longitude_n = as.numeric(Longitude))

# Lines 15-26 allow certain column names of interest in p2_data to be presented
# in a professional manner.
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

p2_server <- function(input, output) {
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
}

p2_sidepanel <- sidebarPanel(
  h6("Please provide the following input"),
  radioButtons(
    inputId = "p2_map_in",
    label = h5("Variable To Display on Map"),
    choices = p2_column_names,
    selected = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
  )
)

p2_mainpanel <- mainPanel(
  h1("Heart Disease Related Mortality and Readmission Rates in USA Hospitals"),
  h6("Press circle on map for more data on the hospital
     represented by the circle"),
  p(strong("Importance of Visualization:"), "This map describes the basic
  statistics of life with heart diseases in the US. Mortality rates are on the
  range of 8 to 20 percent. Readmission rates are on the range of 16 to 32
  percent. Mortality due to heart attack is higher than mortality due to heart
  failure in a typical hospital month. Readmission due to heart failure is high
  than readmission due to heart attack. Overall, this shows the widespread
  presence of heart disease in every state in the US. Moreover, it shows the
  lethal nature of the disease. If it is not lethal, it ends up being a
  long-term disease with repeat hospitalizations. Hospital stays are generally
  very expensive, so it also wrecks the economic and emotional resources of
  patients and societies."),
  leafletOutput("p2_map"),
  p(
    strong("Description of Data:"), "Heart attacks are sudden, and there is
  little prior notice of the disease. Heart failure involves having prolonged
  knowledge of the presence of the disease in the patient. Data is from",
    em("http://data.medicare.gov/"), " June, 2016."
  )
)

page_two_layout <- tabPanel(
  "Map",
  sidebarLayout(
    p2_sidepanel,
    p2_mainpanel
  )
)
