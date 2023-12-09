-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2023 a las 18:25:58
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
(2891, 'Confirman hallazgo de cuerpo en Puntarenas', 'La Cruz Roja confirmó esta mañana el hallazgo de un cuerpo, en El Cocal de Puntarenas.  La alerta se recibió en horas de la mañana, frente al antiguo dique, en la zona de la playa, de acuerdo con Marc', 'https://www.crhoy.com/nacionales/confirman-hallazgo-de-cuerpo-en-puntarenas/', '2023-12-09 14:59:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/02/hallazgox-playax-rescatex-policiax.jpg'),
(2892, 'Hombre muere tras recibir balazo en cuello', 'Un hombre falleció tras recibir un balazo en el cuello, durante la madrugada de este sábado en Florencia de San Carlos. Marcos Alfaro, supervisor de la Cruz Roja informó que el incidente fue reportado', 'https://www.crhoy.com/nacionales/hombre-muere-tras-recibir-balazo-en-cuello/', '2023-12-09 14:47:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2020/02/patrullax-balacerax-muertox-fuerza-publica-noche.jpg'),
(2893, 'Estudiantes del TEC instalaron 400 computadoras para niños de escasos recursos', 'Más de 90 estudiantes de Administración de Tecnología de Información del Tecnológico de Costa Rica (TEC) se unieron con un proyecto solidario que dona gran cantidad de computadoras a niños de escasos ', 'https://www.crhoy.com/nacionales/estudiantes-del-tec-instalaron-400-computadoras-a-ninos-de-escasos-recursos/', '2023-12-09 14:00:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/12/TEC-COMPUTADORAS.jpeg'),
(2894, 'UNA donó materiales didácticos en braille a estudiantes con discapacidad', 'La Universidad Nacional (UNA), a través de su Sede Regional Chorotega, donó material didáctico en braille a dos niños con discapacidad visual en la Escuela Santa Clara de Upala. El material didáctico ', 'https://www.crhoy.com/nacionales/una-dono-materiales-didacticos-en-braille-a-estudiantes-con-discapacidad/', '2023-12-09 13:01:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/12/Donacion-material-didactico.jpeg'),
(2895, 'Directora de escuela en Heredia solicitó destitución de miembros de junta educativa', 'La directora de la Escuela José Martí de San Isidro de Heredia, Yendry Carmona Caravaca, presentó una solicitud al Concejo Municipal para que se destituya de manera inmediata a tres miembros de la Jun', 'https://www.crhoy.com/nacionales/directora-de-escuela-en-heredia-solicito-la-destitucion-de-m/', '2023-12-09 12:00:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/12/Escuela-José-Marti-San-Isidro-de-Heredia.jpg'),
(2896, '¿Aún no sabe qué hacer este fin de semana? Disfrute de estas actividades navideñas en Heredia', 'Este fin de semana estará lleno de actividades navideñas en diferentes malls ubicados en Heredia, por ejemplo, habrá conciertos, pasacalles, cimarrona y más. El Mall Oxígeno y el Paseo de las Flores a', 'https://www.crhoy.com/nacionales/aun-no-sabe-que-hacer-este-fin-de-semana-disfrute-de-estas-actividades-navidenas-en-heredia/', '2023-12-09 11:00:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2017/12/navidad.jpg'),
(2897, 'Nuevo programa tecnológico del MEP cubriría menos del 30% de centros educativos', 'El nuevo programa de formación Tecnológica del Ministerio de Educación Pública (MEP) cubrirá poco menos del 30% de los centros educativos el próximo año. Lo que quiere decir que 3300 escuelas y colegi', 'https://www.crhoy.com/nacionales/nuevo-programa-tecnologico-del-mep-cubriria-poco-menos-del-24/', '2023-12-09 18:22:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/12/nuevo-programa.jpg'),
(2898, 'Condenan a Célimo Guido por difamación: Deberá pagar ₡1 millón a Michael Soto por daño moral', 'El Tribunal Penal del III Circuito Judicial de San José, en Pavas, declaró culpable el miércoles al exdiputado Célimo Guido por el delito de difamación en perjuicio del exministro de Seguridad Pública', 'https://www.crhoy.com/nacionales/condenan-a-celimo-guido-por-difamacion-debera-pagar-%e2%82%a11-millon-a-michael-soto-por-dano-moral/', '2023-12-08 13:38:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2020/10/celimo-guido3.jpg'),
(2899, '¿Aún no ha comprado el regalo? Festival de Arte Navideño ofrece varias opciones', 'La Galería Nacional abrió sus puertas al público para que disfrute del Festival de Arte Navideño, en el cual se presenta el arte plasmado en esculturas, pinturas, botellas, termos, peluches y otros ar', 'https://www.crhoy.com/nacionales/aun-no-ha-comprado-el-regalo-festival-de-arte-navideno-ofrece-varias-opciones/', '2023-12-08 13:04:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/12/Festival-de-Arte-navideño-Galería-Nacional.jpeg'),
(2900, 'Rodrigo Marín renuncia a su puesto como director de Vigilancia de la Salud', 'El doctor Rodrigo Marín renunció su puesto de director de Vigilancia de la Salud del Ministerio de Salud. Así lo confirmó Marín a este medio; él señaló que fue por motivos personales, sin dar mayores ', 'https://www.crhoy.com/nacionales/rodrigo-marin-renuncia-a-su-puesto-como-director-de-vigilancia-de-la-salud/', '2023-12-08 12:30:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2020/07/rodrigo-marin-vigilancia-de-la-salud-e1644501821599.jpg'),
(2901, 'Atención vecinos de Calle Blancos: Se suspenderá el servicio de agua por trabajos en tubería', 'El Instituto Costarricense de Acueductos y Alcantarillados (AyA) informó que se suspenderá el servicio de agua el martes 12 de diciembre debido a unos trabajos en las tuberías de agua potable en Calle', 'https://www.crhoy.com/nacionales/atencion-vecinos-de-calle-blancos-se-suspendera-el-servicio-de-agua-por-trabajos-en-tuberia/', '2023-12-08 11:42:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/12/Suspensión-agua-Calle-Blancos.jpeg'),
(2902, 'Padres pretenden cerrar escuela en Heredia por regreso de directora', 'El regreso de la directora de la Escuela Laboratorio de Heredia generó controversia con los padres de familia y algunos docentes, razón por la cual pretenden manifestarse la próxima semana. Este viern', 'https://www.crhoy.com/nacionales/padres-pretenden-cerrar-escuela-en-heredia-por-regreso-de-directora/', '2023-12-08 10:33:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/12/1WhatsApp-Image-2023-12-08-at-11.20.26-AM.jpg'),
(2903, 'Diciembre inició con un aumento de casos y hospitalizados por COVID-19', 'Diciembre trajo consigo un aumento de casos y hospitalizaciones por el COVID-19, según los datos oficiales del Ministerio de Salud en el más reciente boletín. De acuerdo con la Dirección de Vigilancia', 'https://www.crhoy.com/nacionales/diciembre-inicio-con-un-aumento-de-casos-y-hospitalizados-por-covid-19/', '2023-12-08 09:23:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2021/12/variantes-1.jpg'),
(2904, 'Gobierno prorrogaría permiso a Dekra tras fracaso con concurso para RTV', 'El Ministerio de Obras Públicas y Transportes (MOPT) no descarta prorrogar por más tiempo el permiso en uso en precario otorgado a la empresa Dekra para operar el servicio de la Revisión Técnica Vehic', 'https://www.crhoy.com/nacionales/gobierno-prorrogaria-permiso-a-dekra-tras-fracaso-con-concurso-para-rtv/', '2023-12-08 09:07:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2022/11/San-Carlos-4.jpeg'),
(2905, 'Semáforos en mal estado provocan caos vial en La Sabana', 'Este viernes se reportó caos vial en La Sabana debido a que los semáforos ubicados en el cruce por la Torre Universal hacia la Ruta Nacional Secundaria 176 dejaron de funcionar. Según la app Waze, se ', 'https://www.crhoy.com/nacionales/semaforos-en-mal-estado-provocan-caos-vial-en-la-sabana/', '2023-12-08 08:54:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2023/12/Caos-vial-en-La-Sabana2.jpeg'),
(2906, '¡Cuidado! Walmart alerta sobre este intento de estafa', 'La cadena de supermercados Walmart alerta que están tratando de estafar a las personas, engañándolas con procesos de reclutamiento laboral que son falsos. En un comunicado de prensa, la compañía aclar', 'https://www.crhoy.com/nacionales/cuidado-walmart-alerta-sobre-este-intento-de-estafa/', '2023-12-08 08:46:00', 9, 6, 4, 'https://www.crhoy.com/wp-content/uploads/2022/10/walmart.jpg'),
(2907, 'Emmanuelle Vera, una reina hispanoamericana', 'Modelo filipina de 29 años. La chica de ojos café, además de modelar, es cantante y actriz. Fue elegida Reina Hispanoamericana Filipinas 2021. Más fotos de Emmanuelle aquí', 'https://www.crhoy.com/entretenimiento/emmanuelle-vera/', '2023-12-09 07:33:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/emmanuellevera_1701777362_3251066606235054665_9338628.jpg'),
(2908, '(FOTOS) Viviana Calderón y su pareja disfrutaron anidación de tortugas en Ostional', 'La presentadora de televisión y actriz, Viviana Calderón, cumplió uno de sus sueños: Disfrutar de la anidación de tortugas. En una conversación con CRHoy.com, la también modelo contó lo emocionada que', 'https://www.crhoy.com/entretenimiento/fotos-viviana-calderon-y-su-pareja-disfrutaron-anidacion-de-tortugas-en-ostional/', '2023-12-08 13:48:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/Viviana-Calderón-02.jpeg'),
(2909, '(VIDEO) Actrices de “El Diablo Viste a la Moda” recuerdan detalles de la película', 'Las actrices de la icónica película &#8220;El Diablo Viste a la Moda&#8221;, Anne Hathaway y Emily Blunt, se reencontraron en la sección &#8220;Actors on Actors&#8221; de Variety y revelaron detalles ', 'https://www.crhoy.com/entretenimiento/video-actrices-de-el-diablo-viste-a-la-moda-recuerdan-detalles-de-la-pelicula/', '2023-12-08 12:11:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/Anne-Hathaway-y-Emily-Blunt-1-e1702001476247.jpg'),
(2910, 'La triste historia de la chef Sofía con Raquel: No pudieron concretar encuentro', 'La chef Sophia Rodríguez lamentó el fallecimiento de Raquel Mechoulam, una costarricense que luchó contra un cáncer durante mucho tiempo. Rodríguez expresó que tenía dolor en su corazón tras enterarse', 'https://www.crhoy.com/entretenimiento/la-triste-historia-de-la-chef-sofia-con-raquel-no-pudieron-concretar-encuentro/', '2023-12-08 11:29:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/Sophia-Rodríguez-y-Raquel-Mechoulam.jpeg'),
(2911, 'El momento incómodo de Tom Hanks durante la grabación de “Apolo 13”', 'Más de 25 años después desde que se estrenó la película &#8220;Apolo 13&#8221;, Tom Hanks reveló un momento incómodo que tuvo en el set. En el programa inglés Graham Norton Show, el actor contó que, c', 'https://www.crhoy.com/entretenimiento/el-momento-incomodo-de-tom-hanks-durante-la-grabacion-de-apolo-13/', '2023-12-08 11:01:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2020/03/TomHanksOscars1.jpg'),
(2912, 'VIDEO: Miss Universo quiere volver a Nicaragua', 'Sheynnis Palacios, la Miss Universo reconoció que quiere volver a Nicaragua, pese a toda la situación que enfrenta su país y las represalias que ha tomado el gobierno de Daniel Ortega con la organizac', 'https://www.crhoy.com/entretenimiento/video-miss-universo-quiere-volver-a-nicaragua/', '2023-12-08 18:23:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/Miss-universo.png'),
(2913, 'Pablo Alborán quedó enamorado de Costa Rica: “Dos días más aquí y me voy con disco nuevo”', 'Tan enamorado quedó de Costa Rica el cantante español Pablo Alborán, que incluso sacaría un disco en el país. Con esa frase levantó los gritos y aplausos, la noche de este jueves, durante su esperando', 'https://www.crhoy.com/entretenimiento/pablo-alboran-quedo-enamorado-de-costa-rica-dos-dias-mas-aqui-y-me-voy-con-disco-nuevo/', '2023-12-08 17:59:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/Alborán-2.jpeg'),
(2914, 'Pablo Alborán nos llevó a Saturno este jueves', 'En una noche mágica, Pablo Alborán teletransportó a su público hasta Saturno, este jueves, durante su concierto en el Parque Viva, en La Guácima de Alajuela. El artista salió a escena pasadas las 8:00', 'https://www.crhoy.com/entretenimiento/pablo-alboran-nos-llevo-a-saturno-este-jueves/', '2023-12-08 17:14:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/Pablo-Alborán.jpeg'),
(2915, 'Este viernes hay festival navideño en la Defensoría', 'Este viernes 8 de diciembre se llevará a cabo un festival navideño gratuito en las instalaciones de la Defensoría de los Habitantes, en Barrio México, en San José. A partir de las 11:00 a.m. y hasta l', 'https://www.crhoy.com/entretenimiento/este-viernes-hay-festival-navideno-en-la-defensoria/', '2023-12-08 16:27:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/Foto-Prensa-1-Museíto-y-Museíta-con-los-Duendes-de-Santa.jpg'),
(2916, 'Keanu Reeves fue víctima de ladrones con pasamontañas', 'El actor estadounidense, Keanu Reeves fue víctima de ladrones con pasamontañas, quienes irrumpieron en su casa, en Los Ángeles, Estados Unidos. De acuerdo con el medio especializado en entretenimiento', 'https://www.crhoy.com/entretenimiento/keanu-reeves-fue-victima-de-ladrones-con-pasamontanas/', '2023-12-08 14:24:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2019/06/keanu-reeves_0.jpg'),
(2917, '¿Qué hacer hoy? Esta es la agenda del fin de semana', '(CRHoy.com) En el Auditorio Biblioteca Pública de Heredia, a partir de las 10:30 a.m puede disfrutar de forma gratuita del taller &#8220;Elaboración de envoltorios navideños&#8221; para adultos y adul', 'https://www.crhoy.com/sin-categoria/que-hacer-hoy-esta-es-la-agenda-del-fin-de-semana-40/', '2023-12-08 13:23:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/madre-e-hija-gorro-papa-noel-smartphones.png'),
(2918, 'El fuerte mensaje de la esposa de David Guzmán: “todas somos reales”', 'Stacy Montero, la esposa del jugador saprissista, David Guzmán publicó un fuerte mensaje en redes sociales, para hablar del amor propio y de los comentarios que siempre recibe de su cuerpo. Ella compa', 'https://www.crhoy.com/entretenimiento/el-fuerte-mensaje-de-la-esposa-de-david-guzman-todas-somos-reales/', '2023-12-08 13:12:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/Stacy4-1.png'),
(2919, 'Alborán se despidió del país: “Me voy con el corazón llenito de pura vida”', 'El cantante español, Pablo Alborán dio un conciertazo este jueves en Parque Viva, en Alajuela y tras su presentación, se despidió de los ticos. A través de Instagram, compartió varias imágenes tomadas', 'https://www.crhoy.com/entretenimiento/alboran-se-despidio-del-pais-me-voy-con-el-corazon-llenito-de-pura-vida/', '2023-12-08 12:05:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/Pablo-Alboran-7-1-e1702036221704.jpg'),
(2920, 'Olivia Rodríguez, divina y delicada', 'Modelo estadounidense de origen español de 23 años. A la chica de ojos café le gusta pasar tiempo en el mar. Más fotos de Olivia aquí', 'https://www.crhoy.com/entretenimiento/olivia-rodriguez/', '2023-12-08 07:32:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/olivialarodriguez_1662045032_2917767669875489623_39619483-copia.jpg'),
(2921, '(FOTOS) Pamela Anderson desafía la belleza al no usar maquillaje', 'La reconocida actriz y modelo, Pamela Anderson, llamó la atención hace unos meses al aparecer en la Semana de Moda en París sin maquillaje en su rostro. Cuando apareció con un vestido amarillo, era ir', 'https://www.crhoy.com/entretenimiento/fotos-pamela-anderson-desafia-la-belleza-al-no-usar-maquillaje/', '2023-12-07 14:06:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/Pamela-Anderson.jpg'),
(2922, 'Paris Hilton y Demi Lovato celebran la navidad cocinando queque para perros', 'Paris Hilton y Demi Lovato celebran el inicio de la navidad cocinando queques para perros. En las imágenes se ve a las celebridades decorando la repostería apta para mascotas. El momento forma parte d', 'https://www.crhoy.com/entretenimiento/paris-hilton-y-demi-lovato-celebran-la-navidad-cocinado-queque/', '2023-12-07 13:17:00', 10, 6, 13, 'https://www.crhoy.com/wp-content/uploads/2023/12/Paris-Hilton-y-Demi-Lovato-cocinan-juntas.png'),
(2923, 'UE alcanza acuerdo sobre regulación del uso de Inteligencia Artificial', '(AFP).-Los negociadores de la Unión Europea (UE) alcanzaron este viernes un acuerdo sobre una legislación inédita a nivel mundial para regular el uso de la inteligencia artificial (IA), anunció el com', 'https://www.crhoy.com/tecnologia/ue-alcanza-acuerdo-sobre-regulacion-del-uso-de-inteligencia-artificial/', '2023-12-08 15:34:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2017/08/Inteligencia-artificial.jpg'),
(2924, 'Ofrecen 60 becas universitarias en ciberseguridad', 'Con motivo de la apertura de la carrera de Ciberseguridad en su portafolio académico, Universidad Invenio, en conjunto con Fundación CRUSA, ofrecerán a partir de 2024, 60 becas para jóvenes que deseen', 'https://www.crhoy.com/tecnologia/ofrecen-60-becas-universitarias-en-ciberseguridad/', '2023-12-08 09:37:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/12/Foto-Invenio-1.jpg'),
(2925, 'Japón usará boñiga de vaca para enviar cohete al espacio', '(AFP) Japón puede haber abierto un nuevo capítulo de su historia espacial con el ensayo exitoso de un motor de cohete alimentado únicamente por una energía producida localmente: boñiga de vaca. En la ', 'https://www.crhoy.com/tecnologia/japon-usara-boniga-de-vaca-para-enviar-cohete-al-espacio/', '2023-12-08 13:30:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/12/Estiercol-para-cohete.jpg'),
(2926, 'Costa Rica es el segundo país de la región más atacado por ransomware', 'El Panorama de Amenazas 2023 de Kaspersky reveló que Costa Rica ocupa el segundo lugar en el ranking de naciones centroamericanas que ha sufrido la mayor cantidad de ciberdelincuencia del tipo malware', 'https://www.crhoy.com/tecnologia/costa-rica-es-el-segundo-pais-de-la-region-mas-atacado-por-ransomware/', '2023-12-08 11:26:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/03/ransomware.jpeg'),
(2927, 'Aleti pone en marcha Comité de IA liderado por Camtic', 'La Federación de Asociaciones de Latinoamérica, El Caribe, España y Portugal de Entidades de Tecnologías de Información y Comunicación (Aleti) llevó a cabo el 5 de diciembre, el lanzamiento del Comité', 'https://www.crhoy.com/tecnologia/aleti-pone-en-marcha-comite-de-ia-liderado-por-camtic/', '2023-12-07 16:27:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2019/04/inteligencia-artificial-ia.jpg'),
(2928, 'Procomer: Cierre de operaciones de VMware en el país obedece a decisión corporativa', 'Tras la compra de la tecnológica VMware por parte de Broadcom se dieron una serie de movimientos de personal a escala mundial. Los cambios eventualmente también afectarían la operación en Costa Rica, ', 'https://www.crhoy.com/tecnologia/procomer-cierre-de-operaciones-de-vmware-en-el-pais-obedece-a-decision-corporativa/', '2023-12-07 08:01:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/12/vmware2.jpg'),
(2929, 'Estudio: Esta es la operadora que ofrece el mejor servicio de telefonía móvil en Costa Rica', '&#160; &#160; La empresa Claro obtuvo la mejor calificación en 7 de 9 parámetros de calidad de experiencia del usuario evaluados en los servicios de telefonía e Internet celular, según el último infor', 'https://www.crhoy.com/tecnologia/estudio-esta-es-la-operadora-que-ofrece-el-mejor-servicio-de-telefonia-movil-en-costa-rica/', '2023-12-07 15:58:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/03/celular1-e1677691046402.jpg'),
(2930, 'Cinpe-UNA rechaza manifestaciones del presidente y ministra sobre estudio 5G', 'El Centro Internacional de Política Económica para el Desarrollo Sostenible de la Universidad Nacional (Cinpe-UNA) rechazó categóricamente las manifestaciones dadas por el presidente de la República R', 'https://www.crhoy.com/tecnologia/cinpe-una-rechaza-manifestaciones-del-presidente-y-ministra-sobre-estudio-5g/', '2023-12-06 12:07:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2020/02/Cinpe3.jpg'),
(2931, 'Esto responde Cinpe a cuestionamientos del Micitt sobre estudio de 5G', 'El Centro Internacional de Política Económica y Desarrollo Sostenible (Cinpe-UNA) de la Universidad Nacional (UNA) le respondió una serie de cuestionamientos que le hizo el Ministerio de Ciencia, Inno', 'https://www.crhoy.com/tecnologia/esto-responde-cinpe-a-cuestionamientos-del-micitt-sobre-estudio-de-5g/', '2023-12-06 08:17:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2020/02/CINPE-1.jpg'),
(2932, 'Gemini: El modelo de IA de Google que promete revolucionar la tecnología', 'Google anunció el lanzamiento de Gemini, un modelo de Inteligencia Artificial (IA) multimodal y flexible, que revolucionará la tecnología. Según Infobae, el modelo de IA fue optimizado en diferentes c', 'https://www.crhoy.com/tecnologia/gemini-el-modelo-de-ia-de-google-que-promete-revolucionar-la-tecnologia/', '2023-12-06 18:13:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/12/Google-Gemini.jpg'),
(2933, 'Proponen uniformidad en reglamentación municipal de infraestructura previo a 5G', 'La Superintendencia de Telecomunicaciones (Sutel) emitió una serie de recomendaciones a las municipalidades del país en materia de uniformidad en la reglamentación infraestructura de telecomunicacione', 'https://www.crhoy.com/tecnologia/proponen-uniformidad-en-reglamentacion-municipal-de-infraestructura-previo-a-5g/', '2023-12-06 18:36:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/12/federico-chacon-2.jpeg'),
(2934, 'Huawei: “Convenio de Budapest no tiene absolutamente nada que ver con 5G”', 'La compañía china Huawei habló abiertamente sobre el Convenio de Budapest, incluido en el Decreto Ejecutivo No. 44196-MSP-MICITT. Humberto Cortés y Marcelo Pino, representantes de la empresa asiática,', 'https://www.crhoy.com/tecnologia/huawei-convenio-de-budapest-no-tiene-absolutamente-nada-que-ver-con-5g/', '2023-12-05 13:01:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/12/humberto-cortes-marcelo-pino3.jpeg'),
(2935, '¿Cuándo se levantará el estado de emergencia tras los ciberataques?', '¿Cuándo se levantará el estado de emergencia luego de los ciberataques del 2022? Esa es la pregunta sin respuesta que se hace el sector tecnológico del país y especialmente el de la ciberseguridad. En', 'https://www.crhoy.com/tecnologia/cuando-se-levantara-el-estado-de-emergencia-tras-los-ciberataques/', '2023-12-05 11:51:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2022/04/hackeo.jpg'),
(2936, 'Sindicatos aseguran que ICE ignoró propuesta de red neutra para 5G', 'Representantes de sindicatos del Instituto Costarricense de Electricidad (ICE) aseguran que la propuesta que hicieron para el desarrollo de una red neutra para 5G, fue ignorada por los jerarcas de la ', 'https://www.crhoy.com/tecnologia/sindicatos-aseguran-que-ice-ignoro-propuesta-de-red-neutra-para-5g/', '2023-12-05 11:11:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/04/5g-2.jpg'),
(2937, 'Así manipulan los cibercriminales la mente de sus víctimas', 'Prácticamente a diario los cibercriminales le roban millones de colones a los costarricenses por medio de tácticas de ingeniería social. Y es que los delincuentes utilizan una serie de ardides para sa', 'https://www.crhoy.com/tecnologia/asi-manipulan-los-cibercriminales-la-mente-de-sus-victimas/', '2023-12-04 13:06:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/08/cibercrimen-ciberdelito-copia.jpg'),
(2938, 'Hoy la Luna estará en fase de cuarto menguante: ¿A qué hora verla?', 'La Luna atravesará este lunes por la fase de cuarto menguante, es decir, solo una parte de su superficie se puede ver en el cielo. Según el Planetario de la Universidad de Costa Rica, la Luna llegará ', 'https://www.crhoy.com/tecnologia/hoy-la-luna-estara-en-fase-de-cuarto-menguante-a-que-hora-verla/', '2023-12-04 11:29:00', 4, 21, 9, 'https://www.crhoy.com/wp-content/uploads/2023/03/Cuarto-menguante.jpeg');

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
(9, 'https://feeds.feedburner.com/NacionalesCrhoycomPeriodicoDigitalCostaRicaNoticias', 'CRHoy', 4, 6),
(10, 'https://feeds.feedburner.com/EntretenimientoCrhoycomPeriodicoDigitalCostaRicaNoticias', 'CRHoy', 13, 6),
(11, 'https://www.teletica.com/rss/feed/deportes', 'Teletica', 1, 6);

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
(2710, 2891, 1),
(2711, 2891, 90),
(2712, 2891, 11),
(2713, 2892, 1),
(2714, 2892, 11),
(2715, 2892, 91),
(2716, 2892, 92),
(2717, 2893, 4),
(2718, 2893, 1),
(2719, 2893, 20),
(2720, 2894, 4),
(2721, 2894, 1),
(2722, 2894, 20),
(2723, 2895, 4),
(2724, 2895, 1),
(2725, 2895, 10),
(2726, 2896, 1),
(2727, 2896, 8),
(2728, 2896, 25),
(2729, 2897, 4),
(2730, 2897, 1),
(2731, 2897, 7),
(2732, 2898, 1),
(2733, 2898, 11),
(2734, 2898, 10),
(2735, 2899, 1),
(2736, 2900, 1),
(2737, 2900, 6),
(2738, 2900, 93),
(2739, 2900, 10),
(2740, 2901, 1),
(2741, 2902, 4),
(2742, 2902, 1),
(2743, 2902, 5),
(2744, 2903, 1),
(2745, 2903, 6),
(2746, 2903, 94),
(2747, 2903, 5),
(2748, 2904, 1),
(2749, 2904, 13),
(2750, 2904, 95),
(2751, 2904, 5),
(2752, 2905, 1),
(2753, 2905, 5),
(2754, 2906, 1),
(2755, 2906, 11),
(2756, 2906, 20),
(2757, 2907, 29),
(2758, 2907, 36),
(2759, 2907, 96),
(2760, 2907, 38),
(2761, 2908, 29),
(2762, 2908, 8),
(2763, 2908, 20),
(2764, 2908, 97),
(2765, 2909, 29),
(2766, 2909, 8),
(2767, 2910, 29),
(2768, 2911, 29),
(2769, 2911, 8),
(2770, 2911, 98),
(2771, 2912, 29),
(2772, 2912, 32),
(2773, 2912, 8),
(2774, 2913, 29),
(2775, 2913, 99),
(2776, 2913, 1),
(2777, 2913, 11),
(2778, 2914, 29),
(2779, 2914, 39),
(2780, 2914, 8),
(2781, 2915, 29),
(2782, 2915, 1),
(2783, 2915, 25),
(2784, 2916, 29),
(2785, 2916, 32),
(2786, 2916, 8),
(2787, 2916, 100),
(2788, 2917, 29),
(2789, 2917, 101),
(2790, 2917, 8),
(2791, 2917, 102),
(2792, 2918, 29),
(2793, 2918, 32),
(2794, 2918, 8),
(2795, 2919, 29),
(2796, 2919, 39),
(2797, 2919, 8),
(2798, 2919, 103),
(2799, 2920, 29),
(2800, 2920, 36),
(2801, 2920, 38),
(2802, 2920, 104),
(2803, 2921, 29),
(2804, 2921, 8),
(2805, 2921, 105),
(2806, 2921, 20),
(2807, 2922, 29),
(2808, 2922, 106),
(2809, 2922, 107),
(2810, 2922, 8),
(2811, 2922, 108),
(2812, 2923, 68),
(2813, 2923, 42),
(2814, 2923, 68),
(2815, 2924, 54),
(2816, 2924, 42),
(2817, 2925, 62),
(2818, 2925, 42),
(2819, 2925, 109),
(2820, 2925, 42),
(2821, 2926, 54),
(2822, 2926, 42),
(2823, 2926, 110),
(2824, 2926, 111),
(2825, 2926, 42),
(2826, 2926, 10),
(2827, 2927, 68),
(2828, 2927, 42),
(2829, 2927, 71),
(2830, 2927, 68),
(2831, 2928, 42),
(2832, 2928, 112),
(2833, 2928, 113),
(2834, 2928, 10),
(2835, 2928, 114),
(2836, 2929, 41),
(2837, 2929, 42),
(2838, 2929, 42),
(2839, 2929, 5),
(2840, 2930, 45),
(2841, 2930, 42),
(2842, 2930, 48),
(2843, 2930, 57),
(2844, 2930, 49),
(2845, 2931, 45),
(2846, 2931, 42),
(2847, 2931, 115),
(2848, 2931, 46),
(2849, 2931, 47),
(2850, 2931, 48),
(2851, 2931, 49),
(2852, 2932, 42),
(2853, 2932, 53),
(2854, 2932, 42),
(2855, 2933, 45),
(2856, 2933, 42),
(2857, 2933, 55),
(2858, 2933, 48),
(2859, 2933, 116),
(2860, 2933, 49),
(2861, 2933, 7),
(2862, 2933, 59),
(2863, 2933, 55),
(2864, 2934, 45),
(2865, 2934, 42),
(2866, 2934, 117),
(2867, 2934, 54),
(2868, 2934, 46),
(2869, 2934, 47),
(2870, 2934, 48),
(2871, 2934, 49),
(2872, 2934, 20),
(2873, 2935, 54),
(2874, 2935, 42),
(2875, 2935, 118),
(2876, 2935, 119),
(2877, 2935, 120),
(2878, 2935, 121),
(2879, 2935, 122),
(2880, 2935, 20),
(2881, 2936, 45),
(2882, 2936, 42),
(2883, 2936, 67),
(2884, 2936, 48),
(2885, 2936, 49),
(2886, 2936, 123),
(2887, 2936, 124),
(2888, 2936, 5),
(2889, 2937, 54),
(2890, 2937, 42),
(2891, 2937, 119),
(2892, 2937, 5),
(2893, 2938, 62),
(2894, 2938, 42),
(2895, 2938, 125),
(2896, 2938, 20);

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
(89, 'Spotify'),
(90, 'Puntarenas'),
(91, 'homicidio'),
(92, 'San Carlos'),
(93, 'Rodrigo Marin'),
(94, 'COVID-19'),
(95, 'Dekra'),
(96, 'Emmanuelle Vera'),
(97, 'Viviana Calderón'),
(98, 'Tom Hanks'),
(99, 'Tendencias'),
(100, 'Keanu Reeves'),
(101, 'Noticia'),
(102, '¿Qué hacer hoy?'),
(103, 'Pablo Alborán'),
(104, 'Olivia Rodríguez'),
(105, 'Pamela Anderson'),
(106, 'Televisión'),
(107, 'Demi Lovato'),
(108, 'Paris Hilton'),
(109, 'Japón'),
(110, 'Kaspersky'),
(111, 'Ransomware'),
(112, 'Broadcom'),
(113, 'Economía'),
(114, 'VMware'),
(115, 'Cinpe-UNA'),
(116, 'Ley 10216'),
(117, 'Ciberdelitos'),
(118, '#HackeoConti'),
(119, 'ciberataques'),
(120, 'conti'),
(121, 'estrategia nacional de ciberseguridad'),
(122, 'Hive'),
(123, 'red neutra'),
(124, 'red neutral'),
(125, 'Luna');

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
  `roleId` int(11) UNSIGNED NOT NULL,
  `public` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `firstName`, `lastName`, `password`, `roleId`, `public`) VALUES
(1, 'kimcorralesv@gmail.com', 'admin', 'admin', '$2y$10$5fKk/otESXhTnm.EywR.wOu8wopw7RXy3CNnmNlwfEbSMhLVCpGvK', 1, NULL),
(6, 'kcorrales073@gmail.com', 'Kimberly', 'Corrales', '$2y$10$rqr3WyoGOUDGeF4gzag3PO8EJ5G4y/SwxqGGt2tx7f.vzDGWvoHZO', 2, 0),
(11, 'jimenez@gmail.com', 'Maria', 'Jimenez', '$2y$10$gfIIAFLG8z6S.WSDbLG2d.z.w8R4QWXyEoRtvyXZzYeTiCaqLoVKC', 2, NULL),
(21, 'rportugues@gmail.com', 'Rosa', 'Portugues', '$2y$10$gfIIAFLG8z6S.WSDbLG2d.z.w8R4QWXyEoRtvyXZzYeTiCaqLoVKC', 2, NULL),
(25, 'keycorralesv@gmail.com', 'Keilyn', 'Corrales', '$2y$10$3wb5FjDdYCFVO4HaWrwvPOG1ivHSSgGQVMWteZpfXclTVIeGiZ.bW', 2, NULL),
(26, 'gcorrales@gmail.com', 'Gueyner', 'Corrales', '$2y$10$QIwtOsXMc6XBEKOJeFB7HuX3m80cLULaAq6MLyjdLHFObDA53iSB.', 2, NULL);

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
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2939;

--
-- AUTO_INCREMENT de la tabla `newssources`
--
ALTER TABLE `newssources`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `newstags`
--
ALTER TABLE `newstags`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2897;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

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
