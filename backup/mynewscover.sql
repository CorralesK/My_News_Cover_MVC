-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2023 a las 04:02:53
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mynewscover`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Deportes'),
(4, 'Nacionales'),
(9, 'Tecnología'),
(10, 'Internacionales'),
(13, 'Entretenimiento'),
(19, 'Salud');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `news`
--

CREATE TABLE `news` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL,
  `permanlink` varchar(400) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `newsSourceId` int(11) UNSIGNED NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL,
  `categoryId` int(11) UNSIGNED NOT NULL,
  `img` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `news`
--

INSERT INTO `news` (`id`, `title`, `description`, `permanlink`, `date`, `newsSourceId`, `userId`, `categoryId`, `img`) VALUES
(2066, 'Jafet Soto dirigió el entrenamiento, pero... ¿Se sentará en el banquillo?', 'El juego de ida de las semifinales será este sábado a las 8 p. m. en el Colleya Fonseca.', 'https://www.teletica.com/club-sport-herediano/jafet-soto-dirigio-el-entrenamiento-pero-se-sentara-en-el-banquillo_348177', '2023-11-29 09:12:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/2/24/jafet-soto-tcnico-de-herediano.-foto-de-archivo_16372658_1140x520.jpg'),
(2067, 'Beni Rubido sobre el reto que será Haití: \"No es un partido sencillo\"', 'El técnico de la Selección Mayor Femenina espera a un equipo caribeño que no se expondrá más de lo necesario. ', 'https://www.teletica.com/la-sele/beni-rubido-sobre-el-reto-que-sera-haiti-no-es-un-partido-sencillo_348165', '2023-11-29 07:48:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/29/beni-rubido-seleccin-femenina_1733302322_1140x520.jpg'),
(2068, '¡17 salidas! Estos equipos han reportado bajas para la próxima temporada', 'Liberia, Sporting FC, Pérez Zeledón y Grecia no perdieron tiempo y ya dijeron cuáles jugadores no siguen en sus planteles.', 'https://www.teletica.com/nacional/17-salidas-estos-equipos-han-reportado-bajas-para-la-proxima-temporada_348156', '2023-11-29 18:28:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/10/28/liberia-vs.-sporting._262585291_1140x520.jpeg'),
(2069, 'Este es el equipo de leyendas con el que jugará Bryan Ruiz ', 'José Pékerman y Pacho Maturana estarán a cargo de la dirección técnica de los equipos integrados por figuras del fútbol de América que marcaron historia.', 'https://www.teletica.com/nacional/este-es-el-equipo-de-leyendas-con-el-que-jugara-bryan-ruiz_348154', '2023-11-29 18:26:00', 8, 6, 1, 'https://assets.teletica.com/Files/Sizes/2022/11/10/bryan-ruiz_1913052265_1140x520.jpg'),
(2070, 'Campeón de la Vuelta a Costa Rica es separado de su equipo tras caso de dopaje', 'El ciclista Marco Tulio Suesca ya no formará parte del Movistar Best PC.', 'https://www.teletica.com/ciclismo/campeon-de-la-vuelta-a-costa-rica-es-separado-de-su-equipo-tras-caso-de-dopaje_348153', '2023-11-29 17:56:00', 8, 6, 1, 'https://assets.teletica.com/Files/Sizes/2022/12/25/campen-suesca-festeja-en-ltima-etapa-su-ttulo-en-la-vuelta_953943078_1140x520.jpeg'),
(2071, 'Así le jugó Alajuelense al Estelí en la contundente victoria', 'Rojinegros vencieron 0-3 y encaminan la serie final de la Copa Centroamericana', 'https://www.teletica.com/liga-deportiva-alajuelense/asi-le-jugo-alajuelense-al-esteli-en-la-contundente-victoria_348149', '2023-11-29 17:16:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/29/alajuelense-ante-real-estel_1789539243_1140x520.jpg'),
(2072, 'Celso Borges: \"El Estelí es el mejor equipo al que hemos enfrentado en el torneo\"', 'El volante de Alajuelense destacó la buena labor de los nicaragüenses y asegura que supieron aplicar bien el plan de juego. ', 'https://www.teletica.com/liga-deportiva-alajuelense/celso-borges-el-esteli-es-el-mejor-equipo-al-que-hemos-enfrentado-en-el-torneo_348147', '2023-11-29 16:47:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/29/celso-borges-habla-tras-gane-al-estel_1743681962_1140x520.jpg'),
(2073, 'Carlos Alcaraz advierte que impedirá el dominio de Djokovic en 2024', 'El español cerró la temporada de la ATP como número 2 del mundo, con seis títulos ganados en 2023.', 'https://www.teletica.com/tenis/carlos-alcaraz-advierte-que-impedira-el-dominio-de-djokovic-en-2024_348145', '2023-11-29 16:23:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/9/2/carlos-alcaraz.-afp_742815886_1140x520.jpg'),
(2074, 'Cubo Torres sobre su futuro: \"Es fútbol, nunca sabes lo que pueda pasar\"', 'El pez gordo del mercado de fichajes confirma que clubes han preguntado por su situación.', 'https://www.teletica.com/asociacion-deportiva-guanacasteca/cubo-torres-sobre-su-futuro-es-futbol-nunca-sabes-lo-que-pueda-pasar_348133', '2023-11-29 13:59:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/9/5/eric-cubo-torres-guanacasteca_476985386_1140x520.jpg'),
(2075, 'Andrés Carevic: \"Sabemos que tenemos una ventaja de tres goles, pero no está cerrada la serie\"', 'El técnico de Alajuelense pidió mesura ante el resultado del primer partido de la final de Copa Centroamericana. ', 'https://www.teletica.com/liga-deportiva-alajuelense/andres-carevic-sabemos-que-tenemos-una-ventaja-de-tres-goles-pero-no-esta-cerrada-la-serie_348113', '2023-11-29 13:10:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/29/alajuelense-ante-real-estel_1789539243_1140x520.jpg'),
(2076, 'La Liga sí pudo en Nicaragua: Los manudos acarician el título de Copa Centroamericana', 'Los rojinegros golean al Real Estelí en Nicaragua y tienen la mesa servida para festejar la próxima semana en el Morera Soto. ', 'https://www.teletica.com/liga-deportiva-alajuelense/la-liga-si-pudo-en-nicaragua-los-manudos-acarician-el-titulo-de-copa-centroamericana_348111', '2023-11-28 16:52:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/29/alajuelense-ante-real-estel_1789543509_1140x520.jpg'),
(2077, 'Este es el nuevo cuerpo técnico del Herediano tras la salida de Jeaustin Campos', 'Los rojiamarillos enfrentarán a Alajuelense el próximo sábado en el juego de ida de las semifinales. ', 'https://www.teletica.com/club-sport-herediano/este-es-el-nuevo-cuerpo-tecnico-del-herediano-tras-la-salida-de-jeaustin-campos_348103', '2023-11-28 12:43:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/2/club-sport-herediano_227161428_1140x520.jpg'),
(2078, 'Herediano anuncia que va \"contra todo y contra todos\"', 'El Team echa mano a su discurso de los últimos torneos previo a semifinales.', 'https://www.teletica.com/club-sport-herediano/herediano-anuncia-que-va-contra-todo-y-contra-todos_348095', '2023-11-28 11:20:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/10/5/comunicaciones._2048103692_1140x520.jpg'),
(2079, 'City derrota al Leipzig, Barcelona, Atlético Madrid, Lazio y Dortmund a octavos de Champions', 'El Leipzig no pudo sostener la ventaja que consiguió en la primera mitad', 'https://www.teletica.com/internacional/city-derrota-al-leipzig-barcelona-atletico-madrid-lazio-y-dortmund-a-octavos-de-champions_348092', '2023-11-28 10:10:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/28/manchester-city-rb-leipzig.-afp_1811031243_1140x520.jpg'),
(2080, 'Jeaustin Campos ya no es técnico del Herediano', 'Ayer se dio a conocer que Campos deberá cumplir un castigo de 6 meses', 'https://www.teletica.com/club-sport-herediano/jeaustin-campos-ya-no-es-tecnico-del-herediano_348076', '2023-11-28 08:46:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/8/9/jeaustin-campos-tcnico-herediano_1469214488_1140x520.jpg'),
(2081, 'VAR ayudará a la transparencia, dice presidente de la Fedefútbol ', '\"Queremos trabajar muchísimo en la transparencia, en facilitar la toma de decisiones y como siempre, evitar las dudas que puedan generar el arbitraje\", comentó Osael Maroto.', 'https://www.teletica.com/nacional/var-ayudara-a-la-transparencia-dice-presidente-de-la-fedefutbol_348079', '2023-11-28 07:25:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/3/10/var---videoarbitraje.-foto-de-archivo_1235687486_1140x520.jpg'),
(2082, 'Herediano anunciará esta tarde qué sucederá con el puesto de Jeaustin Campos', 'Los florenses juegan como locales este sábado ante Alajuelense en las semifinales del torneo nacional.', 'https://www.teletica.com/club-sport-herediano/herediano-anunciara-esta-tarde-que-sucedera-con-el-puesto-de-jeaustin-campos_348077', '2023-11-28 18:45:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/28/herediano-definir-este-martes-futuro-de-jeaustin-campos-en-el-eq_1823268650_1140x520.jpg'),
(2083, 'Carevic asegura que juego de la Liga no cambiará por jugar una final', '\nAlajuelense nunca ha perdido cuando se mide al Real Estelí.', 'https://www.teletica.com/liga-deportiva-alajuelense/carevic-asegura-que-juego-de-la-liga-no-cambiara-por-jugar-una-final_348073', '2023-11-28 17:58:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/21/andrs-carevic-tcnico-alajuelense_1856715349_1140x520.jpg'),
(2084, 'Otros siete partidos de fútbol de Brasil bajo sospecha de amaños', 'Las indagaciones sobre esos cotejos forman parte de la tercera fase de la Operación Pena Máxima, lanzada este martes en ocho municipios de cinco estados', 'https://www.teletica.com/internacional/otros-siete-partidos-de-futbol-de-brasil-bajo-sospecha-de-amanos_348070', '2023-11-28 17:19:00', 8, 6, 1, 'https://assets.teletica.com/Files/Sizes/2021/8/30/imagen-ilustrativa._1769512896_1140x520.jpg'),
(2085, 'Alajuelense nunca ha perdido ante el Real Estelí', 'Los manudos tendrán dos partidos ante los pinoleros por la Copa Centroamericana', 'https://www.teletica.com/liga-deportiva-alajuelense/alajuelense-nunca-ha-perdido-ante-el-real-esteli_348067', '2023-11-28 16:38:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/23/alajuelense.-lda_1982685974_1140x520.jpeg'),
(2086, 'Pipo González: \"Hay equipos que sacan la billetera a nivel mundial y al final no les da fruto\"', 'El defensor manudo Giancarlo González, esas diferencias hoy en día no importan y será el propio terreno de juego que se encargue de dar su veredicto.', 'https://www.teletica.com/liga-deportiva-alajuelense/pipo-gonzalez-hay-equipos-que-sacan-la-billetera-a-nivel-mundial-y-al-final-no-les-da-fruto_348066', '2023-11-28 16:20:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/5/26/giancarlo-gonzlez-alajuelense_695243684_1140x520.jpg'),
(2087, '¿Hay un antes y después en Javon East tras polémica con Jeaustin? Su agente responde', 'El atacante acumula 17 goles en esta temporada con el Monstruo.', 'https://www.teletica.com/deportivo-saprissa/hay-un-antes-y-despues-en-javon-east-tras-polemica-con-jeaustin-su-agente-responde_348063', '2023-11-28 15:25:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/12/javon-east-saprissa_1107190099_1140x520.jpg'),
(2088, 'Gavi, operado con éxito de su rodilla derecha', 'El Barça no precisó la duración de la indisponibilidad de su jugador, a quien se le practicó una \"sutura meniscal\"', 'https://www.teletica.com/internacional/gavi-operado-con-exito-de-su-rodilla-derecha_348061', '2023-11-28 15:07:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/28/gavi.-afp_1836438212_1140x520.jpg'),
(2089, 'Saprissa, Olimpia y FAS: los equipos de renombre que superó el Estelí para llegar a la final', 'Los nicaragüenses abren la serie por el trofeo de la Copa Centroamericana en casa, este martes a las 9 p. m.', 'https://www.teletica.com/internacional/saprissa-olimpia-y-fas-los-equipos-de-renombre-que-supero-el-esteli-para-llegar-a-la-final_348060', '2023-11-28 14:51:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/10/5/saprissa-real-estel.-concacaf_2081155145_1140x520.png'),
(2090, 'Cartaginés llega a semifinales con muchas dudas sobre su rendimiento', 'Los brumosos enfrentarán a Saprissa con un récord de una sola victoria en sus últimas siete presentaciones. ', 'https://www.teletica.com/club-sport-cartagines/cartagines-llega-a-semifinales-con-muchas-dudas-sobre-su-rendimiento_348013', '2023-11-28 14:02:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/10/22/cartagins-ante-saprissa_790690932_1140x520.jpg'),
(2091, 'Pirotecnia en los estadios: entre la cultura de los hinchas y la seguridad', 'Casi ningún tema polariza tanto en el fútbol alemán como la pirotecnia en los estadios del país. El equipo Hamburger SV quiere contribuir a su posible legalización.', 'https://www.teletica.com/deutsche-welle/pirotecnia-en-los-estadios-entre-la-cultura-de-los-hinchas-y-la-seguridad_348058', '2023-11-28 13:58:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/28/importada-feed_1840696415_1140x520.jpg'),
(2092, 'Cuarteto arbitral de la ida entre Estelí y Alajuelense es liderado por un canadiense', 'Manudos visitan este martes al equipo nicaragüense por la final de la Copa Centroamericana.', 'https://www.teletica.com/liga-deportiva-alajuelense/cuarteto-arbitral-de-la-ida-entre-esteli-y-alajuelense-es-liderado-por-un-canadiense_348054', '2023-11-28 13:52:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/2/8/arbitraje-en-el-ftbol.-foto-de-archivo_1367965264_1140x520.jpg'),
(2093, 'Orlando Moreira sobre sanción a Jeaustin Campos: \"Yo voy a ver esto sin maldad\"', 'El dirigente del Herediano aseguró que siempre han creído en la inocencia del técnico en este caso de racismo que denunció Javon East. ', 'https://www.teletica.com/club-sport-herediano/orlando-moreira-sobre-sancion-a-jeaustin-campos-yo-voy-a-ver-esto-sin-maldad_348028', '2023-11-27 12:01:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/2/jeaustin-campos-tcnico-herediano_226834381_1140x520.jpg'),
(2094, 'Abogado de Jeaustin sobre castigo: \"Mostraron abiertamente sus colores\"', 'Adolfo Hernández denuncia irregularidades que habrían cometido en el Comité de Ética de la Federación.', 'https://www.teletica.com/nacional/abogado-de-jeaustin-sobre-castigo-mostraron-abiertamente-sus-colores_348027', '2023-11-27 11:40:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/3/29/jeaustin-campos-habla-por-primera-vez-sobre-la-polmica-de-racismo_1432555295_1140x520.jpg'),
(2095, 'Cronología del caso Jeaustin Campos-Javon East', 'Este lunes el Comité de Ética de la Federación Costarricense de Futbol dio a conocer un castigo de seis meses y $5.000 contra el técnico', 'https://www.teletica.com/club-sport-herediano/cronologia-del-caso-jeaustin-campos-javon-east_348022', '2023-11-27 11:21:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/4/13/jeaustin-campos-tcnico-de-herediano._122859904_1140x520.jpg'),
(2096, '¿Puede dirigir Jeaustin Campos este fin de semana ante la Liga pese a sanción?', 'Este es el A, B y C del castigo al director técnico.', 'https://www.teletica.com/nacional/puede-dirigir-jeaustin-campos-este-fin-de-semana-ante-la-liga-pese-a-sancion_348018', '2023-11-27 10:53:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/10/29/jeaustin-campos._174906979_1140x520.jpeg'),
(2097, 'Sanción a Jeaustin Campos: 6 meses de castigo y multa económica', 'El caso de Campos y Javon East se remonta a marzo de este año.', 'https://www.teletica.com/club-sport-herediano/sancion-a-jeaustin-campos-6-meses-de-castigo-y-multa-economica_348016', '2023-11-27 10:40:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/2/jeaustin-campos-tcnico-herediano_226850271_1140x520.jpg'),
(2098, 'Cartaginés anuncia los precios de los boletos para las semifinales', 'Los brumosos recibirán a Saprissa este domingo a las 11 a. m. ', 'https://www.teletica.com/club-sport-cartagines/cartagines-anuncia-los-precios-de-los-boletos-para-las-semifinales_348015', '2023-11-27 10:13:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/5/cartagins-liberia.-_482140209_1140x520.jpeg'),
(2099, 'Santa Ana llegará con ventaja para la vuelta de las semifinales de Liga de Ascenso', 'Los josefinos fueron los únicos que lograron triunfar en los juegos de ida. Este fin de semana se disputará la vuelta.', 'https://www.teletica.com/liga-de-ascenso/santa-ana-llegara-con-ventaja-para-la-vuelta-de-las-semifinales-de-liga-de-ascenso_348009', '2023-11-27 09:11:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/27/santa-ana-fc_1901115540_1140x520.jpg'),
(2100, 'Marco Vásquez sobre final de la Liga: \"Para mí no, pero para muchos el Real Estelí es favorito\"', 'El vocero de la Junta Directiva analizó la invasión en el Morera tras el juego ante Guanacasteca, el partido en Nicaragua y las semifinales del torneo.', 'https://www.teletica.com/liga-deportiva-alajuelense/marco-vasquez-sobre-final-de-la-liga-para-mi-no-pero-para-muchos-el-real-esteli-es-favorito_348010', '2023-11-27 09:06:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/21/freddy-gndola-ante-saprissa_1859696631_1140x520.jpg'),
(2101, 'Falta casi un año para que el VAR sea una realidad en Costa Rica', 'La Federación anunció que el \"banderazo de salida\" será este martes y miércoles.', 'https://www.teletica.com/liga-deportiva-alajuelense/falta-casi-un-ano-para-que-el-var-sea-una-realidad-en-costa-rica_348004', '2023-11-27 08:13:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/3/10/var---videoarbitraje.-foto-de-archivo_1235690501_1140x520.jpg'),
(2102, 'Femenina se juega boleto a la Copa Oro en casa ante Haití y en visita a San Cristóbal y Nieves', 'La Tricolor juega este jueves en el Morera Soto ante las haitianas', 'https://www.teletica.com/la-sele/femenina-se-juega-boleto-a-la-copa-oro-en-casa-ante-haiti-y-en-visita-a-san-cristobal-y-nieves_347996', '2023-11-27 08:02:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/9/27/alexandra-pinell-seleccionada-nacional_1398703692_1140x520.jpg'),
(2103, 'Estos son los únicos jugadores que amenazan el goleo de José de Jesús Godínez ', 'El mexicano se afianza como el principal favorito a dejarse el primer lugar en anotaciones, aunque dos morados están cerca. ', 'https://www.teletica.com/club-sport-herediano/estos-son-los-unicos-jugadores-que-amenazan-el-goleo-de-jose-de-jesus-godinez_347990', '2023-11-27 18:39:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/7/30/jos-de-jess-godnez-herediano_555473988_1140x520.jpg'),
(2104, 'Danny Carvajal regresa al fútbol tico con San Carlos', 'El arquero no jugaba en el país desde el 2017, cuando defendió la camiseta de Saprissa', 'https://www.teletica.com/asociacion-deportiva-san-carlos/danny-carvajal-regresa-al-futbol-tico-con-san-carlos_347987', '2023-11-27 18:10:00', 8, 6, 1, 'https://assets.teletica.com/Files/Sizes/2018/1/26/171700248_1140x520.jpg'),
(2105, 'Box de Peppe: Max Verstappen concluyó temporada récord en el Gran Premio de Abu Dhabi', 'El piloto de Red Bull destacó con 19 triunfos en un total de 22 carreras en el año. ', 'https://www.teletica.com/motores/box-de-peppe-max-verstappen-concluyo-temporada-record-en-el-gran-premio-de-abu-dhabi_347988', '2023-11-27 18:08:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/27/max-verstappen-frmula-1_1911897822_1140x520.jpg'),
(2106, 'Datos confirman a Saprissa como favorito entrando a la fase de definiciones', 'Los morados se enfrenta a Cartaginés en semifinales, mientras que Alajuelense se mide con Herediano.', 'https://www.teletica.com/deportivo-saprissa/datos-confirman-a-saprissa-como-favorito-entrando-a-la-fase-de-definiciones_347982', '2023-11-27 17:23:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/9/16/saprissa-grecia.-_394595224_1140x520.JPG'),
(2107, 'Saprissa debuta a joven de décimo año del Liceo Santo Domingo de Heredia', 'El juvenil Dax Palmer fue titular en el triunfo 1-2 ante el Santos de Guápiles.', 'https://www.teletica.com/deportivo-saprissa/saprissa-debuta-a-joven-de-decimo-ano-del-liceo-santo-domingo-de-heredia_347984', '2023-11-27 17:01:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/27/dax-palmer._1915948400_1140x520.jpg'),
(2108, 'Herediano avisa: \"Nos reservamos el derecho de admisión\"', 'El juego de ida de la semifinal ante la Liga será el 2 de diciembre a las 8 p. m. en el Colleya Fonseca.', 'https://www.teletica.com/club-sport-herediano/herediano-avisa-nos-reservamos-el-derecho-de-admision_347979', '2023-11-27 16:47:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/2/club-sport-herediano_227161428_1140x520.jpg'),
(2109, 'Fin de semana de pocos brillos para los legionarios de La Sele', 'Además, este lunes se dio a conocer un nuevo parte médico sobre Keylor Navas.', 'https://www.teletica.com/legionarios/fin-de-semana-de-pocos-brillos-para-los-legionarios-de-la-sele_347976', '2023-11-27 16:00:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/6/juan-pablo-vargas.-afp_559875006_1140x520.jpg'),
(2110, '¡Qué desplome! La Sele también cae en nuevo ranking FIFA', 'El popular estadígrafo Mr. Chip adelantó en qué puesto estará la Tricolor.', 'https://www.teletica.com/la-sele/que-desplome-la-sele-tambien-cae-en-nuevo-ranking-fifa_347968', '2023-11-27 14:37:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/17/costa-rica-panam._1470188162_1140x520.jpeg'),
(2111, 'PSG da nuevo reporte sobre lesión de Keylor Navas', 'El tico continúa con su programa de rehabilitación.', 'https://www.teletica.com/legionarios/psg-da-nuevo-reporte-sobre-lesion-de-keylor-navas_347963', '2023-11-27 14:03:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/9/18/keylor-navas-junto-a-marquinhos_625519317_1140x520.png'),
(2112, '¿Reportó el árbitro David Gómez la nueva invasión al Morera? Esto dice su informe', 'Un aficionado irrumpió en la cancha rojinegra y recriminó a jugadores.', 'https://www.teletica.com/liga-deportiva-alajuelense/reporto-el-arbitro-david-gomez-la-nueva-invasion-al-morera-esto-dice-su-informe_347960', '2023-11-27 13:35:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/8/1/arbitraje-en-costa-rica_775847660_1140x520.jpg'),
(2113, 'San Carlos cierra el Apertura con cinco victorias en fila', 'Fue el último partido de Walter Chevez con el equipo de Liberia\n\n', 'https://www.teletica.com/municipal-liberia/san-carlos-cierra-el-apertura-con-cinco-victorias-en-fila_347944', '2023-11-26 13:49:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/27/liberia-san-carlos.-adsc_1970638915_1140x520.jpeg'),
(2114, 'Vladimir Quesada: “Esto no termina acá”', 'Morados finalizan la primera fase del Apertura como el mejor equipo, pero el técnico morado se concentra en lo que viene', 'https://www.teletica.com/deportivo-saprissa/vladimir-quesada-esto-no-termina-aca_347939', '2023-11-26 11:49:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/21/vladimir-quesada-tcnico-saprissa_1857084303_1140x520.jpg'),
(2115, 'Récord de goles y puntos: Así finaliza Saprissa tras ganar en Guápiles', 'Los morados ahora se medirán a Cartaginés en la semifinal.', 'https://www.teletica.com/deportivo-saprissa/record-de-goles-y-puntos-asi-finaliza-saprissa-tras-ganar-en-guapiles_347935', '2023-11-26 10:49:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/26/santos-saprissa.-sg_1981423900_1140x520.jpg'),
(2116, 'Real Madrid se va a dormir líder liguero tras ganar 3-0 al Cádiz impulsado por Rodrygo', 'Los merengues arrebataron provisionalmente el primer puesto de la clasificación al Girona, a la espera de lo que hagan los catalanes el lunes contra el Athletic Club ', 'https://www.teletica.com/internacional/real-madrid-se-va-a-dormir-lider-liguero-tras-ganar-3-0-al-cadiz-impulsado-por-rodrygo_347932', '2023-11-26 09:46:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/26/rodrygo.-afp_1985303556_1140x520.jpg'),
(2117, 'Costa Rica logra cifra récord de medallas en los Parapanamericanos', 'Justas finalizaron este domingo en Santiago de Chile', 'https://www.teletica.com/otros-deportes/costa-rica-logra-cifra-record-de-medallas-en-los-parapanamericanos_347931', '2023-11-26 09:27:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/24/sherman-gity-doble-oro-en-santiago-2023_2137520771_1140x520.jpg'),
(2118, 'Mauricio Wright sobre Saprissa: “No tenemos miedo, yo no tengo miedo”', 'Cartaginés juega el próximo domingo ante Saprissa, en la ida de las semifinales.', 'https://www.teletica.com/club-sport-cartagines/mauricio-wright-sobre-saprissa-no-tenemos-miedo-yo-no-tengo-miedo_347928', '2023-11-26 07:01:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/3/11/gracia-vs.-sporting._1309250829_1140x520.jpeg'),
(2119, 'Red Bull dominó una temporada en la que Ferrari y Mercedes decepcionaron', '\nCon una victoria en Abu Dabi, Verstappen pone broche de oro a temporada de ensueño', 'https://www.teletica.com/motores/red-bull-domino-una-temporada-en-la-que-ferrari-y-mercedes-decepcionaron_347926', '2023-11-26 17:52:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/6/19/max-verstappen.-afp_1364230737_1140x520.jpg'),
(2120, 'Carevic asegura que la Liga llega a etapas de definición fuerte mentalmente', 'Alajuelense, antes de medirse con Herediano en semifinales, juega en Nicaragua por la Copa Centroamericana', 'https://www.teletica.com/liga-deportiva-alajuelense/carevic-asegura-que-la-liga-llega-a-etapas-de-definicion-fuerte-mentalmente_347925', '2023-11-26 17:38:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/21/andrs-carevic-tcnico-alajuelense_1856726224_1140x520.jpg'),
(2121, 'Esto opina Jeaustin Campos sobre el manejo de las acusaciones de racismo', 'El timonel habló tras lo acontecido hace una semana entre Freddy Góndola y Marian Torres y sobre su caso con Javon East.', 'https://www.teletica.com/club-sport-herediano/esto-opina-jeaustin-campos-sobre-el-manejo-de-las-acusaciones-de-racismo_347923', '2023-11-26 16:01:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/2/jeaustin-campos-tcnico-herediano_226834381_1140x520.jpg'),
(2122, 'Álvaro Saborío estará en la edición 2023 de La Ruta', 'El goleador sancarleño cambiará el fútbol por la bicicleta en tremendo reto de cruzar el país de costa a costa.', 'https://www.teletica.com/ciclismo/alvaro-saborio-estara-en-la-edicion-2023-de-la-ruta_347857', '2023-11-25 16:48:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/9/21/lvaro-saboro.-adsc_840221520_1140x520.JPG'),
(2123, 'Jesse Owens y Luz Long: La amistad que desafió a Hitler en medio de los Juegos Olímpicos', 'En 1936, ambos atletas sorprendieron al mundo con una gran relación que los nazis vieron como una blasfemia.', 'https://www.teletica.com/otros-deportes/jesse-owens-y-luz-long-la-amistad-que-desafio-a-hitler-en-medio-de-los-juegos-olimpicos_347785', '2023-11-25 16:38:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/24/atletas-jesse-owens-y-luz-long_2135818162_1140x520.png'),
(2124, 'Los cuatro grandes se citan: Saprissa-Cartaginés y Alajuelense-Herediano en semifinales', 'Juegos de la segunda fase del Apertura inicia en el próximo fin de semana.', 'https://www.teletica.com/nacional/los-cuatro-grandes-se-citan-saprissa-cartagines-y-alajuelense-herediano-en-semifinales_347914', '2023-11-25 16:27:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/10/22/cartagins-ante-saprissa_790690932_1140x520.jpg'),
(2125, 'Pérez Zeledón derrota a Cartaginés y se salva de terminar en el sótano', 'Los brumosos llegan a semifinales por goles, tras empatar en puntos con Guanacasteca.', 'https://www.teletica.com/club-sport-cartagines/perez-zeledon-derrota-a-cartagines-y-se-salva-de-terminar-en-el-sotano_347913', '2023-11-25 16:19:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/26/prez-zeledn.-mpz_2054296447_1140x520.jpeg'),
(2126, 'Herediano cumple al derrotar a Sporting y piensa en Alajuelense', 'Los rojiamarillos llegan a semifinales con tres victorias en fila.', 'https://www.teletica.com/club-sport-cartagines/herediano-cumple-al-derrotar-a-sporting-y-piensa-en-alajuelense_347912', '2023-11-25 16:02:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/2/club-sport-herediano_227161428_1140x520.jpg'),
(2127, 'Guanacasteca se despide del Apertura derrotando a la Liga en el Morera', 'Alajuelense ahora se enfoca en el Real Estelí por la Copa Centroamericana.', 'https://www.teletica.com/asociacion-deportiva-guanacasteca/guanacasteca-se-despide-del-apertura-derrotando-a-la-liga-en-el-morera_347910', '2023-11-25 15:48:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/26/alajuelense-guanacasteca.-adg_2051281572_1140x520.jpg'),
(2128, 'Grecia cierra el torneo con tres puntos vitales en el Lito Pérez', 'Puntarenas se mete en problemas y en el Clausura deberá alejarse de la zona de descenso', 'https://www.teletica.com/puntarenas/grecia-cierra-el-torneo-con-tres-puntos-vitales-en-el-lito-perez_347902', '2023-11-25 12:35:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/25/puntarenas-grecia.-mg_2064324556_1140x520.png'),
(2129, 'Barcelona se salva del naufragio en Vallecas, Griezmann decisivo para el Atlético', 'Un gol que permite al Atlético (3º, 31 puntos) escalar al podio, superando al FC Barcelona', 'https://www.teletica.com/internacional/barcelona-se-salva-del-naufragio-en-vallecas-griezmann-decisivo-para-el-atletico_347900', '2023-11-25 11:47:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/25/robert-lewandowski.-afp_2064445587_1140x520.jpg'),
(2130, 'Arsenal es el nuevo líder de la Premier', 'En el partido de la fecha, Manchester City y el Liverpool empataron 1-1', 'https://www.teletica.com/internacional/arsenal-es-el-nuevo-lider-de-la-premier_347897', '2023-11-25 10:26:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/9/11/arsenal_39809817_1140x520.png'),
(2131, 'Parapanamericanos: Costa Rica suma dos medallas más en Santiago 2023', 'Representación tica tiene a su haber 12 preseas en las justas continentales.', 'https://www.teletica.com/otros-deportes/parapanamericanos-costa-rica-suma-dos-medallas-mas-en-santiago-2023_347896', '2023-11-25 09:45:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/25/andrs-molina_2072071415_1140x520.png'),
(2132, 'Costa Rica será la sede de torneo internacional de fútbol infantil', 'La Escuela Rincón Grande de Pavas será la representante del país', 'https://www.teletica.com/futbol/costa-rica-sera-la-sede-de-torneo-internacional-de-futbol-infantil_347893', '2023-11-25 07:49:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/25/copa-continental-scotiabank_2078600915_1140x520.JPG'),
(2133, 'La Fórmula 1 quiere conjugarse en femenino', 'Aunque su presencia en la parrilla suscita debates desde hace años, lo cierto es que desde hace casi medio siglo ninguna mujer ha llegado a la élite como titular.', 'https://www.teletica.com/motores/la-formula-1-quiere-conjugarse-en-femenino_347860', '2023-11-25 13:49:00', 8, 6, 1, 'https://assets.teletica.com/Files/Sizes/2021/1/27/frmula-1_1135584412_1140x520.png'),
(2134, 'Sintonice la fase final de los campeonatos nacionales en TDMAX', 'La Liga Promerica Masculina, la Femenina y la Liga de Ascenso llegan a sus fases finales, donde se definirán los clasificados a la disputa por el título.', 'https://www.teletica.com/nacional/sintonice-la-fase-final-de-los-campeonatos-nacionales-en-tdmax_347795', '2023-11-25 13:40:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/24/sintonice-la-fase-final-de-los-campeonatos-nacionales-en-tdmax_2061103131_1140x520.png'),
(2135, 'Última fecha de la Copa Economy se correrá este domingo', 'Competencia será en la modalidad de Endurance', 'https://www.teletica.com/motores/ultima-fecha-de-la-copa-economy-se-correra-este-domingo_347858', '2023-11-25 13:37:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/24/copa-economy._2138130131_1140x520.jpeg'),
(2136, 'Sherman Güity elude el dolor y se cuelga el segundo oro en Parapanamericanos 2023', 'El para atleta le dio la décima medalla de oro a la delegación costarricense. ', 'https://www.teletica.com/otros-deportes/sherman-guity-elude-el-dolor-y-se-cuelga-el-segundo-oro-en-parapanamericanos-2023_347859', '2023-11-24 10:16:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/24/sherman-gity-doble-oro-en-santiago-2023_2137520771_1140x520.jpg'),
(2137, 'Estas son las sanciones que dejó la penúltima fecha del campeonato ', 'El Tribunal recibió denuncia de la Liga por actos racistas de Mariano Torres sobre Góndola y dará su veredicto la próxima semana. ', 'https://www.teletica.com/nacional/estas-son-las-sanciones-que-dejo-la-penultima-fecha-del-campeonato_347855', '2023-11-24 09:36:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/21/kendall-waston-jugador-del-saprissa_1859345724_1140x520.jpg'),
(2138, 'Puntos y goles: Las marcas que quiere Saprissa en esta última jornada', 'Los morados, con el liderato en firme, viajan a Guápiles este domingo a las 3 p. m', 'https://www.teletica.com/deportivo-saprissa/puntos-y-goles-las-marcas-que-quiere-saprissa-en-esta-ultima-jornada_347854', '2023-11-24 09:02:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/23/grecia-saprissa._2056432959_1140x520.jpeg'),
(2139, 'Mariano Torres se defiende y asegura que nunca ofendió a Freddy Góndola', 'La polémica por supuestos insultos racistas viene desde la final del Torneo de Copa', 'https://www.teletica.com/deportivo-saprissa/mariano-torres-se-defiende-y-asegura-que-nunca-ofendio-a-freddy-gondola_347841', '2023-11-24 18:25:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/21/mariano-torres-jugador-del-saprissa_1860414240_1140x520.jpg'),
(2140, '¡Grecia ante su chance de oro! Intentará salir del sótano en la última fecha ', 'Los griegos reciben al Puntarenas FC otro de los rivales que quedarían comprometidos en la lucha por el no descenso. ', 'https://www.teletica.com/municipal-grecia/grecia-ante-su-chance-de-oro-intentara-salir-del-sotano-en-la-ultima-fecha_347837', '2023-11-24 17:43:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/23/grecia-saprissa.-mg_2051123428_1140x520.jpeg'),
(2141, 'Conceden la libertad condicional a Oscar Pistorius', 'Pistorius fue condenado a 13 años de prisión en 2017 por el asesinato de su novia Reeva Steenkamp en febrero de 2013.', 'https://www.teletica.com/deutsche-welle/conceden-la-libertad-condicional-a-oscar-pistorius_347836', '2023-11-24 17:37:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/24/importada-feed_2121750756_1140x520.jpg'),
(2142, '¿Qué les espera a los legionarios de La Sele?', 'Jugadores ya se encuentran con sus equipos tras el fracaso ante Panamá.', 'https://www.teletica.com/legionarios/que-les-espera-a-los-legionarios-de-la-sele_347833', '2023-11-24 17:00:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/1/kenneth-vargas-hearst-de-escocia_151037115_1140x520.jpg'),
(2143, 'Así se juega la última fecha del Apertura 2023', 'Tres juegos se disputan a la misma hora este sábado.', 'https://www.teletica.com/nacional/asi-se-juega-la-ultima-fecha-del-apertura-2023_347826', '2023-11-24 15:29:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/3/club-sport-herediano_302184490_1140x520.jpg'),
(2144, 'Camila Haase logra la novena medalla para Costa Rica en Parapanamericanos', 'Esta es la segunda medalla de la nadadora paralímpica en los juegos de Santiago 2023. ', 'https://www.teletica.com/otros-deportes/camila-haase-logra-la-novena-medalla-para-costa-rica-en-parapanamericanos_347824', '2023-11-24 15:06:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/24/camila-haase-nadadora-paralmpica_2112756271_1140x520.jpg'),
(2145, 'San Carlos triunfa otra vez y cada vez está más lejos del sótano', '\nEn la fecha 22 San Carlos visita a Liberia y Pérez Zeledón recibe a Cartaginés.', 'https://www.teletica.com/asociacion-deportiva-san-carlos/san-carlos-triunfa-otra-vez-y-cada-vez-esta-mas-lejos-del-sotano_347802', '2023-11-23 14:38:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/24/jonathan-mcdonald.-adsc_2063289349_1140x520.jpeg'),
(2146, 'Vladimir sobre el liderato: \"Para esto se juega y para esos se entrena\"', 'Los morados cierran la fase regular del torneo el fin de semana contra el Santos de Guápiles.', 'https://www.teletica.com/deportivo-saprissa/vladimir-sobre-el-liderato-para-esto-se-juega-y-para-esos-se-entrena_347789', '2023-11-23 11:32:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/21/vladimir-quesada-tcnico-saprissa_1857084303_1140x520.jpg'),
(2147, 'Saprissa triunfa en Grecia y firma su mejor puntuación en un torneo corto', 'Los morados siguen en lo más alto de la tabla del Apertura 2023.', 'https://www.teletica.com/municipal-grecia/saprissa-triunfa-en-grecia-y-firma-su-mejor-puntuacion-en-un-torneo-corto_347782', '2023-11-23 10:31:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/23/grecia-saprissa.-mg_2051125443_1140x520.jpeg'),
(2148, 'Verstappen rechaza la idea de eventual fichaje de Hamilton por Red Bull', 'Hamilton también rechazó un acercamiento a Horner antes de renovar su contrato con Mercedes.', 'https://www.teletica.com/motores/verstappen-rechaza-la-idea-de-eventual-fichaje-de-hamilton-por-red-bull_347774', '2023-11-23 09:22:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/6/18/max-verstappen.-afp_1281382472_1140x520.jpg'),
(2149, 'Yoserth Hernández se despide del PFC: \"Siempre voy a tener un gran respeto hacia este equipo\"', 'El jugador está en órbita del Deportivo Saprissa y todo hace indicar que podría vestirse de morado para el otro torneo. ', 'https://www.teletica.com/puntarenas/yoserth-hernandez-se-despide-del-pfc-siempre-voy-a-tener-un-gran-respeto-hacia-este-equipo_347767', '2023-11-23 07:02:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/20/yoserth-hernndez._1771386209_1140x520.jpg'),
(2150, 'Estas son las jugadoras convocadas para buscar el boleto directo a Copa Oro 2024', 'El técnico de la Selección Femenina, Beni Rubido, mandó a llamar a 23 futbolistas para enfrentar a Haití y San Cristóbal y Nieves. ', 'https://www.teletica.com/la-sele/estas-son-las-jugadoras-convocadas-para-buscar-el-boleto-directo-a-copa-oro-2024_347763', '2023-11-23 18:19:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/9/27/seleccin-nacional-femenina_1398162192_1140x520.jpg'),
(2151, 'Di María dejará la selección argentina después de la Copa América 2024', 'La Copa América se celebrará entre el 20 de junio y el 14 de julio.', 'https://www.teletica.com/internacional/di-maria-dejara-la-seleccion-argentina-despues-de-la-copa-america-2024_347761', '2023-11-23 17:50:00', 8, 6, 1, 'https://assets.teletica.com/Files/Sizes/2021/7/11/ngel-di-mara-seleccin-de-argentina-2021_1857972303_1140x520.jpg'),
(2152, 'Saprissa busca hacer historia si suma seis puntos más', 'Los morados juegan este jueves contra Grecia y Santos en el cierre de la fase regular del Apertura.', 'https://www.teletica.com/deportivo-saprissa/saprissa-busca-hacer-historia-si-suma-seis-puntos-mas_347716', '2023-11-23 16:55:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/5/saprissa-alajuelense.-_428266521_1140x520.jpeg'),
(2153, 'Un año después del 0-7 en el Mundial, La Sele sigue sin brillo ni alma', 'Lo que tenía que haber sido un gran aprendizaje y una oportunidad de mejora, más bien sigue siendo la tónica de la Tricolor. ', 'https://www.teletica.com/la-sele/un-ano-despues-del-0-7-en-el-mundial-la-sele-sigue-sin-brillo-ni-alma_347756', '2023-11-23 16:03:00', 8, 6, 1, 'https://assets.teletica.com/Files/Sizes/2022/11/23/la-sele-ante-espaa_564374281_1140x520.jpg'),
(2154, 'Javier Santamaría sobre caso Góndola-Torres: \"Tema debe ser llevado a instancias judiciales\"', 'El Director Deportivo rojinegro también habló sobre la importancia de ganar el Torneo de Copa.', 'https://www.teletica.com/liga-deportiva-alajuelense/javier-santamaria-sobre-caso-gondola-torres-tema-debe-ser-llevado-a-instancias-judiciales_347721', '2023-11-23 15:02:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/21/freddy-gndola-ante-saprissa_1859648459_1140x520.jpg'),
(2155, 'Polonia de Lewandowski ante Estonia en la repesca para la Eurocopa', 'Por la llamada Ruta B jugarán Israel contra Islandia y Bosnia frente a Ucrania.', 'https://www.teletica.com/internacional/polonia-de-lewandowski-ante-estonia-en-la-repesca-para-la-eurocopa_347748', '2023-11-23 13:42:00', 8, 6, 1, 'https://assets.teletica.com/Files/Sizes/2022/9/20/robert-lewandowski.-afp_1512979594_1140x520.jpg'),
(2156, 'Maduro denuncia \"xenofobia de oligarquía racista de Perú\" tras incidente con selección de fútbol', 'La relación de Maduro con Perú ha sido tensa, con un nuevo pico desde la destitución del presidente de izquierda Pedro Castillo en 2022 ', 'https://www.teletica.com/internacional/maduro-denuncia-xenofobia-de-oligarquia-racista-de-peru-tras-incidente-con-seleccion-de-futbol_347731', '2023-11-22 16:25:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/23/per-venezuela.-afp_1988019631_1140x520.jpg'),
(2157, 'Herediano golea en su camino hacia las semifinales', 'Florenses ganaron como locales ante el Santos', 'https://www.teletica.com/club-sport-herediano/herediano-golea-en-su-camino-hacia-las-semifinales_347729', '2023-11-22 15:42:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/23/herediano-santos.-ads_1985582099_1140x520.jpg'),
(2158, 'Alajuelense sigue de fiesta con victoria ante Puntarenas', 'Manudos se dejaron los tres puntos gracias a un gran cierre del partido.', 'https://www.teletica.com/puntarenas/alajuelense-sigue-de-fiesta-con-victoria-ante-puntarenas_347728', '2023-11-22 14:56:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/23/alajuelense.-lda_1982685974_1140x520.jpeg'),
(2159, '\"La violencia es totalmente inaceptable\", dice Infantino tras los incidentes en el Maracaná', 'La FIFA explicó este miércoles que no ha abierto ninguna investigación disciplinaria, un proceso que precisa generalmente más tiempo. ', 'https://www.teletica.com/internacional/la-violencia-es-totalmente-inaceptable-dice-infantino-tras-los-incidentes-en-el-maracana_347713', '2023-11-22 11:32:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/7/31/gianni-infantino-presidente-de-la-fifa_682577973_1140x520.jpg'),
(2160, 'Guanacasteca triunfa y espera un milagro para ser semifinalista', 'Los de Horacio Esquivel están a tres puntos de Cartaginés, pero el goleo les juega en contra', 'https://www.teletica.com/municipal-liberia/guanacasteca-triunfa-y-espera-un-milagro-para-ser-semifinalista_347709', '2023-11-22 10:36:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/22/guanacasteca-liberia_1965467099_1140x520.jpeg'),
(2161, 'Sherman Güity se cuelga el oro en los 200m de los Parapanamericanos', 'El para atleta costarricense consiguió la segunda presea dorada para la delegación tica.', 'https://www.teletica.com/otros-deportes/sherman-guity-se-cuelga-el-oro-en-los-200m-de-los-parapanamericanos_347704', '2023-11-22 09:29:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/22/sherman-giti._1962957818_1140x520.jpg'),
(2162, 'Pilar Riveros conquista el primer oro para Costa Rica en Parapanamericanos', 'En la misma disciplina de para tiro con arco, Diego Quesada también consiguió una medalla de plata.  ', 'https://www.teletica.com/otros-deportes/pilar-riveros-conquista-el-primer-oro-para-costa-rica-en-parapanamericanos_347692', '2023-11-22 18:23:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/22/pilar-riveros-medalla-de-oro-en-para-tiro-con-arco_1951924490_1140x520.jpg'),
(2163, 'Honduras tendrá cuatro bajas para enfrentar a La Sele en repechaje hacia Copa América', 'Los catrachos perdieron por penales ante México en un partido lleno de polémicas. ', 'https://www.teletica.com/internacional/honduras-tendra-cuatro-bajas-para-enfrentar-a-la-sele-en-repechaje-hacia-copa-america_347687', '2023-11-22 17:10:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/22/mxico-ante-honduras_1947682443_1140x520.jpg'),
(2164, 'Venezuela denuncia \"secuestro\" de avión de la selección y agresión a jugadores en Perú', '\"La aeronave viene experimentando restricciones de abastecimiento de índole mercantil privado ajenas a la voluntad del Estado peruano\", indicaron las autoridades en un comunicado.', 'https://www.teletica.com/internacional/venezuela-denuncia-secuestro-de-avion-de-la-seleccion-y-agresion-a-jugadores-en-peru_347686', '2023-11-22 17:07:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/22/seleccin-de-venezuela._1947639803_1140x520.jpg'),
(2165, 'Técnico de Honduras denunció \"cosas delicadas\" tras polémico partido ante México', 'Reilando Rueda aseguró que “vine por respeto a ustedes a esta conferencia de prensa”. ', 'https://www.teletica.com/internacional/tecnico-de-honduras-denuncio-cosas-delicadas-tras-polemico-partido-ante-mexico_347683', '2023-11-22 16:28:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/7/16/reinaldo-rueda.-afp_609819293_1140x520.jpg'),
(2166, 'Alajuelense con la mesa servida para cerrar la fase regular sin contratiempos', 'Los manudos se enfrentan este miércoles al Puntarenas FC.', 'https://www.teletica.com/liga-deportiva-alajuelense/alajuelense-con-la-mesa-servida-para-cerrar-la-fase-regular-sin-contratiempos_347629', '2023-11-22 15:50:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/3/joel-campbell-celebra-clasificacin-ante-herediano_304134678_1140x520.jpg'),
(2167, '¿Le robaron a Honduras en el Azteca? Esto dicen los exárbitros ticos', 'Aquí se explica por qué si el portero catracho Edrick Menjívar recibió dos amarillas no fue expulsado.', 'https://www.teletica.com/nacional/le-robaron-a-honduras-en-el-azteca-esto-dicen-los-exarbitros-ticos_347680', '2023-11-22 14:16:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/22/mxico---honduras._1941879381_1140x520.jpg'),
(2168, 'Hanna Gabriels demostró su inocencia en caso de supuesto dopaje', '\"No hay evidencia de que la Gabriels haya usado intencionalmente una sustancia prohibida para el propósito de mejorar su desempeño\", comunicó el Consejo Mundial de Boxeo.', 'https://www.teletica.com/otros-deportes/hanna-gabriels-demostro-su-inocencia-en-caso-de-supuesto-dopaje_347673', '2023-11-22 13:50:00', 8, 6, 1, 'https://assets.teletica.com/Files/Sizes/2021/4/18/hanna-gabriels-boxeadora-costarricense-2021_512763821_1140x520.jpeg'),
(2169, '\"Robo en el Azteca\": Concacaf recibe duras críticas tras polémicas en México - Honduras', 'Reponer nueve minutos y después dar dos más, repetir un penal dos veces y un expulsado que siguió jugando. Tremendo lo que sucedió en el Azteca.', 'https://www.teletica.com/internacional/robo-en-el-azteca-concacaf-recibe-duras-criticas-tras-polemicas-en-mexico-honduras_347670', '2023-11-22 13:14:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/22/mxico-vs.-honduras._1934230818_1140x520.jpg'),
(2170, 'Este domingo se realizará la edición 27 de la Marathon San José', 'Según la organización se contará con la presencia de 2.000 atletas provenientes de varias zonas del país y de Centroamérica.', 'https://www.teletica.com/otros-deportes/este-domingo-se-realizara-la-edicion-27-de-la-marathon-san-jose_347631', '2023-11-22 13:00:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/21/presentacin-marathon-san-jos_1881233537_1140x520.jpg'),
(2171, 'México se clasifica ante Honduras; La Sele contra La H por boleto a la Copa América', 'En el otro juego de la fecha Jamaica venció sorpresivamente 3-2 a Canadá.', 'https://www.teletica.com/internacional/mexico-se-clasifica-ante-honduras-la-sele-contra-la-h-por-boleto-a-la-copa-america_347658', '2023-11-21 17:37:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/22/mxico-honduras.-afp_1905966224_1140x520.jpg'),
(2172, 'Scaloni pone en duda su continuidad al frente de la selección argentina', 'Scaloni hizo la inesperada declaración luego de la victoria argentina, que dejó a Brasil sin su histórico invicto como anfitrión en eliminatorias.', 'https://www.teletica.com/internacional/scaloni-pone-en-duda-su-continuidad-al-frente-de-la-seleccion-argentina_347655', '2023-11-21 16:19:00', 8, 6, 1, 'https://assets.teletica.com/Files/Sizes/2018/10/9/236081716_1140x520.jpg'),
(2173, 'Cartaginés saca un provechoso empate en casa de Sporting', 'En la última fecha de la fase regular, Sporting se mide con Herediano y Cartaginés con Pérez Zeledón.', 'https://www.teletica.com/nacional/cartagines-saca-un-provechoso-empate-en-casa-de-sporting_347654', '2023-11-21 15:59:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/22/sporting-cartagins.-_1896035521_1140x520.jpeg'),
(2174, 'Argentina gana y quiebra invicto histórico de Brasil en clásico de alto voltaje', 'Con el histórico triunfo, los campeones del mundo cierran el 2023 en la punta del premundial, con 15 de 18 puntos posibles.', 'https://www.teletica.com/internacional/argentina-gana-y-quiebra-invicto-historico-de-brasil-en-clasico-de-alto-voltaje_347652', '2023-11-21 15:04:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/22/messi.-afp_1896837209_1140x520.jpg'),
(2175, 'Incidentes en el Maracaná demoraron inicio del Brasil-Argentina', 'Una vez que se calmaron los ánimos se dio inicio al partido que se jugaba con alto voltaje.', 'https://www.teletica.com/internacional/incidentes-en-el-maracana-demoraron-inicio-del-brasil-argentina_347648', '2023-11-21 13:42:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/22/brasil-argentina.-afp_1891854662_1140x520.jpg'),
(2176, 'Góndola-Torres: Tribunal Disciplinario no toma mediadas ante falta de pruebas en reporte arbitral', 'Hechos se presentaron el sábado anterior en al final del Torneo de Copa', 'https://www.teletica.com/nacional/gondola-torres-tribunal-disciplinario-no-toma-mediadas-ante-falta-de-pruebas-en-reporte-arbitral_347637', '2023-11-21 11:03:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/21/freddy-gndola-ante-saprissa_1859598053_1140x520.jpg'),
(2177, 'Estos son los horarios de las semifinales de Liga de Ascenso', 'Cuatro equipos buscarán dar el primer gran paso a la Primera División. ', 'https://www.teletica.com/liga-de-ascenso/estos-son-los-horarios-de-las-semifinales-de-liga-de-ascenso_347626', '2023-11-21 09:28:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/21/escorpiones-de-beln-ante-quepos-cambute_1876874443_1140x520.jpg'),
(2178, 'Bryan Ruiz estará en partido de leyendas de Conmebol', 'El juego será el 5 de diciembre en el DRV PNK Stadium del Inter Miami, en Estados Unidos.', 'https://www.teletica.com/nacional/bryan-ruiz-estara-en-partido-de-leyendas-de-conmebol_347621', '2023-11-21 07:19:00', 8, 6, 1, 'https://static3.teletica.com/Files/Sizes/2023/11/21/bryan-ruiz-en-partido-de-leyendas-de-conmebol_1868902990_1140x520.png');
INSERT INTO `news` (`id`, `title`, `description`, `permanlink`, `date`, `newsSourceId`, `userId`, `categoryId`, `img`) VALUES
(2179, 'Proyecto de hospital de Cartago ya cuenta con recomendación final para adjudicar construcción', 'Tras varios meses de incertidumbre, el proyecto del nuevo hospital Max Peralta de Cartago ya cuenta con la recomendación técnica final para adjudicar su construcción. La Gerencia de Infraestructura y ', 'https://www.crhoy.com/nacionales/proyecto-de-hospital-de-cartago-ya-cuenta-con-recomendacion-final-para-adjudicar-construccion/', '2023-11-29 09:20:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/06/Marcha-Hospital-Cartago-Nueva.jpeg'),
(2180, '¿En búsqueda de trabajo? Empresa requiere contratar 50 personas', '¿Se encuentra buscando trabajo? Esta información le va a funcionar, porque la empresa trasnacional Client Services Inc requiere contratar con urgencia 50 personas más. Anteriormente, esta empresa requ', 'https://www.crhoy.com/nacionales/en-busqueda-de-trabajo-empresa-requiere-contratar-50-personas/', '2023-11-29 09:10:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/11/Fachada-22.jpg'),
(2181, '(VIDEO) El volcán Poás vuelve a las erupciones y así lo captó el Ovsicori', 'El volcán Poás registró una nueva erupción este miércoles 29 de noviembre, según reportó el Observatorio Vulcanológico y Sismológico de Costa Rica (Ovsicori) de la Universidad Nacional (UNA). A través', 'https://www.crhoy.com/nacionales/video-el-volcan-poas-vuelve-a-las-erupciones-y-asi-lo-capto-el-ovsicori/', '2023-11-29 08:54:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/11/Ovsicori-Nuevas.jpg'),
(2182, 'Caso Corona: Casa de exalcalde fue uno de los puntos allanados por el OIJ', 'La casa del exacalde de Poás José Joaquín Brenes, fue uno de los puntos de allanamiento en las diligencias que se realizaron el pasado 14 de noviembre como parte de la operación judicial que se desarr', 'https://www.crhoy.com/nacionales/caso-corona-casa-de-exalcalde-fue-uno-de-los-puntos-allanados-por-el-oij/', '2023-11-29 08:45:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/11/Allanamiento-en-casa-de-exalcalde-de-Poás.png'),
(2183, 'Matan a machetazos a hombre en Turrialba', 'Un hombre murió la mañana de este miércoles 29 de noviembre tras sufrir múltiples heridas ocasionada por arma blanca en Turrialba.  Según indicó la supervisora de Cruz Roja, Monserrat Quirós, ante la ', 'https://www.crhoy.com/nacionales/matan-a-machetazos-a-hombre-en-turrialba/', '2023-11-29 08:34:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2018/06/ambulancia-cruz-roja-turrialba.jpg'),
(2184, 'OIJ busca a un hombre que realizó compras con una tarjeta robada', 'La Sección de Hurtos del Organismo de Investigación Judicial (OIJ), solicita colaboración a la ciudadanía para identificar al hombre que se observa en la grabación, ya que figura como sospechoso del d', 'https://www.crhoy.com/nacionales/oij-busca-a-un-hombre-que-realizo-compras-con-una-tarjeta-robada/', '2023-11-29 07:58:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/11/Sospechosos-de-Robo-Agravado-en-Juanilama-Esparza-Puntarenas.png'),
(2185, 'Mujer roba tarjeta de crédito y realiza compras en San Pedro', 'La mujer que se observa en la grabación realizó compras con una tarjeta robada, por eso figura como sospechosa del delito de hurto en San Pedro, San José. Según la Sección de Hurtos del Organismo de I', 'https://www.crhoy.com/nacionales/mujer-roba-tarjeta-de-credito-y-realiza-compras-en-san-pedro/', '2023-11-29 07:50:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/11/Sospechosa-de-Hurto-en-San-Pedro-San-José.png'),
(2186, '3 adultos y una menor fueron hospitalizados tras caer a guindo en Pérez Zeledón', '&#160; El conductor de un carro en el que viajaban 3 personas más, perdió el control, se salió de la carretera y cayó a un guindo en Cajón de Guácimo de Pérez Zeledón. Producto del aparatoso accidente', 'https://www.crhoy.com/nacionales/3-adultos-y-una-menor-fueron-hospitalizados-tras-caer-a-guindo-en-perez-zeledon/', '2023-11-29 07:45:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/11/Accidente-Pérez-Zeledón-2.jpeg'),
(2187, 'Fundación Omar Dengo abre matrícula en programas de robótica', 'La Fundación Omar Dengo (FOD) abrió la matrícula para su programa de robótica educativa dirigido a estudiantes de 6 a 17 años para estas vacaciones de 2024. El mismo dará inicio el 8 de enero, ofrecie', 'https://www.crhoy.com/nacionales/fundacion-omar-dengo-abre-matricula-en-programas-de-robotica/', '2023-11-29 07:28:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/11/11FOD-Robotica.png'),
(2188, '70 colegiales recibieron medallas de oro, plata y bronce en Olimpiada de Matemática', '70 destacados estudiantes fueron galardonados con medallas y menciones de honor en la Olimpiada Costarricense de Matemática de Secundaria (OLCOMA). El acto de premiación se llevó a cabo en el Auditori', 'https://www.crhoy.com/nacionales/70-colegiales-recibieron-medallas-de-oro-plata-y-bronce-en-olimpiada-de-matematica/', '2023-11-29 07:13:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/11/ESTUDIANTES-PREMIADOS-MEP-1.jpeg'),
(2189, 'Estudiantes comenzarán curso lectivo 2024 sin un plan de nivelación', 'Apenas está finalizando el presente curso lectivo y los profesores ya se encuentran preocupados por el próximo año escolar. Debido a que el Ministerio de Educación Pública (MEP), hasta el momento, no ', 'https://www.crhoy.com/nacionales/estudiantes-comenzaran-curso-lectivo-2024-sin-un-plan-de-nivelacion/', '2023-11-29 07:01:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2016/11/aulas-vacias-estudiantes-colegio.jpg'),
(2190, 'VIDEO: 4 personas delicadas tras caer a un guindo en Pérez Zeledón', 'Un carro con 4 personas cayó a un guindo en Cajón de Guácimo de Pérez Zeledón. Según la Cruz Roja Costarricense, se trata de 2 adultos y dos menores de edad. Los cruzrojistas confirmaron que atienden ', 'https://www.crhoy.com/nacionales/video-4-personas-delicadas-tras-caer-a-un-guindo-en-perez-zeledon/', '2023-11-29 18:52:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/11/Accidente-Pérez-Zeledón.jpeg'),
(2191, 'PUSC propone sesionar a doble jornada para sacar agenda de seguridad', 'La fracción del Partido Unidad Social Cristiana (PUSC) propone que el Congreso y las comisiones sesionen a doble jornada para sacar la agenda urgente de proyectos en materia de seguridad ciudadana. El', 'https://www.crhoy.com/nacionales/pusc-propone-sesionar-a-doble-jornada-para-sacar-agenda-de-seguridad/', '2023-11-29 18:50:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2022/12/plenario-diputados.jpg'),
(2192, '9 de cada 10 personas rechaza la pesca de arrastre, según encuesta', 'La encuesta denominada &#8220;Percepción sobre las islas en Costa Rica y las condiciones de vida de sus pobladores&#8220;, revelada este miércoles, determinó que la mayoría de la población está en des', 'https://www.crhoy.com/nacionales/9-de-cada-10-personas-rechaza-la-pesca-de-arrastre-segun-encuesta/', '2023-11-29 18:07:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/11/pesca-de-arrastre-foto-Mar-Viva.png'),
(2193, 'Levantan alerta por infecciones respiratorias en niños pero piden a padres mantener cuidados', 'El Ministerio de Salud informó este miércoles que levantó la alerta sanitaria que estaba vigente desde setiembre por la cantidad de menores de edad con infecciones respiratorias.  Eso sí, las autorida', 'https://www.crhoy.com/nacionales/levantan-alerta-por-infecciones-respiratorias-en-ninos-pero-piden-a-padres-mantener-cuidados/', '2023-11-29 17:58:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/09/Niños-hospitalizados.png'),
(2194, 'Diputada a funcionaria MEP: ¿Dónde estaba usted que no indicó nada en 33 años?', 'La diputada del Partido Liberación Nacional (PLN), Rosaura Méndez, cuestionó a la Directora de Recursos Tecnológicos del MEP, Fresia Aguilar, por no implementar acciones a favor de los estudiantes año', 'https://www.crhoy.com/nacionales/diputada-a-funcionaria-mep-donde-estaba-usted-que-no-indico-nada-en-33-anos/', '2023-11-29 17:47:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/11/CUESTIONAMIENTO-DIPUTADA.jpeg'),
(2195, '“La Tía”, el Profe Geovanni y Fabiola Herra: Las caras de los toros del 8', 'La empresa Multimedios presentó este miércoles a las figuras que estarán en los toros del 8, desde el Centro de Eventos Pedregal, para fin y principio de año. El elenco televisivo estará conformado po', 'https://www.crhoy.com/entretenimiento/la-tia-el-profe-geovanni-y-fabiola-herra-las-caras-de-los-toros-del-8/', '2023-11-29 07:39:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/11/Multimedios-4.jpg'),
(2196, 'Keylor y Andrea comparten foto junto a Sergio Rico tras accidente', 'El portero costarricense, Keylor Navas y su esposa, la exmodelo Andrea Salas compartieron una imagen junto a su amigo, Sergio Rico, tras el accidente que casi le cuesta la vida, hace algunos meses en ', 'https://www.crhoy.com/entretenimiento/keylor-y-andrea-comparten-foto-junto-a-sergio-rico-tras-accidente/', '2023-11-29 07:16:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/11/sergio-rico-1-e1701282100149.jpg'),
(2197, 'Alex Badilla también explota contra Teletón: “Me sacaron del lugar”', 'El maquillista e influencer costarricense, Alex Badilla explotó contra la organización de Teletón, luego de que sacaran al grupo de &#8220;drag queens&#8221; de la edición de este año, que se realizar', 'https://www.crhoy.com/entretenimiento/alex-badilla-tambien-explota-contra-teleton-me-sacaron-del-lugar/', '2023-11-29 18:27:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/11/alex-badilla-e1701280598838.jpg'),
(2198, 'Con mariachis y mucho glamour, así celebraron cumpleaños a dueña de Teletica', 'Paula Picado, la dueña de Teletica, celebró una vuelta más al sol y sus hijas le celebraron a lo grande. María Jesús Prada, conocida como &#8220;Chuza&#8221;, compartió los detalles de la cena que le ', 'https://www.crhoy.com/entretenimiento/con-mariachis-y-mucho-glamour-asi-celebraron-cumpleanos-a-duena-de-teletica/', '2023-11-29 17:25:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/11/Chuza-y-Paula-Picado-1-e1701277645742.jpg'),
(2199, 'Melissa Mora lanza perfumes con aroma “ángel” y “sexi”', 'La cantante y modelo nacional, Melissa Mora lanzó un nuevo producto como empresaria, este miércoles, en un evento en el Grand Casino Escazú. Se trata de dos perfumes que tienen su sello para chicas qu', 'https://www.crhoy.com/entretenimiento/melissa-mora-lanza-perfumes-con-aroma-angel-y-sexi/', '2023-11-29 16:43:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/11/Melissa-Mora2.jpg'),
(2200, '“Quiero volver a tener 70 años”: Cher confiesa que no le gusta envejecer', 'La reconocida cantante estadounidense, Cher, admitió que no le gusta envejecer, sino que le gustaría &#8220;volver a tener 70 años&#8221;. En una entrevista con el programa TODAY, la artista habló sob', 'https://www.crhoy.com/entretenimiento/quiero-volver-a-tener-70-anos-cher-confiesa-que-no-le-gusta-envejecer/', '2023-11-29 15:30:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/07/Cher.jpeg'),
(2201, '(VIDEO) Como si fuese un perro con correa, así pasea esta mujer a un hombre', 'En redes sociales se viralizó un video, donde se puede ver a una mujer que paseaba a un hombre con una correa como si de un perro se tratara. El hombre, lejos de sentirse humillado, parece que disfrut', 'https://www.crhoy.com/entretenimiento/video-como-si-fuese-un-perro-con-correa-asi-pasea-esta-mujer-a-un-hombre/', '2023-11-29 14:57:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/11/Mujer-pasea-a-hombre-como-perro.png'),
(2202, '¿Habrá segunda película de Barbie? Esto dijeron Greta Gerwig y Margot Robbie', 'La película de Greta Gerwig, &#8220;Barbie&#8221;, tuvo un gran éxito a nivel mundial llegando a más de 1.300 miles de millones dólares recaudados y existía la duda de si la historia continuará. Gerwi', 'https://www.crhoy.com/entretenimiento/habra-segunda-pelicula-de-barbie-esto-dijeron-greta-gerwig-y-margot-robbie/', '2023-11-29 14:50:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/05/Barbie.jpg'),
(2203, 'Cantante español comparte sus vacaciones en Costa Rica: “modo salvaje”', 'El cantante español, Manuel Carrasco está disfrutando de unas vacaciones en Costa Rica, en &#8220;modo salvaje&#8221;.  Así lo describió a través de las historias de Instagram la mañana de este miérco', 'https://www.crhoy.com/entretenimiento/cantante-espanol-comparte-sus-vacaciones-en-costa-rica-modo-salvaje/', '2023-11-29 14:22:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/11/Manuel-carrasco25.png'),
(2204, '¿Quiere actuar en una película? Media Docena busca nuevos talentos', 'Si usted quiere convertirse en actor de una película tica, la Media Docena tiene la oportunidad perfecta para usted. Anunció que abrió la convocatoria al casting para aquellas personas que desean part', 'https://www.crhoy.com/entretenimiento/quiere-actuar-en-una-pelicula-media-docena-busca-nuevos-talentos/', '2023-11-29 13:15:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/11/Media-Docena.jpg'),
(2205, 'Ericka Morera: “Dejemos de señalar, de juzgar, de comparar y criticar”', 'La periodista e influencer, Ericka Morera, utilizó su perfil en Instagram para enviar un mensaje claro y conciso, una indirecta para todas esas personas que se dedican a juzgar y criticar, justo despu', 'https://www.crhoy.com/entretenimiento/ericka-morera-dejemos-de-senalar-de-juzgar-de-comparar-y-criticar/', '2023-11-29 12:51:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/08/Ericka-Morera2-1.png'),
(2206, 'Los Tenores deleitarán al público en festival navideño en Puntarenas', 'Los Tenores deleitarán al público el jueves 30 de noviembre en un concierto en la Plaza del Pacífico como parte del Festival Navideño Puntarenas 2023. El festival dará apertura a la Navidad y será el ', 'https://www.crhoy.com/entretenimiento/los-tenores-deleitaran-al-publico-en-festival-navideno-en-puntarenas/', '2023-11-29 11:49:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/11/Los-Tenores.jpg'),
(2207, 'Arci Muñoz, maestra del camuflaje', 'Ella es una hermosa modelo filipina. Además de modelar es cantante, cosplayer y sargento de la Fuerza Aérea. Más fotos de Arci aquí', 'https://www.crhoy.com/entretenimiento/arci-munoz-maestra-del-camuflaje/', '2023-11-29 07:47:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/11/ramonathornes_1676551200_3039454228775858768_10987958-copia.jpg'),
(2208, '“No me operé los ojos”: Jennifer Lawrence habla sobre rumores de cirugía plástica', 'La actriz estadounidense Jennifer Lawrence, habló sobre los rumores de que se había sometido a una cirugía plástica en su rostro. En una conversación con Kylie Jenner, la actriz, conocida por su papel', 'https://www.crhoy.com/entretenimiento/no-me-opere-los-ojos-jennifer-lawrence-habla-sobre-rumores-de-cirugia-plastica/', '2023-11-28 17:53:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/11/Jennifer-Lawrence.jpg'),
(2209, 'Al ex de Keyla le llueven mensajes de seguidoras tras ruptura', 'Hasta hace unos meses, pocos sabían del joven Alejandro Sequeira, hijo de un exjugador de Saprissa. Sin embargo, cuando inició su relación con la presentadora, Keyla Sánchez, fue ganando seguidores y ', 'https://www.crhoy.com/entretenimiento/al-ex-de-keyla-le-llueven-mensajes-de-seguidoras-tras-ruptura/', '2023-11-28 17:38:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/10/Keyla-y-novio-2-e1696373094484.jpg'),
(2210, 'Bad Bunny es nombrado por Forbes como el “Rey del Pop”', 'Bad Bunny ha sido nombrado como el &#8220;Rey del Pop&#8221; en la portada de la revista Forbes Latinoamérica. La mundialmente famosa revista Forbes eligió a Bad Bunny como imagen de su portada por su', 'https://www.crhoy.com/entretenimiento/bad-bunny-es-nombrado-por-forbes-como-el-rey-del-pop/', '2023-11-28 17:13:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/11/Bad-Bunny.png'),
(2211, 'Cómo ChatGPT llevó a Google a modificar su motor de búsqueda', '(AFP).-La irrupción de ChatGPT en noviembre de 2022 modificó las búsquedas en internet y obligó a Google que domina el sector desde hace quince años a acelerar la integración de esta herramienta, expl', 'https://www.crhoy.com/tecnologia/como-chatgpt-llevo-a-google-a-modificar-su-motor-de-busqueda/', '2023-11-29 09:23:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/11/Kent-Walker.jpeg'),
(2212, 'Spotify Wrapped 2023: Estas son las canciones más escuchadas en Costa Rica', 'Spotify anunció este miércoles las listas de las canciones y artistas más escuchados a nivel mundial y latinoamericano. También publicaron los éxitos que consiguieron más reproducciones en cada país. ', 'https://www.crhoy.com/tecnologia/spotify-wrapped-2023-estas-son-las-canciones-mas-escuchadas-en-costa-rica/', '2023-11-29 18:38:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/01/Spotify.png'),
(2213, '¡Llegó el Spotify Wrapped 2023! Estos son los pasos para ver el suyo', '¡Finalmente llegó el Spotify Wrapped 2023! A partir de este miércoles 29 de noviembre, los usuarios de la app de reproducción de música y pódcasts pueden revisar su top de artistas y canciones que esc', 'https://www.crhoy.com/tecnologia/llego-el-spotify-wrapped-2023-estos-son-los-pasos-para-ver-el-suyo/', '2023-11-29 18:16:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/11/Spotify-Wrapped-2023.jpg'),
(2214, 'Internet de Starlink, propiedad de Elon Musk, ya está disponible en Costa Rica', 'La compañía de Internet satelital Starlink, propiedad del multimillonario sudafricano Elon Musk, anunció que los servicios que ofrece están disponibles en Costa Rica. Así lo detalló la empresa, a trav', 'https://www.crhoy.com/tecnologia/internet-de-starlink-propiedad-de-elon-musk-ya-esta-disponible-en-costa-rica/', '2023-11-29 17:10:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2022/02/elon-musk-starlink.png'),
(2215, 'Expertos: Decreto 5G se basa en geopolítica y le faltan temas técnicos', 'Un grupo de expertos que participó en el panel Tecnología 5G en Costa Rica: implicaciones sobre el Decreto Ejecutivo 44196, concluyó que a dicha reglamentación le faltan elementos técnicos y buena par', 'https://www.crhoy.com/tecnologia/expertos-decreto-5g-se-basa-en-geopolitica-y-le-faltan-temas-tecnicos/', '2023-11-29 11:11:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/11/expertos-g5.png'),
(2216, '¡Reciba las noticias del país y del mundo en su WhatsApp!', 'Las noticias al alcance de su mano. El canal de WhatsApp de CRHoy.com ya se encuentra habilitado para que pueda recibir la información más importante del día de la forma más fácil y rápida.  Entre la ', 'https://www.crhoy.com/tecnologia/reciba-las-noticias-del-pais-y-del-mundo-en-su-whatsapp/', '2023-11-28 09:28:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/11/crhoy-canal-de-WhatsApp.jpg'),
(2217, 'Atención: Google eliminará todas las cuentas con esta característica', 'La empresa Google eliminará las cuentas que han estado inactivas por dos años este viernes 1 de diciembre. El anuncio lo había dado hace varios meses; las cuentas que serán eliminadas son aquellas que', 'https://www.crhoy.com/tecnologia/atencion-google-eliminara-todas-las-cuentas-con-esta-caracteristica/', '2023-11-28 14:28:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2018/09/Google.jpg'),
(2218, 'Diputados califican de arrogante, soberbia y absolutista posición sobre decreto 5G', 'Diputados calificaron como arrogante, soberbia, autoritaria y absolutista la posición del Gobierno sobre el decreto de ciberseguridad para redes 5G. Así lo manifestaron durante una audiencia de la Com', 'https://www.crhoy.com/tecnologia/diputados-califican-de-arrogante-soberbia-y-absolutista-posicion-sobre-decreto-5g/', '2023-11-28 12:12:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/08/montserrat-ruiz.jpg'),
(2219, 'Sector tecnológico pide diálogo sobre decreto de ciberseguridad 5G', 'El sector de tecnología nacional pide un espacio de diálogo sobre el Decreto Ejecutivo No. 44196-MSP-MICITT acerca de ciberseguridad en redes 5G. Así lo manifestaron claramente representantes de las c', 'https://www.crhoy.com/tecnologia/sector-tecnologico-pide-dialogo-sobre-decreto-de-ciberseguridad-5g/', '2023-11-28 11:51:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/11/ana-lucia-ramirez-paul-fervoy2.jpeg'),
(2220, 'Foro analizará sostenibilidad medioambiental y las telecomunicaciones', 'El VIII Foro Costa Rica Conectada analizará el rol de las telecomunicaciones para la sostenibilidad medioambiental. El evento organizado por Ciber Regulación e Intec contará con las ponencias TIC para', 'https://www.crhoy.com/tecnologia/foro-analizara-sostenibilidad-medioambiental-y-las-telecomunicaciones/', '2023-11-27 16:45:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2022/11/torres-antenas.jpg'),
(2221, 'Reglamento de ciberseguridad impone un alto en el camino en ruta hacia 5G', 'La emisión del Decreto Ejecutivo 44196-MSP-MICITT impone un alto en el camino en la ruta hacia el desarrollo de la tecnología 5G que llevaba el país. Así lo señaló Ana Lucía Ramírez, directora ejecuti', 'https://www.crhoy.com/tecnologia/reglamento-de-ciberseguridad-impone-un-alto-en-el-camino-en-ruta-hacia-5g/', '2023-11-27 12:12:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/11/ana-lucia-ramirez-infocom.jpeg'),
(2222, 'MSP, el gran ausente en discusión del reglamento de ciberseguridad 5G', '(CRHoy.com).-El Ministerio de Seguridad Pública (MSP) firmó el Decreto Ejecutivo 44196-MSP-MICITT junto con el de Ciencia, Innovación, Tecnología y Telecomunicaciones (Micitt). De hecho, el anuncio lo', 'https://www.crhoy.com/tecnologia/msp-el-gran-ausente-en-discusion-del-reglamento-de-ciberseguridad-5g/', '2023-11-27 11:32:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/08/g5-msp-micitt.jpg'),
(2223, 'Siga estos consejos para que no lo estafen este Cyber Monday', 'Tras el Viernes Negro, este 27 de noviembre tiene lugar el popular Cyber Monday, día de ofertas en línea en el que muchos compradores aprovechan las ofertas. Pero no solo ellos frecuentan el ciberespa', 'https://www.crhoy.com/tecnologia/siga-estos-consejos-para-que-no-lo-estafen-este-cyber-monday/', '2023-11-26 15:17:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/11/cybermonday.jpg'),
(2224, 'CPIC: Convenio de Budapest no está relacionado con ciberseguridad 5G', 'El Colegio de Profesionales en Informática y Computación (CPIC) expresó su posición con relación al Reglamento sobre medidas de ciberseguridad aplicables a los servicios de telecomunicaciones, basados', 'https://www.crhoy.com/tecnologia/cpic-convenio-de-budapest-no-esta-relacionado-con-ciberseguridad-5g/', '2023-11-26 13:05:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2022/06/5G.jpg'),
(2225, 'Saque sus cámaras y telescopios: Este lunes habrá Luna de “castor”', 'Los amantes de la astronomía podrán disfrutar la Luna Llena que aparecerá en el cielo la madrugada del lunes 27 de noviembre. Según el calendario del Planetario de la Universidad de Costa Rica, la Lun', 'https://www.crhoy.com/tecnologia/saque-sus-camaras-y-telescopios-este-lunes-habra-luna-llena/', '2023-11-26 11:34:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/04/Luna-Llena.jpeg'),
(2226, 'Sigue pendiente formalización de frecuencias recuperadas en bandas medias', 'Aún está pendiente de formalizar la recuperación de segmentos de frecuencias de bandas medias del espectro radioeléctrico, necesarias para la implementación de redes 5G en el país. Así lo confirmó est', 'https://www.crhoy.com/tecnologia/sigue-pendiente-formalizacion-de-bandas-medias-del-espectro-recuperadas/', '2023-11-26 13:09:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/11/federico-chacon2.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `newssources`
--

CREATE TABLE `newssources` (
  `id` int(11) UNSIGNED NOT NULL,
  `url` varchar(400) NOT NULL,
  `name` varchar(50) NOT NULL,
  `categoryId` int(11) UNSIGNED NOT NULL,
  `userId` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `newssources`
--

INSERT INTO `newssources` (`id`, `url`, `name`, `categoryId`, `userId`) VALUES
(4, 'https://feeds.feedburner.com/TecnologaCrhoycomPeriodicoDigitalCostaRicaNoticias', 'CRhoy', 9, 21),
(8, 'https://www.teletica.com/rss/feed/deportes', 'Teletica', 1, 6),
(9, 'https://feeds.feedburner.com/NacionalesCrhoycomPeriodicoDigitalCostaRicaNoticias', 'CRHoy', 4, 6),
(10, 'https://feeds.feedburner.com/EntretenimientoCrhoycomPeriodicoDigitalCostaRicaNoticias', 'CRHoy', 13, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `newstags`
--

CREATE TABLE `newstags` (
  `id` int(11) UNSIGNED NOT NULL,
  `newsId` int(11) UNSIGNED NOT NULL,
  `tagId` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `newstags`
--

INSERT INTO `newstags` (`id`, `newsId`, `tagId`) VALUES
(1767, 2179, 1),
(1768, 2179, 6),
(1769, 2179, 6),
(1770, 2179, 7),
(1771, 2180, 1),
(1772, 2180, 73),
(1773, 2180, 74),
(1774, 2180, 5),
(1775, 2181, 1),
(1776, 2181, 13),
(1777, 2181, 10),
(1778, 2181, 75),
(1779, 2182, 1),
(1780, 2182, 11),
(1781, 2182, 76),
(1782, 2182, 77),
(1783, 2182, 78),
(1784, 2182, 79),
(1785, 2182, 10),
(1786, 2183, 1),
(1787, 2183, 11),
(1788, 2183, 5),
(1789, 2184, 1),
(1790, 2184, 11),
(1791, 2185, 1),
(1792, 2185, 11),
(1793, 2186, 1),
(1794, 2186, 11),
(1795, 2187, 4),
(1796, 2187, 1),
(1797, 2188, 4),
(1798, 2188, 1),
(1799, 2189, 4),
(1800, 2189, 1),
(1801, 2189, 80),
(1802, 2189, 7),
(1803, 2190, 1),
(1804, 2190, 11),
(1805, 2190, 10),
(1806, 2191, 81),
(1807, 2191, 1),
(1808, 2191, 2),
(1809, 2191, 82),
(1810, 2192, 83),
(1811, 2192, 1),
(1812, 2192, 84),
(1813, 2192, 20),
(1814, 2193, 1),
(1815, 2193, 6),
(1816, 2193, 85),
(1817, 2193, 6),
(1818, 2194, 4),
(1819, 2194, 1),
(1820, 2194, 86),
(1821, 2195, 29),
(1822, 2195, 32),
(1823, 2195, 8),
(1824, 2196, 29),
(1825, 2196, 32),
(1826, 2196, 8),
(1827, 2197, 29),
(1828, 2197, 32),
(1829, 2197, 8),
(1830, 2198, 29),
(1831, 2198, 8),
(1832, 2199, 29),
(1833, 2199, 8),
(1834, 2200, 29),
(1835, 2200, 8),
(1836, 2201, 30),
(1837, 2201, 29),
(1838, 2201, 31),
(1839, 2202, 29),
(1840, 2202, 8),
(1841, 2203, 29),
(1842, 2203, 32),
(1843, 2203, 8),
(1844, 2203, 33),
(1845, 2204, 29),
(1846, 2204, 8),
(1847, 2204, 34),
(1848, 2205, 29),
(1849, 2205, 32),
(1850, 2205, 35),
(1851, 2205, 8),
(1852, 2206, 29),
(1853, 2206, 8),
(1854, 2207, 29),
(1855, 2207, 36),
(1856, 2207, 37),
(1857, 2207, 38),
(1858, 2208, 29),
(1859, 2208, 8),
(1860, 2209, 29),
(1861, 2209, 32),
(1862, 2209, 8),
(1863, 2209, 20),
(1864, 2210, 29),
(1865, 2210, 39),
(1866, 2210, 8),
(1867, 2210, 5),
(1868, 2211, 54),
(1869, 2211, 42),
(1870, 2211, 87),
(1871, 2211, 53),
(1872, 2211, 88),
(1873, 2211, 20),
(1874, 2212, 42),
(1875, 2212, 8),
(1876, 2212, 39),
(1877, 2212, 89),
(1878, 2213, 42),
(1879, 2213, 8),
(1880, 2213, 39),
(1881, 2214, 41),
(1882, 2214, 42),
(1883, 2214, 43),
(1884, 2214, 1),
(1885, 2214, 44),
(1886, 2214, 42),
(1887, 2214, 5),
(1888, 2215, 45),
(1889, 2215, 42),
(1890, 2215, 46),
(1891, 2215, 47),
(1892, 2215, 48),
(1893, 2215, 49),
(1894, 2215, 10),
(1895, 2216, 50),
(1896, 2216, 42),
(1897, 2216, 1),
(1898, 2216, 51),
(1899, 2217, 42),
(1900, 2217, 52),
(1901, 2217, 53),
(1902, 2217, 42),
(1903, 2218, 45),
(1904, 2218, 42),
(1905, 2218, 46),
(1906, 2218, 47),
(1907, 2218, 48),
(1908, 2218, 49),
(1909, 2218, 20),
(1910, 2219, 54),
(1911, 2219, 42),
(1912, 2219, 45),
(1913, 2219, 46),
(1914, 2219, 47),
(1915, 2219, 48),
(1916, 2219, 49),
(1917, 2219, 5),
(1918, 2220, 42),
(1919, 2220, 55),
(1920, 2220, 55),
(1921, 2221, 45),
(1922, 2221, 42),
(1923, 2221, 47),
(1924, 2221, 48),
(1925, 2221, 49),
(1926, 2221, 10),
(1927, 2222, 54),
(1928, 2222, 42),
(1929, 2222, 45),
(1930, 2222, 56),
(1931, 2222, 47),
(1932, 2222, 48),
(1933, 2222, 57),
(1934, 2222, 58),
(1935, 2222, 49),
(1936, 2222, 59),
(1937, 2222, 10),
(1938, 2223, 54),
(1939, 2223, 42),
(1940, 2223, 60),
(1941, 2223, 61),
(1942, 2224, 45),
(1943, 2224, 42),
(1944, 2224, 46),
(1945, 2224, 47),
(1946, 2224, 48),
(1947, 2224, 49),
(1948, 2225, 62),
(1949, 2225, 42),
(1950, 2225, 63),
(1951, 2226, 45),
(1952, 2226, 42),
(1953, 2226, 64),
(1954, 2226, 65),
(1955, 2226, 66),
(1956, 2226, 67),
(1957, 2226, 48),
(1958, 2226, 57),
(1959, 2226, 49),
(1960, 2226, 59),
(1961, 2226, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE `tags` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tags`
--

INSERT INTO `tags` (`id`, `name`) VALUES
(1, 'Nacionales'),
(2, 'Política'),
(3, 'TSE'),
(4, 'Educación'),
(5, 'visualB'),
(6, 'Salud'),
(7, 'Slider'),
(8, 'Espectáculos'),
(9, 'Festival de la Luz'),
(10, 'visualA'),
(11, 'Sucesos'),
(12, 'prestamistas'),
(13, 'Transportes'),
(14, 'INCOFER'),
(15, 'trenes'),
(16, 'Colegio de Médicos y Cirujanos de Costa Rica'),
(17, 'Sala IV'),
(18, 'Globalvia'),
(19, 'Ruta 27'),
(20, 'VisualC'),
(21, 'Desnutrición infantil'),
(22, 'Clima'),
(23, 'Fuertes vientos'),
(24, 'IMN'),
(25, 'Navidad'),
(26, 'atropello'),
(27, 'Carrillo'),
(28, 'Guanacaste'),
(29, 'Entretenimiento'),
(30, 'Curiosidades'),
(31, 'mundo'),
(32, 'Farándula'),
(33, 'Manuel Carrasco'),
(34, 'Media Docena'),
(35, 'Ericka Morera'),
(36, 'La Diva'),
(37, 'Arci Muñoz'),
(38, 'noapto'),
(39, 'Música'),
(40, 'Jlo'),
(41, 'Internet'),
(42, 'Tecnología'),
(43, 'Elon Musk'),
(44, 'Starlink'),
(45, '5G'),
(46, 'Convenio de Budapest'),
(47, 'Decreto Ejecutivo No. 44196-MSP-MICITT'),
(48, 'IMT 2020'),
(49, 'quinta generación'),
(50, 'Redes Sociales'),
(51, 'VisualB1'),
(52, 'correo electrónico'),
(53, 'Google'),
(54, 'Ciberseguridad'),
(55, 'Telecomunicaciones'),
(56, 'ARESEP'),
(57, 'MICITT'),
(58, 'Ministerio de Seguridad Pública'),
(59, 'SUTEL'),
(60, 'Cyber Monday'),
(61, 'phishing'),
(62, 'Ciencia'),
(63, 'luna llena'),
(64, '2600 MHz'),
(65, '3500 MHz'),
(66, 'bandas medias'),
(67, 'ICE'),
(68, 'Inteligencia Artificial'),
(69, 'IA'),
(70, 'Teecnología'),
(71, 'Camtic'),
(72, 'Infocom'),
(73, 'Servicios'),
(74, '#breteencr'),
(75, 'volcán Poás'),
(76, 'Caso Corona'),
(77, 'Legitimación de capitales'),
(78, 'narcotráfico'),
(79, 'Poás'),
(80, 'MEP'),
(81, 'Gobierno'),
(82, 'Seguridad'),
(83, 'Ambiente'),
(84, 'pesca de arrastre'),
(85, 'infecciones respiratorias'),
(86, 'Eduación'),
(87, 'ChatGPT'),
(88, 'Kent Walker'),
(89, 'Spotify');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(100) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `roleId` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `firstName`, `lastName`, `password`, `roleId`) VALUES
(1, 'kimcorralesv@gmail.com', 'admin', 'admin', '$2y$10$5fKk/otESXhTnm.EywR.wOu8wopw7RXy3CNnmNlwfEbSMhLVCpGvK', 1),
(6, 'kcorrales073@gmail.com', 'Kimberly', 'Corrales', '$2y$10$rqr3WyoGOUDGeF4gzag3PO8EJ5G4y/SwxqGGt2tx7f.vzDGWvoHZO', 2),
(11, 'jimenez@gmail.com', 'Maria', 'Jimenez', '$2y$10$gfIIAFLG8z6S.WSDbLG2d.z.w8R4QWXyEoRtvyXZzYeTiCaqLoVKC', 2),
(21, 'rportugues@gmail.com', 'Rosa', 'Portugues', '$2y$10$gfIIAFLG8z6S.WSDbLG2d.z.w8R4QWXyEoRtvyXZzYeTiCaqLoVKC', 2),
(25, 'keycorralesv@gmail.com', 'Keilyn', 'Corrales', '$2y$10$3wb5FjDdYCFVO4HaWrwvPOG1ivHSSgGQVMWteZpfXclTVIeGiZ.bW', 2),
(26, 'gcorrales@gmail.com', 'Gueyner', 'Corrales', '$2y$10$QIwtOsXMc6XBEKOJeFB7HuX3m80cLULaAq6MLyjdLHFObDA53iSB.', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `news_source_fk` (`newsSourceId`),
  ADD KEY `user_fk` (`userId`) USING BTREE,
  ADD KEY `category_fk` (`categoryId`) USING BTREE;

--
-- Indices de la tabla `newssources`
--
ALTER TABLE `newssources`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `user_fk` (`userId`),
  ADD KEY `category_fk` (`categoryId`);

--
-- Indices de la tabla `newstags`
--
ALTER TABLE `newstags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_news` (`newsId`),
  ADD KEY `fk_tag` (`tagId`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `role_fk` (`roleId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2227;

--
-- AUTO_INCREMENT de la tabla `newssources`
--
ALTER TABLE `newssources`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `newstags`
--
ALTER TABLE `newstags`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1962;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `news_ibfk_2` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `news_source_fk` FOREIGN KEY (`newsSourceId`) REFERENCES `newssources` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `newssources`
--
ALTER TABLE `newssources`
  ADD CONSTRAINT `category_fk` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `user_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `newstags`
--
ALTER TABLE `newstags`
  ADD CONSTRAINT `fk_news` FOREIGN KEY (`newsId`) REFERENCES `news` (`id`),
  ADD CONSTRAINT `fk_tag` FOREIGN KEY (`tagId`) REFERENCES `tags` (`id`);

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `role_fk` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
