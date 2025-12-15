library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
library(wordcloud)
library(tm)
library(DT)
library(plotly)
library(data.table)
library(readr)

# Load the actual data from CSV
tickets <- read.csv("./customer_support_tickets.csv")

# Convert date columns to Date type
tickets$`First.Response.Time` <- as.POSIXct(tickets$`First.Response.Time`, format = "%m/%d/%Y %H:%M")
tickets$`Date.of.Purchase` <- as.Date(tickets$`Date.of.Purchase`, format = "%m/%d/%Y")
tickets$`Resolved` <- as.POSIXct(tickets$`Resolved`, format = "%m/%d/%Y %H:%M")


# UI
ui <- dashboardPage(
  dashboardHeader(title = "DigitalSphere Ticket Dashboard"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Ticket Overview", tabName = "TicketOverview", icon = icon("tachometer-alt")),
      menuItem("Process Time", tabName = "ProcessTime", icon = icon("clock")),
      menuItem("Products", tabName = "Products", icon = icon("cubes")),
      menuItem("Customers", tabName = "Customers", icon = icon("users")),
      menuItem("Ticket Insights", tabName = "TicketInsights", icon = icon("chart-bar")),
      menuItem("Ticket Search", tabName = "TicketSearch", icon = icon("search"))
    )
  ),
  dashboardBody(
    tabItems(
      tabItem(tabName = "TicketOverview",
              fluidRow(
                valueBox(sum(tickets$`Ticket.Status` == "Open", na.rm = TRUE), "Open Tickets", icon = icon("folder-open"), color = "aqua"),
                valueBox(sum(tickets$`Ticket.Status` == "Closed", na.rm = TRUE), "Closed Tickets", icon = icon("check-circle"), color = "green"),
                valueBox(sum(tickets$`Ticket.Status` == "Pending Customer Response", na.rm = TRUE), "Waiting Tickets", icon = icon("clock"), color = "yellow"),
                valueBox(round(mean(tickets$`Customer.Satisfaction.Rating`, na.rm = TRUE), 2), "Avg Satisfaction", icon = icon("smile"), color = "purple"),
                valueBox({
                  
                  # Calculate Resolution Time in hours
                  tickets$ResolutionTime <- as.numeric(difftime(tickets$`Resolved`, tickets$`First.Response.Time`, units = "hours"))
                  
                  # Calculate the average Resolution Time
                  avg_res_time <- mean(tickets$ResolutionTime, na.rm = TRUE)
                  # Display hours and minutes
                  sprintf("%d hrs %.0f mins", floor(avg_res_time), (avg_res_time %% 1) * 60)
                }, "Avg Resolution Time", icon = icon("hourglass-half"), color = "orange", width = 8)
              ),
              fluidRow(
                box(title = "Tickets by Channel", status = "primary", solidHeader = TRUE, width = 12,
                    plotOutput("channelPlot"),
                    downloadButton("downloadChannel", "Download Plot"))
              )
      ),
      tabItem(tabName = "ProcessTime",
              fluidRow(
                valueBox(
                  min(tickets$ResolutionTime, na.rm = TRUE) %>% round(2),
                  "Min Resolution Time (hrs)",
                  icon = icon("angle-double-down"),
                  color = "blue"
                ),
                valueBox(
                  max(tickets$ResolutionTime, na.rm = TRUE) %>% round(2),
                  "Max Resolution Time (hrs)",
                  icon = icon("angle-double-up"),
                  color = "red"
                ),
                valueBox({
                  avg_res_time <- mean(tickets$ResolutionTime, na.rm = TRUE)
                  sprintf("%d hrs %.0f mins", floor(avg_res_time), (avg_res_time %% 1) * 60)
                }, "Avg Resolution Time", icon = icon("hourglass-half"), color = "orange", width = 8)
              ),
              fluidRow(
                box(title = "First Response Times (Hours)", width = 12, plotOutput("firstRespTime")),
              ),
              fluidRow(
                box(title = "Resolved Ticket Processing Time", width = 12, plotOutput("resolvedOverTime"))
              )
      ),
      tabItem(tabName = "Products",
              fluidRow(
                box(title = "Product Word Cloud", width = 12, plotOutput("productCloud", height = "600px"))
              ),
              fluidRow(
                box(title = "Top 10 Products", width = 12, plotOutput("topProducts"))
              ),
              fluidRow(
                box(title = "Product Frequency Histogram", width = 12, plotOutput("productHist"))
              )
      ),
      tabItem(tabName = "Customers",
              fluidRow(
                box(title = "Customer Gender Distribution", width = 6, plotOutput("genderDist")),
                box(title = "Customer Satisfaction Levels", width = 6, plotOutput("satisfactionDist"))
              ),
              fluidRow(
                box(title = "Customer Age Distribution", width = 12, plotOutput("ageDist"))
              )
      ),
      tabItem(tabName = "TicketInsights",
              fluidRow(
                box(title = "Filter Options",
                    solidHeader = TRUE,
                    status = "primary",
                    width = 12,
                    selectInput(inputId = "filterProduct", "Select Product:",
                                choices = c("All", sort(as.character(unique(tickets$`Product.Purchased`))))),
                    
                    selectInput("filterCategory", "Select Ticket Type:",
                                choices = c("All", sort(as.character(unique(tickets$`Ticket.Type`))))),
                    
                    selectInput("filterSubject", "Select Ticket Subject:",
                                choices = c("All", sort(as.character(unique(tickets$`Ticket.Subject`))))),
                    
                    plotOutput("categoryStatusPlot")
                )
              )
      ),
      tabItem(tabName = "TicketSearch",
              fluidRow(
                box(title = "Search Tickets by Customer Name", width = 12,
                    textInput("ticketSearch", "Enter Name:"),
                    DTOutput("searchTable"))
              )
      )
    )
  )
)

server <- function(input, output) {
  
  output$channelPlot <- renderPlot({
    ggplot(tickets, aes(x = `Ticket.Channel`)) +
      geom_bar(fill = "steelblue") +
      labs(title = "Tickets per Channel", x = "Channel", y = "Count") +
      theme_minimal()
  })
  
  output$downloadChannel <- downloadHandler(
    filename = function() { "tickets_by_channel.png" },
    content = function(file) {
      png(file)
      print(ggplot(tickets, aes(x = `Ticket.Channel`)) + geom_bar(fill = "steelblue"))
      dev.off()
    }
  )
  
  output$firstRespTime <- renderPlot({
    # Prepare data: Convert First.Response.Time to hourly bins and count occurrences
    first_resp_data <- tickets %>%
      filter(!is.na(`First.Response.Time`)) %>%
      mutate(HourFirstResp = as.POSIXct(format(`First.Response.Time`, "%Y-%m-%d %H:00:00"))) %>%
      group_by(HourFirstResp) %>%
      summarise(Count = n())
    
    ggplot(first_resp_data, aes(x = HourFirstResp, y = Count)) +
      geom_bar(stat = "identity", fill = "skyblue", color = "black") +
      labs(
        title = "First Response Time Distribution (Hourly)",
        x = "Hour",
        y = "Frequency"
      ) +
      theme_minimal() +
      scale_x_datetime(labels = scales::date_format("%Y-%m-%d %H:%M"), breaks = scales::date_breaks("1 hour")) +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })
  
  
  
  output$resolvedOverTime <- renderPlot({
    resolved_data <- tickets %>%
      filter(!is.na(Resolved)) %>%
      # Remove the outlier date
      filter(Resolved != as.POSIXct("2023-08-01 23:51", format = "%Y-%m-%d %H:%M")) %>%
      # Remove June 3rd entries
      filter(format(Resolved, "%m-%d") != "06-03") %>%
      # Group by the hour of resolution
      mutate(HourResolved = as.POSIXct(format(Resolved, "%Y-%m-%d %H:00:00"))) %>%
      group_by(HourResolved) %>%
      summarise(Count = n())
    
    ggplot(resolved_data, aes(x = HourResolved, y = Count)) +
      geom_bar(stat = "identity", fill = "green", color = "black") +
      labs(
        title = "Resolved Tickets Over Time (Hourly)",
        x = "Hour",
        y = "Number of Resolved Tickets"
      ) +
      theme_minimal() +
      scale_x_datetime(labels = scales::date_format("%Y-%m-%d %H:%M"), breaks = scales::date_breaks("1 hour")) +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))
  })


  output$productCloud <- renderPlot({
    # Adjust the plot margins (e.g., give more space at the top)
    par(mar = c(5, 5, 0, 5))  # Adjust the top margin (third value)
    
    corpus <- Corpus(VectorSource(tickets$`Product.Purchased`))

    corpus <- tm_map(corpus, content_transformer(tolower))
    corpus <- tm_map(corpus, removePunctuation)
    corpus <- tm_map(corpus, removeWords, stopwords("en"))

    corpus <- corpus[sapply(corpus, function(x) length(unlist(strsplit(as.character(x), " "))) > 0)]
    
    # DTM
    dtm <- TermDocumentMatrix(corpus)
    m <- as.matrix(dtm)
    freq <- sort(rowSums(m), decreasing = TRUE)
    
    # Plotting
    wordcloud(names(freq), freq, min.freq = 2, scale = c(3, 1), colors = brewer.pal(8, "Dark2"),
              random.order = FALSE, rot.per = 0.25, layout = c(4, 1))
  }, width = 600, height = 600)
  
  
  output$topProducts <- renderPlot({
    # Group by Product and count ticket volumes
    top_prods <- tickets %>%
      group_by(`Product.Purchased`) %>%
      summarise(Count = n()) %>%
      top_n(10, Count)
    
    # Plot top 10 products by ticket count
    ggplot(top_prods, aes(x = reorder(`Product.Purchased`, Count), y = Count)) +
      geom_col(fill = "darkblue") + 
      coord_flip() +
      labs(title = "Top 10 Products by Ticket Volume", x = "Product", y = "Ticket Count")
  })
  
  
  output$productHist <- renderPlot({
    ggplot(tickets, aes(x = `Product.Purchased`)) +
      geom_bar(fill = "orange") +
      theme(axis.text.x = element_text(angle = 90)) +
      labs(title = "Product Distribution", x = "Product", y = "Count")
  })
  
  output$ageDist <- renderPlot({
    ggplot(tickets, aes(x = `Customer.Age`)) +
      geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
      labs(title = "Customer Age Distribution")
  })
  
  output$genderDist <- renderPlot({
    ggplot(tickets, aes(x = `Customer.Gender`)) +
      geom_bar(fill = "purple") +
      labs(title = "Customer Gender Distribution")
  })
  
  output$satisfactionDist <- renderPlot({
    ggplot(tickets, aes(x = `Customer.Satisfaction.Rating`)) +
      geom_bar(fill = "green") +
      labs(title = "Customer Satisfaction Ratings")
  })
  
  output$categoryStatusPlot <- renderPlot({
    filtered_data <- tickets %>%
      filter(
        if (input$filterProduct != "All") `Product.Purchased` == input$filterProduct else TRUE,
        if (input$filterCategory != "All") `Ticket.Type` == input$filterCategory else TRUE,
        if (input$filterSubject != "All") `Ticket.Subject` == input$filterSubject else TRUE
      )
    
    if (nrow(filtered_data) == 0) {
      plot.new()
      title("No data available for the selected filters")
    } else {
      ggplot(filtered_data, aes(x = `Ticket.Type`, fill = `Ticket.Status`)) +
        geom_bar(position = "stack") +
        labs(title = "Tickets by Category and Status", x = "Category", y = "Count") +
        theme_minimal()
    }
  })
  
  output$searchTable <- renderDT({
    req(input$ticketSearch)
    tickets[grepl(tolower(input$ticketSearch), tolower(tickets$Customer.Name)), ]
  })
  
}

shinyApp(ui, server)
