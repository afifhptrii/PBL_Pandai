<?php
// Konfigurasi database
$servername = "localhost";
$username = "root"; // default XAMPP username
$password = ""; // default XAMPP password (kosong)
$dbname = "pandai";

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname);

// Mengecek koneksi
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Ambil data dari form
    $email = $_POST['email'];
    $password = $_POST['password'];

    // SQL query untuk memeriksa kecocokan email dan password
    $sql = "SELECT * FROM users WHERE email = '$email'";
    $result = $conn->query($sql);

    // Jika ada data yang cocok
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        
        // Verifikasi password
        if (password_verify($password, $row['password'])) {
            // Jika password benar, login berhasil
            echo "<script>alert('Login Berhasil!'); window.location.href='dashboard.php';</script>";
        } else {
            // Jika password salah
            echo "<script>alert('Email atau Password salah!');</script>";
        }
    } else {
        // Jika email tidak ditemukan
        echo "<script>alert('Email tidak ditemukan!');</script>";
    }
}
session_start();
$_SESSION['user_id'] = $row['id'];  // Menyimpan ID pengguna dalam sesi
$_SESSION['user_email'] = $row['email'];  // Menyimpan email pengguna

$conn->close();
?>
