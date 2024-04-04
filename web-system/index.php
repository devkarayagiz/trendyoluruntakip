<?php 

require("db.php");
$posts = file_get_contents('php://input');
if($posts){
    $veriler = json_decode($posts, true);

    if($veriler["onay"]=="accesdata"){
        
    $title = $veriler["title"];
    $url = $veriler["url"];
    $category = $veriler["category"];
    $price = $veriler["price"];
    $comment = $veriler["comment"];
    $brand = $veriler["brand"];
    $image = $veriler["image"];
    
    $gonder = $db->prepare("INSERT INTO data set title=?,category=?,url=?,price=?,comment=?,brand=?,image=?");
    $gonder->execute(array($title,$category,$url,$price,$comment,$brand,$image));
    if($gonder){
        echo"Databaseye Aktarım Başarılı";
    }
    else{
        echo"PROBLEM VAR.";
    }
    }
    
}


?>