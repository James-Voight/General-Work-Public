# Important!
This repository only shows the README documentation to these projects. Since these are included in school work, a private repo is used to hold all of the work. If you would like to access any work, please email me at james.voight@me.com with your account information and I will be happy to grant you access.

# CSCN321 - Python & R Programming Projects

This repository contains a comprehensive collection of data science and programming projects that demonstrate proficiency in both Python and R programming languages. The projects are implemented using Quarto documents, showcasing various data analysis, machine learning, and statistical techniques.

## Project Overview

The projects progress through fundamental programming concepts to advanced data science techniques, with each project building upon previous skills while introducing new methodologies. All projects are implemented in both Python and R to highlight language differences and capabilities.

---

## Python Projects

### 1. Exploratory Data Analysis & Visualization (Project 1)

**Location:** `Project1Quarto/`

**Objective:** Comprehensive exploratory data analysis on a credit card approvals dataset, comparing Python and R implementations for data manipulation and visualization.

**Technical Details:**
- **Dataset**: Credit card application data with 690 records and 16 features
- **Key Variables**: Age, Debt, Income, Credit Score, Years Employed, Industry, Ethnicity, Approval Status
- **Analysis Components**:
  - Data type verification and summary statistics
  - Missing value assessment (confirmed no missing data)
  - Univariate analysis (histograms, density plots, descriptive statistics)
  - Bivariate analysis (scatter plots, regression lines, correlation analysis)
  - Categorical analysis (bar charts, stacked plots, cross-tabulations)
  - Multivariate analysis (correlation heatmaps, pair plots)

**Advanced Visualizations:**
- **Histogram Analysis**: Age distribution with bin width optimization (10-unit bins)
- **Density Estimation**: Kernel density plots for distribution shape analysis
- **Regression Analysis**: Debt vs. Income scatter plots with trend lines
- **Categorical Cross-Analysis**: Industry by Ethnicity stacked bar charts
- **Approval Rate Analysis**: Horizontal bar plots comparing approval rates by ethnicity
- **Box Plot Comparisons**: Debt and years employed distributions by industry
- **Correlation Analysis**: Comprehensive heatmaps and pair plots for numeric variables

**Key Findings:**
- Right-skewed distributions across most numeric variables
- Strong correlation between age and years employed (0.19)
- Weak correlation between age and credit score
- Significant outliers in income data (maximum $400,000)
- Industry-specific debt patterns (education highest range, research lowest)
- Employment duration variations by industry sector

### 2. Data Cleansing & Preparation Pipeline (Project 2)

**Location:** `Project2Quarto/`

**Objective:** Complete data preprocessing pipeline on Airbnb listings data, implementing multiple imputation strategies and feature engineering techniques.

**Technical Details:**
- **Dataset**: Multi-table Airbnb dataset (price, reviews, room types) with 25,000+ records
- **Preprocessing Pipeline**:
  - **Data Integration**: Left joins on listing_id across three source files
  - **Duplicate Removal**: Automated identification and elimination of duplicate records
  - **Missing Value Imputation**: Multiple strategies including MICE, mean, mode, and KNN
  - **Date Processing**: Mixed-format date parsing with pandas and parsedate libraries
  - **Time Calculations**: Days since last review computation
  - **Text Cleaning**: Regular expression-based normalization of descriptions
  - **Categorical Encoding**: One-hot encoding for room types
  - **Numeric Transformation**: Type conversion and rounding operations
  - **Feature Scaling**: Z-score standardization of price and rating features
  - **Data Export**: Cleaned dataset preparation for downstream modeling

**Advanced Imputation Techniques:**
- **Multiple Imputation by Chained Equations (MICE)**: Preserving variable relationships
- **K-Nearest Neighbors (KNN) Imputation**: Structure-preserving missing value replacement
- **Mode Imputation**: Categorical variable handling
- **Forward/Backward Fill**: Time-series aware imputation strategies

**Data Quality Improvements:**
- Consistent data types across numeric and categorical variables
- Standardized date formats for temporal analysis
- Cleaned text data for potential NLP applications
- Properly encoded categorical variables for machine learning
- Scaled numeric features for algorithm compatibility

### 3. User-Defined Functions & Iterative Programming (Project 3)

**Location:** `Project3Quarto/`

**Objective:** Implementation of fundamental programming constructs including loops, functions, and iterative algorithms in both Python and R.

**Programming Components:**

**Loop-Based Calculations:**
- **Test Score Grading**: Comparative analysis of student performance against answer keys
- **Bulk Pricing Calculator**: Tiered pricing system for quantity-based discounts
- **Amortization Scheduler**: Monthly loan payment calculations with balance tracking

**Custom Function Library:**
- **Dot Product Function**: Vector multiplication implementation
- **Minimum Index Finder**: Array search algorithms with zero-based/one-based indexing
- **Unique Value Extractor**: Set-based duplicate removal
- **Weighted Mean Calculator**: Statistical aggregation with optional weighting
- **Set Intersection**: Common element identification across arrays
- **Data Loading Utility**: Multi-format file reader (CSV, TXT, Excel)
- **Data Cleaning Toolkit**: Missing value handling and feature scaling
- **Visualization Engine**: Automated plotting for different data types

**Algorithmic Implementations:**
- **Manual Sorting**: Custom sorting algorithms without built-in functions
- **Set Operations**: Intersection logic using nested loops
- **File Format Detection**: Extension-based file type identification
- **Imputation Strategies**: Multiple missing value replacement methods
- **Statistical Scaling**: Manual standardization implementations

**Performance Analysis:**
- Language-specific syntax comparisons
- Execution efficiency across different operations
- Memory usage patterns for large datasets
- Code readability and maintenance considerations

### 4. Machine Learning Pipeline Development (Project 4)

**Location:** `Project4Quarto/`

**Objective:** End-to-end machine learning pipeline implementation for campaign response prediction, including data preprocessing, model training, and evaluation.

**Technical Details:**
- **Dataset**: Customer campaign data with demographic and behavioral features
- **Target Variable**: Campaign response (binary classification)
- **Features**: Income, Age, Recency, Purchase amounts, Campaign acceptance history

**Preprocessing Pipeline:**
- **Data Type Coercion**: Converting categorical and binary variables to appropriate types
- **Missing Value Handling**: Median imputation for numeric, mode for categorical
- **Feature Engineering**: Creating derived variables and interaction terms
- **Categorical Encoding**: One-hot encoding for nominal variables
- **Feature Scaling**: Standardization for numeric features

**Machine Learning Implementation:**
- **Model Selection**: Logistic Regression and Random Forest classifiers
- **Hyperparameter Tuning**: Grid search cross-validation for optimal parameters
- **Pipeline Construction**: Integrated preprocessing and modeling
- **Model Persistence**: Saving trained models for deployment

**Evaluation Framework:**
- **Performance Metrics**: Accuracy, precision, recall, F1-score, AUC-ROC
- **Confusion Matrix Analysis**: Classification error breakdown
- **ROC Curve Visualization**: Model discrimination assessment
- **Feature Importance**: Variable contribution analysis

**Model Comparison:**
- **Logistic Regression**: Interpretable coefficients and probabilities
- **Random Forest**: Ensemble-based predictions with feature importance
- **Cross-Validation**: Robust performance estimation
- **Hyperparameter Optimization**: Automated parameter selection

### 5. E-commerce Data Analysis (Project 5)

**Location:** `Project5Quarto/`

**Objective:** Advanced exploratory data analysis on e-commerce transaction data, focusing on customer behavior patterns and sales analytics.

**Technical Details:**
- **Dataset**: E-commerce transaction records with customer and product information
- **Analysis Focus**: Customer segmentation, product performance, temporal patterns

**Data Processing:**
- **Missing Value Treatment**: Customer ID generation for anonymous transactions
- **Date Parsing**: Temporal feature extraction and formatting
- **Data Type Optimization**: Appropriate type conversion for analysis
- **Outlier Detection**: Statistical identification of anomalous transactions

**Exploratory Analysis:**
- **Customer Behavior**: Purchase frequency, monetary value, recency analysis
- **Product Performance**: Sales volume, revenue contribution, popularity metrics
- **Temporal Patterns**: Daily, weekly, monthly transaction trends
- **Geographic Analysis**: Regional sales distribution and performance

**Advanced Analytics:**
- **Customer Segmentation**: RFM (Recency, Frequency, Monetary) analysis
- **Cohort Analysis**: Customer retention and lifetime value assessment
- **Basket Analysis**: Product association and cross-selling opportunities
- **Seasonal Decomposition**: Trend and seasonality identification

**Visualization Techniques:**
- **Time Series Plots**: Sales trends and seasonal patterns
- **Geographic Maps**: Regional performance visualization
- **Customer Segmentation Charts**: Cluster analysis representation
- **Product Category Analysis**: Comparative performance dashboards

### 6. Association Rule Mining on Music Streaming Data (Project 6)

**Location:** `project6/`

**Objective:** Market basket analysis on Spotify streaming data using association rule mining to discover music consumption patterns and user preferences.

**Technical Details:**
- **Dataset**: Spotify user listening history with user_id, artist, track, and playlist information
- **Analysis Framework**: Apriori algorithm implementation for pattern discovery

**Data Preprocessing:**
- **Data Type Conversion**: Appropriate type casting for categorical variables
- **Missing Value Handling**: Mode imputation for categorical features
- **Data Filtering**: Removal of non-song content (intros, outros, special characters)
- **Transaction Formatting**: Converting user listening history to transaction format

**Association Rule Mining:**
- **Support Thresholds**: Minimum occurrence frequency for itemsets
- **Confidence Measures**: Rule reliability assessment
- **Lift Analysis**: Interestingness evaluation beyond random co-occurrence
- **Rule Pruning**: Filtering rules by statistical significance

**Pattern Discovery:**
- **Artist Associations**: Frequently co-occurring artists in user libraries
- **Track Combinations**: Popular song pairings and playlists
- **Genre Clustering**: Implicit genre identification through artist associations
- **User Segmentation**: Music taste profiling based on listening patterns

**Business Applications:**
- **Recommendation Systems**: Music discovery and playlist generation
- **Content Curation**: Automated playlist creation based on user preferences
- **Artist Discovery**: Finding similar artists through co-occurrence patterns
- **Market Analysis**: Understanding music consumption trends

### 7. Time Series Analysis on Financial Data (Project 7)

**Location:** `project7/`

**Objective:** Comprehensive time series analysis on Microsoft stock data, implementing multiple forecasting models and evaluating their performance.

**Technical Details:**
- **Dataset**: Microsoft stock prices (2015-2021) with OHLCV data
- **Time Series Components**: Trend, seasonality, cyclical patterns, residual noise
- **Forecasting Horizon**: 6-month prediction window (October 2020 - March 2021)

**Data Preparation:**
- **Date Parsing**: Index creation with proper datetime formatting
- **Missing Value Treatment**: Time series interpolation techniques
- **Data Quality Assessment**: Completeness and consistency verification
- **Train/Test Splitting**: Temporal validation with chronological ordering

**Exploratory Analysis:**
- **Trend Identification**: Long-term price movement analysis
- **Volatility Assessment**: Price fluctuation and trading volume patterns
- **Seasonal Decomposition**: Identifying periodic patterns in stock behavior
- **Stationarity Testing**: Augmented Dickey-Fuller tests for time series properties

**Forecasting Models:**

**Traditional Approaches:**
- **Linear Regression**: Trend-based forecasting using time indices
- **Naive Methods**: Persistence and seasonal naive forecasting
- **Moving Average**: Simple and exponential smoothing techniques

**Advanced Time Series Models:**
- **AutoRegressive (AR) Models**: Autocorrelation-based prediction
- **ARIMA/SARIMA**: Integrated models for non-stationary data
- **SARIMAX**: Seasonal ARIMA with exogenous variables

**Model Evaluation:**
- **Error Metrics**: MAE, RMSE, MAPE for forecast accuracy assessment
- **Residual Analysis**: Model fit and assumption verification
- **Prediction Intervals**: Uncertainty quantification for forecasts
- **Model Comparison**: Performance benchmarking across different approaches

**Financial Insights:**
- **Volatility Patterns**: High-frequency trading impact analysis
- **Market Trends**: Long-term growth trajectory identification
- **Seasonal Effects**: Quarterly performance pattern recognition
- **Prediction Accuracy**: Model reliability for investment decision-making

---

## R Projects

All Python projects have corresponding R implementations, demonstrating:

### Language-Specific Advantages:
- **R's Statistical Ecosystem**: Specialized packages for advanced statistical analysis
- **Python's General-Purpose Nature**: Broader application domains and integration capabilities
- **Data Manipulation**: dplyr vs. pandas comparison
- **Visualization**: ggplot2 vs. matplotlib/seaborn approaches

### Package Dependencies:

**Python Libraries:**
- Data Science: pandas, numpy, scikit-learn
- Visualization: matplotlib, seaborn, plotly
- Statistical Analysis: statsmodels, scipy
- Machine Learning: tensorflow, pytorch (where applicable)

**R Libraries:**
- Data Manipulation: dplyr, tidyr, data.table
- Statistical Analysis: caret, randomForest, glmnet
- Visualization: ggplot2, plotly, lattice
- Specialized: arules (association mining), forecast (time series)

---

## Technical Environment

### Development Tools:
- **Quarto**: Literate programming framework for reproducible research
- **Jupyter/Python Environment**: Interactive data science development
- **RStudio**: Integrated development environment for R
- **Version Control**: Git-based project management

### Data Sources:
- **Credit Card Approvals**: Financial application dataset
- **Airbnb Listings**: Accommodation marketplace data
- **E-commerce Transactions**: Online retail purchase data
- **Spotify Streaming**: Music consumption patterns
- **Microsoft Stock Data**: Financial time series
- **Campaign Response**: Marketing analytics dataset

### Key Learning Outcomes:

1. **Programming Proficiency**: Advanced Python and R programming skills
2. **Data Wrangling**: Complex data preprocessing and cleaning techniques
3. **Statistical Analysis**: Hypothesis testing and inferential statistics
4. **Machine Learning**: Supervised and unsupervised learning algorithms
5. **Time Series Analysis**: Forecasting and temporal pattern recognition
6. **Association Mining**: Market basket analysis and pattern discovery
7. **Data Visualization**: Effective communication of analytical insights
8. **Reproducible Research**: Literate programming with Quarto documents

## Project Progression

The projects follow a logical learning progression:
1. **Foundation**: Basic data manipulation and visualization (Projects 1-2)
2. **Programming**: Algorithm implementation and function development (Project 3)
3. **Machine Learning**: Predictive modeling and evaluation (Project 4)
4. **Advanced Analytics**: Customer behavior and market analysis (Project 5)
5. **Specialized Techniques**: Association mining and time series forecasting (Projects 6-7)

Each project builds upon previous concepts while introducing new analytical methodologies and real-world applications.
