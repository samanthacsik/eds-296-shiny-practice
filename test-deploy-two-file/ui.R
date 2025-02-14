# user interface (ui) ----
ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # (Page 1) intro tabPanel ----
  tabPanel(
    
    title = "About this app",
    
    # intro text fluidRow ----
    fluidRow(
      
      column(1),
      column(10, includeMarkdown("text/about.md")),
      column(1)
      
    ), # END intro text fluidRow
    
    hr(), # creates horizontal line
    
    # footer text ----
    includeMarkdown("text/footer.md")
    
  ), # END (Page 1) intro tabPanel
  
  # (Page 2) data viz tabPanel ----
  tabPanel(title = "Explore the Data",
           
           # tabsetPanel to contain tabs for data viz ----
           tabsetPanel(
             
             # trout tabPanel ----
             tabPanel(title = "Trout",
                      
                      # trout sidebarLayout -----
                      sidebarLayout(
                        
                        # trout sidebarPanel ----
                        sidebarPanel(
                          
                          # channel type pickerInput ----
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s):",
                                      choices = unique(clean_trout$channel_type),
                                      selected = c("cascade", "pool"), 
                                      multiple = TRUE,
                                      options = pickerOptions(actionsBox = TRUE)), # END  channel type pickerInput
                          
                          # section checkboxGroupButtons ----
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select a sampling section(s):",
                                               choices = unique(clean_trout$section),
                                               selected = unique(clean_trout$section),
                                               individual = FALSE, justified = TRUE,
                                               size = "sm",
                                               checkIcon = list(
                                                 yes = icon("check", lib = "font-awesome"),
                                                 no = icon("xmark", lib = "font-awesome")
                                               )) # END section checkboxGroupButtons
                          
                          
                        ), # END trout sidebarPanel
                        
                        # trout mainPanel ----
                        mainPanel(
                          
                          plotOutput(outputId = "trout_scatterplot_output") |> 
                            withSpinner(color = "blue", type = 6, size = 3)
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel
             
             # penguin tabPanel ----
             tabPanel(title = "Penguins",
                      
                      # penguin sidebarLayout ----
                      sidebarLayout(
                        
                        # penguin sidebarPanel ----
                        sidebarPanel(
                          
                          # island pickerInput ----
                          pickerInput(inputId = "penguin_island_input",
                                      label = "Select an island(s):",
                                      choices = c("Torgersen", "Dream", "Biscoe"),
                                      selected = c("Torgersen", "Dream", "Biscoe"),
                                      multiple = TRUE,
                                      options = pickerOptions(actionsBox = TRUE)),
                          
                          sliderInput(inputId = "bin_num_input",
                                      label = "Select number of bins:",
                                      min = 1, max = 100,
                                      value = 25)
                          
                        ), # END penguin sidebarPanel 
                        
                        # penguin mainPanel ----
                        mainPanel(
                          
                          plotOutput(outputId = "flipper_length_histogram_output") |> 
                            withSpinner(color = "orange", type = 5, size = 2)
                          
                        ) # END penguin mainPanel
                        
                      ) # END penguin sidebarLayout
                      
             ) # END penguin tabPanel
             
           ) # END tabsetPanel
           
  ) # END (Page 2) data viz tabPanel ----
  
) # END navbarPage