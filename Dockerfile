# Base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app
RUN python train.py
# Copy all files into the container
COPY . /app/

# Install dependencies
RUN pip install -r requirements.txt

# Train the model and save it as model.pkl


# Expose port for the Flask app
EXPOSE 5000

# Run the Flask app
CMD ["python", "app.py"]
