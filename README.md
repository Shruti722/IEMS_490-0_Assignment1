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

## Environment Setup

### 1. Clone repository and install requirements
```bash
git clone https://github.com/<your-username>/IEMS_490-0_Assignment1.git
cd IEMS_490-0_Assignment1
pip install -r requirements.txt
```
### 2. Create a virtual environment (optional)
```bash
python -m venv iems490_env
source iems490_env/bin/activate    # (macOS/Linux)
iems490_env\Scripts\activate.bat   # (Windows)
```

### 3. Add .env file with your API credentials

Create a file named .env in the project root:
```bash
# Groq configuration (OpenAI-compatible)
PROVIDER=groq
GROQ_API_KEY=your_api_key_here
BASE_URL=https://api.groq.com/openai/v1
MODEL_NAME=llama-3.1-8b-instant
```

## 📁 Files and Structure

├── IEMS_490-0_Assignment1.ipynb ← Main Jupyter Notebook
├── gsm8k_subset.csv ← Subset of GSM8K used for evaluation
├── results_baseline.csv
├── results_manual_improved.csv
├── results_few_shot.csv
├── results_self_consistency.csv
├── results_automated_best_full.csv
├── summary_accuracies.csv
├── preview_*.csv ← 10-row samples for inspection
├── requirements.txt
├── .env.example
└── README.md

## Dataset — GSM8K

1. **Source: Hugging Face Dataset openai/gsm8k (split: main)
2. **Subset Size: ≈ 300 samples (for runtime efficiency)
3. **Backup: A local 5-sample set is embedded to run offline.
4. **Format: Each question includes a #### ANSWER annotation extracted and normalized to numeric form.

## Methodology / Pipeline

1. **Data Loading & Normalization**
   - Download GSM8K or use fallback sample.  
   - Extract final numeric answers (`#### N`).

2. **Prompt Templates**
   - Minimal baseline  
   - Manual improvement (step-by-step)  
   - Few-shot reasoning (3 examples + CoT reasoning)

3. **Evaluation Metrics**
   - Per-question accuracy = ( Pred == GT )  
   - Aggregated mean accuracy across subset

4. **Self-Consistency (Ensemble)**
   - Generate k samples ( k = 3 → 5 ).  
   - Vote by mode of numeric answers.

5. **Automated Prompt Optimization (OPRO)**
   - Model proposes new instruction blocks.  
   - Each candidate evaluated on a subset; best prompt selected.

---

## Results

| Prompt Type         | Accuracy |
|----------------------|-----------|
| Baseline             | 0.80 |
| Manual Improved      | 0.60 |
| Few-Shot             | 0.80 |
| Self-Consistency     | **1.00** |
| Automated Best       | **0.89** |

### **Observations**
- Baseline performance is already strong on simple GSM8K items.  
- Manual reasoning instructions can over-constrain small models.  
- Few-shot examples recover baseline accuracy.  
- Self-consistency achieves perfect accuracy on the subset by voting out noise.  
- Automated prompt search (OPRO) discovers a prompt with near-optimal accuracy (0.89).

---

## Discussion & Insights

- **Prompt engineering matters:** Model accuracy varies by ~20% across prompt styles.  
- **Reasoning verbosity trade-off:** Verbose "tutor" prompts may distract smaller LLMs.  
- **Few-shot and self-consistency are most robust:** Combining structured context and ensemble sampling yields reliable numerical answers.  
- **Automated prompt optimization (OPRO):** Effective in refining instructions without human intervention.  
- **API portability:** Groq’s OpenAI-compatible endpoint allowed seamless migration from OpenAI API to a cost-efficient LLM backend.

---

## Deliverables

| Artifact | Description |
|-----------|-------------|
| `IEMS_490-0_Assignment1.ipynb` | Full code pipeline with outputs and plots. |
| `summary_accuracies.csv` | Tabulated accuracies for all prompt types. |
| `preview_*.csv` | Sample predictions for transparency and grading. |
| `IEMS_490-0_Assignment1_Report_ShrutiKalaskar.pdf` | 4-page technical write-up (submitted separately on Canvas). |

---

## How to Run End-to-End

1. Launch Jupyter Notebook:
   ```bash
   jupyter notebook IEMS_490-0_Assignment1.ipynb
   ```
2. Ensure your .env is configured and kernel has packages installed.
3. Run all cells sequentially (Kernel → Restart & Run All).
4. Final outputs will appear at the bottom with the accuracy table and CSV files.


