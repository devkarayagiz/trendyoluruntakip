<?php
session_start();
if (empty($_SESSION['email'])) {
    header("Location:giris.php");
    exit();
}
require_once '../db.php';

$query = $db->prepare("SELECT products_rant.id, products_rant.product_id, products_rant.comment_count, data.* FROM products_rant JOIN data ON products_rant.product_id = data.id;");
$query->execute();

$veriler = $query->fetchAll(PDO::FETCH_ASSOC);

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
        <div class="grid lg:grid-cols-4 md:grid-cols-3 grid-cols-1 gap-2 my-10">
            <?php foreach ($veriler as $veri) : ?>
                <div class="w-full overflow-hidden flex-col justify-between rounded shadow-lg items-center relative <?= strtolower($veri['brand']) == 'wefood' ? 'border-2 border-orange-600' : '' ?>">
                    <img class="w-full h-60 object-contain" src="<?php echo $veri['image']; ?>" alt="<?php echo $veri['title']; ?>" />
                    <div class="w-auto h-12 py-2 rounded bg-white border-l border-b border-orange-300 absolute top-0 right-0">
                        <span class="text-orange-600 ml-2 text-center">
                            <?= $veri['date'] ?>
                        </span>
                    </div>
                    <div class="px-2 py-2">
                        <div class="text-base min-h-[3rem]"><span class="text-lg font-bold"><?php echo $veri['brand']; ?></span> <?php echo $veri['title']; ?></div>
                        <div class="flex items-center">
                            <span>
                                <a target="_blank" href="/chart.php?product-id=<?= $veri['id'] ?>">Yorumlar: <span class="text-sm font-semibold text-orange-500"><?= $veri['comment'] ?></span></a>
                            </span>
                        </div>
                    </div>
                    <div class="flex flex-col gap-3 md:px-6 py-2 px-2">
                        <span class="inline-block rounded-full md:text-lg md:font-semibold text-pretty">Kategori: <span class="font-normal md:text-lg text-sm"> <?php echo $veri['category']; ?></span></span>
                        <span class="inline-block rounded-full md:text-lg md:font-semibold text-orange-400">
                            <?php echo $veri['price']; ?>
                        </span>
                        <a href="<?php echo $veri['url']; ?>" target="_blank" class="bg-white-500 text-center rounded border border-orange-400 px-4 py-2 font-semibold text-orange-500 transition-colors hover:bg-orange-500 hover:text-white">Ürüne Git</a>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</body>

</html>