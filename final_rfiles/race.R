# This will be the ui layout for the race tab in the ui.
page_four_layout <- tabPanel(
  "Race",
  h1("Race's Distributions by Year"),
  p("This visualization of the data allows you to compare each race that the
    data set provided. Under dimensions you can choose to display either
    cardiovascular diseases or risk factors as well the year. This allows you to
    compare how each race is affected respectively each year by cardiovascular
    diseases or risk."),
  sidebarLayout(
    sidebarPanel(
      h2("Parameters"),
      # radio button input for choosing between risk and cardiovascular
      # agdiseases.
      radioButtons(
        inputId = "p4_radio",
        label = h3("Category"),
        choices = list(
          "Cardiovascular Diseases" = "Cardiovascular Diseases",
          "Risk Factors" = "Risk Factors"
        ),
        selected = "Cardiovascular Diseases"
      ),
      # Slider to input for choosing between the year which will be displayed.
      sliderInput(
        inputId = "p4_year",
        label = h3("Year"),
        min = 2000,
        max = 2017,
        value = 2000,
        round = T
      )
    ),
    mainPanel(
      h2("Distribution Graph"),
      plotlyOutput(
        outputId = "p4_plot"
      )
    )
  )
)
