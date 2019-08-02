-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2019-08-02 11:18:29
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

-- --------------------------------------------------------

--
-- 資料表結構 `menu_list`
--

CREATE TABLE `menu_list` (
  `sl_id` int(11) NOT NULL COMMENT '便當店編號',
  `pl_id` int(11) NOT NULL COMMENT '菜色編號'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜單列表';

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
  MODIFY `od_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '明細編號';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `order_list`
--
ALTER TABLE `order_list`
  MODIFY `ol_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '訂單編號';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `product_list`
--
ALTER TABLE `product_list`
  MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜色編號';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `store_list`
--
ALTER TABLE `store_list`
  MODIFY `sl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '便當店編號';

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `user_data`
--
ALTER TABLE `user_data`
  MODIFY `ud_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '會員編號';
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
