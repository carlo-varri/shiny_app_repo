# Load necessary libraries
library(shiny)
library(gapminder)

# Define UI
ui <- fluidPage(
  titlePanel("Gapmxinder Data"),
  themeSelector(),
  sidebarLayout(
    sidebarPanel(
      selectInput("year", "Select a Year, Maria", choices = unique(gapminder$year)),
      selectInput("country", "Select a Country, Maria", choices = unique(gapminder$country))
    ),
    mainPanel(
      h4("Some information on your selected country, Maria", style = "color: gray;"),
      tableOutput("country_data")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Filter data based on user input
  selected_data <- reactive({
    gapminder %>% filter(year == input$year, country == input$country)
  })
  
  # Render table
  output$country_data <- renderTable({
    selected_data()
  })
}

# Run the application
shinyApp(ui = ui, server = server)
