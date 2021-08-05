data('iris')
scatter_ui <- fluidPage(
  box(
    selectizeInput('scatter_x',label='X',choices=colnames(iris)),
    selectizeInput('scatter_y',label='Y',choices=colnames(iris))
  ),
  box(
    plotOutput('scatter_plot')
  )
)

pie_ui <- fluidPage(
  box(
    selectizeInput('pie_feature',label='feature',choices=colnames(iris))
  ),
  box(
    plotOutput('pie_plot')
  )
)

