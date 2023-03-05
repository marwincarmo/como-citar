library(shiny)

# Define UI for shiny app
ui <- fluidPage(
    titlePanel("Voting App"),
    sidebarLayout(
        sidebarPanel(
            h4("Select options:"),
            checkboxGroupInput(
                "options",
                label = NULL,
                choices = c("Option 1", "Option 2", "Option 3")
            ),
            br(),
            textInput("new_option", label = "Add a new option:"),
            actionButton("add_option", "Add")
        ),
        mainPanel(
            h4("Results:"),
            verbatimTextOutput("results")
        )
    )
)

# Define server logic for shiny app
server <- function(input, output) {
    options <- reactiveValues(choices = c("Option 1", "Option 2", "Option 3"))
    
    observeEvent(input$add_option, {
        new_option <- input$new_option
        if (!is.null(new_option) && !new_option %in% options$choices) {
            options$choices <- c(options$choices, new_option)
        }
    })
    
    output$results <- renderPrint({
        paste("Selected options:", paste(input$options, collapse = ", "))
    })
}

# Run shiny app
shinyApp(ui = ui, server = server)
