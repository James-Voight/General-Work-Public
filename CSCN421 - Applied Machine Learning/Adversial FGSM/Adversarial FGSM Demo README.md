# Adversarial FGSM Demo

## Overview
This Jupyter notebook demonstrates adversarial machine learning attacks using the Fast Gradient Sign Method (FGSM) on a Convolutional Neural Network (CNN) trained on the MNIST dataset. The demo shows how small, carefully crafted perturbations can fool neural networks into making incorrect predictions.

## Learning Objectives
- Understand adversarial attacks and their implications for ML security
- Learn the Fast Gradient Sign Method (FGSM) algorithm
- Implement adversarial example generation
- Evaluate model robustness against adversarial inputs
- Visualize the effects of adversarial perturbations

## Technical Components

### Dataset and Model
- **MNIST Dataset**: Handwritten digit recognition (60,000 train, 10,000 test)
- **CNN Architecture**:
  - Convolutional layers (32, 64 filters)
  - Max pooling layers
  - Batch normalization and ReLU activation
  - Dense layers with dropout (30%)
  - Softmax output (10 classes)

### Adversarial Attack Implementation
- **Fast Gradient Sign Method (FGSM)**: One-step adversarial attack
- **Perturbation Generation**: Gradient-based input manipulation
- **ε Parameter**: Controls attack strength (perturbation magnitude)
- **Targeted vs. Untargeted Attacks**: Different attack objectives

### Evaluation Metrics
- **Clean Accuracy**: Model performance on original images
- **Adversarial Accuracy**: Model performance on perturbed images
- **Attack Success Rate**: Percentage of successful misclassifications
- **Perturbation Magnitude**: L2/L∞ norms of added noise

### Visualization
- **Original Images**: Clean MNIST samples
- **Adversarial Examples**: Perturbed images causing misclassification
- **Difference Maps**: Visualization of applied perturbations
- **Confidence Scores**: Model prediction probabilities

## Key Concepts Covered
- Adversarial machine learning
- Fast Gradient Sign Method (FGSM)
- Neural network vulnerability analysis
- Gradient-based optimization
- Model robustness evaluation
- Adversarial example generation
- Defense implications and considerations

## Prerequisites
- Python 3.7+
- TensorFlow 2.x with Keras
- NumPy, Matplotlib, Scikit-learn
- Understanding of CNNs and gradient descent
- Basic knowledge of image processing

## Usage Instructions
1. Open `Adversarial FGSM Demo.ipynb` in Jupyter Notebook
2. Run cells sequentially to train the baseline CNN model
3. Evaluate clean model performance on MNIST test set
4. Implement FGSM adversarial attack
5. Generate adversarial examples with different ε values
6. Analyze attack effectiveness and visualize results
7. Compare model predictions on clean vs. adversarial inputs

## Dependencies
```python
tensorflow==2.15.0
numpy
matplotlib
scikit-learn
```

## Expected Outcomes
By completing this demo, participants will understand:
- How adversarial attacks exploit neural network vulnerabilities
- The mathematical foundation of gradient-based attacks
- Methods to generate imperceptible but effective perturbations
- Importance of adversarial robustness in ML systems
- Techniques for evaluating model security
- Real-world implications of adversarial ML

## Security Implications
- **Model Vulnerabilities**: Neural networks are susceptible to adversarial inputs
- **Real-world Threats**: Adversarial attacks can compromise deployed ML systems
- **Defense Strategies**: Need for robust training and input validation
- **Research Directions**: Ongoing work in adversarial ML defense

## References
- Goodfellow, I. J., Shlens, J., & Szegedy, C. (2014). Explaining and harnessing adversarial examples. arXiv preprint arXiv:1412.6572.
- MNIST Dataset: LeCun, Y., Cortes, C., & Burges, C. J. C. (1998). The MNIST database of handwritten digits.
