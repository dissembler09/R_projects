library(shiny)
library(highcharter)


ui <- fluidPage(

  titlePanel("Greet User!"),

  sidebarLayout(

    sidebarPanel(

      h3("Your Input"),

      sliderInput(
        inputId = "slider_user", 
        label = "Number of points", 
        min = 10, 
        max = 100, 
        value = 50 
      ),

      numericInput(
        inputId = "mean_user",
        label = "Mean",
        min = -5,
        max = 10,
        value = 70
      ),

      numericInput(
        inputId = "sd_user",
        label = "STD",
        min = 1, 
        max = 100, 
        value = 50 
      )


    ),

    mainPanel(

      h3("User Greeting"),

      highchartOutput("user_highchart")

    )
  )

)

server <- function(input, output) {

  output$user_highchart <- renderHighchart({

    df <-  data.frame(
      x = rnorm(
        input$slider_user,
        input$mean_user,
        input$sd_user
      ),
      y = rnorm(input$slider_user,5,30)
    )

    hchart(
      df,
      "point",
      hcaes(
        x = x,
        y = y
      )
    )


  })

}

shinyApp(ui = ui, server = server)
