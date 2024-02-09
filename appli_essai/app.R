#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library (stringr)

#ui
ui <- fluidPage(
#titre
  titlePanel("Ranger des mots par ordre alphabétique"),
  sidebarLayout(
    sidebarPanel(
      textInput("mots", "Entrez des mots (séparés par des virgules et sans espace)"),
      actionButton("Bouttonsort", "Trier")
    ),
    mainPanel(
      textOutput("Mots triés")
    )
  )
)

# server
server <- function(input, output, session) {
  liste <- renderText(
  
  observeEvent(input$Bouttonsort, {
    x <- strsplit(input$mots,",")
    mts <- trimws(x)  # Supprimer les espaces autour des mots
# Convertir les éléments en caractères avant de trier
    mots_tri <- paste(sort(as.character(mts)), collapse = ", ")
  }))
  
  output$mots_tri <- renderPrint({
  liste()
  })
}
# Run the application 
shinyApp(ui = ui, server = server)
