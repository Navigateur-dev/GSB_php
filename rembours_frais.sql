-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : lun. 28 mars 2022 à 18:25
-- Version du serveur : 10.6.5-MariaDB
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `rembours_frais`
--

-- --------------------------------------------------------

--
-- Structure de la table `demande_remboursement`
--

DROP TABLE IF EXISTS `demande_remboursement`;
CREATE TABLE IF NOT EXISTS `demande_remboursement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_saisie` datetime NOT NULL,
  `montant` decimal(10,0) NOT NULL,
  `commentaire` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `id_type_frais` int(11) NOT NULL,
  `id_delegue` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `demande_remboursement`
--

INSERT INTO `demande_remboursement` (`id`, `date_saisie`, `montant`, `commentaire`, `id_type_frais`, `id_delegue`) VALUES
(1, '2021-07-06 16:17:34', '12', 'frais de repas', 1, 3),
(2, '2021-07-08 11:04:28', '500', 'Invitation du responsable du CHU d\'Amiens', 3, 1),
(3, '2021-07-08 11:16:46', '650', '3 nuits lors du colloque de Nice sur les addictions', 2, 1),
(4, '2021-11-16 20:57:08', '502', 'Nuit d\'hôtel lors de la conférence du 05/05/2020', 2, 3),
(5, '2021-11-16 20:57:28', '125', 'Invitation de la secrétaire médical du Dr Virtigo', 3, 3),
(6, '2022-02-19 20:12:31', '0', 'sauna + champagne d\'or + hormard', 1, 2),
(7, '2022-02-19 20:13:35', '2500', 'sauna + champagne d\'or + hormard', 1, 1),
(8, '2022-02-19 20:45:06', '2727', '5 nuitées', 2, 1),
(9, '2022-02-20 11:49:25', '25', 'vin', 1, 4),
(10, '2022-03-12 08:43:54', '25', 'Homard frais ', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `fonctionnalite`
--

DROP TABLE IF EXISTS `fonctionnalite`;
CREATE TABLE IF NOT EXISTS `fonctionnalite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(75) COLLATE latin1_general_ci NOT NULL,
  `libelle_menu_parent` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `libelle_menu_enfant` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `lien_menu` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `fonctionnalite`
--

INSERT INTO `fonctionnalite` (`id`, `libelle`, `libelle_menu_parent`, `libelle_menu_enfant`, `lien_menu`) VALUES
(1, 'Modification du mot de passe', 'Utilisateur', 'Changer mot de passe', 'modifMdp'),
(2, 'Consultation des demandes de remboursement', 'Demande Remboursement', 'Voir demandes', 'consultTousRembour'),
(3, 'Modification d\'une demande de remboursement', 'Demande Remboursement', 'Modifier une demande', 'modifDemRembListeForm'),
(4, 'Ajout d\'un utilisateur', 'Utilisateur', 'Ajouter utilisateur', 'ajoutUtilisateurForm'),
(5, 'Saisie d\'une demande de remboursement de frais', 'Demande Remboursement', 'Ajouter demande', 'ajoutDemRembForm'),
(6, 'Consultation de son profil', 'Utilisateur', 'Voir mon profil', 'consultProfil'),
(7, 'Consultation des demandes de l\'utilisateur connecté', 'Demande Remboursement', 'Voir mes demandes', 'consultMesDemRemb');

-- --------------------------------------------------------

--
-- Structure de la table `profil`
--

DROP TABLE IF EXISTS `profil`;
CREATE TABLE IF NOT EXISTS `profil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `profil`
--

INSERT INTO `profil` (`id`, `libelle`) VALUES
(1, 'Délégué'),
(2, 'Responsable comptabilité'),
(3, 'Responsable délégué'),
(4, 'Administrateur'),
(5, 'Responsable informatique');

-- --------------------------------------------------------

--
-- Structure de la table `profil_fonct`
--

DROP TABLE IF EXISTS `profil_fonct`;
CREATE TABLE IF NOT EXISTS `profil_fonct` (
  `id_profil` int(11) NOT NULL,
  `id_fonct` int(11) NOT NULL,
  PRIMARY KEY (`id_profil`,`id_fonct`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `profil_fonct`
--

INSERT INTO `profil_fonct` (`id_profil`, `id_fonct`) VALUES
(1, 1),
(1, 3),
(1, 5),
(1, 6),
(1, 7),
(2, 1),
(2, 2),
(2, 6),
(3, 1),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6);

-- --------------------------------------------------------

--
-- Structure de la table `type_frais`
--

DROP TABLE IF EXISTS `type_frais`;
CREATE TABLE IF NOT EXISTS `type_frais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(45) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `type_frais`
--

INSERT INTO `type_frais` (`id`, `libelle`) VALUES
(1, 'repas'),
(2, 'nuit d\'hôtel'),
(3, 'repas (invitation client)');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(35) COLLATE latin1_general_ci NOT NULL,
  `prenom` varchar(35) COLLATE latin1_general_ci NOT NULL,
  `pseudo` varchar(35) COLLATE latin1_general_ci NOT NULL,
  `mot_de_passe` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `id_profil` int(11) NOT NULL,
  `id_dern_util_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nom`, `prenom`, `pseudo`, `mot_de_passe`, `id_profil`, `id_dern_util_modif`) VALUES
(1, 'Aressi', 'Yvan', 'rbtay562', '$2y$10$D0xfm7DFo1IaM0QRUy4aaegu8EoOIdrcVtmwQP0gjHUIhLPqcErnq', 1, 3),
(2, 'Lisilon', 'Pierre', 'rbtlp788', '$2y$10$UviHJr/38HipyN86Ph8SM.BPhsmTGY4qbHUac35B7c9QqxWWRHtoG', 2, 3),
(3, 'Lebos', 'Jade', 'rbtlj621', '$2y$10$GouM0EjMMp4B67B8DQEVEu6yxItMwFKzFb5y8r3i0EiwoTH0FvS/6', 4, 3),
(4, 'Lejaune', 'Paul', 'rbtio150', '$2y$10$i6lJb3qhPCuxLwht6FgRr.AZZ1qxfdyLHWU.WbHVE0mb4JP75XwmW', 3, 3),

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
