<?php
// Halaman ini hanya dapat diakses jika pengguna sudah login
session_start();
if (!isset($_SESSION['user_id'])) {
    header("Location: sign-in.html");
    exit();
}

// Kode untuk menampilkan halaman dashboard
echo "<h1>Welcome to your Dashboard!</h1>";
echo "<p>You are logged in.</p>";
?>
