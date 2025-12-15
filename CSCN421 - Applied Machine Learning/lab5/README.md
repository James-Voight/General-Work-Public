# Lab 5: CIFAR-10 Image Classification with Deep Learning

## Overview
This laboratory exercise explores deep learning techniques for image classification using the CIFAR-10 dataset. Students will implement Convolutional Neural Networks (CNNs), experiment with data augmentation strategies, and apply transfer learning approaches to improve model performance.

## Learning Objectives
- Understand CNN architectures for image classification
- Implement data preprocessing pipelines for images
- Apply data augmentation techniques to improve model generalization
- Use transfer learning with pre-trained models
- Compare different neural network configurations and training strategies

## Dataset
- **CIFAR-10**: 60,000 32×32 color images in 10 classes (50,000 train, 10,000 test)
- **Classes**: airplane, automobile, bird, cat, deer, dog, frog, horse, ship, truck
- **Challenge**: Small image size with complex patterns requiring deep feature learning

## Workflow Components

### Data Exploration and Preprocessing
- **Dataset Loading**: Import CIFAR-10 from Keras/TensorFlow
- **Data Visualization**: Display sample images from each class
- **Preprocessing Pipeline**: Image resizing, normalization, and one-hot encoding
- **Train/Validation/Test Split**: 80/20 train/validation split from training data

### Baseline CNN Model
- **Architecture**: Multi-layer CNN with convolutional and pooling layers
- **Components**:
  - Convolutional layers (32, 64, 128 filters)
  - Max pooling layers
  - Dense layers with dropout (30%)
  - Softmax output layer (10 classes)
- **Training**: Adam optimizer, categorical cross-entropy loss
- **Evaluation**: Accuracy, loss curves, confusion matrices

### Data Augmentation
- **tf.image-based Augmentation**:
  - Random horizontal flips
  - Random brightness and contrast adjustments
  - Random cropping with padding
- **Keras Augmentation Layers**:
  - Sequential augmentation pipeline
  - Real-time augmentation during training
  - Sparse categorical labels optimization

### Transfer Learning
- **Pre-trained Models**: EfficientNetB0, MobileNetV2, EfficientNetV2B0
- **Fine-tuning Strategy**: Feature extraction followed by custom classification head
- **Preprocessing**: Model-specific input preprocessing (RGB conversion, resizing)
- **Training Optimization**: Early stopping and learning rate scheduling

### Performance Analysis
- **Training Curves**: Loss and accuracy plots for train/validation
- **Model Comparison**: Baseline vs. augmented vs. transfer learning
- **Hyperparameter Tuning**: Learning rates, batch sizes, epochs
- **Error Analysis**: Understanding model limitations and failure cases

## Key Concepts Covered
- Convolutional Neural Networks (CNNs)
- Data augmentation for image data
- Transfer learning and fine-tuning
- Image preprocessing pipelines
- Model evaluation and comparison
- Overfitting prevention techniques
- TensorFlow/Keras best practices

## Prerequisites
- Python 3.7+
- TensorFlow 2.x
- NumPy, Pandas, Matplotlib, Seaborn
- Understanding of neural network basics
- Familiarity with image processing concepts

## Usage Instructions
1. Open `CFIR10.ipynb` in Jupyter Notebook
2. Run cells sequentially to execute the complete workflow
3. Observe data preprocessing and visualization outputs
4. Monitor training progress and performance metrics
5. Compare results across different model configurations

## Dependencies
```python
tensorflow==2.15.0
numpy
pandas
matplotlib
seaborn
```

## Expected Outcomes
By completing this lab, participants will be able to:
- Build and train CNNs for image classification tasks
- Implement effective data augmentation strategies
- Apply transfer learning techniques to new datasets
- Analyze and interpret model performance
- Optimize neural network training procedures
- Handle common challenges in deep learning workflows
