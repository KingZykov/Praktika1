<?php session_start();

if (isset($_SESSION['user'])) {
	header('Location: ../projects.php');
	die();
}

// Checking if the form has been filled it up.
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	$user_form = filter_var(htmlspecialchars($_POST['user']), FILTER_SANITIZE_STRING);
	$password_form = filter_var(htmlspecialchars($_POST['password']), FILTER_SANITIZE_STRING);
	$password_form = hash('sha512', $password_form);
	$errors = '';

	// ----------------------- DATABASE CONNECTION ------------------------------------
	include 'C:/openserver/domains/kanban-board-website-master/db/functions.php';

	$database = new Database();
    $connection = $database->connection();
    /*$role = $_POST['select_option'];*/
	$role = 'admin';
	include 'session.perem.php';
	
	$statement = $connection->prepare('SELECT * FROM users WHERE user =? AND password =? AND role =?');
	$statement->execute(array($user_form, $password_form, $role));
	$result = $statement->rowCount();
	if ($result == 1) {
		setSessionData($statement, $id_user, $user_form, $role);
		header('Location: ../index.php');
	} elseif ($result != 1) {
		$role = 'user';
		$statement->execute(array($user_form, $password_form, $role));
		setSessionData($statement, $id_user, $user_form, $role);
		header('Location: ../index.php');
	} else {
		$errors = '<li>The username or password is incorrect</li>';
	}
}

require 'C:/openserver/domains/kanban-board-website-master/views/login.view.php';

?>

