# CSCN323 - Data Visualization Projects

This repository contains a comprehensive collection of data visualization projects demonstrating various techniques for effective data communication and analysis. The projects utilize multiple visualization platforms including Datawrapper, R Shiny dashboards, and Tableau to showcase different approaches to data storytelling and interactive visualization.

## Project Overview

The data visualization projects focus on creating compelling, interactive visualizations that effectively communicate insights from complex datasets. Each project demonstrates different visualization paradigms and tools, from web-based charting platforms to interactive dashboard development.

---

## 1. Datawrapper Data Science Job Market Analysis

**Location:** `DatawrapperLab/`

**Objective:** Create a comprehensive visual analysis of the data science job market using Datawrapper's web-based visualization platform, focusing on salary trends, job availability, and geographic distributions.

**Technical Details:**
- **Platform**: Datawrapper (web-based visualization tool)
- **Format**: Interactive embedded charts with responsive design
- **Data Sources**: Data Science job market datasets and Glassdoor analytics

**Visualization Components:**

### Data Science Job Market Analysis (Section 1)
- **Maximum Salaries by Job Category & Experience Level (1.1)**:
  - Heat map table visualization
  - Color-coded salary ranges by experience level
  - Job categories: Data Analyst, ML Engineer, Data Scientist, etc.
  - Experience levels: Entry, Mid, Senior

- **Number of Jobs Available Across Work Settings & Experience Levels (1.2)**:
  - Grouped column chart
  - Work settings: Remote, Hybrid, In-person
  - Stacked visualization for experience level distribution
  - Comparative analysis of job availability trends

- **Salary Variation by Company Location (1.3)**:
  - World choropleth map
  - Geographic salary distribution
  - Color-coded regions by average compensation
  - Global market comparison

- **Percentage Ratio of Work Setting by Company Size (1.4)**:
  - Grouped bar chart
  - Company size categories: Small, Medium, Large
  - Work setting ratios within each size category
  - Remote vs. in-person job distribution

- **Job Availability Over Time (1.5)**:
  - Interactive line chart
  - Four-year temporal analysis (2021-2024)
  - Job posting trends across categories
  - Market growth and contraction patterns

### Glassdoor Data Engineering Focus (Section 2)
- **Education & Experience Required for Data Engineering Jobs (2.1)**:
  - Grouped column comparison
  - Education levels: Bachelor's, Master's, PhD
  - Experience requirements by education level
  - Job qualification analysis

- **Top Recruiting Companies and Industries (2.2)**:
  - Dual bar chart visualization
  - Company ratings (4.8+ star threshold)
  - Industry performance rankings
  - Recruitment quality assessment

- **Average Salary Estimate by Company Sector (2.3)**:
  - Descending order bar chart
  - Sector-based salary comparisons
  - Industry compensation analysis

- **Data Engineering Job Locations (2.4)**:
  - State-level choropleth map
  - Geographic job distribution
  - State-by-state opportunity analysis

- **Average Estimated Salary Based on Location (2.5)**:
  - State-level salary choropleth
  - Geographic compensation variations
  - Regional salary market analysis

**Design Principles:**
- **Color Coding**: Green for monetary values, blue/purple for other metrics
- **Accessibility**: Colorblind-friendly palettes
- **Interactivity**: Embedded iframes with dynamic resizing
- **Responsive Design**: Mobile-compatible visualizations

**Key Insights:**
- Senior-level experience doesn't always correlate with highest salaries
- In-person jobs dominate across all experience levels
- Geographic salary variations (Qatar outliers handled via quartile-based scaling)
- Remote work decreases with company size
- Significant job market growth from 2021-2023 with 2024 contraction

---

## 2. Indy 500 Race Winners Dashboard

**Location:** `Indy500Visualization/`

**Objective:** Develop an interactive R Shiny dashboard analyzing Indianapolis 500 race data, focusing on historical winners, performance trends, and racing statistics.

**Technical Details:**
- **Platform**: R Shiny with shinydashboard framework
- **Data Source**: Indy 500 Race Summaries CSV dataset
- **Interactivity**: Dynamic filtering and visualization updates
- **Layout**: Three-tab dashboard structure

**Dashboard Structure:**

### Start & Speed Trends Tab
- **Starting Position Analysis**: Distribution of winning starting positions
- **Qualifying Speed Trends**: Temporal analysis of qualifying speeds
- **Race Speed Evolution**: Historical race speed progression
- **Interactive Filtering**: Year-based data subset selection

### Driver & Team Stats Tab
- **Driver Performance Metrics**: Career wins and podium finishes
- **Team Success Analysis**: Constructor performance over time
- **Car Model Statistics**: Winning car make/model distributions
- **Geographic Representation**: Driver nationality distributions

### Race Time Patterns Tab
- **Race Duration Analysis**: Historical race time trends
- **Time Conversion**: HH:MM:SS to decimal hours transformation
- **Performance Correlation**: Speed vs. time relationship analysis
- **Statistical Summaries**: Mean, median, and range calculations

**Technical Implementation:**
- **Data Processing**:
  - Time format conversion (HH:MM:SS → decimal hours)
  - Data type optimization (numeric conversions, factor creation)
  - Missing value handling and data validation
- **Visualization Techniques**:
  - ggplot2 for statistical plots
  - Interactive charts with hover details
  - Color-coded categorical variables
  - Temporal trend analysis
- **Shiny Framework Features**:
  - Reactive data filtering
  - Dynamic UI updates
  - Modular tab-based organization
  - Responsive dashboard layout

**Key Features:**
- **Real-time Filtering**: Year-based data exploration
- **Statistical Analysis**: Performance metric calculations
- **Visual Storytelling**: Racing history narrative through data
- **Interactive Exploration**: User-driven data discovery

---

## 3. DigitalSphere Customer Support Ticket Dashboard

**Location:** `RShinyLab/`

**Objective:** Create a comprehensive customer support analytics dashboard for DigitalSphere, providing insights into ticket resolution, customer satisfaction, and operational efficiency.

**Technical Details:**
- **Platform**: R Shiny with advanced dashboard features
- **Data Source**: Customer support tickets CSV dataset
- **Features**: Multi-tab analytics with interactive visualizations
- **Advanced Components**: Word clouds, time series analysis, customer segmentation

**Dashboard Architecture:**

### Ticket Overview Tab
- **KPI Metrics**: Open, closed, pending tickets with visual indicators
- **Status Distribution**: Ticket status breakdown with color coding
- **Average Satisfaction**: Customer satisfaction rating aggregation
- **Resolution Time**: Average ticket resolution duration

### Process Time Analysis Tab
- **Time Metrics Visualization**: Response time and resolution time distributions
- **Priority-based Analysis**: Processing time by ticket priority
- **Temporal Patterns**: Time-based performance trends
- **Efficiency Metrics**: SLA compliance indicators

### Products Analysis Tab
- **Product-wise Ticket Distribution**: Tickets by product category
- **Issue Type Breakdown**: Problem categorization by product
- **Resolution Success Rates**: Product-specific success metrics
- **Trend Analysis**: Product performance over time

### Customer Insights Tab
- **Customer Segmentation**: Ticket volume by customer type
- **Geographic Distribution**: Customer location analysis
- **Purchase Date Correlation**: Relationship between purchase timing and issues
- **Customer Satisfaction**: Rating distribution and trends

### Ticket Insights Tab
- **Word Cloud Analysis**: Common issue keywords and themes
- **Sentiment Analysis**: Ticket content emotional analysis
- **Topic Modeling**: Automated issue categorization
- **Trend Identification**: Emerging issue patterns

### Ticket Search Functionality Tab
- **Advanced Filtering**: Multi-criteria ticket search
- **Real-time Results**: Dynamic search result updates
- **Detailed Ticket View**: Individual ticket examination
- **Export Capabilities**: Filtered data export options

**Advanced Technical Features:**
- **Text Mining Integration**:
  - tm package for text processing
  - wordcloud for visual text analysis
  - Sentiment analysis algorithms
- **Interactive Visualizations**:
  - plotly for dynamic charts
  - DT for searchable data tables
  - ggplot2 for statistical plots
- **Performance Optimization**:
  - data.table for efficient data manipulation
  - Reactive programming for responsive UI
  - Memory-efficient data processing

**Business Intelligence Capabilities:**
- **Operational Metrics**: Ticket resolution efficiency tracking
- **Customer Experience**: Satisfaction and loyalty indicators
- **Product Quality**: Issue frequency and resolution analysis
- **Strategic Insights**: Trend identification and predictive analytics

---

## 4. Tableau Dashboard Lab

**Location:** `Tablaeu Dashboard Lab.twb`

**Objective:** Develop advanced data visualizations and dashboards using Tableau, focusing on interactive data exploration and business intelligence presentation.

**Technical Details:**
- **Platform**: Tableau Desktop
- **Format**: Tableau Workbook (.twb) file
- **Features**: Interactive dashboards with calculated fields and parameters
- **Data Integration**: Multiple data source connections and relationships

**Dashboard Components:**
- **Interactive Visualizations**: Dynamic charts with cross-filtering
- **Calculated Fields**: Custom metrics and KPIs
- **Parameter Controls**: User-driven dashboard customization
- **Dashboard Actions**: Click-based navigation and highlighting
- **Data Storytelling**: Narrative-driven data presentation

**Tableau-Specific Features:**
- **LOD Calculations**: Level of detail expressions for complex aggregations
- **Table Calculations**: Running totals, percent of total, and ranking functions
- **Data Blending**: Multiple data source integration
- **Custom Formatting**: Conditional formatting and visual styling
- **Dashboard Layout**: Tiled and floating layout options

---

## Technical Environment

### Datawrapper Requirements
- **Web Platform**: Browser-based visualization tool
- **Data Formats**: CSV, Excel, JSON support
- **Export Options**: Embedded HTML, PNG, PDF
- **Interactivity**: Hover effects, filtering, responsive design

### R Shiny Requirements
- **R Version**: 4.0+
- **Core Packages**:
  - shiny: Web application framework
  - shinydashboard: Dashboard layout components
  - ggplot2: Statistical plotting
  - dplyr: Data manipulation
  - DT: Interactive data tables
  - plotly: Interactive visualizations
- **Advanced Packages**:
  - tm: Text mining
  - wordcloud: Word cloud generation
  - data.table: High-performance data processing

### Tableau Requirements
- **Software**: Tableau Desktop or Public
- **Data Connectors**: Multiple source integration
- **Visualization Types**: Charts, maps, dashboards
- **Interactivity**: Filters, parameters, actions

## Visualization Design Principles

### Color and Accessibility
- **Semantic Color Usage**: Green for financial metrics, blue/purple for general data
- **Colorblind Compatibility**: High contrast ratios and alternative patterns
- **Consistent Palettes**: Unified color schemes across related visualizations

### Interactivity and User Experience
- **Progressive Disclosure**: Layered information presentation
- **Intuitive Navigation**: Logical tab and filter organization
- **Responsive Design**: Cross-device compatibility
- **Performance Optimization**: Efficient rendering for large datasets

### Data Storytelling
- **Narrative Flow**: Logical progression from overview to detail
- **Context Preservation**: Maintaining data relationships across views
- **Insight Communication**: Clear presentation of key findings
- **Actionable Intelligence**: Business-relevant recommendations

## Learning Outcomes

The data visualization projects provide comprehensive experience with:

1. **Visualization Platform Proficiency**: Datawrapper, R Shiny, Tableau expertise
2. **Data Communication**: Effective translation of data insights to visual narratives
3. **Interactive Design**: User-centered dashboard and visualization development
4. **Technical Implementation**: Programming skills for custom visualization solutions
5. **Business Intelligence**: Analytical thinking for data-driven decision making
6. **Design Principles**: Visual design, accessibility, and user experience considerations

## Project Applications

These visualization projects demonstrate practical applications in:
- **Business Analytics**: Sales performance, customer insights, operational metrics
- **Market Research**: Job market analysis, geographic trends, industry comparisons
- **Sports Analytics**: Racing performance, historical trends, competitive analysis
- **Customer Service**: Support ticket analysis, satisfaction metrics, process optimization
- **Data Journalism**: Public data presentation, trend communication, audience engagement
