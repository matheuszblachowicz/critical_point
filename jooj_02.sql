-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2022 at 10:15 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `critical_point`
--

-- --------------------------------------------------------

--
-- Table structure for table `jooj_02`
--

CREATE TABLE `jooj_02` (
  `ID` int(11) NOT NULL,
  `B_NOME` varchar(255) NOT NULL,
  `B_IMAGEM` varchar(255) NOT NULL,
  `B_BANNER` varchar(255) NOT NULL,
  `B_DESEN` varchar(255) NOT NULL,
  `B_DISTRI` varchar(255) NOT NULL,
  `B_DATA_LANC` date NOT NULL,
  `B_DESC` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jooj_02`
--

INSERT INTO `jooj_02` (`ID`, `B_NOME`, `B_IMAGEM`, `B_BANNER`, `B_DESEN`, `B_DISTRI`, `B_DATA_LANC`, `B_DESC`) VALUES
(1, 'Forza Horizon 4', 'forza_horizon_4.png', 'forza_horizon_4_banner.jpg', 'Playground Games', 'Microsoft Studios', '2018-09-28', 'Estações dinâmicas mudam tudo no maior festival automotivo do mundo. Participe sozinho ou junte os amigos para explorar a linda e histórica Grã-Bretanha num mundo aberto compartilhado. Colete, modifique e pilote mais de 450 carros. Corra, faça proeza, crie e explore. Escolha seu caminho para se tornar um superastro do Horizon. - XBOX'),
(2, 'Psychonauts 2', 'psychonauts_2.png', 'psychonauts_2_banner.png', 'Double Fine Productions', 'Xbox Game Studios', '2021-08-24', 'Razputin “Raz” Aquato, um acrobata treinado e poderoso jovem psíquico, realizou o sonho de sua vida inteira de integrar a organização de espionagem psíquica internacional conhecida como os Psychonauts! Mas esses superespiões psíquicos estão em apuros. O líder deles está agindo de forma estranha desde que foi resgatado de um sequestro e, para piorar, há um espião escondido na sede.\r\n\r\nMisturando missões excêntricas e conspirações misteriosas, Psychonauts 2 é um jogo de aventura do tipo plataforma com estilo cinematográfico e uma variedade de poderes psíquicos personalizáveis. Psychonauts 2 oferece perigo, emoção e risadas na mesma medida enquanto os jogadores guiam Raz pela mente de amigos e inimigos na missão para derrotar um vilão psíquico sanguinário. - XBOX'),
(3, 'Slime Rancher 2', 'slime_rancher_2.png', 'slime_rancher_2_banner.png', 'Monomi Park', 'Monomi Park', '2022-09-22', 'Slime Rancher 2 é a sequência do premiado jogo original, um grande sucesso adorado por mais de 10 milhões de fãs em todo o mundo. Continue as aventuras de Beatrix LeBeau enquanto ela viaja até a Ilha Arco-íris, uma terra misteriosa repleta de tecnologia antiga, recursos naturais desconhecidos e uma avalanche de novos slimes saltitantes, cheios de remelexo, para serem descobertos.\r\nEnquanto Beatrix tenta desvendar os segredos da ilha e descobrir seu verdadeiro propósito, ela construirá melhorias para criação e cultivo em um belo solário, cujas paredes de vidro cristalino permitem uma visão integral do paraíso prismático que ela agora chama de lar. - XBOX'),
(4, 'Call of Duty: Modern Warfare II', 'cod_mw_2.png', 'cod_mw_2_banner.png', 'Infinity Ward, Raven Software, Beenox, Treyarch, High Moon Studios, Sledgehammer Games, Activision Shanghai, Demonware, Toys for Bob', 'Activision', '2022-10-28', 'O Call of Duty®: Modern Warfare® II coloca os jogadores dentro de um conflito global sem precedentes que conta com o retorno dos Operadores icônicos da Força-Tarefa 141. Desde operações táticas para infiltração de alto risco em pequena escala até missões altamente confidenciais, jogadores vão se mobilizar junto de amigos em uma verdadeira experiência imersiva.\r\n\r\nA Infinity Ward traz jogabalidade revolucionária para os fãs, com manuseio de arma totalmente novo, sistema de IA avançada, um novo Armeiro e uma série de outras inovação gráficas e de jogabilidade que vão elevar a franquia a outro nível.\r\n\r\nO Modern Warfare® II é lançado com uma campanha para um jogador pelo mundo, combate Multijogador imersivo e uma experiência cooperativa de Operações Especiais centrada na narrativa. - STEAM\r\n'),
(5, 'Monster Hunter Rise', 'monster_hunter_rise.png', 'monster_hunter_rise_banner.png', 'CAPCOM', 'CAPCOM', '2022-01-12', 'Encare o desafio e junte-se à caça! Em Monster Hunter Rise, o capítulo mais recente da premiada e bem-sucedida série Monster Hunter, você vai se tornar um caçador, explorar mapas novos e usar diversas armas para derrotar monstros assustadores como parte de uma nova história. A versão para PC também vem com uma série de otimizações visuais e de desempenho extras. - STEAM'),
(6, 'V Rising', 'v_rising.png', 'v_rising_banner.png', 'Stunlock Studios', 'Stunlock Studios', '2022-05-17', 'Lute pela sua sobrevivência\r\n\r\nAcorde como um vampiro após séculos de sono profundo. Evite o sol enquanto você vai atrás de sangue para recuperar sua força. Reconstrua seu castelo e converta humanos em seus servos leais durante a sua missão para criar um império vampiro. Faça aliados e inimigos online ou jogue sozinho em seu próprio servidor, lute contra soldados e trave uma guerra nesse mundo de conflitos.\r\n\r\nVocê se tornará o próximo Drácula? - STEAM'),
(7, 'Tiny Tina\'s Wonderlands', 'tiny_tina\'s_wonderlands.png', 'tiny_tina\'s_wonderlands_banner.png', 'Gearbox Software', '2K', '2022-06-23', 'Junte os amigos para jogar o multijogador entre as plataformas!\r\n\r\nEmbarque numa aventura épica cheia de extravagâncias, maravilhas e armamentos poderosos! Balas, magia e espadas se encontram neste mundo fantástico e caótico criado pela mente da imprevisível Tiny Tina.\r\nRole os dados para criar seu próprio herói multiclasse e enfrente monstros grotescos e masmorras abarrotadas de espólios na base de saque, tiro, espadada e feitiço para deter o tirânico Senhor dos Dragões. Entre para o grupo, ponha suas botas de aventureiro e seja Caótico e Maneiro! - STEAM'),
(8, 'Steelrising', 'steelrising.png', 'steelrising_banner.png', 'Spiders', 'Nacon', '2022-09-08', 'A cidade queima e sangra nas garras do insano rei Louis XVI e sua violenta legião de automatas. Aegis, uma obra-prima criada pelo engenheiro Vaucanson para ser a guarda-costas da rainha, deverá salvar a Revolução Francesa neste desafiador RPG de ação.\r\n\r\nAvance contra os soldados mecânicos do rei com precisão mortal. Execute sequências de esquivas, aparadas, saltos e ataques devastadores para abrir caminho à força pela cidade. Cada combate testará seus nervos e sua disciplina, enquanto os imensos e incansáveis chefões mecânicos exigirão paciência e habilidade. - STEAM'),
(9, 'Raft', 'raft.png', 'raft_banner.png', 'Redbeet Interactive', 'Axolot Games', '2022-06-20', 'By yourself or with friends, your mission is to survive an epic oceanic adventure across\r\na perilous sea! Gather debris to survive, expand your raft and set sail towards forgotten and dangerous islands!\r\n\r\n\r\nTrapped on a small raft with nothing but a hook made of old plastic, players awake on a vast,\r\nblue ocean totally alone and with no land in sight! With a dry throat and an empty stomach,\r\nsurvival will not be easy!\r\n\r\nRaft throws you and your friends into an epic adventure out on the big open sea, with the\r\nobjective to stay alive, gather resources and build yourself a floating home worthy of\r\nsurvival.\r\n\r\nResources are tough to come by at sea: Players will have to make sure to catch whatever debris floats by using their trusty hook and when possible, scavenge the reefs beneath the waves and the islands above.\r\nHowever, thirst and hunger is not the only danger in the ocean… watch out for the man-\r\neating shark determined to end your voyage!\r\n\r\nFind the last parts of civilization still above water. Overcome the challenges therein, uncover the story of its previous inhabitants and find your way to the next destination! - STEAM'),
(10, 'Vampire Survivors', 'vampire_survivors.png', 'vampire_survivors_banner.png', 'poncle', 'poncle', '2022-10-20', 'Acabe com milhares de criaturas noturnas e sobreviva até o amanhecer!\r\nVampire Survivors é um jogo casual de terror gótico com elementos roguelite onde suas escolhas podem fazer você crescer rapidamente e aniquilar os milhares de monstros que aparecem pelo caminho.\r\n\r\n\r\nVampire Survivors é um jogo de sobrevivência com jogabilidade minimalista e elementos roguelite.\r\nO inferno está vazio. Todos os demônios estão aqui, e não há como se esconder. Só lhe resta sobreviver o máximo que puder até que a morte, por fim, encerre seu sofrimento. Colete ouro nas partidas para comprar aprimoramentos e ajudar o próximo sobrevivente. -STEAM\r\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jooj_02`
--
ALTER TABLE `jooj_02`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jooj_02`
--
ALTER TABLE `jooj_02`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
