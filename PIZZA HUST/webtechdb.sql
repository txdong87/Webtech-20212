-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 15, 2022 lúc 03:57 PM
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
-- Cơ sở dữ liệu: `project2db`
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
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `fname` varchar(198) NOT NULL,
  `price` varchar(58) NOT NULL,
  `quantity` int(19) NOT NULL,
  `total_price` varchar(198) NOT NULL,
  `cat_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `description` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `food`
--

INSERT INTO `food` (`id`, `cat_id`, `fname`, `price`, `description`) VALUES
(1, 7, 'Kem tươi 2 tầng', 29000, 'Phủ lên trên 1 chút Chocolate, kem tươi hai tầng mềm, mịn, không quá ngọt phù hợp sau những bữa ăn nhẹ.'),
(2, 7, 'Strawberry Nutella', 50000, 'Dâu tây được phủ Chocolate và hạt phỉ. Còn điều gì đáng mong đợi hơn một món ăn nhẹ nhàng, ngọt ngào, say đắm trong cuối bữa ăn.'),
(3, 8, 'Aquafina', 15000, 'Thanh khiết hương vị thiên nhiên.'),
(4, 8, 'Cocacola', 15000, 'Cocacola cho mọi nhà'),
(5, 9, 'Mac N Chese', 55000, 'Mì ống kem gọi một thứ gì đó giàu tinh bột như nút tỏi, nhưng chúng tôi cũng có những món yêu thích như sốt táo, khoai tây chiên, trái cây, rau và xà lách. Điều đó có nghĩa là bạn chắc chắn sẽ tìm được thứ gì đó không chỉ ngon mà còn đủ lành mạnh để bạn có thể vui vẻ cho những đứa trẻ trong bữa tiệc của mình '),
(6, 9, 'Chicken Tenders', 39000, 'Những miếng gà ngon ngọt được chiên giòn đến độ giòn và dùng kèm với nước sốt trang trại kem hoặc sốt BBQ thơm lừng để chấm'),
(7, 10, 'Pizza thập cẩm', 31000, 'Là món ăn được mọi người yêu thích. Đặc biệt bánh pizza vị thịt nướng BBQ vô cùng khác biệt so với các loại bánh pizza khác. Thông thường khẩu vị của người Hàn Quốc rất hợp với người Việt, cả cách chế biến cũng mang lại điều thú vị riêng biệt\n- Pizza này rất phù hợp để nướng chảo vì toàn bộ topping đã được làm chín sẵn. Pizza nướng chảo sẽ tiện hơn lợi hơn cho các mẹ mà vẫn giữ nguyên hương vị, ngon không kém nướng lò.\n- Tất cả là nhờ bí quyết độc quyền của Ottogi khiến vỏ bánh mềm, thơm nức mũi'),
(8, 10, 'Pizza cá hồi', 39000, 'Siêu phẩm mùa hè món Pizza cá hồi hun khói cực kì hấp dẫn, sự kết hợp này cũng khá mới mẻ trong làng pizza. Một phần pizza cá hồi hun khói sẽ được phủ một lớp cheese béo ngậy./nPhần nhân Pizza sẽ gồm có cá hồi xông khói tẩm ướt vị đậm đà một xíu, thịt cá ngậy hơi beo béo nữa. Thêm các loại gia vị rau củ giúp trung hoà lại hương vị ăn đỡ ngấy nè. Đế bánh mỏng, thơm cắn một miếng vẫn giòn rụm.'),
(9, 11, 'Miến trộn Hàn Quốc', 29000, 'Sợi miến dai, rau củ ngọt tươi, giòn mát lại thêm thịt bò nóng hổi, đậm đà.'),
(10, 11, 'Xíu mại chay', 19000, 'Từng viên xíu mại với màu sắc bắt mắt, mềm dẻo, thơm nồng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `food_id` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `user_id`, `food_id`, `user_name`, `timestamp`) VALUES
(9, 'ABC927654', '3', '6', 'Tran', '09:07:2022 03:56:20pm'),
(10, 'ABC776950', '3', '2', 'Tran', '11:07:2022 09:20:03pm');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders1`
--

CREATE TABLE `orders1` (
  `id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `grand_total` float(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `status` enum('Pending','Completed','Cancelled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order1_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `quantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timestamp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `timestamp`) VALUES
(3, 'Tran Xuan Dong', 'tranxuandonghy@gmail.com', '123456', '29:06:2022 01:40:08am');

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
-- Chỉ mục cho bảng `orders1`
--
ALTER TABLE `orders1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order1_id` (`order1_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `orders1`
--
ALTER TABLE `orders1`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders1`
--
ALTER TABLE `orders1`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order1_id`) REFERENCES `orders1` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
