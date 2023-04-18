<?php
session_start();
include "db_conn.php";

if (isset($_POST["uname"]) && isset($_POST["password"])) {
    $uname = $_POST["uname"];
    $pass = $_POST["password"];

    if (empty($uname)) {
        header("Location: index.php?error=Userame is required");
        exit();
    } elseif (empty($pass)) {
        header("Location: index.php?error=Password is required");
        exit();
    } else {
        $query = "SELECT * FROM users WHERE username='$uname' and password='$pass'";
        $result = mysqli_query($conn, $query);
        $rows = mysqli_fetch_array($result);

        if ($rows) {
			$row = mysqli_fetch_assoc($result);

            	$_SESSION['username'] = $rows['username'];
            	$_SESSION['name'] = $rows['name'];
            	$_SESSION['id'] = $rows['id'];
            	header("Location: home.php");
		        exit();
            
        } else {
			header("Location: index.php?error=Incorect User name or password");
        }
    }
} else {
    header("Location: index.php");
    exit();
}
?>
