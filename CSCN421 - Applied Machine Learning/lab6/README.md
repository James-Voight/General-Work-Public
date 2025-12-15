# Lab 6: Recurrent Neural Networks for Text Analysis

## Overview
This laboratory exercise explores natural language processing using Recurrent Neural Networks (RNNs), specifically Long Short-Term Memory (LSTM) networks. Students will build text generation models, perform sentiment analysis, and apply transformer-based summarization techniques on Amazon product reviews.

## Learning Objectives
- Understand RNN and LSTM architectures for sequential data
- Implement text preprocessing and tokenization pipelines
- Train language models for text generation
- Apply sentiment analysis using multiple approaches
- Use transformer models for text summarization
- Handle real-world text data challenges

## Dataset
- **Amazon Product Reviews**: Customer reviews for a specific product
- **Focus Product**: Selected based on review count (highest reviewed product)
- **Text Processing**: Review deduplication, normalization, and cleaning
- **Task Types**: Language modeling, sentiment classification, summarization

## Workflow Components

### Data Preparation and Preprocessing
- **Data Loading**: Import Amazon reviews dataset (CSV format)
- **Product Selection**: Choose product with most reviews for focused analysis
- **Text Cleaning**: Remove duplicates, normalize text, handle missing values
- **Tokenization**: Convert text to integer sequences using Keras Tokenizer
- **Sequence Processing**: Create n-gram sequences for language modeling

### RNN Model Training
- **Architecture**: Embedding layer + LSTM/GRU + Dense output
- **Parameters**:
  - Vocabulary size: Limited to top 10,000 words
  - Embedding dimension: 100
  - LSTM units: 128
  - Maximum sequence length: 40 tokens
- **Training**: Adam optimizer, sparse categorical cross-entropy
- **Callbacks**: Early stopping with patience monitoring

### Text Generation
- **Seed-based Generation**: Generate text continuations from seed phrases
- **Temperature Sampling**: Control randomness in generation
- **Model Persistence**: Save/load trained models and tokenizers
- **Evaluation**: Qualitative assessment of generated text quality

### Sentiment Analysis
- **VADER (Valence Aware Dictionary and sEntiment Reasoner)**:
  - Lexicon-based approach
  - Compound sentiment scores (-1 to +1)
  - Rule-based sentiment intensity
- **TextBlob**: Pattern-based sentiment analysis
- **Comparison**: Multiple approaches for robust sentiment scoring

### Transformer Applications
- **Text Summarization**: BART model for review summarization
- **Pipeline Integration**: Hugging Face transformers library
- **Document-level Analysis**: Aggregate insights from multiple reviews

### Model Evaluation and Analysis
- **Training Metrics**: Loss curves, accuracy tracking
- **Generation Quality**: Fluency and coherence assessment
- **Sentiment Validation**: Correlation analysis between methods
- **Performance Optimization**: Hyperparameter tuning and model selection

## Key Concepts Covered
- Recurrent Neural Networks (RNNs)
- Long Short-Term Memory (LSTM)
- Text tokenization and preprocessing
- Language modeling and text generation
- Sentiment analysis techniques
- Transformer architectures
- Model serialization and deployment
- Real-world NLP pipeline challenges

## Prerequisites
- Python 3.7+
- TensorFlow 2.x with Keras
- NLTK and VaderSentiment
- TextBlob and Transformers libraries
- Understanding of sequential data processing
- Basic knowledge of natural language concepts

## Usage Instructions
1. Open `lab6.ipynb` in Jupyter Notebook
2. Ensure Amazon reviews dataset is available at specified path
3. Run preprocessing cells to prepare text data
4. Train the RNN model (may take several minutes)
5. Generate text using different seed phrases
6. Perform sentiment analysis on reviews
7. Apply transformer summarization

## Dependencies
```python
tensorflow==2.15.0
nltk
vaderSentiment
textblob
transformers
pandas
numpy
pickle
openpyxl
```

## Expected Outcomes
By completing this lab, participants will be able to:
- Build and train RNN models for text data
- Generate coherent text using language models
- Apply multiple sentiment analysis approaches
- Use transformer models for text tasks
- Handle text preprocessing challenges
- Evaluate and interpret NLP model performance
- Deploy and use trained NLP models
