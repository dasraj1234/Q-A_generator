# Use a lightweight Python image with Debian
FROM python:3.13-slim

# Install Tesseract OCR and other system packages
RUN apt-get update && \
    apt-get install -y tesseract-ocr && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory inside the container
WORKDIR /app

# Copy your project files into the container
COPY . .

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Streamlit will use
EXPOSE 8501

# Run the Streamlit app
CMD ["streamlit", "run", "appuivs1.py", "--server.port=8501", "--server.address=0.0.0.0"]
