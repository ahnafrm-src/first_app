<?php
header("Content-Type: application/json");
include "koneksi_db.php";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nama = $_POST['nama'];
    $nis = $_POST['nis'];
    $tplahir = $_POST['tplahir'];
    $tglahir = $_POST['tglahir'];
    $kelamin = $_POST['kelamin'];
    $agama = $_POST['agama'];
    $alamat = $_POST['alamat'];
}


$stmt = $db->prepare("INSERT INTO siswa (nama, nis, tplahir, tglahir, kelamin, agama, alamat) VALUES (?, ?, ?, ?, ?, ?, ?)");

$result = $stmt->execute([$nama, $nis, $tplahir, $tglahir, $kelamin, $agama, $alamat]);

echo json_encode(
    [
        'success' => $result
    ]
);
