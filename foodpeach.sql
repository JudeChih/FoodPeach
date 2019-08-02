-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2019-08-02 14:36:10
-- 伺服器版本： 10.3.16-MariaDB
-- PHP 版本： 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `foodpeach`
--

DELIMITER $$
--
-- 程序
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `addOrder` (IN `n` VARCHAR(200))  BEGIN
  set @stmt = concat("INSERT INTO `order_detail` (`od_id`, `ol_id`, `pl_id`, `od_num`, `od_remark`) VALUES (NULL,", n ,")");
  PREPARE ss from @stmt;
  EXECUTE ss;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 資料表結構 `menu_list`
--

CREATE TABLE `menu_list` (
  `sl_id` int(11) NOT NULL COMMENT '便當店編號',
  `pl_id` int(11) NOT NULL COMMENT '菜色編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜單列表';

--
-- 傾印資料表的資料 `menu_list`
--

INSERT INTO `menu_list` (`sl_id`, `pl_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16);

-- --------------------------------------------------------

--
-- 資料表結構 `order_detail`
--

CREATE TABLE `order_detail` (
  `od_id` int(11) NOT NULL COMMENT '明細編號',
  `ol_id` int(11) NOT NULL COMMENT '訂單編號',
  `pl_id` int(11) NOT NULL COMMENT '菜色編號',
  `od_num` int(11) NOT NULL COMMENT '明細數量',
  `od_remark` varchar(200) DEFAULT NULL COMMENT '備註'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='訂單明細';

--
-- 傾印資料表的資料 `order_detail`
--

INSERT INTO `order_detail` (`od_id`, `ol_id`, `pl_id`, `od_num`, `od_remark`) VALUES
(1, 1, 1, 2, 'no'),
(2, 1, 1, 2, 'no'),
(3, 1, 2, 3, 'no');

-- --------------------------------------------------------

--
-- 資料表結構 `order_list`
--

CREATE TABLE `order_list` (
  `ol_id` int(11) NOT NULL COMMENT '訂單編號',
  `ud_id` int(11) NOT NULL COMMENT '會員編號',
  `ol_time` datetime NOT NULL COMMENT '訂餐時間',
  `ol_address` varchar(200) NOT NULL COMMENT '送餐地址',
  `ol_price` int(11) NOT NULL COMMENT '訂單價錢',
  `ol_remark` varchar(200) DEFAULT NULL COMMENT '備註'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='訂單列表';

-- --------------------------------------------------------

--
-- 資料表結構 `product_list`
--

CREATE TABLE `product_list` (
  `pl_id` int(11) NOT NULL COMMENT '菜色編號',
  `pl_name` varchar(50) NOT NULL COMMENT '菜色名稱',
  `pl_img` text DEFAULT NULL COMMENT '菜色圖片',
  `pl_price` int(20) NOT NULL COMMENT '菜色價錢',
  `pl_content` varchar(200) DEFAULT NULL COMMENT '菜色簡介'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜色列表';

--
-- 傾印資料表的資料 `product_list`
--

INSERT INTO `product_list` (`pl_id`, `pl_name`, `pl_img`, `pl_price`, `pl_content`) VALUES
(1, '大麥克', '大麥克圖片', 100, '好吃的大麥克'),
(2, '雙層牛肉吉士堡', '雙層牛肉吉士堡圖片', 120, '好吃的雙層牛肉吉士堡'),
(3, '麥香雞', '麥香雞的相片', 80, '好吃的麥香雞'),
(4, '麥克雞塊', '麥克雞塊的圖片', 90, '好吃的麥克雞塊'),
(5, '勁辣雞腿堡', '勁辣雞腿堡圖片', 125, '美味的勁辣雞腿堡'),
(6, '墨西哥雞肉捲', '墨西哥雞肉捲的圖片', 65, '美味的墨西哥雞肉捲'),
(7, '炸雞全家桶', '炸雞全家桶圖片', 260, '美味的炸雞全家桶'),
(8, '葡式蛋塔', '葡式蛋塔圖片', 35, '美味的葡式蛋塔'),
(9, '水煮雞胸肉', '水煮雞胸肉圖片', 90, '健康的水煮雞胸肉'),
(10, '水煮菜套餐', '水煮菜套餐圖片', 70, '健康的水煮菜套餐'),
(11, '清蒸鯖魚', '清蒸鯖魚圖片', 120, '健康的清蒸鯖魚'),
(12, '紅燒獅子頭', '紅燒獅子頭圖片', 100, '健康的紅燒獅子頭'),
(13, '鮭魚壽司', '鮭魚壽司圖片', 40, '新鮮的鮭魚壽司'),
(14, '茶碗蒸', '茶碗蒸圖片', 40, '新鮮的茶碗蒸'),
(15, '天婦羅', '天婦羅圖片', 60, '新鮮的天婦羅'),
(16, '龍蝦握壽司', '龍蝦握壽司圖片', 40, '新鮮的龍蝦握壽司'),
(17, '測試資料', '測試資料圖片', 100, '測試用的測試資料');

-- --------------------------------------------------------

--
-- 資料表結構 `store_list`
--

CREATE TABLE `store_list` (
  `sl_id` int(11) NOT NULL COMMENT '便當店編號',
  `sl_name` varchar(50) NOT NULL COMMENT '便當店店名',
  `sl_address` varchar(200) NOT NULL COMMENT '便當店地址',
  `sl_phone` int(20) NOT NULL COMMENT '便當店電話'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='便當店列表';

--
-- 傾印資料表的資料 `store_list`
--

INSERT INTO `store_list` (`sl_id`, `sl_name`, `sl_address`, `sl_phone`) VALUES
(1, '麥當勞', '台中市向上路100號', 240666888),
(2, '肯德基', '台中市台灣大道99號', 45689342),
(3, '低GI廚房', '台中市文心路55號', 466778899),
(4, '藏壽司', '台中市中清路12號', 412123344);

-- --------------------------------------------------------

--
-- 資料表結構 `user_data`
--

CREATE TABLE `user_data` (
  `ud_id` int(11) NOT NULL COMMENT '會員編號',
  `ud_name` varchar(50) NOT NULL COMMENT '會員名稱',
  `ud_account` varchar(50) NOT NULL COMMENT '會員帳號',
  `ud_pwd` int(11) NOT NULL COMMENT '會員密碼',
  `ud_phone` varchar(20) NOT NULL COMMENT '會員電話',
  `ud_address` varchar(200) DEFAULT NULL COMMENT '會員地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='會員資料列表';

--
-- 傾印資料表的資料 `user_data`
--

INSERT INTO `user_data` (`ud_id`, `ud_name`, `ud_account`, `ud_pwd`, `ud_phone`, `ud_address`) VALUES
(1, 'Toby', 'toby', 1234, '0912-345678', '南投某地'),
(2, 'Peach', 'peach', 1234, '0987-654321', '台中某地');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `menu_list`
--
ALTER TABLE `menu_list`
  ADD PRIMARY KEY (`sl_id`,`pl_id`);

--
-- 資料表索引 `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`od_id`);

--
-- 資料表索引 `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`ol_id`);

--
-- 資料表索引 `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`pl_id`);

--
-- 資料表索引 `store_list`
--
ALTER TABLE `store_list`
  ADD PRIMARY KEY (`sl_id`);

--
-- 資料表索引 `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`ud_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '明細編號', AUTO_INCREMENT=4;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_list`
--
ALTER TABLE `order_list`
  MODIFY `ol_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '訂單編號';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_list`
--
ALTER TABLE `product_list`
  MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜色編號', AUTO_INCREMENT=18;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `store_list`
--
ALTER TABLE `store_list`
  MODIFY `sl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '便當店編號', AUTO_INCREMENT=5;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_data`
--
ALTER TABLE `user_data`
  MODIFY `ud_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '會員編號', AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
