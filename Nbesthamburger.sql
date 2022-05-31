CREATE DATABASE  IF NOT EXISTS `besthamburger` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `besthamburger`;
-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: besthamburger
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local` varchar(45) NOT NULL,
  `bairro` varchar(45) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `rua` varchar(45) NOT NULL,
  `referencia` varchar(45) DEFAULT NULL,
  `cep` varchar(45) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_endereco_usuario_idx` (`usuario_id`),
  CONSTRAINT `fk_endereco_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `preco_total` decimal(10,0) NOT NULL,
  `data` datetime NOT NULL,
  `frete` decimal(10,0) NOT NULL,
  `cartao_credito` varchar(45) DEFAULT NULL,
  `pix` varchar(45) DEFAULT NULL,
  `dinheiro` varchar(45) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pedido_usuario1_idx` (`usuario_id`),
  CONSTRAINT `fk_pedido_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `preco` decimal(10,0) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `img` varchar(45) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (2,'Batata Frita',25,'Batata Frita Simples','images/home-images/acompanhamento01.jpeg','Acompanhamento'),(3,'Frango Frito',50,'Frango Frito','images/home-images/acompanhamento02.jpeg','Acompanhamento'),(4,'Bolinho de Bacalhau',40,'bolinho de bacalhau','images/home-images/acompanhamento03.jpeg','Acompanhamento'),(5,'Onion Ring',20,'Cebolas em rodelas empanadas fritas','images/home-images/acompanhamento04.jpeg','Acompanhamento'),(6,'Batata Completa',30,'Batata com Cheddar e Bacon','images/home-images/acompanhamento05.jpeg','Acompanhamento'),(7,'Salada Completa',25,'Salada Alface com Tomate e Cebola','images/home-images/acompanhamento06.jpeg','Acompanhamento'),(10,'Chop de Vinho',25,'Chop de Vinho ','images/home-images/bebida.jpg','Bebida'),(11,'Refrigerante',5,'Guarana, Coca-Cola, Fanta, Pepsi','images/home-images/bebida02.jpg','Bebida'),(12,'Chop',15,'Chop Brahma','images/home-images/bebida03.jpg','Bebida'),(13,'Drinks',20,'Bloody Mary, Pinã Colada, Mojito, Gin Tônica, Caipirinha','images/home-images/bebida04.jpg','Bebida'),(16,'Suco',10,'Morango, Melancia, Laranja, Limão, Acerola','images/home-images/bebida07.jpg','Bebida'),(17,'Milk-Shake',15,'Morango, Chocolate, Nutella, Leite Ninho','images/home-images/bebidas06.jpg','Bebida'),(18,'Hamburger Duplo',45,'Hamburger Duplo com queijo cheddar','images/home-images/burguer-1.jpg','Hamburger'),(19,'Hamburger 2',50,'Hamburger com Alface , Queijo , Batata Chips e Picles','images/home-images/burguer-2.jpg','Hamburger'),(20,'Hamburger 3',27,'Hamburger com Pão Branco ou Preto com Rucula , Queijo ou Beterraba (Vegetariano)','images/home-images/burguer-3.jpg','Hamburger'),(21,'Hamburger 4',29,'hamburger com cebola roxa, tomate, queijo prato e molho barbecue','images/home-images/burguer-4.jpg','Hamburger'),(22,'Hamburger 5',30,'Hamburger de frandinha 180g com Pão de gergelim, tomate, queijo mussarela , onion ring , alface','images/home-images/burguer-5.jpg','Hamburger'),(23,'Hamburger 6',42,'Hamburger de picanha 180g com Pão de gergelim, bacon, rucula, cebola roxa, tomate e maionese caseira','images/home-images/burguer-6.jpg','Hamburger'),(27,'Banoffe',20,'Torta de banana, doce de leite e chantilly','images/home-images/sobremesa-01.jpg','Sobremesa'),(29,'Pudim',15,'Pudim de doce de leite individual','images/home-images/sobremesa-02.jpg','Sobremesa'),(30,'Bolo de pote',15,'Bolo de pote de chocolate','images/home-images/sobremesa-03.jpg','Sobremesa'),(31,'Donuts',10,'Donuts chocolate, creme e coco','images/home-images/sobremesa-04.jpg','Sobremesa'),(32,'Cheesecake de Nutella no pote',25,'Cheesecake de Nutella no pote','images/home-images/sobremesa-05.jpg','Sobremesa'),(33,'Mousse de Maracujá',15,'Mousse de Maracujá no pote','images/home-images/sobremesa-06.jpg','Sobremesa'),(34,'Hamburger de cogumelo de Shitake',30,'Hamburger de cogumelo Shitake com alface e tomate picado','images/home-images/burgerveg-01.jpg','Hamburger Vegetariano'),(35,'Hambúrguer de beterraba e arroz integral',25,'Hambúrguer de beterraba e arroz integral e cebola roxa','images/home-images/burgerveg-02.jpg','Hamburger Vegetariano'),(36,'Hamburger de legumes',20,'Hamburger de legumes, tomate e alface','images/home-images/burgerveg-03.jpg','Hamburger Vegetariano'),(37,'Hamburger de proteína de soja',15,'Hamburger de proteína de soja, tomate e alface','images/home-images/burgerveg-04.jpg','Hamburger Vegetariano'),(38,'Hamburger do futuro (vegetal)',35,'Hamburger do futuro (vegetal),Molho Billy and Jack, tomate, cebola e alface americana','images/home-images/burgerveg-06.jpg','Hamburger Vegetariano'),(40,'Hamburger de batata doce',30,'Hamburger de batata doce cebola roxa picada e rúcula','images/home-images/burgerveg-05.jpg','Hamburger Vegetariano'),(41,'Cachorro quente cremoso gratinado',50,'Cachorro quente com cheddar cremoso e bacon picado','images/home-images/cachorroquente-01.jpg','Cachorro Quente'),(42,'Cachorro quente de pote',30,'Cachorro quente de pote com purê, batata palha, vinagrete, pão picado e salsicha','images/home-images/cachorroquente-02.jpg','Cachorro Quente'),(43,'Cachorro quente com cebola caramelizada',30,'Cachorro quente com cebola caramelizada e uma salsicha','images/home-images/cachorroquente-03.jpg','Cachorro Quente'),(45,'Cachorro quente vegetariano',40,'Cachorro quente com salsicha de soja e salada','images/home-images/cachorroquente-04.jpg','Cachorro Quente'),(46,'Cachorro quente simples ',20,'Cachorro quente com uma salsicha, katchup e mostarda','images/home-images/cachorroquente-05.jpg','Cachorro Quente'),(47,'Cachorro quente Chilli Apimentado  ',35,'Cachorro quente com Chilli, pimenta jalapeño e cheddar ralado','images/home-images/cachorroquente-06.jpg','Cachorro Quente'),(48,' Hamburger e Batata Frita ',38,'Hamburger 180g fraldinha com alface, cebola, queijo cheddar','images/home-images/comboburger-01.jpg','Combos'),(49,' Hamburger Duplo e Batata Frita ',38,'Hamburger duplo 180g fraldinha com alface, cebola, queijo cheddar e bacon','images/home-images/comboburger-02.jpg','Combos'),(50,'Hamburger Triplo , onion ring e chopp de vinho ',38,'Hamburger triplo 180g fraldinha  queijo cheddar, cebola caramelizada, molhor barbecua e bacon','images/home-images/comboburger-03.jpg','Combos'),(51,' Dois Cachorro Quente simples e Batata Frita)',25,'Cachorro Quente simples ketchup, mostarda e Batata Frita simples','images/home-images/combocachorroquente-04.jpg','Combos'),(52,'Cachorro Quente, Batata Frita e Vitamina)',30,'Cachorro Quente , batata palha, molho de tomate, maionese com Batata Frita simples e Vitamina: Morango, Banana','images/home-images/combocachorroquente-05.jpg','Combos'),(53,'Cachorro Quente e refrigerante a escolha)',30,'Cachorro Quente , batata palha, molho de tomate, maionese com Batata Frita simples e refrigerante 300ml','images/home-images/combocachorroquente-06.jpg','Combos');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto_has_pedido`
--

DROP TABLE IF EXISTS `produto_has_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto_has_pedido` (
  `produto_id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`produto_id`,`pedido_id`),
  KEY `fk_produto_has_pedido_pedido1_idx` (`pedido_id`),
  KEY `fk_produto_has_pedido_produto1_idx` (`produto_id`),
  CONSTRAINT `fk_produto_has_pedido_pedido1` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  CONSTRAINT `fk_produto_has_pedido_produto1` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto_has_pedido`
--

LOCK TABLES `produto_has_pedido` WRITE;
/*!40000 ALTER TABLE `produto_has_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto_has_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `sobrenome` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `data_de_nascimento` varchar(200) NOT NULL,
  `avata` varchar(45) DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `telefone_UNIQUE` (`telefone`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (22,'veronica 2','bandeira','085.739.256-70','11987876469','veronica.bandeira@gmail.com','F','1993-05-14',NULL,'0123456'),(25,'Veronica','Bandeira','58566649580','11995362108','veronica.bandeira1990@yahoo.com.br','feminino','14051990',NULL,'$2a$10$BwbgN7umd4LZQ81WgxyDb.WiVglOizvROMIiv/oKmnR3ys7w6WvLa'),(27,'andressa','bandeira','14747180869','11987883562','andressa@gmail.com','feminino','10031973',NULL,'$2a$10$NxTAhIseq8JkKofXpfdrq.IdXBXF/YdDbiTzsdgj/y1Ha.mao1pya');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'besthamburger'
--

--
-- Dumping routines for database 'besthamburger'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-31 20:32:36
