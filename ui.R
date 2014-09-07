library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Body Mass Index (BMI) Calculator"), ## Heading
    sidebarPanel(
      numericInput('wt', 'Please enter your weight in kilograms', 50) , ##Inputting weight
      numericInput('ht', 'Please enter your height in centimeters', 160, min = 50, max = 250, step = 1), ## Inputting height
      submitButton('Submit') ##Submit butotn
    ),
    mainPanel(
      ##Introduction text
      h4('This app calculates your BMI score according to the height and weight you enter at panel on the left side. It also tells you which category you belong to depending on your BMI score.'),
      p(em("Documentation:",a("BMI Calculator",href="http://arjhunh.github.io/BMICalc/index.html#1"))),
      p('The body mass index (BMI), is a measure of relative weight based on an individual\'s mass and height. A frequent use of the BMI is to assess how much an individual\'s body weight departs from what is normal or desirable for a person of his or her height.'),
      p('The following is the classification according to BMI values :'),
      tags$div(
        tags$ul(
          tags$li('BMI less than 15    : Very severely underweight'),
          tags$li('BMI from 15 to 16   : Severely underweight'),
          tags$li('BMI from 16 to 18.5 : Underweight'),
          tags$li('BMI from 18.5 to 25 : Healthy weight'),
          tags$li('BMI from 25 to 30   : Overweight'),
          tags$li('BMI from 30 to 35   : Moderately Obese'),
          tags$li('BMI from 35 to 40   : Severely Obese'),
          tags$li('BMI above 40        : Very severely Obese')
        )
      ),
      h4('Weight you have entered : '), verbatimTextOutput("inputwt"),
      h4('Height you have entered : '), verbatimTextOutput("inputht"),
      h4('BMI value :'),
      verbatimTextOutput("bmi"),
      h4('Interpretation : '),strong(verbatimTextOutput("interpretation"))
    )
  )
)
