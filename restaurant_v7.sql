-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  lun. 28 déc. 2020 à 17:43
-- Version du serveur :  10.3.16-MariaDB
-- Version de PHP :  7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `restaurant`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `street_number` int(11) NOT NULL,
  `street_name` varchar(100) NOT NULL,
  `post_code` int(11) NOT NULL,
  `town` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `date_added`, `street_number`, `street_name`, `post_code`, `town`) VALUES
(1, '2020-11-24 21:51:00', 20, 'rue liberté', 75012, 'Paris'),
(2, '2020-11-24 22:52:00', 12, 'rue Saint-Ange', 13000, 'Marseille');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `date_added`, `name`, `surname`, `email`, `password`, `phone`) VALUES
(1, '2020-11-24 21:51:00', 'Michel', 'Bertrand', 'michel.bertrand@gmail.com', '45671*$ertQJ86437zt', '0126568978'),
(2, '2020-11-24 22:52:00', 'Dupuis', 'Vincent', 'vincent.dupuis@gmail.com', '3467*$hsjkqlznzcj', '0645567889');

-- --------------------------------------------------------

--
-- Structure de la table `deliverer`
--

CREATE TABLE `deliverer` (
  `id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `deliverer`
--

INSERT INTO `deliverer` (`id`, `date_added`, `name`, `surname`, `email`, `password`, `phone`) VALUES
(1, '2020-11-24 22:51:00', 'Marinier', 'Rémi', 'marinier.remi@gmail.com', 'ù%jsklasjxo j$', '0646568978'),
(2, '2020-11-24 22:53:00', 'Poulain', 'Pierre', 'pierre.poulain@gmail.com', 'éythrjc$£gshqj', '0585567889');

-- --------------------------------------------------------

--
-- Structure de la table `dish`
--

CREATE TABLE `dish` (
  `id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `dish_title` varchar(50) NOT NULL,
  `dish_recipe` varchar(255) NOT NULL,
  `dish_img` varchar(100) NOT NULL,
  `dish_price` decimal(4,2) NOT NULL,
  `dish_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `dish`
--

INSERT INTO `dish` (`id`, `date_added`, `dish_title`, `dish_recipe`, `dish_img`, `dish_price`, `dish_type`) VALUES
(1, '2020-11-24 21:51:00', 'Salade César', 'Assortiments de salades, carottes aux oignons, vinaigrette aux herbes', 'salade-caesar.jpg', '12.50', 'Plat'),
(2, '2020-11-24 21:52:00', 'Baba au rhum', 'Savarin servi imbibé de sirop au rhum', 'baba-au-rhum.jpg', '8.30', 'Dessert');

-- --------------------------------------------------------

--
-- Structure de la table `manager`
--

CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `manager`
--

INSERT INTO `manager` (`id`, `username`, `password`) VALUES
(1, 'Carlito', '$ertQJ86437zteis');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `total_cost` decimal(4,2) NOT NULL,
  `deliverer_start` time NOT NULL,
  `delivery_end` datetime NOT NULL,
  `client_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `deliverer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `date`, `total_cost`, `deliverer_start`, `delivery_end`, `client_id`, `address_id`, `payment_id`, `deliverer_id`) VALUES
(1, '2020-11-24 00:00:00', '37.50', '00:05:00', '2020-11-25 00:15:00', 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order_detail`
--

INSERT INTO `order_detail` (`id`, `price`, `quantity`, `title`, `dish_id`, `order_id`) VALUES
(1, '37.50', 3, 'Salade César', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE `payment` (
  `id` int(11) NOT NULL,
  `payment_tool` varchar(255) NOT NULL,
  `client_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`id`, `payment_tool`, `client_id`) VALUES
(1, 'paypal', 1),
(2, 'visa', 2);

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `dish_id` int(11) NOT NULL,
  `deliverer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`id`, `date`, `quantity`, `dish_id`, `deliverer_id`) VALUES
(1, '2020-11-24 09:00:10', 12, 1, 1),
(2, '2020-11-24 09:00:10', 14, 2, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `deliverer`
--
ALTER TABLE `deliverer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `dish`
--
ALTER TABLE `dish`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_data_client` (`client_id`),
  ADD KEY `fk_data_address` (`address_id`),
  ADD KEY `fk_data_payment` (`payment_id`),
  ADD KEY `fk_data_deliverer` (`deliverer_id`);

--
-- Index pour la table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_data_dish` (`dish_id`) USING BTREE,
  ADD KEY `fk_data_order` (`order_id`);

--
-- Index pour la table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_data_client` (`client_id`) USING BTREE;

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_data_dish_info` (`dish_id`),
  ADD KEY `fk_data_deliverer_info` (`deliverer_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `deliverer`
--
ALTER TABLE `deliverer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `dish`
--
ALTER TABLE `dish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `dish`
--
ALTER TABLE `dish`
  ADD CONSTRAINT `dish_ibfk_1` FOREIGN KEY (`id`) REFERENCES `order_detail` (`dish_id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_data_address` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `fk_data_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `fk_data_deliverer` FOREIGN KEY (`deliverer_id`) REFERENCES `deliverer` (`id`),
  ADD CONSTRAINT `fk_data_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`);

--
-- Contraintes pour la table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `fk_data_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_client` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);

--
-- Contraintes pour la table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_data_deliverer_info` FOREIGN KEY (`deliverer_id`) REFERENCES `deliverer` (`id`),
  ADD CONSTRAINT `fk_data_dish_info` FOREIGN KEY (`dish_id`) REFERENCES `dish` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
