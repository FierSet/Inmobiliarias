-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2024 a las 08:12:32
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inmoviliaria`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE PROCEDURE `actualizarcasalocal` (IN `ids` INT(8), IN `tipop` VARCHAR(25), IN `statusl` VARCHAR(15), IN `cal` VARCHAR(255), IN `Cp` INT(10), IN `ciud` VARCHAR(255), IN `Ri` VARCHAR(255), IN `paiss` VARCHAR(255), IN `rec` TINYINT(2), IN `ban` TINYINT(2), IN `estaci` TINYINT(2), IN `areas` FLOAT, IN `precios` FLOAT, IN `descr` VARCHAR(255), IN `Im1` VARCHAR(255), IN `Im2` VARCHAR(255), IN `Im3` VARCHAR(255), IN `fechain` DATE, IN `fechaact` DATE, IN `fechafin` DATE)   BEGIN
UPDATE immoviliaria SET 
tipo_propiedad = tipop, 
status_local = statusl, 
calle = cal, 
Codigo_postal = Cp,
ciudad = ciud,
Region = Ri,
pais = paiss,
recamaras = rec,
banos = ban,
estacionamientos = estaci,
area = areas,
precio = precios,
desripcion = descr, 
Imagen1 = Im1,
Imagen2 = Im2,
Imagen3 = Im3,
fechainicio = fechain,
fechadeactualizacion = fechaact,
fechatermino = fechafin
WHERE ID = ids;	
END$$

CREATE PROCEDURE `addlistones` (IN `tip` INT(2), IN `tit1` VARCHAR(30), IN `desc1` VARCHAR(255), IN `tit2` VARCHAR(30), IN `desc2` VARCHAR(255), IN `tit3` VARCHAR(30), IN `desc3` VARCHAR(255), IN `img` VARCHAR(255))   INSERT INTO listones VALUES (
    tip, 
    tit1, 
    desc1, 
    tit2, 
    desc2, 
    tit3, 
    desc3, 
    img
)$$

CREATE PROCEDURE `borrarliston` (IN `ids` INT(11))   BEGIN
DELETE FROM listones WHERE ID = ids;
END$$

CREATE PROCEDURE `checarllave` (IN `llave` CHAR(255))   BEGIN
	SELECT accesskey FROM accesskey WHERE accesskey = llave;
END$$

CREATE PROCEDURE `Contactos` ()   BEGIN
	SELECT * FROM contactos;
END$$

CREATE PROCEDURE `crearcasalocal` (IN `tipo_p` VARCHAR(25), IN `status_l` VARCHAR(15), IN `cal` VARCHAR(255), IN `Codigo_p` INT(10), IN `ciud` VARCHAR(255), IN `Reg` VARCHAR(255), IN `pai` VARCHAR(255), IN `recam` TINYINT(2), IN `ban` TINYINT(2), IN `estacion` TINYINT(2), IN `are` FLOAT, IN `prec` FLOAT, IN `desr` VARCHAR(255), IN `Imag1` VARCHAR(255), IN `Imag2` VARCHAR(255), IN `Imag3` VARCHAR(255), IN `fechain` DATE, IN `fechadeact` DATE, IN `fechat` DATE)   BEGIN
INSERT INTO immoviliaria VALUE( 
    null, 
    tipo_p, 
    status_l, 
    cal, 
    Codigo_p, 
    ciud, 
    Reg, 
    pai,
    recam, 
    ban, 
    estacion, 
    are, 
    prec, 
    desr, 
    Imag1, 
    Imag2, 
    Imag3, 
    fechain, 
    fechadeact, 
    fechat 
);
END$$

CREATE PROCEDURE `createliston` (IN `tipos` INT(2), IN `titulo1s` VARCHAR(30), IN `descrip1s` VARCHAR(255), IN `titulo2s` VARCHAR(30), IN `descrip2s` VARCHAR(255), IN `titulo3s` VARCHAR(30), IN `descrip3s` VARCHAR(255), IN `Imagens` VARCHAR(255))   BEGIN
	INSERT INTO listones VALUES (
    	null,
		tipos,
        titulo1s,
        descrip1s,
        titulo2s,
        descrip2s,
        titulo3s,
        descrip3s,
        Imagens
    );
END$$

CREATE PROCEDURE `existeliston` (IN `ids` INT(11))   BEGIN
	SELECT ID FROM listones WHERE ID =ids;
END$$

CREATE PROCEDURE `getcasalocal` (IN `id` INT(8))   BEGIN
	SELECT * FROM immoviliaria WHERE ID = id;
END$$

CREATE PROCEDURE `getlengs` (IN `status_l` VARCHAR(15), IN `tipo_p` VARCHAR(25))   BEGIN
SELECT COUNT(ID) FROM immoviliaria WHERE status_local = status_l
    AND tipo_propiedad = tipo_p;
END$$

CREATE PROCEDURE `getstatuslocal` (IN `statuslocal` VARCHAR(15), IN `tipolocal` VARCHAR(25), IN `leng` INT(3), IN `curren` INT(3))   BEGIN
SELECT * FROM immoviliaria 
WHERE status_local = statuslocal AND tipo_propiedad = tipolocal 
LIMIT leng OFFSET curren;
END$$

CREATE PROCEDURE `headerandfotter` ()   BEGIN
	SELECT * FROM contactos;
END$$

CREATE PROCEDURE `inmoviliariarando` ()   BEGIN
	SELECT * FROM immoviliaria ORDER BY rand() LIMIT 3;
END$$

CREATE PROCEDURE `listones` ()   BEGIN
	SELECT * FROM listones;
END$$

CREATE PROCEDURE `searchcreation` (IN `tipo_p` VARCHAR(25), IN `status_l` VARCHAR(15), IN `cal` VARCHAR(255), IN `Codigo_p` INT(10), IN `ciud` VARCHAR(255), IN `Reg` VARCHAR(255), IN `pai` INT(255), IN `reca` TINYINT(2), IN `bano` TINYINT(2), IN `estacion` TINYINT(2), IN `areas` FLOAT, IN `precios` FLOAT, IN `desri` VARCHAR(255), IN `Img1` VARCHAR(255), IN `Img2` VARCHAR(255), IN `Img3` VARCHAR(2555))   BEGIN

SELECT ID FROM immoviliaria WHERE
tipo_propiedad = tipo_p AND
status_local = status_l AND
calle = cal AND
Codigo_postal = Codigo_p AND
ciudad = ciud AND
Region = Reg AND
pais = pai AND
recamaras = reca AND
banos = bano AND
estacionamientos = estacion AND
area = areas AND
precio = precios AND
Imagen1 = Img1 AND
Imagen2 = Img2 AND
Imagen3 = Img3;
END$$

CREATE PROCEDURE `statuslist` ()   BEGIN
	SELECT * FROM status_local;
END$$

CREATE PROCEDURE `tipolista` ()   BEGIN
	SELECT * FROM tipo_propiedad;
END$$

CREATE PROCEDURE `updatecontacts` (IN `cel` CHAR(10), IN `ema` CHAR(255), IN `whats` CHAR(10), IN `faceb` VARCHAR(2083), IN `instagr` VARCHAR(2083), IN `estad` CHAR(25), IN `col` CHAR(255), IN `Ciud` VARCHAR(50), IN `cal` CHAR(255), IN `nolocal` INT(4), IN `log` VARCHAR(255), IN `sub_l` VARCHAR(255), IN `titul` VARCHAR(30), IN `desripc` VARCHAR(255))   BEGIN

UPDATE contactos SET 
celular = cel, 
email = ema,
whatsapp = whats,
facebook = faceb, 
instagram = instagr,
estado = estad,
colonia = col,
Ciudad = Ciud,
calle = cal,
no_local = nolocal,
logo = log,
sub_logo = sub_l,
titulo = titul,
desripcion = desripc;

END$$

CREATE PROCEDURE `updatelistones` (IN `IDs` INT(11), IN `tipos` INT(2), IN `titulo1s` VARCHAR(30), IN `descrip1s` VARCHAR(255), IN `titulo2s` VARCHAR(30), IN `descrip2s` VARCHAR(255), IN `titulo3s` VARCHAR(30), IN `descrip3s` VARCHAR(255), IN `Imagens` VARCHAR(255))   BEGIN
	UPDATE listones SET 
    tipo = tipos,
    titulo1 = titulo1s,
    descrip1 = descrip1s,
    titulo2 = titulo2s,
    descrip2 = descrip2s,
    titulo3 = titulo3s,
    descrip3= descrip3s,
    Imagen = Imagens
    WHERE ID = IDs;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesskey`
--

CREATE TABLE `accesskey` (
  `accesskey` char(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `accesskey`
--

INSERT INTO `accesskey` (`accesskey`) VALUES
('pinshisap');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `celular` char(10) DEFAULT NULL,
  `email` char(255) DEFAULT NULL,
  `whatsapp` char(10) DEFAULT NULL,
  `facebook` varchar(2083) DEFAULT NULL,
  `instagram` varchar(2083) DEFAULT NULL,
  `estado` char(25) DEFAULT NULL,
  `colonia` char(255) DEFAULT NULL,
  `Ciudad` varchar(50) DEFAULT NULL,
  `calle` char(255) DEFAULT NULL,
  `no_local` int(4) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `sub_logo` varchar(255) DEFAULT NULL,
  `titulo` varchar(30) DEFAULT NULL,
  `desripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contactos`
--

INSERT INTO `contactos` (`celular`, `email`, `whatsapp`, `facebook`, `instagram`, `estado`, `colonia`, `Ciudad`, `calle`, `no_local`, `logo`, `sub_logo`, `titulo`, `desripcion`) VALUES
('1234567890', 'mail@mail.com', '1234567890', 'https://www.facebook.com/', 'https://instagram.com/', 'Querétaro', 'Queretaro', 'Queretaro', 'C. de tierra y lodo', 2022, 'https://www.dropbox.com/scl/fi/1lymb3l7dnvpvdl54blo1/LOGO_OFFICE.png?rlkey=hj4purn393y1dggjmmq9fcyg8&dl=1', 'https://www.dropbox.com/scl/fi/ypp522cxkb1icf64g5efy/SUB-LOGO_OFFICE.png?rlkey=43wckmhpoy9z7amwo8dvzjz0z&dl=1', 'Llevele llevele', 'Terrenos, casas, oficinas, departamentos, bodegas, etc. Las mejores propiedades');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `immoviliaria`
--

CREATE TABLE `immoviliaria` (
  `ID` int(8) NOT NULL,
  `tipo_propiedad` varchar(25) NOT NULL,
  `status_local` varchar(15) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `Codigo_postal` int(10) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `Region` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `recamaras` tinyint(2) DEFAULT NULL,
  `banos` tinyint(2) DEFAULT NULL,
  `estacionamientos` tinyint(2) DEFAULT NULL,
  `area` float DEFAULT NULL,
  `precio` float DEFAULT NULL,
  `desripcion` varchar(255) DEFAULT NULL,
  `Imagen1` varchar(255) DEFAULT NULL,
  `Imagen2` varchar(255) DEFAULT NULL,
  `Imagen3` varchar(255) DEFAULT NULL,
  `fechainicio` date DEFAULT NULL,
  `fechadeactualizacion` date DEFAULT NULL,
  `fechatermino` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `immoviliaria`
--

INSERT INTO `immoviliaria` (`ID`, `tipo_propiedad`, `status_local`, `calle`, `Codigo_postal`, `ciudad`, `Region`, `pais`, `recamaras`, `banos`, `estacionamientos`, `area`, `precio`, `desripcion`, `Imagen1`, `Imagen2`, `Imagen3`, `fechainicio`, `fechadeactualizacion`, `fechatermino`) VALUES
(1, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/fc/Level995.jpg/revision/latest?cb=20221029203707&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/0/03/Patio-trasero.png/revision/latest/scale-to-width-down/600?cb=20230319004143&path-prefix=es', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(2, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(3, 'Bodega comercial', 'Renta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 2, 160, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://sumaqmercados.pe/wp-content/uploads/2022/11/sumaq-mercados-tipos-de-locales-comerciales.jpg', '2024-04-26', '2024-04-27', '0000-00-00'),
(4, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(5, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(6, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(7, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(8, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(12, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(13, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(14, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(15, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(16, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(17, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(18, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(19, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(27, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(28, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(29, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(30, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(31, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(32, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(33, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(34, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(35, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(36, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(37, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(38, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(39, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(40, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(41, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(42, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(58, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/fc/Level995.jpg/revision/latest?cb=20221029203707&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/0/03/Patio-trasero.png/revision/latest/scale-to-width-down/600?cb=20230319004143&path-prefix=es', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(59, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(60, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://static.wikia.nocookie.net/backrooms/images/9/9f/E0q_a_yVcAI3J8_.jpg/revision/latest/scale-to-width-down/400?cb=20230410003102&path-prefix=es', NULL, NULL, NULL),
(61, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(62, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(63, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(64, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(65, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(66, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(67, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(68, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(69, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(70, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(71, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(72, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(73, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(74, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(75, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(76, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(77, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(78, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(79, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(80, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(81, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(82, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(83, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(84, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(85, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(86, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(87, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(88, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(89, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(128, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/fc/Level995.jpg/revision/latest?cb=20221029203707&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/0/03/Patio-trasero.png/revision/latest/scale-to-width-down/600?cb=20230319004143&path-prefix=es', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(129, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(130, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://static.wikia.nocookie.net/backrooms/images/9/9f/E0q_a_yVcAI3J8_.jpg/revision/latest/scale-to-width-down/400?cb=20230410003102&path-prefix=es', NULL, NULL, NULL),
(131, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL);
INSERT INTO `immoviliaria` (`ID`, `tipo_propiedad`, `status_local`, `calle`, `Codigo_postal`, `ciudad`, `Region`, `pais`, `recamaras`, `banos`, `estacionamientos`, `area`, `precio`, `desripcion`, `Imagen1`, `Imagen2`, `Imagen3`, `fechainicio`, `fechadeactualizacion`, `fechatermino`) VALUES
(132, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(133, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(134, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(135, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(136, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(137, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(138, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(139, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(140, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(141, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(142, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(143, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(144, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(145, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(146, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(147, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(148, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(149, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(150, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(151, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(152, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(153, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(154, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(155, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(156, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(157, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(158, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(159, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(160, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/fc/Level995.jpg/revision/latest?cb=20221029203707&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/0/03/Patio-trasero.png/revision/latest/scale-to-width-down/600?cb=20230319004143&path-prefix=es', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(161, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(162, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://static.wikia.nocookie.net/backrooms/images/9/9f/E0q_a_yVcAI3J8_.jpg/revision/latest/scale-to-width-down/400?cb=20230410003102&path-prefix=es', NULL, NULL, NULL),
(163, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(164, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(165, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(166, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(167, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(168, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(169, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(170, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(171, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(172, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(173, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(174, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(175, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(176, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(177, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(178, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(179, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(180, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(181, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(182, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(183, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(184, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(185, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(186, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(187, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(188, 'Casa', 'Renta', 'C. serca de tu corazon', 7777, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.clarin.com/img/2020/05/22/cqnDFy5zZ_1256x620__1.jpg', 'https://elcorreoweb.es/binrepository/711x400/18c0/675d400/none/10703/SAIF/eca-casa-piano-1_21210308_20230920084436.jpg', 'https://i.ytimg.com/vi/vW_zIsR4gIU/maxresdefault.jpg', NULL, NULL, NULL),
(189, 'Bodega industrial', 'Renta Temporar', 'C. menchaca #69', 7787, 'Queretaro', 'Queretaro', 'Mexico', NULL, NULL, NULL, NULL, 1000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.elheraldodechihuahua.com.mx/incoming/e5zpmq-casa-de-los-chinos-1/ALTERNATES/LANDSCAPE_768/casa%20de%20los%20chinos%201', 'https://images.reporteindigo.com/wp-content/uploads/2023/02/Backrooms-pasillos-infinitos-zumbidos-y-luces-estridentes-la-aterradora-creepypasta-llega-al-cine.jpeg', 'https://i.redd.it/ebh2zt8w6xqa1.jpg', NULL, NULL, NULL),
(190, 'Casa', 'Venta', 'C. tetipo #66600', 61600, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 150, 1, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://www.canal26.com/media/image/2022/08/24/515755.jpg', 'https://png.pngtree.com/background/20230425/original/pngtree-spooky-decaying-abandoned-house-in-switzerland-picture-image_2466663.jpg', 'https://st3.idealista.com/news/archivos/styles/fullwidth_xl/public/2015-11/mansiones_abandonadas_16.jpg', NULL, NULL, NULL),
(191, 'Casa', 'Renta Temporar', 'C. menchaca', NULL, 'Queretaro', 'Queretaro', 'Mexico', 0, 0, 0, 150, 10000000, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/1/1e/LEVEL808.png/revision/latest?cb=20211111201938&path-prefix=es', 'https://static.wikia.nocookie.net/backrooms/images/f/f3/Frowner_123.jpg/revision/latest/smart/width/371/height/332?cb=20221219013025&path-prefix=es', NULL, NULL, NULL),
(192, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', NULL, NULL, NULL, NULL, NULL, NULL),
(193, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'piso o terreno se suelen evaluar otras características, pero necesitas ayuda, entonces debes recurrir a una inmobiliaria. En este caso, éstas tienen el trabajo de valorar la ubicación, el estado en el que se encuentre la vivienda, el estado de su exterior', NULL, NULL, NULL, NULL, NULL, NULL),
(194, 'Bodega comercial', 'Renta', 'C. tetipo #06600', 7765, 'Queretaro', 'Queretaro', 'Mexico', 2, 2, 2, 190, 2000000, 'ta padre', 'https://areazero20.com/wp-content/uploads/2022/04/diseno-de-locales-comerciales.jpg', 'https://areazero20.com/wp-content/uploads/2022/04/diseno-de-locales-comerciales.jpg', 'https://sumaqmercados.pe/wp-content/uploads/2022/11/sumaq-mercados-tipos-de-locales-comerciales.jpg', '2024-04-27', '2024-04-27', '0000-00-00'),
(195, 'Casa', 'Renta', 'C. de tierra', 8882, 'Queretaro', 'Queretaro', 'Mexico', 2, 3, 1, 220, 1000000, 'ta padre', 'https://buroinmobiliario.mx/wp-content/uploads/2020/12/6-local.jpg', 'https://brasa.com.mx/wp-content/uploads/2021/09/021-scaled.jpeg', 'https://brasa.com.mx/wp-content/uploads/2021/09/021-scaled.jpeg', '2024-04-27', '2024-04-27', '2024-04-27'),
(196, 'Casa', 'Vendido', 'C. pimpinera', 77889, 'Queretaro', 'Queretaro', 'Mexico', 4, 3, 2, 500, 1000200, 'La vendo proque no la uso.\nNo es por inseguridad. creanme.', 'https://siespinosa.mx/administrador/inmuebles/images/68942_0_20210603083020.jpg', 'https://http2.mlstatic.com/D_NQ_NP_716504-MLM74957507137_032024-O.webp', 'https://img10.naventcdn.com/avisos/18/01/42/80/22/45/720x532/1441456019.jpg', '2024-04-27', '2024-04-27', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listones`
--

CREATE TABLE `listones` (
  `ID` int(11) NOT NULL,
  `tipo` int(2) DEFAULT NULL,
  `titulo1` varchar(30) DEFAULT NULL,
  `descrip1` varchar(255) DEFAULT NULL,
  `titulo2` varchar(30) DEFAULT NULL,
  `descrip2` varchar(255) DEFAULT NULL,
  `titulo3` varchar(30) DEFAULT NULL,
  `descrip3` varchar(255) DEFAULT NULL,
  `Imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Volcado de datos para la tabla `listones`
--

INSERT INTO `listones` (`ID`, `tipo`, `titulo1`, `descrip1`, `titulo2`, `descrip2`, `titulo3`, `descrip3`, `Imagen`) VALUES
(2, 2, 'CASAS Desde $5.3M', 'CASAS Desde $5.3M — Las mejores vistas desde tu jardín y roof garden. Casas completamente equipadas.', 'Residencial emblemático', 'Espacios al aire libre, piscina exterior, sauna, gimnasio y garaje. Desde 2.230.000 €.', 'Compra hoy', 'RE/MAX México cuenta con Inmuebles e Inmobiliarias especialistas en vender y rentar casas en las principales zonas de país.', 'https://img.freepik.com/foto-gratis/mujer-mostrando-mano-mini-casa-concepto-inmobiliario-ai-generativo_123827-24098.jpg'),
(6, 1, 'CASAS Desde $5.3M', 'Es una casa aislada y vacía con una iluminación tenue, que se cree que está habitada por una entidad', '', '', '', '', 'https://static.wikia.nocookie.net/backrooms/images/f/fc/Level995.jpg'),
(9, 1, 'En venta y renta1', 'Terrenos, casas, oficinas, departamentos, bodegas, etc. Las mejores propiedades en venta y renta', '', '', '', '', 'https://www.saari.com.mx/wp-content/uploads/2020/01/%C2%BFQu%C3%A9-es-una-inmobiliaria.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status_local`
--

CREATE TABLE `status_local` (
  `status_local` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `status_local`
--

INSERT INTO `status_local` (`status_local`) VALUES
('Cancelado'),
('Renta'),
('Renta Temporar'),
('Renta/Venta'),
('Rentado'),
('Vendido'),
('Venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_propiedad`
--

CREATE TABLE `tipo_propiedad` (
  `tipo_propiedad` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_propiedad`
--

INSERT INTO `tipo_propiedad` (`tipo_propiedad`) VALUES
('Bodega comercial'),
('Bodega industrial'),
('Casa'),
('Casa con uso de suelo'),
('Casa en condominio'),
('Departamento'),
('Local comercial'),
('Local en centro comercial'),
('Nave industrial'),
('Oficina'),
('Otro'),
('Terreno'),
('Terreno comercial'),
('Terreno industrial');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `immoviliaria`
--
ALTER TABLE `immoviliaria`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `tipo_propiedad` (`tipo_propiedad`),
  ADD KEY `status_local` (`status_local`);

--
-- Indices de la tabla `listones`
--
ALTER TABLE `listones`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `status_local`
--
ALTER TABLE `status_local`
  ADD PRIMARY KEY (`status_local`);

--
-- Indices de la tabla `tipo_propiedad`
--
ALTER TABLE `tipo_propiedad`
  ADD PRIMARY KEY (`tipo_propiedad`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `immoviliaria`
--
ALTER TABLE `immoviliaria`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT de la tabla `listones`
--
ALTER TABLE `listones`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
