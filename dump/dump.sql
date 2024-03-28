-- MySQL dump 10.13  Distrib 8.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: click-n-party
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ajouter_en_favoris`
--

DROP TABLE IF EXISTS `ajouter_en_favoris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ajouter_en_favoris` (
  `utilisateurs_id` int NOT NULL,
  `locations_id` int NOT NULL,
  `date_ajout` date NOT NULL,
  PRIMARY KEY (`utilisateurs_id`,`locations_id`),
  KEY `IDX_5425BB8F1E969C5` (`utilisateurs_id`),
  KEY `IDX_5425BB8FED775E23` (`locations_id`),
  CONSTRAINT `FK_5425BB8F1E969C5` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`),
  CONSTRAINT `FK_5425BB8FED775E23` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajouter_en_favoris`
--

LOCK TABLES `ajouter_en_favoris` WRITE;
/*!40000 ALTER TABLE `ajouter_en_favoris` DISABLE KEYS */;
INSERT INTO `ajouter_en_favoris` VALUES (1,11,'2024-03-17'),(2,10,'2024-03-20'),(2,11,'2024-03-17'),(2,14,'2024-03-17'),(2,15,'2024-03-20'),(4,10,'2024-03-17'),(4,11,'2024-03-17'),(4,12,'2024-03-17');
/*!40000 ALTER TABLE `ajouter_en_favoris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alerte_disponibilite`
--

DROP TABLE IF EXISTS `alerte_disponibilite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerte_disponibilite` (
  `utilisateurs_id` int NOT NULL,
  `categories_id` int NOT NULL,
  `actif` tinyint(1) DEFAULT NULL,
  `date_creation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (`utilisateurs_id`,`categories_id`),
  KEY `IDX_55F5DEBE1E969C5` (`utilisateurs_id`),
  KEY `IDX_55F5DEBEA21214B7` (`categories_id`),
  CONSTRAINT `FK_55F5DEBE1E969C5` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`),
  CONSTRAINT `FK_55F5DEBEA21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerte_disponibilite`
--

LOCK TABLES `alerte_disponibilite` WRITE;
/*!40000 ALTER TABLE `alerte_disponibilite` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerte_disponibilite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Garage','https://cdn-icons-png.flaticon.com/512/1571/1571991.png'),(2,'Grange','data:image/png;base64,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'),(4,'Salon','https://cdn-icons-png.flaticon.com/512/393/393249.png'),(5,'cinema','https://cdn-icons-png.flaticon.com/512/3875/3875391.png'),(6,'Maison','https://cdn-icons-png.flaticon.com/512/93/93624.png'),(7,'photo','https://cdn-icons-png.flaticon.com/512/2983/2983798.png');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commenter`
--

DROP TABLE IF EXISTS `commenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commenter` (
  `utilisateurs_id` int NOT NULL,
  `locations_id` int NOT NULL,
  `avis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note_proprietaires` int DEFAULT NULL,
  `note_loueur` int DEFAULT NULL,
  PRIMARY KEY (`utilisateurs_id`,`locations_id`),
  KEY `IDX_AB751D0A1E969C5` (`utilisateurs_id`),
  KEY `IDX_AB751D0AED775E23` (`locations_id`),
  CONSTRAINT `FK_AB751D0A1E969C5` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`),
  CONSTRAINT `FK_AB751D0AED775E23` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commenter`
--

LOCK TABLES `commenter` WRITE;
/*!40000 ALTER TABLE `commenter` DISABLE KEYS */;
INSERT INTO `commenter` VALUES (1,10,'Super endroit j\'adore !',5,5),(1,11,'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de tex',5,NULL),(1,12,'test commentaire',5,NULL),(2,11,'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de tex',4,NULL),(4,11,'Le Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l\'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de tex',3,NULL),(5,11,'ceci est un commentaire',5,NULL),(6,11,'super',4,NULL),(7,11,'test',0,NULL),(8,11,'test2',3,NULL);
/*!40000 ALTER TABLE `commenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20240202162245','2024-02-02 16:23:26',96),('DoctrineMigrations\\Version20240203173402','2024-02-23 09:09:42',185),('DoctrineMigrations\\Version20240223092710','2024-02-23 09:27:22',180),('DoctrineMigrations\\Version20240223093056','2024-02-23 09:31:16',164),('DoctrineMigrations\\Version20240223093916','2024-02-23 09:39:25',140),('DoctrineMigrations\\Version20240223095027','2024-02-23 09:50:53',208),('DoctrineMigrations\\Version20240223095543','2024-02-23 09:55:52',40),('DoctrineMigrations\\Version20240223110743','2024-02-23 11:08:42',315),('DoctrineMigrations\\Version20240223111141','2024-02-23 11:11:48',47),('DoctrineMigrations\\Version20240223131704','2024-02-23 13:17:32',236),('DoctrineMigrations\\Version20240223132301','2024-02-23 13:23:06',241),('DoctrineMigrations\\Version20240223132533','2024-02-23 13:25:48',248),('DoctrineMigrations\\Version20240304191641','2024-03-04 19:16:54',301),('DoctrineMigrations\\Version20240304192135','2024-03-04 19:21:41',40),('DoctrineMigrations\\Version20240305211652','2024-03-05 21:17:22',49),('DoctrineMigrations\\Version20240307182132','2024-03-07 18:23:21',124),('DoctrineMigrations\\Version20240307183706','2024-03-07 18:37:17',138),('DoctrineMigrations\\Version20240311205408','2024-03-11 20:54:17',177),('DoctrineMigrations\\Version20240320145952','2024-03-20 15:00:21',381);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `locations_id` int NOT NULL,
  `nom` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E01FBE6AED775E23` (`locations_id`),
  CONSTRAINT `FK_E01FBE6AED775E23` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (15,10,'0152eceba6b7540cec134562431a9227.webp'),(16,10,'2fbf2893fd199d283c75cc32a1499c29.webp'),(17,10,'d9a7e9bc3e43874bcfe53ec54dfe6b04.webp'),(18,10,'4ec55293890e148046b2ac95eaf4b630.webp'),(19,10,'942ad4e98c620e7008e0f97c5eccac0f.webp'),(20,10,'90f835e915799ec3f9cda18f4c069db8.webp'),(21,11,'c5eee3384e89baa7d9d5dbf62f291712.webp'),(22,11,'2df47ed82af923c46c681e8bc200d02b.webp'),(23,11,'3a18a4ee10e738c66239a58ba23358f0.webp'),(24,11,'3fdac062e92ee7c4bc5b507949940889.webp'),(25,11,'a7fdac16e94aa05cb49f8a02964a18bd.webp'),(26,11,'733cf2e799570bbb5ff2a1b59b3390c6.webp'),(27,12,'f8365f73f995d92e8879416d17ae41d2.webp'),(28,12,'c55b98c0d5058d73007d3e87a5f236df.webp'),(29,12,'be819e133e142060cdf27a6dbdc35e25.webp'),(30,12,'30ff7892d464c3b4e586e1bfa139e7b6.webp'),(31,12,'858c2b22bfbf120725ea4d1f4edc6d22.webp'),(32,13,'da26f9337efcdf175acbe49b5cf4e73a.webp'),(33,13,'c03854130bf3184e3b3766bdaeab9b42.webp'),(34,13,'fd1deb2fa08c2fbba3eae7ce6cc18c22.webp'),(35,13,'87b98fb464e203290d6fa4d902a6a594.webp'),(36,13,'274282391fb83eb48dfb23df55d2e8b3.webp'),(37,14,'d8ce0b4325c5a4ecd8b7da87109ec38d.webp'),(38,14,'62836b7ab870e2cc9031adab252119a6.webp'),(39,14,'336c4876012e9f337be79c1e3436abc4.webp'),(40,14,'d9acb7375a654d1079b83316b9f2e806.webp'),(41,14,'efb465d96ed5f228dad3f6b68d85e8ed.webp'),(42,14,'c63fa919276ee6962590e4258459649f.webp'),(43,15,'b7a75060693abbeeaa4e4ee4a8e1f20d.webp'),(44,15,'477b3ecc4694d2778d1e007917beb0a9.webp'),(45,15,'ea78ba1fe23e8d99e5bcbf0e59efb6af.webp'),(46,15,'c0cd5e008bfae50cb4e1a7e97619fadf.webp'),(47,15,'313c75a8955b596e3afe72f3bbf99acf.webp'),(48,15,'8d50f7883140a8d470e9e3903ad7ffaf.webp');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `utilisateurs_id` int DEFAULT NULL,
  `nom` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prix` double NOT NULL,
  `adresse` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_debut_disponibilite` date NOT NULL,
  `capacite_maximal` int NOT NULL,
  `pmr` tinyint(1) NOT NULL,
  `actif` tinyint(1) NOT NULL,
  `date_fin_disponibilite` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_17E64ABA1E969C5` (`utilisateurs_id`),
  CONSTRAINT `FK_17E64ABA1E969C5` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (10,1,'Moinho das Feteiras | The Mill  Partager','Moulin à vent',152,'Ponta Delgada, Portugal','2024-02-04',5,1,1,'2025-04-01'),(11,1,'Boîte à oiseaux confortable','Vue imprenable sur la montagne dans une boîte à oiseaux confortable',259,'Gaular, Norvège','2023-02-04',2,1,1,'2024-05-07'),(12,1,'Cabane Spa Sauvage pour 2 personnes','Au bout de l’étang, vous tomberez sur cette magnifique cabane flottante et pénétrerez le décor sauvage des lieux pour vivre pleinement l’expérience des cabanes Coucoo Grands Reflets.  Après un tour de barque pour accéder à votre nid, plongez dans votre ba',310,'Joncherey, France','2024-01-01',2,1,1,'2024-08-01'),(13,1,'Maison de Hobbits unique et insolite','Pour des nuits magiques et insolites, découvrez notre Kerterre, une vraie sculpture en matériaux naturels qui ressemble à une petite maison de Hobbits.  Vous apprécierez Cablanc pour la beauté des lieux,  le calme et la nature.',55,'Saussignac, France','2024-05-07',4,1,1,'2026-09-05'),(14,1,'La Suite secrète','Situé au coeur du quai NDSM d\'Amsterdam avec vue panoramique sur la ville. Au sommet de la grue se trouvent trois suites spacieuses, avec sous un studio pour les événements d\'entreprise et de musique.',889,'Hôte : Faralda Crane Hotel, Amsterdam, Pays-Bas','2024-03-05',15,1,1,'2024-08-07'),(15,2,'Château - Guichainville, France','À propos de ce logement\r\nÀ seulement une heure de Paris, un endroit magique où le confort et la tradition rencontrent le luxe raffiné. Notre château, construit en 1620, a été agrandi et amélioré au fil des siècles : il a bénéficié d\'une rénovation complète, tandis que les éléments originaux ont été soigneusement préservés.\r\n\r\nNous sommes là pour vous accueillir, et pour vous aider à créer de bons souvenirs avec votre famille, vos amis et vos collègues en groupes intimes de 16 personnes avec 4 matelas et 3 lits bébé.(Nous avons finalement des lits pour 40)\r\n\r\n\r\n\r\n​\r\n​\r\nLe logement\r\nNous sommes ravis de vous offrir le château à l\'usage exclusif des 2 premiers étages, qui comprend 4 suites, 1 suite familiale ( double) et 2 chambres (ROSE et DORÉ), pour un séjour de 8 à 16 voyageurs ( veuillez noter que nous pouvons accueillir jusqu\'à 35 invités dans le château ou 43 invités à Chateau et à la dépendance, mais avec des conditions différentes. Si c\'est ce que vous recherchez, vous aurez tout le domaine à votre disposition, mais veuillez d\'abord me contacter).\r\n\r\nAu rez-de-chaussée, vous aurez l\'usage exclusif du salon, de la salle à manger, de la cuisine et de la suite Mumbai (la seule sans escalier).\r\n\r\nAu premier étage, vous trouverez :\r\n\r\n1. Suite VERTE/BLEUE, appartement familial avec 2 chambres à coucher et salle de bain avec superbes carreaux bleus. La vue depuis cet appartement se fait sur le parc en face du Château, sur le parc et la forêt à l\'arrière (et à partir de mai une piscine !) et sur la chapelle sur le côté.\r\n2. suite ROUGE, notre suite emblématique magnifiquement décorée, avec une superbe salle de bains avec baignoire, douche et toilettes, avec des armoires en bois avec une décoration rouge et or luxueuse. Cette suite donne sur le parc devant le château.\r\n3. Chambre ROSE, la seule avec un lit plus petit (140 cm), et avec une salle de bain juste en face du couloir, mais avec de splendides broderies au mur. La salle d\'eau dispose d\'une douche italienne, de toilettes et d\'une vue sur le parc et la forêt.\r\n4. Suite NOIRE ET BLANCHE, notre suite « mariage », extrêmement spacieuse, avec vue sur le parc devant le Château. La salle de bains dispose d\'une baignoire et d\'une WC.\r\n5. Suite VIOLETTE au bout du couloir, avec vue sur le parc et la forêt, et salle de bain avec baignoire et toilettes.\r\n6. Chambre DORÉE avec lit double, avec salle de bain partagée avec chambre ROSE.\r\n\r\nAu Rez de chaussée :\r\n\r\n* Salon très spacieux (Salon de 52 m2) de style splendide avec cheminée, piano, hauts plafonds (4 m)\r\n*Leading off the salon is\r\n6. Suite MUMBAI, avec lit maharaja, vue sur le parc et la forêt, et salle de bain avec douche et WC.\r\n* Salle à manger avec table pouvant accueillir 8 à 20 personnes, entièrement équipée pour un dîner royal : assiettes, verres à vin et champagne, assiettes en argent, lustres... bien sûr avec nappe et serviettes (40 m2)\r\n*Cuisine de 23 m2 avec plafonds hauts de 4m, entièrement équipée avec La Cornue (2 fours, 5 cuisinières à feu, grill) et grand barbecue rôti, deux réfrigérateurs, micro-ondes, machines à café, poêles, assiettes, verres...\r\n*Patry pour le stockage supplémentaire des provisions\r\n\r\nVous et vos invités pourrez profiter pleinement de notre parc de 3ha avec sa table extérieure et son belvédère, son immense barbecue et notre forêt de 13 ha pour les promenades, le jogging ou la méditation.\r\n\r\nLa nouvelle piscine chauffée est accessible exclusivement à nos voyageurs.\r\n\r\nNotre court de tennis privé est également à votre entière Nous avons des raquettes de tennis, mais nous vous suggérons d\'apporter les vôtres si vous souhaitez jouer pour des raisons sanitaires ;)\r\n\r\nNos invités viennent souvent fêter un anniversaire ou un anniversaire de anniversaires dans un petit groupe familial ou ami. La plupart de nos réservations sont pour les mariages, le mois d\'août est notre mois de « vacances » où la famille et les amis séjournent pendant 5 à 7 jours en profitant de l\'été autour de la piscine et des excursions à Deauville, Honfleur, Etretat, les plages de Normandie, Paris ...\r\n\r\nChâteau peut accueillir 35 voyageurs au total, et avec nos Annex Studios et Lodge jusqu\'à 43 voyageurs, mais l\'offre Airbnb est pour un petit groupe : 16 voyageurs avec une possibilité de 4 matelas et 3 lits bébé.\r\n\r\nNous pouvons également vous recommander des traiteurs et des restaurants à proximité.\r\n\r\nNous ne proposons pas de petit déjeuner car nous vous laissons dans votre cercle privé, mais nous recommandons fortement Jerome de P&J Atelier et ses croissants frais XXL livrés encore chaud directement au château !\r\n\r\nDites-moi juste quel est votre projet et ce dont vous avez besoin. Mon mari et moi adorons vous faire sentir choyé pendant votre séjour spécial !\r\n\r\n\r\n​\r\nAccès des voyageurs\r\nLes clients peuvent accéder à tout le parc, la forêt, la piscine et le terrain de tennis privé (avec réservation préalable chez nous)\r\nAutres remarques\r\nLe bâtiment principal du château est uniquement pour vous, mais nous avons une annexe et un gîte où d\'autres voyageurs (et nous) peuvent être (maximum 10 autres personnes ) à moins que vous ne réserviez tout le domaine.\r\n\r\nNous n\'acceptons plus les animaux de compagnie dans le château, uniquement dans les dépendances. Ils ne sont pas autorisés pendant les événements ( mariage, etc.) .\r\n\r\nLa piscine est ouverte de 10h00 à 20h00, sauf demande spécifique directement avec nous.\r\nVous êtes entièrement responsable de la sécurité de vos enfants, ils doivent toujours être accompagnés à la piscine et sur la propriété. Ne les laissez pas seuls, ni dans le château, ni à l\'extérieur.\r\n\r\n\r\nDimanche, la plupart des boutiques et restaurants sont fermés donc nous vous recommandons de faire des provisions avant ou de profiter de la journée pour visiter Rouen, Deauville ou Honfleur où tout est ouvert !\r\n\r\nFaites attention aux escaliers menant à l\'appartement.\r\nNous sommes une «propriété privée» et le public extérieur n\'est pas autorisé dans notre propriété.\r\n\r\nLes enfants ont dû être surveillés EN PERMANENCE pendant votre séjour.\r\n\r\nS\'il vous plaît, si vous avez un plan ou une demande spécifique, écrivez-moi avant et nous pourrons trouver une solution',705,'Guichainville, Normandie, France','2024-05-05',16,1,1,'2025-04-05');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations_categories`
--

DROP TABLE IF EXISTS `locations_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations_categories` (
  `locations_id` int NOT NULL,
  `categories_id` int NOT NULL,
  PRIMARY KEY (`locations_id`,`categories_id`),
  KEY `IDX_5256C72DED775E23` (`locations_id`),
  KEY `IDX_5256C72DA21214B7` (`categories_id`),
  CONSTRAINT `FK_5256C72DA21214B7` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5256C72DED775E23` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations_categories`
--

LOCK TABLES `locations_categories` WRITE;
/*!40000 ALTER TABLE `locations_categories` DISABLE KEYS */;
INSERT INTO `locations_categories` VALUES (10,1),(11,2),(12,4),(13,5),(14,6),(15,7);
/*!40000 ALTER TABLE `locations_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messenger_messages`
--

LOCK TABLES `messenger_messages` WRITE;
/*!40000 ALTER TABLE `messenger_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messenger_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserver`
--

DROP TABLE IF EXISTS `reserver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserver` (
  `utilisateurs_id` int NOT NULL,
  `locations_id` int NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `statut` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombres_de_locataires` double NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `IDX_B9765E931E969C5` (`utilisateurs_id`),
  KEY `IDX_B9765E93ED775E23` (`locations_id`),
  CONSTRAINT `FK_B9765E931E969C5` FOREIGN KEY (`utilisateurs_id`) REFERENCES `utilisateurs` (`id`),
  CONSTRAINT `FK_B9765E93ED775E23` FOREIGN KEY (`locations_id`) REFERENCES `locations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserver`
--

LOCK TABLES `reserver` WRITE;
/*!40000 ALTER TABLE `reserver` DISABLE KEYS */;
INSERT INTO `reserver` VALUES (1,10,'2024-03-11','2024-03-13','transmis',1,13),(1,10,'2024-03-04','2024-03-06','transmis',1,14),(1,10,'2024-04-09','2024-04-11','transmis',2,16),(1,10,'2024-05-07','2024-05-09','transmis',2,18),(1,11,'2024-03-19','2024-03-22','transmis',1,21),(1,11,'2024-03-12','2024-03-14','transmis',1,22),(1,12,'2024-03-12','2024-03-14','transmis',2,23),(2,11,'2024-03-15','2024-03-17','transmis',1,24);
/*!40000 ALTER TABLE `reserver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilisateurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_inscription` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '(DC2Type:datetime_immutable)',
  `adresse` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_497B315EE7927C74` (`email`),
  CONSTRAINT `utilisateurs_chk_1` CHECK (json_valid(`roles`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateurs`
--

LOCK TABLES `utilisateurs` WRITE;
/*!40000 ALTER TABLE `utilisateurs` DISABLE KEYS */;
INSERT INTO `utilisateurs` VALUES (1,'theotime@gmail.com','[\"ROLE_ADMIN\"]','$2y$13$ir0xtaogjGkkcvcIFQyfxecPyga9TjsalqiK5bpxP9hlQApayMwua','Pagies','Théotime','2024-02-02 16:27:25','37 chemin du riez de l\'erelle','0663351044'),(2,'test@gmail.com','[]','$2y$13$ir0xtaogjGkkcvcIFQyfxecPyga9TjsalqiK5bpxP9hlQApayMwua','test','test','2024-02-02 16:34:23','37 chemin du riez de l\'erelle','0663351044'),(4,'lucas@hotmail.fr','[]','$2y$13$JlNHDjH5JnWLclG7IkR.0eI6Ama.54fTC/wLLlgaEeKW9JYQUsNYW','Brtd','Lucas','2024-03-17 14:18:00','32 rue de la rue','0626242526'),(5,'test2@gmail.com','[]','$2y$13$ir0xtaogjGkkcvcIFQyfxecPyga9TjsalqiK5bpxP9hlQApayMwua','test2','Test2','2024-03-28 21:42:26','test rue du test ','0660000000'),(6,'test3@gmail.com','[]','azerty','test3','Test3','2024-03-28 22:14:57','test rue du test ','0660000000'),(7,'test4@gmail.com','[]','azerty','test4','Test4','2024-03-28 22:16:18','test rue du test ','0660000000'),(8,'test5@gmail.com','[]','azerty','test5','Test5','2024-03-28 22:16:44','test rue du test ','0660000000');
/*!40000 ALTER TABLE `utilisateurs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-28 23:25:28
