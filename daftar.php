<!DOCTYPE html>
<html>

<head>
    <title>Daftar Akun</title>
    <link rel="stylesheet" type="text/css" href="../css/loginstyle.css">
    <!-- code by muh iriansyah putra pratama -->
</head>

<body>
    <div class="login">
        <h2 class="login-header">DAFTAR AKUN</h2>
        <form class="login-container" action="daftar.php" method="post">

            <?php

            include "../lib/koneksi.php";
            session_start();
            // code by muh iriansyah putra pratama
            if (isset($_POST['submit'])) {
                $namalengkap = $_POST['nama_lengkap'];
                $email = $_POST['email'];
                $nohp = $_POST['no_hp'];
                $alamat = $_POST['alamat'];
                $username = $_POST['username'];
                $password = $_POST['password'];
                $status = 'user';
                // code by muh iriansyah putra pratama
                try {
                    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    $pdo = $conn->prepare('INSERT INTO tbl_users (nama_lengkap, email, username, password, alamat, no_hp,title)
                          values (:nama_lengkap, :email, :username, :password, :alamat, :no_hp, :title)');
                    $insertdata = array(':nama_lengkap' => $namalengkap, ':email' => $email, 'username' => $username, 'password' => $password, ':alamat' => $alamat, ':no_hp' => $nohp, ':title' => $status);
                    $pdo->execute($insertdata);
                    // code by muh iriansyah putra pratama
                    echo "<center><button class='tombol-biru'>pendaftaran berhasil</button></center>";
                    echo "<meta http-equiv='refresh' content='1;
              url=login.php'>";
                } catch (PDOexception $e) {
                    print "pendaftaran gagal dilakukan: " . $e->getMessage() . "<br/>";
                    die();
                }
            }
            // code by muh iriansyah putra pratama
            ?>

            <p>
                <input type="text" name="nama_lengkap" placeholder="Nama Lengkap" required>
            </p>
            <p>
                <input type="email" name="email" placeholder="Email" required>
            </p>
            <p>
                <input type="text" name="no_hp" placeholder="No HP" required>
            </p>
            <p>
                <textarea name="alamat" rows="3" cols="80" placeholder="Alamat" required></textarea>
            </p>
            <hr>
            <p>
                <input type="text" name="username" maxlength="6" placeholder="Username" required>
            </p>
            <p>
                <input type="password" name="password" maxlength="6" placeholder="Password" required>
            </p>
            <p>
                <input type="submit" name="submit" value="DAFTAR">
            </p>
            <p align="center"><a href="login.php">kembali</a></p>
            <!-- code by muh iriansyah putra pratama -->
            <br>
            <center>
                <p>Repost by <a href="https://stokcoding.com/" title="StokCoding.com" target="_blank">StokCoding.com</a></p>
            </center>
        </form>

    </div>
</body>

</html>
<!-- code by muh iriansyah putra pratama -->