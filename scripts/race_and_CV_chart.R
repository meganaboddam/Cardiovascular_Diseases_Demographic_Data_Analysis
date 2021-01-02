# Load in R packages and the data
library(dplyr)
library(tidyr)
library(ggplot2)

# Write the function that creates the chart
bar_chart <- function(dataframe) {
  plot_data <- df %>%
    filter(Category == "Cardiovascular Diseases", Data_Value_Type ==
      "Age-Standardized", Break_Out_Category == "Race", LocationAbbr ==
      "US", Topic == "Major Cardiovascular Disease") %>%
    group_by(Break_Out) %>%
    summarize(
      Low = mean(LowConfidenceLimit, na.rm = TRUE),
      Mean = mean(Data_Value, na.rm = TRUE),
      High = mean(HighConfidenceLimit, na.rm = TRUE)
    ) %>%
    gather(key = type, value = number, -Break_Out)
  plot <- ggplot(data = plot_data) +
    geom_col(
      mapping = aes(x = Break_Out, y = number, fill = type), position =
        "dodge"
    ) +
    coord_flip() +
    labs(
      title = "Average Rate of CV By Race", x = "Race", y = "Percent With CV",
      fill = "Estimate Type"
    )
  return(plot)
}
