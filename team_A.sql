CREATE TABLE `order` (
  `id` int PRIMARY KEY,
  `menu_id` int,
  `bill_id` int,
  `number` int,
  `is_provide` bool,
  `menu_name` varchar(255)
);

CREATE TABLE `bill` (
  `id` int PRIMARY KEY,
  `money_sum` int,
  `table_id` int,
  `is_paid` bool
);

CREATE TABLE `menu` (
  `id` int PRIMARY KEY,
  `manu_name` varchar(255),
  `price` int,
  `shop_id` int
);

CREATE TABLE `table` (
  `id` int PRIMARY KEY,
  `guest_number` int,
  `shop_id` int
);

CREATE TABLE `shop` (
  `id` int PRIMARY KEY,
  `shop_name` varchar(255),
  `prefecture` varchar(255)
);

CREATE TABLE `users` (
  `id` in PRIMARY KEY,
  `password` varchar(255),
  `role` varchar(255)
);

CREATE TABLE `user_shop` (
  `id` int PRIMARY KEY,
  `user_id` int,
  `shop_id` int
);

CREATE TABLE `qr` (
  `id` int PRIMARY KEY,
  `table_id` int,
  `expired_at` datetime
);

ALTER TABLE `bill` ADD FOREIGN KEY (`table_id`) REFERENCES `table` (`id`);

ALTER TABLE `menu` ADD FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);

ALTER TABLE `order` ADD FOREIGN KEY (`bill_id`) REFERENCES `bill` (`id`);

ALTER TABLE `user_shop` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_shop` ADD FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`);

ALTER TABLE `qr` ADD FOREIGN KEY (`table_id`) REFERENCES `table` (`id`);

ALTER TABLE `table` ADD FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`);
