<div class="box-title">
    <p>Beranda / <b>Produk Jualan</b></p>
</div>
<div id="box">

  <?php
  if (isset ($_SESSION['username']) == ""){ ?>
    <div class="pesan">
      <p>Masuk dengan <b>akun</b> terlebih dahulu sebelum mulai belanja, belum punya akun ?
      <a href="page/daftar.php" class="tombol-biru">Yuk Daftar</a></p>
    </div>
  <?php } ?>

  <table>
  <tr>
  <?php
  include 'lib/koneksi.php';
  $no = 1;
  $query = $conn->prepare("SELECT * FROM tbl_barang");
  $query->execute();

  $data = $query->fetchAll();

  foreach ($data as $value) { ?>
    <td class="list">
      <img src="img/jersey/<?php echo $value['nama_image']; ?>" width="100">
    <br><?php echo $value['deskripsi']; ?>
    <br><b><?php echo "Rp.".$value['harga']; ?></b>
    <br>
    <?php

    $id = $value['id_barang'];
    $query = $conn->prepare("SELECT SUM(qty)AS jumlah FROM tbl_pesanan WHERE id_barang=:id");
    $query->bindparam(':id', $id);
    $query->execute();
    $data = $query->fetch(PDO::FETCH_OBJ);
    $hasil = $data->jumlah;

    $stok = $value['stok'];
    $sisa = ($stok-$hasil);
    ?>
    <button type="button">Stok : <?php
    if ($sisa > 0) echo $sisa;
    else echo "Habis";
    ?></button>
    <?php
    if ($sisa > 0){
    if (isset ($_SESSION['username']) != ""){ ?>
      <a class="link"href="?page=belanja_detail&id=<?php echo $value['id_barang']; ?>&st=<?php echo $sisa; ?>">Beli</a>
    <?php }} ?>
    </td>
  <?php
    if ($no%4 == 0) echo "</tr><tr>";
    $no++;
    } ?>
</tr>
</table>
</div>
