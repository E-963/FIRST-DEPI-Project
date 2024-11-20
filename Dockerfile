FROM python:3-slim

# Install system dependencies for building Python packages
RUN apt-get update && apt-get install -y \
    build-essential \
    g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

COPY requirements.txt requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

RUN addgroup -S app && adduser -S app -G app && chown -R app:app .

USER app

EXPOSE 3000

CMD [ "gunicorn" ,"--bind", "0.0.0.0:3000", "wsgi"]
