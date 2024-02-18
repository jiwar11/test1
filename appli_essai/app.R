#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(stringr)

# UI
ui <- fluidPage(
  titlePanel("Ranger des mots par ordre alphabétique"),
  sidebarLayout(
    sidebarPanel(
      textInput("mots", "Entrez des mots (séparés par des virgules et sans espace)"),
      actionButton("Bouttonsort", "Trier")
    ),
    mainPanel(
      textOutput("mots_tri")
    )
  )
)

# Server
server <- function(input, output, session) {
  liste <- reactiveVal(NULL)
  
  observeEvent(input$Bouttonsort, {
    x <- strsplit(input$mots, ",")[[1]]
    mots_tri <- paste(sort(x), collapse = ", ")
    liste(mots_tri)
  })
  
  output$mots_tri <- renderPrint({
    print(liste())
  })
}

# Run the application 
shinyApp(ui = ui, server = server)