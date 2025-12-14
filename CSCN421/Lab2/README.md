# Lab 2: Clustering and Dimensionality Reduction

## Overview
This laboratory exercise explores unsupervised learning techniques focusing on clustering algorithms and dimensionality reduction methods. Using KNIME Analytics Platform, students will implement and compare different clustering approaches and visualize high-dimensional data.

## Learning Objectives
- Understand various clustering algorithms (k-Means, EM, SOM)
- Learn dimensionality reduction techniques (t-SNE)
- Implement data preprocessing for clustering
- Evaluate and compare clustering results
- Visualize high-dimensional data effectively

## Workflow Components

### Data Processing
- **CSV Reader**: Loads the dataset for analysis
- **Data Cleaning**: Handles missing values and outliers
- **Normalization**: Scales features for clustering algorithms
- **Duplicate Removal**: Ensures data quality

### Clustering Algorithms
- **k-Means Clustering**: Partition-based clustering with centroid optimization
- **Expectation-Maximization (EM)**: Probabilistic clustering with Gaussian mixtures
- **Self-Organizing Maps (SOM)**: Neural network-based clustering and visualization

### Dimensionality Reduction
- **t-SNE**: t-Distributed Stochastic Neighbor Embedding for 2D visualization
- **Parameter Optimization**: Tuning t-SNE parameters for optimal visualization

### Evaluation and Visualization
- **Silhouette Coefficient**: Measures clustering quality and separation
- **Scatter Plots**: 2D visualization of clusters and reduced dimensions
- **Box Plots**: Statistical summaries of cluster characteristics
- **Color Management**: Enhanced visualization with categorical coloring

### Advanced Analysis
- **Distance Matrix**: Computes pairwise distances between data points
- **GroupBy Operations**: Aggregates data by cluster assignments
- **Parameter Optimization Loops**: Automated hyperparameter tuning

## Key Concepts Covered
- Unsupervised learning paradigms
- Clustering algorithms and their applications
- Dimensionality reduction techniques
- Cluster evaluation metrics
- Data visualization for high-dimensional datasets
- Parameter optimization strategies

## Prerequisites
- KNIME Analytics Platform (4.0+ recommended)
- Understanding of distance metrics and similarity measures
- Basic knowledge of statistical concepts
- Familiarity with data visualization principles

## Usage Instructions
1. Open the `Lab2.knwf` file in KNIME
2. Configure data input paths as needed
3. Execute the workflow sequentially
4. Adjust clustering parameters and re-run for comparison
5. Analyze results through visualization nodes

## Expected Outcomes
By completing this lab, participants will be able to:
- Apply appropriate clustering algorithms to different data types
- Evaluate clustering performance using quantitative metrics
- Visualize complex datasets using dimensionality reduction
- Interpret clustering results and identify patterns
- Choose suitable algorithms based on data characteristics and requirements
