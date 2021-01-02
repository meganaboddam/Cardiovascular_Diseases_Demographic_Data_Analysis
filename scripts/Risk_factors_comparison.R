# Load R packages
library(dplyr)
library(ggplot2)

# Function that creates the line graph
create_line_graph <- function(dataframe) {
  graph_data <- dataframe %>%
    filter(
      Category == "Risk Factors",
      Data_Value_Type == "Crude",
      Break_Out_Category == "Age",
      LocationAbbr == "US",
      !Topic == "Hypertension"
    ) %>%
    select(Year, Topic, Break_Out, Data_Value)

  graph_data <- na.omit(graph_data)

  plot <- ggplot(
    data = graph_data,
    aes(x = Year, y = Data_Value)
  ) +
    geom_line(aes(colour = Break_Out)) +
    facet_wrap(~Topic) +
    labs(
      title = "Risk Factors Percentage Change by Age Group",
      x = "Years", y = "Percentage (%)",
      colour = "Age group"
    )

  return(plot)
}
