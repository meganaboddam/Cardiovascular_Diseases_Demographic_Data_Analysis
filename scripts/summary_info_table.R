# Libraries

library("dplyr")

# Summary Data Frame Function

create_summary_table <- function(df) {
  table <- df %>%
    filter(Break_Out_Category == "Gender") %>%
    group_by(Topic, Break_Out) %>%
    summarise(avg_percent = mean(Data_Value, na.rm = T)) %>%
    arrange(-avg_percent) %>%
    rename(Gender = Break_Out, Condition = Topic, Percent = avg_percent)
  return(table)
}
