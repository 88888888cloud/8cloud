#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
source('sub_ui.R')
# Define UI for application that draws a histogram
dashboardPage(skin = 'red',
              dashboardHeader(
                  title = 'Practice'
              ),
              dashboardSidebar(
                  sidebarMenu(
                      menuItem('Input Data',tabName = 'data',icon = icon('table')),
                      menuItem('Plot',tabName = 'customer',icon = icon('image'),
                               menuItem('Scatter',tabName = 'Scatter',icon = icon('braille')),
                               menuItem('Pie',tabName = 'Pie',icon = icon('chart-pie')),
                               menuItem('Bar',tabName = 'Bar',icon = icon('chart-bar')),
                               menuItem('Bubble',tabName = 'Bubble',icon = icon('soap')))
                  )
              ),
              dashboardBody(
                  tabItems(
                      tabItem(tabName = 'data',
                              fluidPage(
                                  fileInput('data_upload','Data',
                                            accept = c('text/csv','text/comma-separated-value','.csv')),
                                  tags$script(
                                      '$("#data_upload").on("click",function(){
                              this.value = null;});'
                                  ),
                                  actionButton('upload','upload',icon = icon('upload'))
                              ),
                              dataTableOutput('datatable')
                      ),
                      tabItem(tabName = 'Scatter',
                              scatter_ui),
                      tabItem(tabName = 'Pie',
                              pie_ui),
                      tabItem(tabName = 'Bar',
                              uiOutput('Bar_body')),
                      tabItem(tabName = 'Bubble',
                              uiOutput('Bubble_body'))              
                  ))
)

