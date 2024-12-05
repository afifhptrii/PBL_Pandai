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
    $username = $_POST['username'];
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Hash password
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // SQL query untuk memasukkan data
    $sql = "INSERT INTO users (username, email, password) VALUES ('$username', '$email', '$hashed_password')";

    if ($conn->query($sql) === TRUE) {
        // Jika berhasil, tampilkan pesan sukses
        echo "<script>alert('Sign Up Berhasil!'); window.location.href='sign-in.html';</script>";
    } else {
        // Jika gagal, tampilkan pesan error
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

$conn->close();
?>
