# Libraries

library("dplyr")

# Summary Information List Function

create_summary_info_list <- function(df) {
  info <- list()

  info$avg_risk_percent_us <- df %>%
    filter(Category == "Risk Factors") %>%
    summarise(avg_percent = mean(Data_Value, na.rm = T)) %>%
    pull(avg_percent)

  info$most_prevalent_risk <- df %>%
    filter(Category == "Risk Factors") %>%
    group_by(Topic) %>%
    summarise(avg_percent = mean(Data_Value, na.rm = T)) %>%
    filter(avg_percent == max(avg_percent, na.rm = T)) %>%
    pull(Topic)

  info$avg_diseases_percent_us <- df %>%
    filter(Category == "Cardiovascular Diseases") %>%
    summarise(avg_percent = mean(Data_Value, na.rm = T)) %>%
    pull(avg_percent)

  info$most_prevalent_disease <- df %>%
    filter(Category == "Cardiovascular Diseases") %>%
    group_by(Topic) %>%
    summarise(avg_percent = mean(Data_Value, na.rm = T)) %>%
    filter(avg_percent == max(avg_percent, na.rm = T)) %>%
    pull(Topic)

  info$highest_risk_year <- df %>%
    filter(Category == "Risk Factors") %>%
    group_by(Year) %>%
    summarise(avg_percent = mean(Data_Value, na.rm = T)) %>%
    filter(avg_percent == max(avg_percent, na.rm = T)) %>%
    pull(Year)

  info$highest_diseases_year <- df %>%
    filter(Category == "Cardiovascular Diseases") %>%
    group_by(Year) %>%
    summarise(avg_percent = mean(Data_Value, na.rm = T)) %>%
    filter(avg_percent == max(avg_percent, na.rm = T)) %>%
    pull(Year)

  return(info)
}
