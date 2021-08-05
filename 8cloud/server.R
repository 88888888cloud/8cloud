#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
data('iris')
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    var <- reactiveValues(table = iris)
    ##
    observeEvent(input$data_upload, {
        reg(input$data_upload)
        initial_data <- read.csv(input$data_upload$datapath,header = TRUE)
        var$table <- initial_data
    })
    output$datatable <- renderDataTable({var$table[,-1]})
    ##scatter plot
    output$scatter_plot <- renderPlot({
        x <- var$table[,input$scatter_x]
        y <- var$table[,input$scatter_y]
        plot(x,y,xlab=input$scatter_x,ylab=input$scatter_y)
    })
    ##pie chart
    output$pie_plot <- renderPlot({
        feature <- var$table[,input$pie_feature]
        feature_count <- table(feature)
        pie(feature_count)
    })
    
})
