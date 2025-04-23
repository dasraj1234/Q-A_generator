FROM python:3.11-slim

# Install system dependencies needed by Tesseract and Python packages
RUN apt-get update && \
    apt-get install -y \
    tesseract-ocr \
    libgl1 \
    libglib2.0-0 \
    libxml2 \
    libxslt1.1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Streamlit will use
EXPOSE 8501

# Run Streamlit
CMD ["streamlit", "run", "appuivs1.py", "--server.port=8501", "--server.address=0.0.0.0"]
