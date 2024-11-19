# Use the official Python image with Alpine
FROM python:3-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install build dependencies for Python packages
RUN apk update && apk add --no-cache \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev \
    cargo \
    python3-dev \
    && pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del gcc musl-dev libffi-dev openssl-dev python3-dev

# Add a non-root user
RUN addgroup -S app && adduser -S app -G app && chown -R app:app .

# Change to non-root user
USER app

# Expose the application port
EXPOSE 3000

# Run the application
CMD ["gunicorn", "--bind", "0.0.0.0:3000", "wsgi"]
