-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 23, 2022 lúc 09:11 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webtechdb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`) VALUES
(1, 'Admin', 'admin@gmail.com', '12345'),
(2, 'Dong', 'tranxuandonghy@gmail.com', '12345');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `short_desc` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `long_desc` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `short_desc`, `long_desc`) VALUES
(7, 'Dessert', 'This is menu dessert', 'Sweet food at the end of the meal'),
(8, 'Drink', 'This is menu drink', ''),
(9, 'Kid', 'This is menu kid.', ''),
(10, 'Main Course', ' This is menu main course.', ''),
(11, 'Vegetarian', 'This is menu vegetarian.', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `food`
--

CREATE TABLE `food` (
  `id` int(20) NOT NULL,
  `cat_id` int(20) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `price` int(20) NOT NULL,
  `description` varchar(500) NOT NULL,
  `imageUrl` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `food`
--

INSERT INTO `food` (`id`, `cat_id`, `fname`, `price`, `description`, `imageUrl`) VALUES
(1, 7, 'Kem tươi 2 tầng', 29000, 'Phủ lên trên 1 chút Chocolate, kem tươi hai tầng mềm, mịn, không quá ngọt phù hợp sau những bữa ăn nhẹ.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgpdxQr-CNOpvBqNwB_8fd14Zj79fPxu5VPg&usqp=CAU'),
(2, 7, 'Strawberry Nutella', 50000, 'Dâu tây được phủ Chocolate và hạt phỉ. Còn điều gì đáng mong đợi hơn một món ăn nhẹ nhàng, ngọt ngào, say đắm trong cuối bữa ăn.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTk23Une8jPTrBm4FWy8s51oS2cVo0AX1F0Mw&usqp=CAU'),
(3, 8, 'Aquafina', 15000, 'Thanh khiết hương vị thiên nhiên.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxhjCSXAPgNP151NZOoJMhT7z_3de6JZGzPw&usqp=CAU'),
(4, 8, 'Cocacola', 15000, 'Cocacola cho mọi nhà', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnDbiGYxK_vvkFI08AlGMQMl8W4jFhF-iuHA&usqp=CAU'),
(5, 9, 'Mac N Chese', 55000, 'Mì ống kem gọi một thứ gì đó giàu tinh bột như nút tỏi, nhưng chúng tôi cũng có những món yêu thích như sốt táo, khoai tây chiên, trái cây, rau và xà lách. Điều đó có nghĩa là bạn chắc chắn sẽ tìm được thứ gì đó không chỉ ngon mà còn đủ lành mạnh để bạn có thể vui vẻ cho những đứa trẻ trong bữa tiệc của mình ', 'https://cloudfront.bjsrestaurants.com/img_5c49e9348931a3.17252647_Kids%20Mac%20N%20Cheese_Web.jpg'),
(6, 9, 'Chicken Tenders', 39000, 'Những miếng gà ngon ngọt được chiên giòn đến độ giòn và dùng kèm với nước sốt trang trại kem hoặc sốt BBQ thơm lừng để chấm', 'https://cloudfront.bjsrestaurants.com/img_5c49e68104c2b9.30306587_Kids%20Chicken%20Tenders_Web.jpg'),
(7, 10, 'Pizza thập cẩm', 31000, 'Là món ăn được mọi người yêu thích. Đặc biệt bánh pizza vị thịt nướng BBQ vô cùng khác biệt so với các loại bánh pizza khác. Thông thường khẩu vị của người Hàn Quốc rất hợp với người Việt, cả cách chế biến cũng mang lại điều thú vị riêng biệt\n- Pizza này rất phù hợp để nướng chảo vì toàn bộ topping đã được làm chín sẵn. Pizza nướng chảo sẽ tiện hơn lợi hơn cho các mẹ mà vẫn giữ nguyên hương vị, ngon không kém nướng lò.\n- Tất cả là nhờ bí quyết độc quyền của Ottogi khiến vỏ bánh mềm, thơm nức mũi', 'https://tse1.mm.bing.net/th?id=OIP.Hk_8DGzWZud9hZZ35WTgnQHaEo&pid=Api&P=0&w=276&h=172'),
(8, 10, 'Pizza cá hồi', 39000, 'Siêu phẩm mùa hè món Pizza cá hồi hun khói cực kì hấp dẫn, sự kết hợp này cũng khá mới mẻ trong làng pizza. Một phần pizza cá hồi hun khói sẽ được phủ một lớp cheese béo ngậy./nPhần nhân Pizza sẽ gồm có cá hồi xông khói tẩm ướt vị đậm đà một xíu, thịt cá ngậy hơi beo béo nữa. Thêm các loại gia vị rau củ giúp trung hoà lại hương vị ăn đỡ ngấy nè. Đế bánh mỏng, thơm cắn một miếng vẫn giòn rụm.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSdjK3C1VUwNb5fCfDOnKdw3GAWAxQsCkNWnw&usqp=CAU'),
(9, 11, 'Miến trộn Hàn Quốc', 29000, 'Sợi miến dai, rau củ ngọt tươi, giòn mát lại thêm thịt bò nóng hổi, đậm đà.', 'https://khamphamonngon.com/wp-content/uploads/2021/06/cach-lam-mien-tron-han-quoc.jpeg'),
(10, 11, 'Xíu mại chay', 19000, 'Từng viên xíu mại với màu sắc bắt mắt, mềm dẻo, thơm nồng', 'https://hapivegan.com/wp-content/uploads/2018/04/Xiu-mai-chay.jpg.webp');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `users_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `users_id`, `name`, `email`, `address`, `phone`, `timestamp`) VALUES
(1, '13', 'Trần Xuân Đồng', 'abc@gmail.com', 'SA', '0388526788', '2022-07-23 13:48:23'),
(2, '13', 'Trần Xuân Đồng', 'abc@gmail.com', '32', '(+84) 563371697', '2022-07-23 21:05:54'),
(3, '13', 'gg', 'abc@gmail.com', '12', '01', '2022-07-23 21:06:36'),
(4, '3', 'as', 'ac@gmail.com', 'q', '1', '2022-07-23 21:10:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `order_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `food_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(50) NOT NULL,
  `price` int(20) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`id`, `order_id`, `food_id`, `quantity`, `price`, `createAt`) VALUES
(1, '3', '2', 1, 50000, '2022-07-23 14:06:36'),
(2, '4', '3', 1, 15000, '2022-07-23 14:10:55'),
(3, '4', '5', 1, 55000, '2022-07-23 14:10:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `timestamp`) VALUES
(3, 'Tran Xuan Dong', 'tranxuandonghy@gmail.com', '123456', '0000-00-00 00:00:00'),
(4, 'abc', '123@gmail.com', '123', NULL),
(5, 'asd', 'xzc@gmail.com', '123', '0000-00-00 00:00:00'),
(6, 'SSS', 'a@gmail.com', '123', '0000-00-00 00:00:00'),
(7, 'dang', 'nguyen@gmail.com', '1234', '0000-00-00 00:00:00'),
(8, 'a', 'abc@gmail.com', '123', '0000-00-00 00:00:00'),
(9, 'abc', '1@gmail.com', '123', '0000-00-00 00:00:00'),
(10, 'abc', '12@gmail.com', '12', '0000-00-00 00:00:00'),
(11, '123', 'ad@gmail.com', '123', '0000-00-00 00:00:00'),
(12, 'qa', 'l@gmail.com', '123', '0000-00-00 00:00:00'),
(13, 'b', 'b@gmail.com', '12', '0000-00-00 00:00:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
