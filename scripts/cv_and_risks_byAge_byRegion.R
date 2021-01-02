library(dplyr)
library(tidyr)
library(ggplot2)

cv_risks_age_and_region <- function(data_set) {
  data_1 <- data_set %>%
    filter(Break_Out_Category == "Age") %>%
    filter(LocationDesc != "United States") %>%
    group_by(Break_Out) %>%
    ggplot(aes(x = Break_Out, y = Data_Value, fill = Category)) +
    geom_boxplot() +
    facet_wrap(~LocationDesc) +
    labs(
      title = "Prevalence Rates of CV Diseases and their Risk Factors",
      x = "Age Group (in years)",
      y = "Prevalence Rate (%)",
      fill = ""
    ) +
    theme_classic()
  result <- data_1
  return(result)
}
