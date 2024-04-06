<?php

require("db.php");
$posts = file_get_contents('php://input');
if ($posts) {
    $veriler = json_decode($posts, true);
    if ($veriler["onay"] == "accesdata") {

        $title = $veriler["title"];
        $url = $veriler["url"];
        $category = $veriler["category"];
        $price = $veriler["price"];
        $comment = $veriler["comment"];
        $brand = $veriler["brand"];
        $image = $veriler["image"];

        $queryProduct = $db->prepare("SELECT * FROM data WHERE title=:title and category=:category and brand=:brand");
        $queryProduct->bindParam(':title', $title, PDO::PARAM_STR);
        $queryProduct->bindParam(':category', $category, PDO::PARAM_STR);
        $queryProduct->bindParam(':brand', $brand, PDO::PARAM_STR);
        $queryProduct->execute();

        if ($result = $queryProduct->fetch(PDO::FETCH_ASSOC)) {
            // önceki ürünün yorumu alınıp, yeni gelen yoruma göre %30 artmışsa bu ürün, `product_rant` tablosuna eklenir.
            $commentOld = $result['comment'];
            $commentNew = $comment;
            $commentOld = preg_replace('/[^0-9.]/', '', $commentOld);
            $commentNew = preg_replace('/[^0-9.]/', '', $commentNew);
            $commentOld = (float) $commentOld;
            $commentNew = (float) $commentNew;
            $commentDiff = $commentNew - $commentOld;
            $commentDiffPercent = ($commentDiff / $commentOld) * 100;

            if ($commentDiffPercent > 30) {
                $queryProductRant = $db->prepare("INSERT INTO products_rant set product_id=?,before_comment_count=?,comment_count=?");
                $queryProductRant->execute(array($result['id'], $commentOld, $commentNew));
            }
        }

        $gonder = $db->prepare("INSERT INTO data set title=?,category=?,url=?,price=?,comment=?,brand=?,image=?");
        $gonder->execute(array($title, $category, $url, $price, $comment, $brand, $image));
        if ($gonder) {
            echo "Databaseye Aktarım Başarılı";
        } else {
            echo "PROBLEM VAR.";
        }
    }
}
