<div class="box-title">
    <p>User / <b>Manajemen User</b></p>
</div>
<div id="box">
  <h1>User</h1>

  <?php
  $status = "user";
  include('lib/koneksi.php');

  $query = $conn->prepare("SELECT * FROM tbl_users WHERE title=:title");
  $query->bindparam(':title',$status);
  $query->execute();
  $data = $query->fetchAll();
  $count = $query->rowCount();
  ?>

  <table class="news">
    <tr>
      <th>No</th>
      <th>Nama</th>
      <th>Email</th>
      <th>Username</th>
      <th>Alamat</th>
      <th>No HP</th>
      <th>Aksi</th>
    </tr>
    <?php
    $no=1;
    foreach ($data as $value): ?>
        <tr>
            <td><?php echo $no; ?></td>
            <td><?php echo "(".$value['id_user'].") ".$value['nama_lengkap'] ?></td>
            <td><?php echo $value['email'] ?></td>
            <td><?php echo $value['username'] ?></td>
            <td><?php echo $value['alamat'] ?></td>
            <td><?php echo $value['no_hp'] ?></td>
            <td>
              <a class="tombol-biru" href="?page=user_edit&id=<?php echo $value['id_user']; ?>">Ubah</a><br><br>
              <a class="tombol-merah" href="?page=user_hapus&id=<?php echo $value['id_user']; ?>">Hapus</a>
            </td>
        </tr>
    <?php
    $no++;
    endforeach;
     ?>
  </table>
  <br>
  <?php
  if ($count == 0){
    echo "<center>-- Belum ada pesanan barang --</center>";
    echo "<br>";
  }
   ?>

</div>
