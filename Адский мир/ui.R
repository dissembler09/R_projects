library(shiny)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
 titlePanel("Hello World"),

    # Sidebar with a slider input for number of bins
 sidebarLayout(
 sidebarPanel(
 sliderInput("bins",
                        "Number of bins:",
                        1 = 1,
                        50 = 50,
                        30 = 30)
        ),

        # Show a plot of the generated distribution
 mainPanel(
 plotOutput("distPlot")
        )
    )
)
