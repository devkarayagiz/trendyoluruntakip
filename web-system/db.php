<?php

try {
	$db=new PDO("mysql:host=localhost;dbname=Trendyol;charset=utf8;","root","root");
	
} catch (PDOException $e) {
	echo $e->getMessage();
}

?>