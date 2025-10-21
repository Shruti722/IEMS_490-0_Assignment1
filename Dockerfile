FROM python:3.10-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git build-essential curl ca-certificates \
 && rm -rf /var/lib/apt/lists/*

ENV PIP_NO_CACHE_DIR=1 \
    PYTHONUNBUFFERED=1 \
    HF_HUB_ENABLE_HF_TRANSFER=1

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip install --upgrade pip && pip install -r /app/requirements.txt

COPY . /app

RUN mkdir -p /outputs

ENV PROVIDER=groq \
    BASE_URL=https://api.groq.com/openai/v1 \
    MODEL_NAME=llama-3.1-8b-instant \
    MAX_QUESTIONS=300 \
    PER_STAGE_LIMIT=10 \
    SC_EVAL_LIMIT=3 \
    SC_SAMPLES=3

CMD ["papermill", "IEMS_490-0_Assignment1.ipynb", "/outputs/Assignment1_executed.ipynb", "-k", "python3"]
