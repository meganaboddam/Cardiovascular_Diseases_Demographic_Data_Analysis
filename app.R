# Load Packages
library(shiny)
library(leaflet)
library(shinyWidgets)
library(ggplot2)
library(plotly)
library(dplyr)
library(shinythemes)
library(leaflet)

# Load sources
source("app_ui.R")
source("app_server.R")

# Starting shiny application
shinyApp(ui = ui, server = server)
