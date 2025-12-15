library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(DT)
library(readr)
library(ggpmisc)
# helped with ggpmisc https://rdrr.io/github/aphalo/ggpmisc/man/

# Load data
indy <- read_csv("C:/Users/james/Downloads/Indy 500 Race Summaries.csv", trim_ws = TRUE) %>%
  # Remove completely empty rows (usually caused by blank lines at the bottom)
  filter(if_any(everything(), ~ !is.na(.))) %>%
  # Remove unnamed column (e.g. created by trailing comma)
  select(where(~ !all(is.na(.))))
View(indy)

# Clean and convert, including Race Time → decimal hours
indy <- indy %>%
  mutate(
    Year = as.numeric(Year),
    Start = as.numeric(Start),
    Car.Num. = as.numeric(`Car Num.`),
    Qual.Speed = as.numeric(`Qual Speed`),
    Race.Speed = as.numeric(`Race Speed`),
    Driver = as.factor(Driver),
    Car.Name.Entrant = as.factor(`Car Name/Entrant`),
    Make.Model = as.factor(`Make/Model`),
    Race.Time.Hours = as.numeric(sapply(strsplit(as.character(`Race Time`), ":"), function(x) {
      if (length(x) == 3) {
        hr <- as.numeric(x[1])
        min <- as.numeric(x[2])
        sec <- as.numeric(x[3])
        return(hr + min / 60 + sec / 3600)
      } else {
        return(NA)
      }
    }))
  )

ui <- dashboardPage(
  dashboardHeader(title = "Indy 500 Winners Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Start & Speed Trends", tabName = "start_speed", icon = icon("flag")),
      menuItem("Driver & Team Stats", tabName = "driver_team", icon = icon("car")),
      menuItem("Race Time Patterns", tabName = "race_time", icon = icon("clock"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "start_speed",
              fluidRow(
                box(title = "Starting Position Over Time", width = 6, plotOutput("start_over_time")),
                box(title = "Average Start by Decade", width = 6, plotOutput("avg_start_decade"))
              ),
              fluidRow(
                box(title = "Qualifying Speed Over Time", width = 6, plotOutput("qual_speed_time")),
                box(title = "Race Speed Over Time", width = 6, plotOutput("race_speed_time"))
              )
      ),
      tabItem(tabName = "driver_team",
              fluidRow(
                box(title = "Most Winning Drivers", width = 6, plotOutput("top_drivers")),
                box(title = "Most Successful Entrants", width = 6, plotOutput("top_entrants"))
              ),
              fluidRow(
                box(title = "Winning Car Makes", width = 6, plotOutput("top_makes")),
                box(title = "Top Winning Car Numbers", width = 6, plotOutput("top_car_numbers"))
              ),
              fluidRow(
                box(title = "Driver Stats Lookup Table", width = 12, DTOutput("driver_lookup"))
              )
      ),
      tabItem(tabName = "race_time",
              fluidRow(
                box(title = "Race Time Distribution", width = 6, plotOutput("race_time_dist")),
                box(title = "Race Time Over Time", width = 6, plotOutput("race_time_trend"))
              ),
              fluidRow(
                box(title = "Race Time vs Qualifying Speed", width = 6, plotOutput("time_vs_qual")),
                box(title = "Race Time vs Race Speed (with Equation)", width = 6, plotOutput("time_vs_race_speed"))
              )
      )
    )
  )
)

server <- function(input, output) {
  # Tab 1: Start & Speed Trends
  output$start_over_time <- renderPlot({
    ggplot(indy, aes(x = Year, y = Start)) +
      geom_point(alpha = 0.6) +
      geom_smooth(method = "loess", se = FALSE, color = "blue") +
      labs(title = "Starting Position Over Time", y = "Start Position")
  })
  
  output$avg_start_decade <- renderPlot({
    indy %>%
      mutate(Decade = floor(Year / 10) * 10) %>%
      group_by(Decade) %>%
      summarize(AvgStart = mean(Start, na.rm = TRUE)) %>%
      ggplot(aes(x = factor(Decade), y = AvgStart)) +
      geom_col(fill = "steelblue") +
      labs(title = "Average Start by Decade", x = "Decade", y = "Avg Start")
  })
  
  output$qual_speed_time <- renderPlot({
    ggplot(indy, aes(x = Year, y = Qual.Speed)) +
      geom_line(color = "darkorange") +
      labs(title = "Qualifying Speed Over Time", y = "Qual Speed (mph)")
  })
  
  output$race_speed_time <- renderPlot({
    ggplot(indy, aes(x = Year, y = Race.Speed)) +
      geom_line(color = "purple") +
      labs(title = "Race Speed Over Time", y = "Race Speed (mph)")
  })
  
  # Tab 2: Driver & Team Stats
  output$top_drivers <- renderPlot({
    indy %>% count(Driver, sort = TRUE) %>% top_n(10) %>%
      ggplot(aes(x = reorder(Driver, n), y = n)) +
      geom_col(fill = "forestgreen") + coord_flip() +
      labs(title = "Drivers with Most Wins", x = "Driver", y = "Wins")
  })
  
  output$top_entrants <- renderPlot({
    indy %>% count(Car.Name.Entrant, sort = TRUE) %>% top_n(10) %>%
      ggplot(aes(x = reorder(Car.Name.Entrant, n), y = n)) +
      geom_col(fill = "steelblue") + coord_flip() +
      labs(title = "Top Winning Entrants", x = "Entrant", y = "Wins")
  })
  
  output$top_makes <- renderPlot({
    indy %>% count(Make.Model, sort = TRUE) %>% top_n(10) %>%
      ggplot(aes(x = reorder(Make.Model, n), y = n)) +
      geom_col(fill = "darkred") + coord_flip() +
      labs(title = "Most Winning Car Makes", x = "Make/Model", y = "Wins")
  })
  
  output$top_car_numbers <- renderPlot({
    indy %>% count(Car.Num., sort = TRUE) %>% top_n(10) %>%
      ggplot(aes(x = reorder(as.factor(Car.Num.), n), y = n)) +
      geom_col(fill = "darkblue") + coord_flip() +
      labs(title = "Most Winning Car Numbers", x = "Car Number", y = "Wins")
  })
  
  output$driver_lookup <- renderDT({
    indy %>%
      group_by(Driver) %>%
      summarise(
        Wins = n(),
        MostRecentYear = max(Year, na.rm = TRUE),
        AvgStart = round(mean(Start, na.rm = TRUE), 1),
        CommonMake = names(sort(table(Make.Model), decreasing = TRUE))[1],
        AvgQualSpeed = round(mean(Qual.Speed, na.rm = TRUE), 2),
        AvgRaceSpeed = round(mean(Race.Speed, na.rm = TRUE), 2),
        AvgRaceTime = round(mean(Race.Time.Hours, na.rm = TRUE), 2)
      ) %>%
      arrange(desc(Wins))
  })
  
  # Tab 3: Race Time Patterns
  output$race_time_dist <- renderPlot({
    ggplot(indy, aes(x = Race.Time.Hours)) +
      geom_histogram(binwidth = 0.2, fill = "darkcyan", color = "white") +
      labs(title = "Distribution of Race Times", x = "Race Time (decimal hours)", y = "Count")
  })
  
  output$race_time_trend <- renderPlot({
    ggplot(indy, aes(x = Year, y = Race.Time.Hours)) +
      geom_line(color = "darkgreen") +
      labs(title = "Race Time Over Time", y = "Time (hours)")
  })
  
  output$time_vs_qual <- renderPlot({
    ggplot(indy, aes(x = Qual.Speed, y = Race.Time.Hours)) +
      geom_point(alpha = 0.5) +
      geom_smooth(method = "loess", se = FALSE, color = "black") +
      labs(title = "Race Time vs Qualifying Speed", x = "Qual Speed", y = "Race Time (hours)")
  })
  
  output$time_vs_race_speed <- renderPlot({
    ggplot(indy, aes(x = Race.Speed, y = Race.Time.Hours)) +
      geom_point(alpha = 0.5, color = "orange") +
      geom_smooth(method = "loess", se = FALSE, color = "black") +
      stat_poly_eq(
        aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")),
        formula = y ~ x, parse = TRUE,
        label.x = "right", label.y = "top"
      ) +
      labs(title = "Race Time vs Race Speed", x = "Race Speed", y = "Race Time (hours)")
  })
}

shinyApp(ui, server)
