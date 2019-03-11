ui <- fluidPage(
  selectInput(inputId = "chosen_par", 
              label = "Graph", 
              choices = list("Region", "Unit", "Segment", "Business", "Year")),
  plotOutput(outputId = "graph")
) 
