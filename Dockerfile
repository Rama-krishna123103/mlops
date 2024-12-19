FROM python:3.9-alpine

WORKDIR /app

COPY requirements.txt .
# Make sure to copy model.pkl into the container
COPY model.pkl /app/model.pkl

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "app.py"]
