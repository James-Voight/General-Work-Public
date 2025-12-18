# Important!
This repository only shows the README documentation to these projects. Since these are included in school work, a private repo is used to hold all of the work. If you would like to access any work, please email me at james.voight@me.com with your account information and I will be happy to grant you access.

# CSCN421 - Applied Machine Learning Projects

This repository contains a comprehensive collection of machine learning projects implemented in Python and R/KNIME environments, covering supervised learning, unsupervised learning, deep learning, and reinforcement learning techniques.

## Project Overview

The projects are organized into two main categories: Python-based deep learning implementations using Jupyter notebooks, and R-based machine learning workflows using KNIME Analytics Platform.

---

## Python Projects

### 1. Adversarial FGSM Demo

**Location:** `Adversial FGSM/`

**Objective:** Demonstrates adversarial machine learning attacks using the Fast Gradient Sign Method (FGSM) on Convolutional Neural Networks trained on the MNIST dataset.

**Technical Details:**
- **Dataset**: MNIST handwritten digits (60,000 training, 10,000 testing samples)
- **Model Architecture**:
  - Convolutional layers with 32 and 64 filters
  - Max pooling layers for spatial reduction
  - Batch normalization for training stability
  - Dense layers with 30% dropout regularization
  - Softmax output for 10-class classification
- **Adversarial Attack Implementation**:
  - Fast Gradient Sign Method for generating adversarial examples
  - Gradient-based perturbation generation
  - Configurable ε parameter controlling attack strength
  - Support for both targeted and untargeted attacks

**Key Learning Outcomes:**
- Understanding neural network vulnerabilities to adversarial inputs
- Mathematical foundations of gradient-based adversarial attacks
- Implementation of imperceptible but effective perturbations
- Evaluation of model robustness against malicious inputs
- Visualization techniques for adversarial perturbations
- Real-world security implications of adversarial machine learning

### 2. CIFAR-10 Image Classification (Lab 5)

**Location:** `lab5/`

**Objective:** Comprehensive exploration of deep learning techniques for image classification using Convolutional Neural Networks on the CIFAR-10 dataset, including data augmentation and transfer learning approaches.

**Technical Details:**
- **Dataset**: CIFAR-10 (60,000 32×32 color images, 10 classes: airplane, automobile, bird, cat, deer, dog, frog, horse, ship, truck)
- **Model Architectures**:
  - **Baseline CNN**: Multi-layer architecture with progressive filter increases (32→64→128)
  - **Data Augmentation**: Random horizontal flips, brightness/contrast adjustments, cropping
  - **Transfer Learning**: Fine-tuning pre-trained EfficientNetB0, MobileNetV2, EfficientNetV2B0
- **Training Strategy**:
  - 80/20 train/validation split from original training data
  - Adam optimizer with categorical cross-entropy loss
  - Early stopping and learning rate scheduling
  - Real-time augmentation during training

**Advanced Techniques:**
- **tf.image-based Augmentation**: TensorFlow's efficient image transformation pipeline
- **Keras Augmentation Layers**: Sequential augmentation with optimized performance
- **Transfer Learning Pipeline**: Feature extraction followed by custom classification heads
- **Model-specific Preprocessing**: Architecture-dependent input transformations

**Key Learning Outcomes:**
- Building and training CNNs for complex image classification tasks
- Implementing effective data augmentation strategies to combat overfitting
- Applying transfer learning techniques to improve performance on limited datasets
- Analyzing training curves and model convergence behavior
- Optimizing hyperparameters for deep learning models
- Understanding the challenges of small-scale image classification

### 3. Recurrent Neural Networks for Text Analysis (Lab 6)

**Location:** `lab6/`

**Objective:** Comprehensive exploration of natural language processing using RNNs and LSTMs, covering text generation, sentiment analysis, and transformer-based summarization on Amazon product reviews.

**Technical Details:**
- **Dataset**: Amazon product reviews for a high-review-volume product
- **Preprocessing Pipeline**:
  - Text deduplication and normalization
  - Keras Tokenizer for vocabulary creation (top 10,000 words)
  - N-gram sequence generation for language modeling
  - Maximum sequence length of 40 tokens
- **RNN Architecture**:
  - Embedding layer (100-dimensional) for word representations
  - LSTM layer with 128 units for sequence processing
  - Dense output layer for next-word prediction
  - Adam optimizer with sparse categorical cross-entropy

**Text Analysis Components:**
- **Language Model Training**: Next-word prediction on review sequences
- **Text Generation**: Seed-based text continuation with temperature sampling
- **Sentiment Analysis**: Multiple approaches including VADER and TextBlob
- **Transformer Summarization**: BART model for review summarization using Hugging Face

**Advanced Features:**
- **Temperature-controlled Generation**: Adjustable randomness in text output
- **Model Persistence**: Saving/loading trained models and tokenizers via pickle
- **Multi-method Sentiment Scoring**: Lexicon-based (VADER) and pattern-based (TextBlob) approaches
- **Document-level Analysis**: Aggregating insights across multiple reviews

**Key Learning Outcomes:**
- Building and training RNN/LSTM models for sequential text data
- Implementing text preprocessing pipelines for NLP tasks
- Generating coherent text using probabilistic language models
- Applying multiple sentiment analysis methodologies
- Using transformer architectures for text summarization
- Handling real-world text data quality issues
- Evaluating and interpreting NLP model performance

### 4. Reinforcement Learning (Lab 7)

**Location:** `lab7/`

**Objective:** Complete introduction to reinforcement learning algorithms, progressing from basic policies to advanced deep reinforcement learning on the CartPole environment.

**Environment Details:**
- **CartPole-v1**: OpenAI Gym classic control task
- **State Space**: [cart position, cart velocity, pole angle, pole angular velocity] (continuous)
- **Action Space**: Discrete (2 actions: push cart left/right)
- **Reward Structure**: +1 point per timestep pole remains upright (max 500)
- **Termination**: Pole angle > 15° or cart position > 2.4 units

**Algorithm Implementations:**

**Basic Policy Approaches:**
- **Random Agent**: Baseline random action selection
- **Policy A**: Simple threshold-based policy using pole angle
- **Policy B**: Advanced two-mode policy incorporating angle and angular velocity

**Classical RL Methods:**
- **Monte Carlo Control**: Complete episode sampling for policy learning
  - 20,000 training episodes
  - Learning rate decay (0.1→0.2)
  - Exponential ε-greedy exploration decay
- **Temporal Difference Learning**: Bootstrapping-based value estimation
  - Q-Learning implementation
  - SARSA on-policy variant
  - Slow learning rate decay for stability

**Deep Reinforcement Learning:**
- **Deep Q-Network (DQN)**: Neural network Q-function approximation
- **Stable Baselines3 Integration**: Professional RL library implementation
- **Advanced Features**:
  - Experience replay buffer for sample efficiency
  - Target network for training stability
  - ε-greedy exploration with decay

**Performance Analysis:**
- Algorithm comparison across random, MC, TD, and DQN approaches
- Training curve visualization and convergence analysis
- Stability metrics using mean-standard deviation scoring
- Hyperparameter sensitivity analysis

**Key Learning Outcomes:**
- Understanding Markov Decision Processes and RL fundamentals
- Implementing exploration vs. exploitation strategies
- Building Monte Carlo and temporal difference algorithms
- Training neural networks for reinforcement learning
- Analyzing RL algorithm performance and convergence
- Applying RL to continuous control problems
- Debugging and optimizing RL training procedures

---

## R/KNIME Projects

### 1. Support Vector Machine Classification (Assignment 1)

**Location:** `Assignment1/`

**Objective:** Complete machine learning pipeline implementation using Support Vector Machines in KNIME, covering data preprocessing, model training, evaluation, and visualization.

**Workflow Components:**
- **Data Processing Pipeline**:
  - CSV data ingestion with robust error handling
  - Feature engineering and column transformations
  - Normalization techniques for optimal SVM performance
  - Strategic train/validation/test data partitioning
- **SVM Implementation**:
  - Multiple kernel configurations (linear, RBF, polynomial)
  - Hyperparameter optimization through grid search
  - Cross-validation for model validation
- **Evaluation Framework**:
  - Comprehensive performance metrics (accuracy, precision, recall, F1-score)
  - Confusion matrix analysis
  - Python integration for custom evaluation scripts

**Advanced Features:**
- **Parameter Optimization**: Automated hyperparameter tuning loops
- **Model Comparison**: Performance evaluation across different SVM configurations
- **Visualization**: Scatter plots and statistical summaries for data exploration

**Key Learning Outcomes:**
- Building end-to-end machine learning pipelines in KNIME
- Understanding SVM algorithm mechanics and kernel methods
- Implementing effective data preprocessing strategies
- Performing hyperparameter optimization and model selection
- Interpreting classification performance metrics
- Creating reproducible ML workflows

### 2. Clustering and Dimensionality Reduction (Lab 2)

**Location:** `Lab2/`

**Objective:** Comprehensive exploration of unsupervised learning techniques focusing on clustering algorithms and high-dimensional data visualization using KNIME.

**Clustering Algorithms Implemented:**
- **k-Means Clustering**: Centroid-based partitioning with iterative optimization
- **Expectation-Maximization (EM)**: Probabilistic clustering using Gaussian mixture models
- **Self-Organizing Maps (SOM)**: Neural network-based clustering and topology preservation

**Dimensionality Reduction:**
- **t-SNE Implementation**: t-Distributed Stochastic Neighbor Embedding for 2D visualization
- **Parameter Optimization**: Perplexity and learning rate tuning for optimal embeddings
- **Enhanced Visualization**: Color-coded scatter plots with cluster assignments

**Evaluation Framework:**
- **Silhouette Coefficient**: Quantitative clustering quality assessment
- **Statistical Analysis**: Box plots and distribution summaries by cluster
- **Distance Matrix Computation**: Pairwise similarity analysis
- **GroupBy Operations**: Cluster-wise data aggregation and characterization

**Advanced Analysis:**
- **Automated Parameter Tuning**: Optimization loops for algorithm hyperparameters
- **Multi-algorithm Comparison**: Performance evaluation across different clustering approaches
- **Data Quality Processing**: Duplicate removal and outlier handling

**Key Learning Outcomes:**
- Applying appropriate clustering algorithms to diverse data types
- Evaluating clustering performance using quantitative metrics
- Visualizing complex high-dimensional datasets effectively
- Interpreting clustering results and identifying meaningful patterns
- Selecting suitable algorithms based on data characteristics
- Understanding unsupervised learning evaluation challenges

### 3. Neural Networks and Text Analysis (Lab 3)

**Location:** `Lab3/`

**Objective:** Integration of neural network implementations with text analysis techniques using KNIME's Python scripting capabilities for custom deep learning models.

**Neural Network Components:**
- **Custom Architecture Design**: Building appropriate network structures using TensorFlow/Keras
- **Training Optimization**: Advanced loss functions, optimizers, and hyperparameter configuration
- **Validation Strategies**: Cross-validation and performance monitoring
- **Model Serialization**: Saving and loading trained neural networks

**Text Processing Pipeline:**
- **Preprocessing Operations**: Tokenization, normalization, and cleaning
- **Feature Extraction**: Converting text to numerical representations
- **Tag Cloud Generation**: Visual text data representation
- **Sentiment Analysis**: Text classification and emotion detection

**KNIME-Python Integration:**
- **Python Learner Nodes**: Custom neural network training within KNIME workflows
- **Python Predictor Nodes**: Model deployment for inference tasks
- **Script Optimization**: Efficient handling of large datasets through batching
- **Visualization Integration**: Training curve plotting and result analysis

**Advanced Features:**
- **Custom Scripting**: Complex algorithm implementations in Python
- **Model Comparison Framework**: Evaluating different architectures and configurations
- **Error Analysis**: Understanding model limitations and prediction biases
- **Workflow Optimization**: Efficient processing pipelines for text data

**Key Learning Outcomes:**
- Designing and implementing neural network architectures
- Processing and analyzing text data for machine learning applications
- Seamlessly integrating Python code with KNIME workflows
- Training and evaluating deep learning models
- Applying text mining techniques to real-world problems
- Debugging and optimizing neural network performance

### 4. Data Preprocessing and Feature Engineering (Lab 4)

**Location:** `Lab4/`

**Objective:** Comprehensive exploration of data preprocessing and feature engineering techniques essential for building robust machine learning models using KNIME.

**Data Quality Processing:**
- **Missing Value Strategies**: Multiple imputation techniques (mean, median, mode, KNN)
- **Duplicate Detection**: Automated identification and removal of duplicate records
- **Outlier Handling**: Statistical and domain-based outlier detection methods
- **Data Type Optimization**: Appropriate type conversion for computational efficiency

**Feature Engineering Techniques:**
- **Column Operations**: Creating derived features through mathematical transformations
- **String Manipulation**: Text processing and categorical variable encoding
- **Dictionary Mapping**: Systematic categorical value replacement
- **One-to-Many Operations**: Data structure expansion for complex relationships

**Data Transformation:**
- **Normalization Methods**: Min-Max scaling, Z-score standardization, robust scaling
- **Feature Selection**: Low variance filtering and importance-based selection
- **Data Partitioning**: Stratified train/validation/test splits
- **Restructuring Operations**: Data reshaping for specific algorithm requirements

**Workflow Automation:**
- **Synthetic Data Generation**: Table Creator nodes for testing and validation
- **Column Filtering**: Selective feature inclusion/exclusion pipelines
- **Batch Processing**: Efficient handling of large datasets
- **Export Optimization**: Processed data preparation for downstream modeling

**Key Learning Outcomes:**
- Designing comprehensive data preprocessing workflows
- Applying appropriate techniques for different data types and distributions
- Ensuring data quality and integrity throughout the pipeline
- Creating effective feature representations for machine learning algorithms
- Automating repetitive preprocessing tasks
- Troubleshooting common data processing and quality issues

---

## Technical Environment

### Python Projects Requirements
- **Python**: 3.7+
- **Deep Learning**: TensorFlow 2.x, Keras
- **Scientific Computing**: NumPy, Pandas, Scikit-learn
- **Visualization**: Matplotlib, Seaborn, Plotly
- **NLP Libraries**: NLTK, TextBlob, Transformers, VaderSentiment
- **Reinforcement Learning**: Gymnasium, Stable Baselines3

### R/KNIME Projects Requirements
- **KNIME Analytics Platform**: Version 4.0+
- **R Integration**: Built-in R scripting nodes
- **Python Integration**: Python scripting capabilities within KNIME
- **Machine Learning Libraries**: Integrated algorithms and custom implementations

## Learning Progression

The projects follow a logical learning progression:
1. **Foundation**: Data preprocessing and traditional ML algorithms (SVM, clustering)
2. **Deep Learning**: Neural networks, CNNs, RNNs for vision and text tasks
3. **Advanced Topics**: Adversarial ML, transfer learning, reinforcement learning
4. **Integration**: Combining multiple techniques in comprehensive workflows

Each project builds upon previous concepts while introducing new methodologies and practical applications in applied machine learning.
