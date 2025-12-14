# Lab 1: Support Vector Machine Classification

## Overview
This laboratory exercise focuses on implementing and evaluating Support Vector Machine (SVM) classifiers using KNIME Analytics Platform. The workflow demonstrates the complete machine learning pipeline including data preprocessing, model training, prediction, and evaluation.

## Learning Objectives
- Understand SVM classification algorithms
- Learn data preprocessing techniques (normalization, feature engineering)
- Implement model training and evaluation workflows
- Compare different SVM configurations and parameters

## Workflow Components

### Data Processing
- **CSV Reader**: Loads the dataset
- **Column Operations**: Data cleaning and feature engineering
- **Normalization**: Feature scaling for optimal SVM performance
- **Data Partitioning**: Train/validation/test splits

### Model Training
- **SVM Learner**: Trains SVM models with different kernel configurations
- **Parameter Optimization**: Hyperparameter tuning using grid search
- **Cross-validation**: Model validation techniques

### Model Evaluation
- **SVM Predictor**: Generates predictions on test data
- **Scorer**: Performance metrics calculation (accuracy, precision, recall, F1-score)
- **Python Integration**: Custom evaluation scripts

### Visualization
- **Data Exploration**: Scatter plots and statistical summaries
- **Model Comparison**: Performance comparison across different configurations

## Key Concepts Covered
- Support Vector Machines (SVM)
- Kernel methods
- Hyperparameter optimization
- Model evaluation metrics
- Cross-validation techniques
- Data preprocessing pipelines

## Prerequisites
- KNIME Analytics Platform (4.0+ recommended)
- Basic understanding of classification algorithms
- Familiarity with data preprocessing concepts

## Usage Instructions
1. Open the `Assignment1.knwf` file in KNIME
2. Ensure all required data files are in the correct paths
3. Execute the workflow nodes in order
4. Review the results in the scoring and visualization nodes

## Expected Outcomes
By completing this lab, participants will be able to:
- Build complete ML pipelines in KNIME
- Train and evaluate SVM classifiers
- Perform hyperparameter optimization
- Interpret model performance metrics
- Apply preprocessing techniques appropriately
