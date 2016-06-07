<?php
class User {
  public $first_name;
  public $last_name;

  public function full_name()
  {
    return $this->first_name . ' ' . $this->last_name;
  }
}

try {
  $pdo = new PDO('mysql:host=lemp_mariadb;dbname=ghost_nmrony_info', 'root', 'nmrony');
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

  $result = $pdo->query('SELECT * FROM test');

  # Map results to object
  $result->setFetchMode(PDO::FETCH_CLASS, 'User');

  while($user = $result->fetch()) {
    # Call our custom full_name method
    echo $user->full_name();
  }
} catch(PDOException $e) {
  echo 'Error: ' . $e->getMessage();
}
