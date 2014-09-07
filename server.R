library(shiny)
BMI_calc<-function(wt,ht)
{
  ht=ht/100
  BMI = wt/(ht^2)
  BMI
}
BMI_category<-function(wt,ht)
{
  BMIvalue=BMI_calc(wt,ht)
  if(BMIvalue<15) category = "Very severely underweight"
  else if (BMIvalue<16) category =  "Severely underweight"
  else if (BMIvalue<18.5) category =  "Underweight"
  else if (BMIvalue<25) category =  "Healthy weight"
  else if (BMIvalue<30) category = "overweight"
  else if (BMIvalue<35) category =  "Moderately obese"
  else if (BMIvalue<40) category =  "Severely obese"
  else category = "Very severely obese"
  
  category
}
shinyServer(
  function(input, output) {
    output$inputwt <- renderPrint({input$wt})
    output$inputht <- renderPrint({input$ht})
    output$bmi <- renderPrint({BMI_calc(input$wt,input$ht)})
    output$interpretation <- renderPrint({BMI_category(input$wt,input$ht)})
  }
)