# Load sources files for separate ui functions
source("final_rfiles/intro.R")
source("final_rfiles/map.R")
source("final_rfiles/gender.R")
source("final_rfiles/race.R")
source("final_rfiles/age.R")
source("final_rfiles/outro.R")

# Individual Page UI
# Each page UI is consists of page title and a variable with layout information
page_one <- tabPanel(
  "Introduction",
  page_one_layout,
)

page_two <- tabPanel(
  "Geographic Info",
  page_two_layout
)

page_three <- tabPanel(
  "Gender",
  page_three_layout
)

page_four <- tabPanel(
  "Race",
  page_four_layout
)

page_five <- tabPanel(
  "Age",
  page_five_layout
)

page_six <- tabPanel(
  "Discussion",
  page_six_layout
)

# Application control UI
ui <- fluidPage(
  includeCSS("style.css"),
  theme = shinytheme("united"),
  navbarPage(
    "Final Deliverable",
    page_one,
    page_two,
    page_three,
    page_four,
    page_five,
    page_six
  )
)
