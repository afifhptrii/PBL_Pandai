<?php
$host = 'localhost';  // Sesuaikan dengan host database Anda
$username = 'root';   // Sesuaikan dengan username MySQL Anda
$password = '';       // Sesuaikan dengan password MySQL Anda
$dbname = 'Pandai';   // Nama database Anda

// Koneksi ke MySQL
$conn = new mysqli($host, $username, $password, $dbname);

// Cek koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
