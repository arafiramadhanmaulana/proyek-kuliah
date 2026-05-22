# Gunakan image Python
FROM python:3.9-slim

# Tentukan direktori kerja dalam kontainer
WORKDIR /app

# Salin file requirements dan install dependensi
COPY requirements.txt .
RUN pip install -r requirements.txt

# Salin semua file ke dalam kontainer
COPY . .

# Jalankan aplikasi Flask
CMD ["python", "app.py"]