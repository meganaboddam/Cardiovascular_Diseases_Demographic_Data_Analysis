library(shiny)
library(shinyWidgets)

image_var <- paste0("https://my-alternativehealth.com/wp-content/uploads/2015",
                    "/11/internal-discomfort.jpg")
page_one_layout <- fluidPage(
  img(src = image_var, width = 250, height = 250),
  column(10,
    offset = 1,
    h1("Cardiovascular Diseases and their Risk Factors")
  ),
  column(8,
    offset = 2,
    p("Understanding demographics and risk factors behind cardiovascular
            diseases (or heart diseases) is crucial in our aging world. As
            people are living longer, they are also accruing more diseases.
            Some of these diseases, most prominently cardiovascular diseases,
            can be directly tied in with lifestyle choices. It is important to
            keep the messages learned from the data presented here and apply
            it to our own lives."),
    h2("This website is dedicated to our healthy futures."),
    p("The information presented in this website is collected from the
            following sources"),
    tagList(
      "Hospital Outcome Measures Data: ",
      a("source - data.medicare.gov",
        href = "https://datascience-enthusiast.com/R/hospital_rank.html"
      )
    ),
    br(),
    tagList(
      "Cardiovascular Diseases, Demographics, Risks: ",
      a("source - National Health Interview Survey",
        href = "https://healthdata.gov/dataset/national-health-interview-survey
        -nhis-national-cardiovascular-disease-surveillance-data"
      )
    )
  )
)
