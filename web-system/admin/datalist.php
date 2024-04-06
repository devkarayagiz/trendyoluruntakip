<?php
session_start();
if (empty($_SESSION['email'])) {
    header("Location:giris.php");
    exit();
}
require_once '../db.php';

$date = htmlspecialchars($_GET['date'] ?? '');
$category = htmlspecialchars($_GET['category'] ?? '');
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
</head>

<body>

    <?php
    echo 'Hoşgeldin ' . $_SESSION['adsoyad'];
    echo '</br>';
    echo '<a href="cikisyap.php">Çıkış Yap</a><br>';
    echo '<a href="products-rant.php">En Son Yorumlanan Ürünler</a>';


    $category_link = 'https://www.trendyol.com/' . $category;

    $sayfa = isset($_GET['sayfa']) ? (int)$_GET['sayfa'] : 1;
    $limit = 10;
    $offset = ($sayfa - 1) * $limit;

    $where = '';

    if ($category) {
        $where .= ' where category="' . $category_link . '"';
    }

    if ($date) {
        $startDate = str_replace('-', '', $date) . '000000';
        $endDate = str_replace('-', '', $date) . '235959';
        $where .= ' AND date BETWEEN ' . $startDate . ' AND ' . $endDate;
    }

    $sorgu = $db->prepare("SELECT COUNT(*) AS toplam FROM data {$where}");
    $sorgu->execute();
    $say = $sorgu->fetch(PDO::FETCH_ASSOC);
    $toplam_sayfa = ceil($say['toplam'] / $limit);

    $sorgu = $db->prepare("SELECT * FROM data {$where} ORDER BY id DESC LIMIT :limit OFFSET :offset");
    $sorgu->bindParam(':limit', $limit, PDO::PARAM_INT);
    $sorgu->bindParam(':offset', $offset, PDO::PARAM_INT);
    $sorgu->execute();
    $veriler = $sorgu->fetchAll(PDO::FETCH_ASSOC);

    $sql = "SELECT category FROM data GROUP BY category";
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll();
    $categories = [0 => 'Tümü'];

    foreach ($results as $result) {
        [$name, $id] = explode('-x-', $slug = explode('.com/', $result['category'])[1]);
        $categories[$slug] = $name;
    }

    ?>
    <div class='container mt-5'>
        <h2>Veri Listesi</h2>
        <form action="">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label for="">
                            Kategori
                        </label>
                        <select name="category" class="form-control" id="">
                            <?php foreach ($categories as $key => $item) : ?>
                                <option <?php echo ($key == $category) ? 'selected' : null ?> value="<?php echo $key ?>"><?php echo $item ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="">Tarih</label>
                        <input type="date" name="date" class="form-control" value="<?php echo $date ?>">
                    </div>
                </div>

                <div class="col-md-2">
                    <button class="btn btn-primary">Filtrele</button>
                </div>
            </div>

        </form>
        <div class="grid lg:grid-cols-4 md:grid-cols-3 grid-cols-1 gap-2 my-10">
            <?php foreach ($veriler as $veri) : ?>
                <div class="w-full overflow-hidden flex-col justify-between rounded shadow-lg items-center relative <?=strtolower($veri['brand']) == 'wefood' ? 'border-2 border-orange-600': ''?>">
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
                                <a target="_blank" href="/chart.php?product-id=<?=$veri['id']?>">Yorumlar: <span class="text-sm font-semibold text-orange-500"><?=$veri['comment']?></span></a>
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

        <!-- <table class='table table-striped'>
        <thead>
        <tr>
            <th scope='col'>Başlık</th>
            <th scope='col'>URL</th>
            <th scope='col'>Kategori</th>
            <th scope='col'>Fiyat</th>
            <th scope='col'>Yorum</th>
            <th scope='col'>Marka</th>
            <th scope='col'>Tarih</th>
            <th scope='col'>Resim</th>
        </tr>
        </thead>
        <tbody>
        <?php
        foreach ($veriler as $veri) {
        ?>
            <tr>
                <td><?php echo $veri['title']; ?></td>
                <td>
                    <?php
                    $url = $veri['url'];
                    if (strlen($url) > 90) {
                        $short_url = substr($url, 0, 100);
                        echo $short_url . "... <a href='$url' target='_blank'>Tıkla Git</a>";
                    } else {
                        echo $url;
                    }
                    ?>
                </td>
                <td><?php echo $veri['category']; ?></td>
                <td><?php echo $veri['price']; ?></td>
                <td><?php echo $veri['comment']; ?></td>
                <td><?php echo $veri['brand']; ?></td>
                <td><?php echo $veri['date']; ?></td>
                <td><img src='<?php echo $veri['image']; ?>' alt='Resim'
                         style='max-width: 100px; max-height: 100px;'></td>
            </tr>
            <?php
        }
            ?>
        </tbody>
    </table> -->
        <nav aria-label="Sayfalar">
            <ul class="pagination justify-content-center">
                <?php
                for ($i = 1; $i <= $toplam_sayfa; $i++) {
                ?>
                    <li class="page-item <?php if ($i == $sayfa) {
                                                echo 'active';
                                            } ?>"><a class="page-link" href="datalist.php?sayfa=<?php echo $i; ?>&date=<?php echo $date ?>&category=<?php echo $category ?>"><?php echo $i; ?></a>
                    </li>
                <?php
                }
                ?>
            </ul>
        </nav>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>

</html>