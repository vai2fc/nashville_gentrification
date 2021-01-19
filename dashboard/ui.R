shinyUI(dashboardPage(

    # Application title
    dashboardHeader(title = "Forces of Gentrification: Nashville, 2000-2010"),
    
    # Sidebar
    dashboardSidebar(
        # Create selector for gentrification status
        selectInput(
            "metric",
            h4("Select the measures to compare:"),
            choices = c("",
                        "Gentrification",
                        "Race / Ethnicity",
                        "Educational Attainment",
                        "Household Income",
                        "Housing Costs",
                        "HOLC Grade",
                        "Tornado Damage (within 10 years)",
                        "2010 Flood Damage"),
            selected = ""
        ),
        # Create checkbox for race
        checkboxGroupInput(
            "race",
            h4("Select race:"),
            choices = c("African American / Black",
                        "Asian",
                        "Indigenous American",
                        "White",
                        "Two or more races")
        ),
        # Create checkbox for ethnicity
        checkboxGroupInput(
            "ethnicity",
            h4("Select Hispanic / Latinx ethnicity:"),
            choices = c("Hispanic / Latinx",
                        "Not Hispanic / Latinx")
        ),
        # Create checkbox for educational attainment
        checkboxGroupInput(
            "education",
            h4("Select educational attainment for residents 25+:"),
            choices = c("No HS",
                        "HS degree or equivalent",
                        "Some college",
                        "Associate's degree",
                        "Bachelor's degree",
                        "Some graduate school",
                        "Master's degree",
                        "Professional degree",
                        "Doctorate")
        ),
        # Create checkbox for income
        checkboxGroupInput(
            "income",
            h4("Select annual household income brackets:"),
            choices = c("< $10,000",
                        "$10,000 - $19,999",
                        "$20,000 - $29,999",
                        "$30,000 - $39,999",
                        "$40,000 - $49,999",
                        "$50,000 - $59,999",
                        "$60,000 - $69,999",
                        "$70,000 - $79,999",
                        "$80,000 - $89,999",
                        "$90,000 - $99,999",
                        "$100,000 - $109,999",
                        "$110,000 - $119,999",
                        "$120,000 - $129,999",
                        "$130,000 - $139,999",
                        "$140,000 - $149,999",
                        "$150,000 - $159,999",
                        "$160,000 - $169,999",
                        "$170,000 - $179,999",
                        "$180,000 - $189,999",
                        "$190,000 - $199,999",
                        ">= $200,000")
        ),
        # Create slider for rent
        checkboxGroupInput(
            "rent",
            h4("Select monthly housing costs:"),
            choices = c("< $100",
                        "$100 - $199",
                        "$200 - $299",
                        "$300 - $399",
                        "$400 - $499",
                        "$500 - $599",
                        "$600 - $699",
                        "$700 - $799",
                        "$800 - $899",
                        "$900 - $999",
                        "$1,000 - $1,099",
                        "$1,100 - $1,199",
                        "$1,200 - $1,299",
                        "$1,300 - $1,399",
                        "$1,400 - $1,499",
                        "$1,500 - $1,599",
                        "$1,600 - $1,699",
                        "$1,700 - $1,799",
                        "$1,800 - $1,899",
                        "$1,900 - $1,999",
                        ">= $2,000")
        )
        ),
    
    # Body
    dashboardBody(
        # Set the dashboard theme
        shinyDashboardThemes(theme = "grey_light"),
        
        # Create some tabs
        tabsetPanel(
            tabPanel("Demographic Shifts",
            # Create boxes to style each plot
                fluidRow(
                    # Left Map for 2000 data
                    column(width = 6,
                        box(title = "2000",
                            width = NULL,
                            leafletOutput("map_2000"))
                    ),
                    # Right Map for 2010 data
                    column(width = 6,
                        box(title = "2010",
                            width = NULL,
                            leafletOutput("map_2010"))
                    )
                )
            ),
            
            tabPanel("Historical and Natural Forces",
                     # Create boxes to style each plot
                     fluidRow(
                         # Left Map for 2000 data
                         column(width = 6,
                                box(width = NULL,
                                    leafletOutput("holc_map"))
                         ),
                         # Right Map for 2010 data
                         column(width = 6,
                                box(width = NULL,
                                    leafletOutput("tornado_map"))
                         )
                     )
            )
        )
        
        
    )
))
