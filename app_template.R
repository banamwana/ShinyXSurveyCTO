library(shiny)
library(httr)
library(jsonlite)

# Your SurveyCTO login information
username <- 'user@company.org'
credential <- '################'


# Define UI ----
ui <- fluidPage(
  
  titlePanel('Shiny App from Survey CTO'),
  plotOutput('plot')
  
)

# Define server logic ----
server <- function(input, output) {
  
  # The date to filter data from
  # Convert your date at https://www.epochconverter.com/
  # You can enter '0', but this will trigger SurveyCTO to block 
  # any further requests for as much as 400 seconds, which can break the app!!
  date <- '1583064000' # March 1, 2020
  formID <- 'Form ID'
  
  # Construct request url
  url <- paste0('https://<YOUR SERVER>.surveycto.com/api/v2/forms/data/wide/json/', formID, '?date=', date)
  
  # Make API request
  my_request <- GET(url, authenticate(username, credential))

  # retrieve the contents of a request as a character vector
  my_request_txt <- content(my_request, 'text')

  # convert from JSON data to R object
  data <- fromJSON(my_request_txt, flatten = T)
  
  my_plot <- function(data){
   
    # Make your plot here
     
  }
  
  output$plot <- renderPlot(my_plot())
  
  
}


shinyApp(ui = ui, server = server)
