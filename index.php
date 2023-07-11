<?php session_start();

if(isset($_SESSION['user'])) {
	header('Location: projects.php');
	die();
} else {
	header('Location: main.php');
}

?>