<?php
header('Content-Type: application/json');
include "koneksi_db.php";

$id = $_GET['id'];

$stmt = $db->prepare("SELECT id, nis, nama, tplahir, tglahir, kelamin, agama, alamat FROM siswa WHERE id = ?");
$stmt->execute([$id]);
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

echo json_encode($result);