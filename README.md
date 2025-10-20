# IEMS_490-0_Assignment1
## Shruti Kalaskar

---

## Overview

This assignment explores how **prompt design** and **evaluation techniques** influence the performance of a language model on **elementary mathematical reasoning tasks**.  
Using the **GSM8K** dataset of grade-school math word problems, a **Groq LLM** (LLaMA 3 series) was queried through an **OpenAI-compatible API** to test several prompting strategies:

1. **Baseline prompt** (minimal instruction)  
2. **Manual improved prompt** (explicit reasoning)  
3. **Few-shot prompt** (contextual exemplars)  
4. **Self-consistency** (majority voting across multiple stochastic samples)  
5. **Automated prompt optimization** (OPRO-style iterative improvement)

The goal is to understand how structured prompting and ensemble reasoning affect quantitative accuracy and reasoning stability.

---

## ⚙️ Environment Setup

### 1. Clone repository and install requirements
```bash
git clone https://github.com/<your-username>/IEMS_490-0_Assignment1.git
cd IEMS_490-0_Assignment1
pip install -r requirements.txt
```
