<?php
session_start();
if (empty($_SESSION['email'])) {
    header("Location:giris.php");
    exit();
}


require_once '../db.php';

$productId = htmlspecialchars($_GET['product-id']);
if (!$productId || !is_numeric($productId)) {
    header("Location:datalist.php");
    exit();
}

$query = $db->prepare("SELECT * FROM data WHERE id=:product_id");
$query->bindParam(':product_id', $productId, PDO::PARAM_INT);
$query->execute();
$fetchProduct = $query->fetch(PDO::FETCH_ASSOC);

$query = $db->prepare("SELECT * FROM data WHERE brand=:brand and category=:category and title=:title");
$query->bindParam(':brand', $fetchProduct['brand'], PDO::PARAM_STR);
$query->bindParam(':category', $fetchProduct['category'], PDO::PARAM_STR);
$query->bindParam(':title', $fetchProduct['title'], PDO::PARAM_STR);

$query->execute();

$products = $query->fetchAll(PDO::FETCH_ASSOC);
$dates = [];
$comments = [];
$prices = [];

foreach ($products as $product) {
    $date = DateTime::createFromFormat('Y-m-d H:i:s', $product['date']);
    if (!$date) {
        continue;
    }
    $dates[] = $date->format('d-M');
    $comments[] = $product['comment'];
    $price = preg_replace('/[^0-9.]/', '', $product['price']);
    $prices[] = $price;
}

?>
<!doctype html>
<html lang="tr">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Admin Panel</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"> </script>
    <style>
        /* Grafiği sarmak için div stilini tanımlayın */
        .chart-container {
            width: 800px;
            /* veya istediğiniz genişlik */
            height: 400px;
            /* veya istediğiniz yükseklik */
            overflow: auto;
            /* Taşma durumunda kaydırma ekleyin */
        }
    </style>
</head>

<body>
    <?php
    echo 'Hoşgeldin ' . $_SESSION['adsoyad'];
    echo '</br>';
    echo '<a href="cikisyap.php">Çıkış Yap</a><br>';
    echo '<a href="products-rant.php">En Son Yorumlanan Ürünler</a>';

    ?>

    <div class="container mx-auto">
        <div class="w-full flex h-96 gap-4">
            <div class="flex flex-col">
                <h1 class="text-2xl font-bold">Yorumlar</h1>
                <canvas id="commentsChart" width="400" height="400"></canvas>
            </div>
            <div class="flex flex-col">
                <h1 class="text-2xl font-bold">Fiyatlar</h1>
                <canvas id="prices" width="400" height="400"></canvas>
            </div>
        </div>
    </div>
    <script>
        // Günlük yorum sayıları
        const dailyComments = <?= json_encode($comments) ?>;
        const prices = <?= json_encode($prices) ?>;
        // dates
        const labels = <?= json_encode($dates) ?>;

        // Grafiği oluşturma
        const ctx = document.getElementById('commentsChart').getContext('2d');
        const price = document.getElementById('prices').getContext('2d');
        const commentsChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: labels,

                datasets: [{
                    label: 'Yorum Grafiği',
                    data: dailyComments,
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
        const pricesChart = new Chart(price, {
            type: 'line',
            data: {
                labels: labels,
                datasets: [{
                    label: 'Fiyat Grafiği(TL)',
                    data: prices,
                    backgroundColor: 'rgba(237, 137, 54, 0.8)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    </script>
</body>

</html>