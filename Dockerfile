# Use Python 3.8 slim base image
FROM python:3.8-slim

# Set working directory
WORKDIR /app

# Install system dependencies for Playwright, MySQL, and Matplotlib
RUN apt-get update && apt-get install -y \
    build-essential \
    pkg-config \
    libpq-dev \
    libmariadb-dev \
    libmariadb-dev-compat \
    libjpeg-dev \
    zlib1g-dev \
    libpng-dev \
    libwoff1 \
    libwoff-dev \
    libfontconfig1 \
    libfreetype6 \
    libx11-6 \
    libxext6 \
    libxrender1 \
    fonts-liberation \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip==25.0.1
# Install Playwright browsers
RUN pip install playwright && playwright install

# Copy requirements.txt
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Set environment variables 
ENV PYTHONUNBUFFERED=1 \
    DJANGO_SETTINGS_MODULE=Tiktok.settings

# Expose port 8000
EXPOSE 8000

# Command to run the application
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "Tiktok.wsgi:application"]