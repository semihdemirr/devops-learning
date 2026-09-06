# Production-Ready Dockerfile
# Base image: lightweight Python image (not Ubuntu!)
FROM python:3.10-slim

# Metadata
LABEL maintainer="semihdemirr@gmail.com"
LABEL version="2.0"
LABEL description="My first production DevOps application"

# Set working directory
WORKDIR /app

# Copy application code
COPY app.py .

# Create non-root user for security
RUN useradd -m appuser && chown -R appuser:appuser /app

# Switch to non-root user
USER appuser

# Health check (important for production!)
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python3 app.py || exit 1

# Run application
CMD ["python3", "app.py"]
