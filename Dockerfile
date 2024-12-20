# Base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy all app files including the pre-generated model.pkl
COPY . /app/

# Install dependencies
RUN pip install -r requirements.txt

# Expose port for the Flask app
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
