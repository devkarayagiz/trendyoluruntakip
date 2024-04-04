-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 22 Mar 2024, 15:53:24
-- Sunucu sürümü: 10.4.28-MariaDB
-- PHP Sürümü: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `trendyol`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `data`
--

CREATE TABLE `data` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `category` text NOT NULL,
  `url` text NOT NULL,
  `price` varchar(255) NOT NULL,
  `comment` varchar(10) NOT NULL,
  `brand` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `data`
--

INSERT INTO `data` (`id`, `title`, `category`, `url`, `price`, `comment`, `brand`, `image`, `date`) VALUES
(648, '2 Kg Fıstık Ezmesi (1 KG ÇİKOLATALI, 1 KG SADE)', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//richnut/2-kg-fistik-ezmesi-1-kg-cikolatali-1-kg-sade-p-369366646', '388,55 TL', '518', 'Deva Çiftliği', 'https://cdn.dsmcdn.com/ty1160/product/media/images/prod/SPM/PIM/20240130/22/3f61f200-181e-34e8-9977-bd764096fc34/1_org_zoom.jpg', '2024-03-22 13:32:07'),
(649, '2 Kg Şekersiz Katkısız %100 Fıstık Ezmesi (2 X 1000 GR)', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//deva-ciftligi/2-kg-sekersiz-katkisiz-100-fistik-ezmesi-2-x-1000-gr-p-93452064?advertItems=eyJhZHZlcnRJZCI6IjQxNzc3YWQ0LTU5N2QtNGE5OS1iYTAzLTAxMGRiYTdiYTlmMSIsInNvcnRpbmdTY29yZSI6MC4wOTEwMDI3MDIyOTM5MTc1NSwiYWRTY29yZSI6MC4wMjgwNDM5NzYwNTM1OTU1NDMsImFkU2NvcmVzIjp7IjEiOjAuMDI4MDQzOTc2MDUzNTk1NTQzLCIyIjowLjAyODA0Mzk3NjA1MzU5NTU0M30sImNwYyI6My4yNDUwMDAwMDAwMDAwMDA2LCJtaW5DcGMiOjAsImVDcGMiOjIuMTk3NTIyODk2OTYwMDU3NSwiYWR2ZXJ0U2xvdCI6MSwib3JkZXIiOjEsImF0dHJpYnV0ZXMiOiIiLCJyZWxldmFuY3lLZXkiOiJlem1lc2lfZmlzdGlrIn0=', '357,20 TL', '10856', 'Deva Çiftliği', 'https://cdn.dsmcdn.com/ty1166/product/media/images/prod/SPM/PIM/20240209/13/71971b06-7d53-35a2-ab92-a2f2e5dc8be4/1_org_zoom.jpg', '2024-03-22 13:32:11'),
(650, 'Fıstık Ezmesi  3 Adet X 315 gr', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//zuber/fistik-ezmesi-3-adet-x-315-gr-p-130559824', '363 TL', '23295', 'Züber', 'https://cdn.dsmcdn.com/ty1143/product/media/images/prod/SPM/PIM/20240124/11/0dc2fb41-996e-333f-b5c1-4317788d9a8e/1_org_zoom.jpg', '2024-03-22 13:32:14'),
(651, 'Deniz Tuzlu Fıstık Ezmesi, 300 g', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//muni/deniz-tuzlu-fistik-ezmesi-300-g-p-776491339?advertItems=eyJhZHZlcnRJZCI6ImZkNzEwN2QxLTc3ZWQtNGU2Mi04ODE1LWMwMWQ0OTlkMjhiNSIsInNvcnRpbmdTY29yZSI6MC4wNjEwNjY0MDIwMzc2MjM5NiwiYWRTY29yZSI6MC4wMTU2MTg2NjYwNzUxNzAwNCwiYWRTY29yZXMiOnsiMSI6MC4wMTU2MTg2NjYwNzUxNzAwNCwiMiI6MC4wMTU2MTg2NjYwNzUxNzAwNH0sImNwYyI6My45MDk4MzQ2NjQ3MzUyMjk2LCJtaW5DcGMiOjAsImVDcGMiOjMuODIxMjg0OTMyNzgxNjcyLCJhZHZlcnRTbG90IjoyLCJvcmRlciI6MywiYXR0cmlidXRlcyI6IiIsInJlbGV2YW5jeUtleSI6ImV6bWVzaV9maXN0aWsifQ==', '104,97 TL', '10', 'muni shop', 'https://cdn.dsmcdn.com/ty1125/product/media/images/prod/SPM/PIM/20240108/17/30c545bf-7bb7-35a6-bfd3-d7b0bba47323/1_org_zoom.jpg', '2024-03-22 13:32:17'),
(652, 'Richnut Şekersiz %100 Saf Doğal Fıstık Ezmesi 1 Kg', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//deva-ciftligi/richnut-sekersiz-100-saf-dogal-fistik-ezmesi-1-kg-p-52242525', '166,65 TL', '12853', 'Deva Çiftliği', 'https://cdn.dsmcdn.com/ty1164/product/media/images/prod/SPM/PIM/20240209/13/fc605aa5-9d9d-30e8-b9ae-c4f7565f7d20/1_org_zoom.jpg', '2024-03-22 13:32:20'),
(653, 'Fıstık Ezmesi 200 gr', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//antep-sepeti-gurme/fistik-ezmesi-200-gr-p-101809142?advertItems=eyJhZHZlcnRJZCI6IjYyZWQyMzNlLTZiZWMtNGY5Ni1iZWZhLTk4MTAwZjBiNmYxNyIsInNvcnRpbmdTY29yZSI6MC4wNTkzNzA5OTk2MzQyNjU5MDQsImFkU2NvcmUiOjAuMDU5OTcwNzA2NzAxMjc4Njg3LCJhZFNjb3JlcyI6eyIxIjowLjA1OTk3MDcwNjcwMTI3ODY4NywiMiI6MC4wNTk5NzA3MDY3MDEyNzg2ODd9LCJjcGMiOjAuOTkwMDAwMDAwMDAwMDAwMSwibWluQ3BjIjowLCJlQ3BjIjowLjkwOTQ0Nzk3NTQ3MzM1NzIsImFkdmVydFNsb3QiOjMsIm9yZGVyIjo1LCJhdHRyaWJ1dGVzIjoiIiwicmVsZXZhbmN5S2V5IjoiZXptZXNpX2Zpc3RpayJ9', '295 TL', '6', 'ANTEP SEPETİ', 'https://cdn.dsmcdn.com/ty110/product/media/images/20210430/0/83945134/168743216/0/0_org_zoom.jpg', '2024-03-22 13:32:23'),
(654, 'Fındık Kreması + %100 Fıstık Ezmesi', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//zuber/findik-kremasi-100-fistik-ezmesi-p-801209450', '329,90 TL', '199', 'Züber', 'https://cdn.dsmcdn.com/ty1150/product/media/images/prod/SPM/PIM/20240129/18/437310e7-630b-369c-83f3-0c13478801b1/1_org_zoom.jpg', '2024-03-22 13:32:26'),
(655, '%100 Fıstık Ezmesi, 300 g', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//muni/100-fistik-ezmesi-300-g-p-776222163?advertItems=eyJhZHZlcnRJZCI6ImFlOWI3YTRjLWM0NDMtNDA2My1hZWE1LWI5OTU5NGQ4YTM5OSIsInNvcnRpbmdTY29yZSI6MC4wNTMzNDA4MjI0NTgyNjcyMSwiYWRTY29yZSI6MC4wMDk2OTgzMzEzNTYwNDg1ODQsImFkU2NvcmVzIjp7IjEiOjAuMDA5Njk4MzMxMzU2MDQ4NTg0LCIyIjowLjAwOTY5ODMzMTM1NjA0ODU4NH0sImNwYyI6NS41LCJtaW5DcGMiOjAsImVDcGMiOjUuMDE1MDM4NzQ5Njg1MDI0LCJhZHZlcnRTbG90Ijo0LCJvcmRlciI6NywiYXR0cmlidXRlcyI6IiIsInJlbGV2YW5jeUtleSI6ImV6bWVzaV9maXN0aWsifQ==', '104,97 TL', '23', 'muni shop', 'https://cdn.dsmcdn.com/ty1142/product/media/images/prod/SPM/PIM/20240119/20/fcfd5932-42be-3c22-8ea6-6b2fd6a80485/1_org_zoom.jpg', '2024-03-22 13:32:29'),
(656, 'PARÇACIKLI ANTEP FISTIĞI EZMESİ 250 GR', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//tugba-kuruyemis/parcacikli-antep-fistigi-ezmesi-250-gr-p-803715248', '199 TL', '77', 'Tuğba Kuruyemiş', 'https://cdn.dsmcdn.com/ty1162/product/media/images/prod/SPM/PIM/20240206/16/5339a306-29c5-36ce-941a-1b0aee3cd093/1_org_zoom.jpg', '2024-03-22 13:32:32'),
(657, 'Çikolata Parçacıklı Fıstık Ezmesi, 300 g', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//muni/cikolata-parcacikli-fistik-ezmesi-300-g-p-776579302?advertItems=eyJhZHZlcnRJZCI6ImIyODM3NzVkLTZhNGEtNDgxOC04MTZiLTdjNTQ2YzExY2YzYSIsInNvcnRpbmdTY29yZSI6MC4wNDg0NDM1NDE5MTc2Mjc3OCwiYWRTY29yZSI6MC4wMTUyMTY2OTc5Mzg3NDAyNTMsImFkU2NvcmVzIjp7IjEiOjAuMDE1MjE2Njk3OTM4NzQwMjUzLCIyIjowLjAxNTIxNjY5NzkzODc0MDI1M30sImNwYyI6My4xODM1Nzc4MTEyMDc5ODY3LCJtaW5DcGMiOjAsImVDcGMiOjEuNTU3MjczNTM0NDg5MzEsImFkdmVydFNsb3QiOjUsIm9yZGVyIjo5LCJhdHRyaWJ1dGVzIjoiIiwicmVsZXZhbmN5S2V5IjoiZXptZXNpX2Zpc3RpayJ9', '101,82 TL', '15', 'muni shop', 'https://cdn.dsmcdn.com/ty1125/product/media/images/prod/SPM/PIM/20240108/17/4f44af09-cdde-3003-ba8a-18ea526d2f78/1_org_zoom.jpg', '2024-03-22 13:32:35'),
(658, 'Rgb Stıck - Oda Aydınlatma Sistemi Full Rgb - Full Renk - Çok Özellik Kumandalı -orjinal', 'https://www.trendyol.com/lambader-x-c103676', 'https://www.trendyol.com//neeko/rgb-stick-oda-aydinlatma-sistemi-full-rgb-full-renk-cok-ozellik-kumandali-orjinal-p-108763079', '380,80 TL', '8826', 'Neeko', 'https://cdn.dsmcdn.com/ty1205/product/media/images/prod/SPM/PIM/20240312/13/4c4c349c-cadf-3e14-b530-bd350ed8221e/1_org_zoom.jpg', '2024-03-22 13:34:47'),
(659, 'Toscana Antik Beji --3 Ayaklı Tripod Lambader Abajur Kumaş Başlık--bej-c', 'https://www.trendyol.com/lambader-x-c103676', 'https://www.trendyol.com//homedit/toscana-antik-beji-3-ayakli-tripod-lambader-abajur-kumas-baslik-bej-c-p-33949323', '376,56 TL', '9376', 'Vita Aydınlatma', 'https://cdn.dsmcdn.com/ty698/product/media/images/20230120/17/262258392/60859928/1/1_org_zoom.jpg', '2024-03-22 13:34:51'),
(660, 'Javed 3\'lü Eskitme Metal Kafe Restoran, Salon, Oturma Odası Köşe Lambader', 'https://www.trendyol.com/lambader-x-c103676', 'https://www.trendyol.com//apliqa/javed-3-lu-eskitme-metal-kafe-restoran-salon-oturma-odasi-kose-lambader-p-690418116?advertItems=eyJhZHZlcnRJZCI6ImQ3ZjU5YjRmLTY5YmMtNDg5Ni1hZTYwLTZjY2Q2YzZmMDY3OCIsInNvcnRpbmdTY29yZSI6MC4wNDkwODYwNzg2NTQ5NzQ3MDUsImFkU2NvcmUiOjAuMDI3NTQ1NDk4Njg0MDQ4NjUzLCJhZFNjb3JlcyI6eyIxIjowLjAyNzU0NTQ5ODY4NDA0ODY1MywiMiI6MC4wMjc1NDU0OTg2ODQwNDg2NTN9LCJjcGMiOjEuNzgyMDAwMDAwMDAwMDAwMywibWluQ3BjIjowLjAxLCJlQ3BjIjoxLjQ2ODUyNjIyMDg4MzI2NzUsImFkdmVydFNsb3QiOjEsIm9yZGVyIjoyLCJhdHRyaWJ1dGVzIjoiIiwicmVsZXZhbmN5S2V5IjoibGFtYmFkZXIifQ==', '1.168,39 TL', '4', 'Apliqa Aydınlatma', 'https://cdn.dsmcdn.com/ty989/product/media/images/prod/SPM/PIM/20230822/17/a07a842c-351f-38f2-a70e-614869186843/1_org_zoom.jpg', '2024-03-22 13:34:54'),
(661, 'Raflı Lambader Barok Ceviz', 'https://www.trendyol.com/lambader-x-c103676', 'https://www.trendyol.com//messer/rafli-lambader-barok-ceviz-p-778414939', '399 TL', '120', 'Messer home style', 'https://cdn.dsmcdn.com/ty1173/product/media/images/prod/SPM/PIM/20240219/13/45db8bc9-fc05-3ed4-8816-2454e87ea873/1_org_zoom.jpg', '2024-03-22 13:34:57'),
(662, 'Lambader Doğal Ağaç Yalıkavak Serisi 140 cm Çift Küre Aydınlatma', 'https://www.trendyol.com/lambader-x-c103676', 'https://www.trendyol.com//cosargroup/lambader-dogal-agac-yalikavak-serisi-140-cm-cift-kure-aydinlatma-p-85755787', '487,30 TL', '14522', 'COSAR GROUP', 'https://cdn.dsmcdn.com/ty105/product/media/images/20210427/15/83330189/143616417/1/1_org_zoom.jpg', '2024-03-22 13:35:01'),
(663, 'Modena 5 Li Eskitme Lambader-Füme Camlı', 'https://www.trendyol.com/lambader-x-c103676', 'https://www.trendyol.com//tascan-aydinlatma/modena-5-li-eskitme-lambader-fume-camli-p-120927157?advertItems=eyJhZHZlcnRJZCI6ImJhOTY2ODEwLTRkN2MtNDQ5Yy1hMDU5LTkwZDI5ZTgxZjUyZiIsInNvcnRpbmdTY29yZSI6MC4wMzk5MDAzNzY2MDY3MzI2MSwiYWRTY29yZSI6MC4wMjk3MzIwMjQyOTcxMTgxODcsImFkU2NvcmVzIjp7IjEiOjAuMDI5NzMyMDI0Mjk3MTE4MTg3LCIyIjowLjAyOTczMjAyNDI5NzExODE4N30sImNwYyI6MS4zNDIsIm1pbkNwYyI6MC4wMSwiZUNwYyI6MS4zNDIsImFkdmVydFNsb3QiOjIsIm9yZGVyIjo1LCJhdHRyaWJ1dGVzIjoiIiwicmVsZXZhbmN5S2V5IjoibGFtYmFkZXIifQ==', '1.039,09 TL', '263', 'TAŞCAN AVİZE', 'https://cdn.dsmcdn.com/ty1211/product/media/images/prod/SPM/PIM/20240310/14/a9f54896-47fc-30ba-91e0-2f8f2f248da7/1_org_zoom.jpg', '2024-03-22 13:35:04'),
(664, 'Dekoratif Minimalist Led Lambader Animasyonlu Kumandalı 256 Renk Köşe Lambası', 'https://www.trendyol.com/lambader-x-c103676', 'https://www.trendyol.com//lumos/dekoratif-minimalist-led-lambader-animasyonlu-kumandali-256-renk-kose-lambasi-p-74441136', '352,30 TL', '1902', 'LUMOS TURKEY', 'https://cdn.dsmcdn.com/ty1147/product/media/images/prod/SPM/PIM/20240124/14/b6382eb2-5f34-31c8-bb6c-4d27ab6c6555/1_org_zoom.jpg', '2024-03-22 13:35:07'),
(665, 'Homing Antrasit  Kumaş Silindir Başlık Ahşap Üç Ayaklı Lambader', 'https://www.trendyol.com/lambader-x-c103676', 'https://www.trendyol.com//homing/homing-antrasit-kumas-silindir-baslik-ahsap-uc-ayakli-lambader-p-738798494', '381,21 TL', '585', 'Softavm', 'https://cdn.dsmcdn.com/ty956/product/media/images/20230622/15/388174689/971856705/1/1_org_zoom.jpg', '2024-03-22 13:35:10'),
(666, 'Delhi Tekli Eskitme Lambader-krem Şapkalı', 'https://www.trendyol.com/lambader-x-c103676', 'https://www.trendyol.com//tascan-aydinlatma/delhi-tekli-eskitme-lambader-krem-sapkali-p-135454231?advertItems=eyJhZHZlcnRJZCI6ImJhOTY2ODEwLTRkN2MtNDQ5Yy1hMDU5LTkwZDI5ZTgxZjUyZiIsInNvcnRpbmdTY29yZSI6MC4wMzk1MDUxOTEzMTEyNDAxOTUsImFkU2NvcmUiOjAuMDI5NDM3NTQ5NDEyMjUwNTIsImFkU2NvcmVzIjp7IjEiOjAuMDI5NDM3NTQ5NDEyMjUwNTIsIjIiOjAuMDI5NDM3NTQ5NDEyMjUwNTJ9LCJjcGMiOjEuMzQyLCJtaW5DcGMiOjAuMDEsImVDcGMiOjEuMjk1MTg3MjI4MTAxMzMwNCwiYWR2ZXJ0U2xvdCI6Mywib3JkZXIiOjgsImF0dHJpYnV0ZXMiOiIiLCJyZWxldmFuY3lLZXkiOiJsYW1iYWRlciJ9', '1.348,44 TL', '196', 'TAŞCAN AVİZE', 'https://cdn.dsmcdn.com/ty1206/product/media/images/prod/SPM/PIM/20240310/14/e03cd077-705c-361c-bf56-9003fd7f62a3/1_org_zoom.jpg', '2024-03-22 13:35:13'),
(667, 'Ağaç Lambader Demonte Doğal Ağaç Halikarnas Serisi Min 140 cm', 'https://www.trendyol.com/lambader-x-c103676', 'https://www.trendyol.com//cosargroup/agac-lambader-demonte-dogal-agac-halikarnas-serisi-min-140-cm-p-88552221', '591 TL', '3636', 'EGEGROUP', 'https://cdn.dsmcdn.com/ty551/product/media/images/20221004/3/185330620/147978612/1/1_org_zoom.jpg', '2024-03-22 13:35:16'),
(668, '2 Kg Fıstık Ezmesi (1 KG ÇİKOLATALI, 1 KG SADE)', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//richnut/2-kg-fistik-ezmesi-1-kg-cikolatali-1-kg-sade-p-369366646', '388,55 TL', '518', 'Deva Çiftliği', 'https://cdn.dsmcdn.com/ty1160/product/media/images/prod/SPM/PIM/20240130/22/3f61f200-181e-34e8-9977-bd764096fc34/1_org_zoom.jpg', '2024-03-22 13:35:19'),
(669, '2 Kg Şekersiz Katkısız %100 Fıstık Ezmesi (2 X 1000 GR)', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//deva-ciftligi/2-kg-sekersiz-katkisiz-100-fistik-ezmesi-2-x-1000-gr-p-93452064?advertItems=eyJhZHZlcnRJZCI6IjQxNzc3YWQ0LTU5N2QtNGE5OS1iYTAzLTAxMGRiYTdiYTlmMSIsInNvcnRpbmdTY29yZSI6MC4wOTEwMDI3MDIyOTM5MTc1NSwiYWRTY29yZSI6MC4wMjczNTE0MDE3NDYyNzMwNCwiYWRTY29yZXMiOnsiMSI6MC4wMjczNTE0MDE3NDYyNzMwNCwiMiI6MC4wMjczNTE0MDE3NDYyNzMwNH0sImNwYyI6My4yNDUwMDAwMDAwMDAwMDA2LCJtaW5DcGMiOjAsImVDcGMiOjIuMTk3NTIyODk2OTYwMDU3NSwiYWR2ZXJ0U2xvdCI6MSwib3JkZXIiOjEsImF0dHJpYnV0ZXMiOiIiLCJyZWxldmFuY3lLZXkiOiJlem1lc2lfZmlzdGlrIn0=', '357,20 TL', '10856', 'Deva Çiftliği', 'https://cdn.dsmcdn.com/ty1166/product/media/images/prod/SPM/PIM/20240209/13/71971b06-7d53-35a2-ab92-a2f2e5dc8be4/1_org_zoom.jpg', '2024-03-22 13:35:23'),
(670, 'Fıstık Ezmesi  3 Adet X 315 gr', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//zuber/fistik-ezmesi-3-adet-x-315-gr-p-130559824', '363 TL', '23295', 'Züber', 'https://cdn.dsmcdn.com/ty1143/product/media/images/prod/SPM/PIM/20240124/11/0dc2fb41-996e-333f-b5c1-4317788d9a8e/1_org_zoom.jpg', '2024-03-22 13:35:26'),
(671, 'Deniz Tuzlu Fıstık Ezmesi, 300 g', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//muni/deniz-tuzlu-fistik-ezmesi-300-g-p-776491339?advertItems=eyJhZHZlcnRJZCI6ImZkNzEwN2QxLTc3ZWQtNGU2Mi04ODE1LWMwMWQ0OTlkMjhiNSIsInNvcnRpbmdTY29yZSI6MC4wNjEwNjY0MDIwMzc2MjM5NiwiYWRTY29yZSI6MC4wMTU2MTg2NjYwNzUxNzAwNCwiYWRTY29yZXMiOnsiMSI6MC4wMTU2MTg2NjYwNzUxNzAwNCwiMiI6MC4wMTU2MTg2NjYwNzUxNzAwNH0sImNwYyI6My45MDk4MzQ2NjQ3MzUyMjk2LCJtaW5DcGMiOjAsImVDcGMiOjMuODIxMjg0OTMyNzgxNjcyLCJhZHZlcnRTbG90IjoyLCJvcmRlciI6MywiYXR0cmlidXRlcyI6IiIsInJlbGV2YW5jeUtleSI6ImV6bWVzaV9maXN0aWsifQ==', '104,97 TL', '10', 'muni shop', 'https://cdn.dsmcdn.com/ty1125/product/media/images/prod/SPM/PIM/20240108/17/30c545bf-7bb7-35a6-bfd3-d7b0bba47323/1_org_zoom.jpg', '2024-03-22 13:35:30'),
(672, 'Richnut Şekersiz %100 Saf Doğal Fıstık Ezmesi 1 Kg', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//deva-ciftligi/richnut-sekersiz-100-saf-dogal-fistik-ezmesi-1-kg-p-52242525', '166,65 TL', '12853', 'Deva Çiftliği', 'https://cdn.dsmcdn.com/ty1164/product/media/images/prod/SPM/PIM/20240209/13/fc605aa5-9d9d-30e8-b9ae-c4f7565f7d20/1_org_zoom.jpg', '2024-03-22 13:35:33'),
(673, 'Fıstık Ezmesi 200 gr', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//antep-sepeti-gurme/fistik-ezmesi-200-gr-p-101809142?advertItems=eyJhZHZlcnRJZCI6IjYyZWQyMzNlLTZiZWMtNGY5Ni1iZWZhLTk4MTAwZjBiNmYxNyIsInNvcnRpbmdTY29yZSI6MC4wNTkzNzA5OTk2MzQyNjU5MDQsImFkU2NvcmUiOjAuMDU5OTcwNzA2NzAxMjc4Njg3LCJhZFNjb3JlcyI6eyIxIjowLjA1OTk3MDcwNjcwMTI3ODY4NywiMiI6MC4wNTk5NzA3MDY3MDEyNzg2ODd9LCJjcGMiOjAuOTkwMDAwMDAwMDAwMDAwMSwibWluQ3BjIjowLCJlQ3BjIjowLjg4Mzk2NTA0MDgzNzI2NzEsImFkdmVydFNsb3QiOjMsIm9yZGVyIjo1LCJhdHRyaWJ1dGVzIjoiIiwicmVsZXZhbmN5S2V5IjoiZXptZXNpX2Zpc3RpayJ9', '295 TL', '6', 'ANTEP SEPETİ', 'https://cdn.dsmcdn.com/ty110/product/media/images/20210430/0/83945134/168743216/0/0_org_zoom.jpg', '2024-03-22 13:35:36'),
(674, 'Fındık Kreması + %100 Fıstık Ezmesi', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//zuber/findik-kremasi-100-fistik-ezmesi-p-801209450', '329,90 TL', '199', 'Züber', 'https://cdn.dsmcdn.com/ty1150/product/media/images/prod/SPM/PIM/20240129/18/437310e7-630b-369c-83f3-0c13478801b1/1_org_zoom.jpg', '2024-03-22 13:35:39'),
(675, '%100 Fıstık Ezmesi, 300 g', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//muni/100-fistik-ezmesi-300-g-p-776222163?advertItems=eyJhZHZlcnRJZCI6ImFlOWI3YTRjLWM0NDMtNDA2My1hZWE1LWI5OTU5NGQ4YTM5OSIsInNvcnRpbmdTY29yZSI6MC4wNTE4MTI1OTE5NjI1MTYzMSwiYWRTY29yZSI6MC4wMDk0MjA0NzEyNjU5MTIwNTYsImFkU2NvcmVzIjp7IjEiOjAuMDA5NDIwNDcxMjY1OTEyMDU2LCIyIjowLjAwOTQyMDQ3MTI2NTkxMjA1Nn0sImNwYyI6NS41LCJtaW5DcGMiOjAsImVDcGMiOjUuMTYyMzY5MDY5NzE2OTYxLCJhZHZlcnRTbG90Ijo0LCJvcmRlciI6NywiYXR0cmlidXRlcyI6IiIsInJlbGV2YW5jeUtleSI6ImV6bWVzaV9maXN0aWsifQ==', '104,97 TL', '23', 'muni shop', 'https://cdn.dsmcdn.com/ty1142/product/media/images/prod/SPM/PIM/20240119/20/fcfd5932-42be-3c22-8ea6-6b2fd6a80485/1_org_zoom.jpg', '2024-03-22 13:35:43'),
(676, 'PARÇACIKLI ANTEP FISTIĞI EZMESİ 250 GR', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//tugba-kuruyemis/parcacikli-antep-fistigi-ezmesi-250-gr-p-803715248', '199 TL', '77', 'Tuğba Kuruyemiş', 'https://cdn.dsmcdn.com/ty1162/product/media/images/prod/SPM/PIM/20240206/16/5339a306-29c5-36ce-941a-1b0aee3cd093/1_org_zoom.jpg', '2024-03-22 13:35:46'),
(677, 'Çikolata Parçacıklı Fıstık Ezmesi, 300 g', 'https://www.trendyol.com/fistik-ezmesi-x-c145138', 'https://www.trendyol.com//muni/cikolata-parcacikli-fistik-ezmesi-300-g-p-776579302?advertItems=eyJhZHZlcnRJZCI6ImIyODM3NzVkLTZhNGEtNDgxOC04MTZiLTdjNTQ2YzExY2YzYSIsInNvcnRpbmdTY29yZSI6MC4wNDg0NDM1NDE5MTc2Mjc3OCwiYWRTY29yZSI6MC4wMTUyMTY2OTc5Mzg3NDAyNTMsImFkU2NvcmVzIjp7IjEiOjAuMDE1MjE2Njk3OTM4NzQwMjUzLCIyIjowLjAxNTIxNjY5NzkzODc0MDI1M30sImNwYyI6My4xODM1Nzc4MTEyMDc5ODY3LCJtaW5DcGMiOjAsImVDcGMiOjEuNTU3MjczNTM0NDg5MzEsImFkdmVydFNsb3QiOjUsIm9yZGVyIjo5LCJhdHRyaWJ1dGVzIjoiIiwicmVsZXZhbmN5S2V5IjoiZXptZXNpX2Zpc3RpayJ9', '101,82 TL', '15', 'muni shop', 'https://cdn.dsmcdn.com/ty1125/product/media/images/prod/SPM/PIM/20240108/17/4f44af09-cdde-3003-ba8a-18ea526d2f78/1_org_zoom.jpg', '2024-03-22 13:35:49');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `data`
--
ALTER TABLE `data`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `data`
--
ALTER TABLE `data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=679;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
