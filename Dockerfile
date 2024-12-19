# Use the official Python 3.9 slim image as a base
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Copy the trained model into the container
COPY model.pkl /app/model.pkl

# Run the Flask application
CMD ["python", "app.py"]
