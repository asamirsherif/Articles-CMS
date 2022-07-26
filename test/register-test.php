<?php
$servername = "localhost";
$username = "root";
$password = "12345678";

try {
    $conn = new PDO("mysql:host=$servername;dbname=articles", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    echo "Connected successfully";
  } catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
  }

echo "Connected successfully";

$hash = password_hash('123456',PASSWORD_DEFAULT);

$user = array("firstname"=>"ahmed", "lastname"=>"ahmed", "email"=>"ahmed@ahmed.com", "password" => $hash);

$sql = 'INSERT INTO user (firstname, lastname, email, password) VALUES (:firstname, :lastname, :email, :password)';

$obj = $conn->prepare($sql);

        $obj->execute(array(
                'firstname' => $user['firstname'],
                'lastname' => $user['lastname'],
                'email' => $user['email'],
                'password' => $user['password']
        )); 


echo 'done';
?> 