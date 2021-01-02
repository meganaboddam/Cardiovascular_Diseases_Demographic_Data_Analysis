# Variable that have mainpannel information
page_five_mainpannel <- mainPanel(
  plotlyOutput(
    outputId = "age_plot"
  )
)

# Variable that has sidepannel information
page_five_sidepannel <- sidebarPanel(
  radioButtons(
    inputId = "categorySelection",
    label = "Choose your category:",
    choices = list(
      "Risk Factors" = "Risk Factors",
      "Cardiovascular Diseases" = "Cardiovascular Diseases"
    ),
    selected = "Risk Factors"
  ),
  conditionalPanel(
    condition = "input.categorySelection == 'Risk Factors'",
    radioButtons(
      inputId = "riskSelection",
      label = "Choose Risks:",
      choices = list(
        "Smoking" = "Smoking",
        "Physical Inactivity" = "Physical Inactivity"
      ),
      selected = "Smoking"
    )
  ),
  conditionalPanel(
    condition = "input.categorySelection == 'Cardiovascular Diseases'",
    radioButtons(
      inputId = "diseaseSelection",
      label = "Choose Dieases:",
      choices = list(
        "Stroke" = "Stroke",
        "Coronary Heart Disease" = "Coronary Heart Disease",
        "Major Cardiovascular Disease" = "Major Cardiovascular Disease",
        "Acute Myocardial Infarction (Heart Attack)" =
          "Acute Myocardial Infarction (Heart Attack)"
      ),
      selected = "Stroke"
    )
  ),
  checkboxGroupInput(
    inputId = "yearRange",
    label = "Choose years to display",
    choices = list(
      "2000" = 2000,
      "2001" = 2001,
      "2002" = 2002,
      "2003" = 2003,
      "2004" = 2004,
      "2005" = 2005,
      "2006" = 2006,
      "2007" = 2007,
      "2008" = 2008,
      "2009" = 2009,
      "2010" = 2010,
      "2011" = 2011,
      "2012" = 2012,
      "2013" = 2013,
      "2014" = 2014,
      "2015" = 2015,
      "2016" = 2016,
      "2017" = 2017
    ),
    selected = c(2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009,
                 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017)
  )
)

# Page layout UI information
page_five_layout <- tabPanel(
  "Age",
  h1("Age Group Comparison"),
  p(
    "The following chart shows the percentage change of population in age groups
    for selected topics under the main categories. We are trying to understand
    if ",
    strong("age"),
    "is a factor in considering CV diseases and see which age group is being
    affected the most by both the CV disease and risk factors."
  ),
  sidebarLayout(
    page_five_sidepannel,
    page_five_mainpannel
  )
)
