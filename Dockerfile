# Use Python 3 Alpine as base image
FROM python:3-alpine

# Install necessary build tools and system dependencies
RUN apk add --no-cache \
    build-base \
    g++ \
    libffi-dev \
    musl-dev \
    python3-dev \
    libpq-dev  # Add any additional dependencies that may be required by your application

# Ensure correct version of pip is installed
RUN python -m ensurepip --upgrade && pip install --no-cache-dir --upgrade pip setuptools wheel

# Create and activate a virtual environment
RUN python3 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Set the working directory
WORKDIR /app

# Copy application files
COPY . .

# Install dependencies from the requirements.txt
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Create and configure a non-root user for security reasons
RUN addgroup -S app && adduser -S app -G app && chown -R app:app /app

# Switch to the non-root user
USER app

# Expose the application port (adjust if needed)
EXPOSE 3000

# Set the command to start the application (e.g., using gunicorn)
CMD ["gunicorn", "--bind", "0.0.0.0:3000", "wsgi"]
