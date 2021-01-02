# Gender Page UI
page_three_layout <- tabPanel(
  "Gender",
  h1("Gender Differences"),
  p(
    "This is a chart that shows the population percentage in two main
      categories:",
    strong("CV disease and Risk Factors"),
    ". We are trying to see understand the gender differences for heart and
      blood vessels related health issues. The chart shows the mean percent for
    each disease from 2000 to 2017"
  ),
  sidebarLayout(
    sidebarPanel(
      h2("Parameters"),
      selectInput(
        "gender_var",
        label = "Gender",
        choices = list("Male" = "Male", "Female" = "Female")
      ),
      radioButtons(
        "cat_var",
        label = "Category",
        choices = list(
          "Diseases" = "Cardiovascular Diseases", "Risk Factors" =
            "Risk Factors"
        )
      )
    ),
    mainPanel(
      h2("Percentage Change by Gender Group"),
      plotlyOutput("p3_gender")
    )
  )
)
