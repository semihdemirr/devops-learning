# Use Ubuntu as base image
FROM ubuntu:22.04

# Set working directory
WORKDIR /app

# Copy Python app
COPY app.py .

# Install Python
RUN apt-get update && apt-get install -y python3

# Run the app
CMD ["python3", "app.py"]
