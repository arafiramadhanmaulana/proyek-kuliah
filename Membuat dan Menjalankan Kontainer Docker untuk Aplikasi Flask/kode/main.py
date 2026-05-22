from flask import Flask, jsonify, render_template_string, request
from datetime import datetime
import socket
import platform

app = Flask(__name__)

homepage_template = """
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>E-Learning ITERA</title>
    <style>
        body { font-family: Arial, sans-serif; background-color:
        h1 { color:
        ul { list-style-type: none; padding: 0; }
        li { margin: 10px 0; }
        a { text-decoration: none; color:
        a:hover { text-decoration: underline; }
        .container { background: white; padding: 30px; border-radius: 10px; box-shadow: 0 0 15px rgba(0,0,0,0.1); }
    </style>
</head>
<body>
    <div class="container">
        <h1>📚 E-Learning ITERA (Dockerized)</h1>
        <p><strong>Mahasiswa:</strong> {{ nama }}</p>
        <p><strong>NIM:</strong> {{ nim }}</p>
        <p>Silakan jelajahi layanan E-Learning berikut:</p>
        <ul>
            <li><a href="/info">📄 Info Aplikasi</a></li>
            <li><a href="/courses">📘 Daftar Mata Kuliah</a></li>
            <li><a href="/students">👨‍🎓 Data Mahasiswa</a></li>
            <li><a href="/lecturer">👩‍🏫 Data Dosen</a></li>
            <li><a href="/schedule">🗓️ Jadwal Kuliah</a></li>
            <li><a href="/status">📊 Status Sistem</a></li>
            <li><a href="/healthcheck">✅ Health Check</a></li>
            <li><a href="/api/docs">🧾 Dokumentasi API</a></li>
        </ul>
    </div>
</body>
</html>