CREATE TABLE `product` (
  `id` int AUTO_INCREMENT,
  `category_id` smallint,
  `title` varchar(30),
  `description` varchar(100) NOT NULL,
  `price` smallint NOT NULL,
  `texture` varchar(100) NOT NULL,
  `wash` varchar(50) NOT NULL,
  `place` varchar(30) NOT NULL,
  `note` varchar(100),
  `story` varchar(1000) NOT NULL,
  `main_image` varchar(200) NOT NULL,
  PRIMARY KEY (`category_id`, `title`),
  UNIQUE KEY (id)
);

CREATE TABLE `variant` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `color_code` char(6) NOT NULL,
  `size` char(5) NOT NULL,
  `stock` smallint NOT NULL
);

CREATE TABLE `image` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `image` varchar(255)
);

CREATE TABLE `color` (
  `id` smallint PRIMARY KEY AUTO_INCREMENT,
  `code` char(6) UNIQUE NOT NULL,
  `name` varchar(20) NOT NULL
);

CREATE TABLE `category` (
  `id` smallint PRIMARY KEY AUTO_INCREMENT,
  `category` varchar(30) UNIQUE
);

CREATE TABLE `size` (
  `id` tinyint PRIMARY KEY AUTO_INCREMENT,
  `size` varchar(4) UNIQUE 
);


ALTER TABLE product ADD FOREIGN KEY (category_id) REFERENCES category(id);

ALTER TABLE variant ADD FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE,
  ADD FOREIGN KEY (color_code) REFERENCES color(code),
  ADD FOREIGN KEY (size) REFERENCES size(size);

ALTER TABLE image ADD FOREIGN KEY (product_id) REFERENCES product(id) ON DELETE CASCADE

