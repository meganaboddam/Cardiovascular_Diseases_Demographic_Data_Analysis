library(shiny)

# The UI for the last page
page_six_layout <- tabPanel(
  "Outro",
  h1("Summary Takeaways"),
  h2("Gender"),
  p("Men tend to be more likely to develop various cardiovascular diseases than
    women, with every single type of disease having higher rates in men. Risk
    Factors are a different story, however, with two of the three risk factors
    higher in women. Here is a table breaking down the Major Cardiovasular
    Disease between the genders:"),
  tableOutput("p6_chart1"),
  p("Implications of this are that men are more at risk of contracting
    Cardiovascular Diseases than women. This may be due to a number of
    unexplained factors, but we do know that men smoke more than women do, which
    can explain some of shown difference."),
  h2("Race"),
  p("There are clear difference in Cardiovascular Disease by race. Other (which
    consists of races like Native American, Pacific Islander, etc.) have the
    highest Cardiovascular Disease rates, while Non-Hispanic Asians and
    Hispanics have the lowest rate. Non-Hispanic Black and Non-Hispanic White
    are in between these two groups. Hispanics seem to have the highest rates
    of Physical Inactivity, while people of other races have the highest
    rates of smoking. To help understand this trend, here is a table showing the
    rates of Major Cardiovasular Disease by race:"),
  tableOutput("p6_chart2"),
  p("The implications of this are that people who of small minorities (shown in
    the Other category) are at by far the highest risk. Non-Hispanic Black and
    Non-Hispanic White people are also at high risk. This may be to various
    socioeconomic factors that disadvantage people of those groups. Also,
    smoking may also help explain why people of small minorities are so much
    higher, since their rates of smoking are also high."),
  h2("Age"),
  p("As people get older, the more likely they are to contract Cardiovascular
    Diseases. More elderly people showed clearly higher rates than young people.
    Elderly people were also more likely to exhibit the risk factors associated
    with Cardiovascular Disease, with the lone exception being smoking. To help
    show this, here is a table showing the differences in Major Cardiovascular
    Disease by age:"),
  tableOutput("p6_chart3"),
  p("The implication is that elderly people are at a significant risk of
    Cardiovascular Diseases, while young adults are basically at no risk
    whatsoever. Age is a clear factor when in comes to CV rates, having the
    largest changes of any breakout group, as shown with the large differences
    in the plot above. This may be due to elderly people people more physically
    inactive or having hypertension, however it seems more likely that
    Cardiovascular rates rise with age, regardless of the other Risk Factors,
    due to the breaking down bodies of the elderly.")
)
