-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 15, 2022 lúc 12:36 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demo`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `photo` varchar(50) DEFAULT NULL,
  `activated` tinyint(1) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `password`, `fullname`, `address`, `phone`, `email`, `photo`, `activated`, `admin`) VALUES
(11, 'qhuy', '123', NULL, NULL, NULL, 'huy@gmail.com', NULL, 1, 0),
(14, 'minh09az', 'Obanhmi1', '', '', 0, 'minh09az90@gmail.com', '', 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `status`) VALUES
(1, 'Asus', 0),
(2, 'Acer', 0),
(3, 'HP', 0),
(4, 'DELL', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetails`
--

CREATE TABLE `orderdetails` (
  `id` int(11) NOT NULL,
  `price` float NOT NULL,
  `quantity` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `address` varchar(200) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `confirm` tinyint(1) NOT NULL,
  `createdate` date NOT NULL DEFAULT current_timestamp(),
  `price` float NOT NULL,
  `username` varchar(200) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `about` varchar(200) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `createdate` date NOT NULL DEFAULT current_timestamp(),
  `discount` int(11) NOT NULL,
  `image` varchar(80) NOT NULL,
  `name` varchar(80) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `about`, `available`, `createdate`, `discount`, `image`, `name`, `price`, `quantity`, `categoryid`) VALUES
(2, 'Laptop Asus ROG Scar phiên bản 2022', 0, '2022-12-11', 10, 'https://dlcdnwebimgs.asus.com/files/media/4A154828-5642-4794-9854-A490339031A6/v', 'Asus ROG Scar G513 i9 12900K - RTX 3090 - 16GB RAM', 5000000, 45, 1),
(4, 'Laptop Acer Nitro 5 Tiger phiên bản 2022', 0, '2022-12-11', 50, 'https://file.hstatic.net/1000167396/file/acer-nitro-5-tiger-i5-12500h-rtx3050-8_', 'Acer Nitro 5 Tiger R9 9000H - RTX 3090 - 16GB RAM', 4000000, 38, 2),
(5, 'Laptop HP Victus Gaming phiên bản 2022', 0, '2022-12-11', 50, 'https://tuanphong.vn/pictures/full/2021/10/1634179476-647-nang-cap-ssd-ram-cho-l', 'Laptop HP Victus R7 6800H - RTX 3050 - 8GB RAM', 3000000, 30, 3),
(6, 'Laptop HP Victus Pro phiên bản 2022', 0, '2022-12-11', 50, 'https://nguyenvu.store/wp-content/uploads/2022/03/HP-VICTUS-16-e0177AX-4R0U9PA-n', 'Laptop HP Victus Pro R9 9000H - RTX 3090 - 16GB RAM', 4500000, 50, 3),
(7, 'Laptop DELL Inspiron phiên bản 2022', 0, '2022-12-11', 50, 'https://laptop360.net/wp-content/uploads/2022/03/laptop-hai-phong-6.jpg', 'Laptop DELL Inspiron R9 9000H - RTX 3090 - 16GB RAM', 4500000, 0, 4);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid` (`productid`),
  ADD KEY `orderid` (`orderid`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categoryid` (`categoryid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`productid`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
