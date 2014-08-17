library(shiny)

shinyUI(
    fluidPage(
        # Application title
        titlePanel("Grade Calculator and Progress Report (2014 Fall)"),
        # Sidebar with data inputs
        sidebarLayout(
            sidebarPanel(
                h3("Please provide your grades"),
                # By using <fluidRow>, one can add columns
                fluidRow(
                    column(3, 
                        h4("Quizzes", align="center"),   
                        numericInput("quiz1", "Quiz 1:", value = 11),
                        numericInput("quiz2", "Quiz 2:", 12.5),
                        numericInput("quiz3", "Quiz 3:", 13),
                        numericInput("quiz4", "Quiz 4:", 9),
                        numericInput("quiz5", "Quiz 5:", 7.5),
                        numericInput("quiz6", "Quiz 6:", 14),
                        numericInput("quiz7", "Quiz 7:", 13.5),
                        numericInput("quiz8", "Quiz 8:", 15)
                    ),
                    column(3,
                        h4("HWs", align="center"),
                        numericInput("hw1", "HW 1:", 21.5),
                        numericInput("hw2", "HW 2:", 22),
                        numericInput("hw3", "HW 3:", 23.5),
                        numericInput("hw4", "HW 4:", 20),
                        numericInput("hw5", "HW 5:", 25)
                    ),
                    column(3,
                        h4("Exams", align="center"),
                        numericInput("exam1", "Exam 1:", 83.5),
                        numericInput("exam2", "Exam 2:", 91),
                        numericInput("final", "Final:", 112.5),
                        br(),
                        br(),
                        h4("Participation", align="center"),
                        numericInput("cp", "Participation:", 15)
                    )
                ), # END fluidRow
                #submitButton("Submit")
                fluidRow(
                    column(2, actionButton("submitButton", "Submit")),
                    column(2, actionButton("clearButton", "Clear"))
                )
                
            ), # END sidebarPanel
            # Show the results
            mainPanel(
                h3("Your progress report"),
                p("The following plots shows your progress for each assignment (dashed line) and overall performance (solid line) before and after dropping the lowest quiz grade."),
#                 textOutput("quizGrades"),
                h4("Percentages before Adjustment", align="center"),
                plotOutput("gradePlot"),
                h4("Percentages after Adjustment (Retrospectively)", align="center"),
                plotOutput("gradePlot_adj"),
                h4("Numerical facts"),
                textOutput("totalEarned_text")
            )       
        )
    )    
)