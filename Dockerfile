# Base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy app files
COPY . /app/


RUN echo "Hello"

# Install dependencies
RUN pip install -r requirements.txt
RUN python /app/train.py
# Expose port
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
