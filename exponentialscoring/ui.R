MaxScore = 20 # number of test simulations
ExpValue = MaxScore/2 # number of observations

shinyUI(pageWithSidebar(
    headerPanel("Exponential Scoring"),
    sidebarPanel(
        sliderInput('MaxScore', 'Max Score',
                    value = MaxScore/2, min = 5, max = MaxScore, step = 1),
        br(),
        sliderInput('ExpValue', 'Exponential Value',
                    value = 1, min = 1, max = ExpValue, step = 1)
    ),
    mainPanel(
        h4("Formula:"),
        h4("NewScore = MaxScore * (Score / MaxScore)^ExpValue"),
        h4("NewScore = ( (MaxScore + 1) ^ (Score / MaxScore) ) -1"),
        plotOutput('myExpCurve', width = "100%", height = "600px")
#        dataTableOutput('table'),
    )
))
