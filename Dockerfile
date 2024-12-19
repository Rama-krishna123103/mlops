# Stage 1: Build dependencies using a builder image
FROM python:3.9-slim AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy only requirements.txt to install dependencies first (caching optimization)
COPY requirements.txt .

# Install dependencies, and clean up the pip cache to reduce image size
RUN pip install --no-cache-dir -r requirements.txt && \
    rm -rf /root/.cache

# Stage 2: Final image (smaller size)
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy installed dependencies from the builder stage
COPY --from=builder /app /app

# Copy application code and model into the container
COPY . .
COPY model.pkl /app/model.pkl

# Expose port (optional, depending on your Flask app setup)
EXPOSE 5000

# Run the Flask application when the container starts
CMD ["python", "app.py"]
