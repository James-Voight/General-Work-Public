# Lab 7: Reinforcement Learning

## Overview
This laboratory exercise provides a comprehensive introduction to reinforcement learning (RL) concepts and algorithms. Students will implement and compare various RL approaches on the CartPole environment, progressing from simple hand-crafted policies to advanced deep reinforcement learning methods.

## Learning Objectives
- Understand fundamental reinforcement learning concepts
- Implement and evaluate different policy types
- Apply Monte Carlo and Temporal Difference methods
- Train Deep Q-Networks (DQN) for continuous control
- Compare performance across different RL algorithms
- Analyze exploration vs. exploitation trade-offs

## Environment
- **CartPole-v1**: Classic control task from OpenAI Gym
- **State Space**: [cart position, cart velocity, pole angle, pole angular velocity]
- **Action Space**: Discrete (2 actions: push cart left/right)
- **Goal**: Balance pole for maximum time steps (up to 500)
- **Reward**: +1 for each time step pole remains upright

## Workflow Components

### Basic Policy Evaluation
- **Random Agent**: Baseline performance with random actions
- **Policy A**: Simple threshold-based policy using pole angle
- **Policy B**: Advanced two-mode policy using angle and angular velocity
- **Performance Metrics**: Mean return, standard deviation, episode lengths
- **Visualization**: GIF animations of agent behavior

### Environment Discretization
- **State Space Discretization**: Convert continuous states to discrete bins
- **Q-Table Creation**: Initialize value function representation
- **Policy Evaluation**: Assess discretized environment properties

### Monte Carlo Methods
- **MC Control**: Learn optimal policy through complete episode sampling
- **Parameters**:
  - Episodes: 20,000 training episodes
  - Learning rate (α): 0.1-0.2 with decay
  - Exploration (ε): 1.0 with exponential decay
  - Discount factor (γ): 1.0
- **Evaluation**: Mean return and stability metrics

### Temporal Difference Learning
- **Q-Learning**: Update value estimates using bootstrapping
- **SARSA**: On-policy TD learning variant
- **Hyperparameters**:
  - Learning rate: 0.3 with slow decay
  - Exploration decay: 5e-4
  - Evaluation frequency: Every 1,000 episodes

### Deep Reinforcement Learning
- **Deep Q-Network (DQN)**: Neural network approximation of Q-function
- **Stable Baselines3**: Professional RL library implementation
- **Training Components**:
  - Experience replay buffer
  - Target network for stability
  - ε-greedy exploration strategy
- **Evaluation**: Performance on modified environment (stricter termination)

### Performance Analysis
- **Algorithm Comparison**: Random vs. MC vs. TD vs. DQN
- **Training Curves**: Learning progress visualization
- **Stability Metrics**: Mean - standard deviation scoring
- **Hyperparameter Sensitivity**: Impact of learning rates and exploration

## Key Concepts Covered
- Markov Decision Processes (MDPs)
- Policy evaluation and improvement
- Exploration vs. exploitation dilemma
- Monte Carlo sampling methods
- Temporal difference learning
- Function approximation with neural networks
- Deep Q-Learning algorithms
- Experience replay and target networks

## Prerequisites
- Python 3.7+
- Gymnasium (formerly OpenAI Gym)
- Stable Baselines3
- NumPy, Matplotlib
- Understanding of probability and dynamic programming
- Basic knowledge of neural networks

## Usage Instructions
1. Open `Lab7.ipynb` in Jupyter Notebook
2. Install required dependencies (gymnasium, stable-baselines3)
3. Run cells sequentially from basic policies to advanced DQN
4. Observe training progress and evaluation metrics
5. Compare algorithm performance across different approaches
6. Analyze generated GIF animations of learned behaviors

## Dependencies
```python
gymnasium==0.28.1
stable-baselines3[extra]
numpy
matplotlib
swig
```

## Custom RL Tools
- **rltools.py**: Custom implementations of RL algorithms
- **RandomAgent**: Random action selection
- **MCAgent**: Monte Carlo control implementation
- **TDAgent**: Temporal difference Q-learning
- **SB3Agent**: Stable Baselines3 wrapper

## Expected Outcomes
By completing this lab, participants will be able to:
- Implement basic and advanced RL algorithms
- Evaluate and compare different learning approaches
- Understand exploration strategies and their impact
- Train neural networks for reinforcement learning
- Analyze RL algorithm performance and stability
- Apply RL techniques to continuous control problems
- Debug and optimize RL training procedures
