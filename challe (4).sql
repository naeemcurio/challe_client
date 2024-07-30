-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 11, 2024 at 07:46 AM
-- Server version: 8.0.37-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `challe`
--

-- --------------------------------------------------------

--
-- Table structure for table `challenger_record_submissions`
--

CREATE TABLE `challenger_record_submissions` (
  `id` bigint UNSIGNED NOT NULL,
  `challenge_attempt_id` bigint UNSIGNED NOT NULL,
  `challenger_id` bigint UNSIGNED NOT NULL,
  `video_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments` text COLLATE utf8mb4_unicode_ci,
  `submit_record_time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `challenger_record_submissions`
--

INSERT INTO `challenger_record_submissions` (`id`, `challenge_attempt_id`, `challenger_id`, `video_url`, `comments`, `submit_record_time`, `created_at`, `updated_at`) VALUES
(30, 23, 159, 'ლინკი', 'ესეც კომენტარი', '2024-06-03 15:26:44.897475', '2024-06-03 10:26:44.000000', '2024-06-03 10:26:44.000000'),
(69, 43, 141, 'xiaomi 2', NULL, '2024-06-05 13:48:36.103480', '2024-06-05 08:48:36.000000', '2024-06-05 08:48:36.000000'),
(70, 43, 159, 'pixel 2', NULL, '2024-06-05 13:48:36.834455', '2024-06-05 08:48:36.000000', '2024-06-05 08:48:36.000000'),
(251, 140, 159, 'qfgvv', NULL, '2024-06-14 16:31:31.859765', '2024-06-14 16:31:31.000000', '2024-06-14 16:31:31.000000'),
(252, 140, 141, 'qwdff', NULL, '2024-06-14 16:31:32.323274', '2024-06-14 16:31:32.000000', '2024-06-14 16:31:32.000000'),
(253, 141, 159, 'ghj', NULL, '2024-06-14 16:36:23.778516', '2024-06-14 16:36:23.000000', '2024-06-14 16:36:23.000000'),
(254, 141, 141, 'cdw', NULL, '2024-06-14 16:36:23.793534', '2024-06-14 16:36:23.000000', '2024-06-14 16:36:23.000000'),
(277, 153, 141, 'gh', NULL, '2024-06-18 22:09:45.835184', '2024-06-18 22:09:45.000000', '2024-06-18 22:09:45.000000'),
(278, 153, 159, 'hdd', NULL, '2024-06-18 22:09:48.725998', '2024-06-18 22:09:48.000000', '2024-06-18 22:09:48.000000');

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

CREATE TABLE `challenges` (
  `id` bigint UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `price` double NOT NULL,
  `price_id` bigint UNSIGNED DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=disapproved,1=approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `challenges`
--

INSERT INTO `challenges` (`id`, `description`, `price`, `price_id`, `image`, `video`, `created_by`, `status`, `created_at`, `updated_at`) VALUES
(27, '1. Do 10 push ups on the roof of any car\r\n2. Say \"challe\" after you do each push up\r\n3. Record a video of this process\r\n4. Upload the video on Tik-Tok with hashtag #Challe\r\n5. Send the link of this video here in Challe app in \"provide the proof\" section', 10, 3, 'upload/image/challenge/1718371445-7020.jpg', 'upload/videos/1716551096_Reel.mp4', 141, 1, '2024-05-24 06:44:58', '2024-06-27 15:05:28'),
(28, '1. Shake hand with 3 strangers in the crowded street\r\n2. Instead of Hello, say Challe and smile, while shaking a hand\r\n3. Record a video\r\n4. Upload it on Tiktok with this hashtag: #Challe\r\n5. Send the link of these video here in Challe app in \"provide the proof\" section', 10, 3, NULL, 'upload/videos/1716561695_WhatsApp Video 2024-02-07 at 8.17.56 PM.mp4', 141, 1, '2024-05-24 09:41:36', '2024-06-27 15:05:11'),
(97, '1. Balance a pillow on your head (without holding it with hands) and squat 5 times without dropping it.\r\n2. Say \"Challe\" after each squat.\r\n3. Record a video of the entire process.\r\n4. Upload the video on TikTok with hashtag #Challe\r\n5. Send the link of this video here in Challe app in \"provide the proof\" section.', 10, 3, NULL, NULL, 141, 1, '2024-06-27 15:02:22', '2024-06-27 15:02:22'),
(98, '1. Gather 5 pairs of socks and a laundry basket.\r\n2. Stand approximately 3 meters away and try to toss each pair into the basket 3 times straight. After every toss, say ‘’Challe\"\r\n3. Record a video of the entire process.\r\n4. Upload the video on TikTok with hashtag #Challe\r\n5. Send the link of this video here in Challe app in \"provide the proof\" section.', 50, 4, NULL, NULL, 141, 1, '2024-06-27 15:04:55', '2024-06-27 15:04:55'),
(99, '1. Throw a piece of popcorn (at least 10 times) into the air and try to catch it in your mouth while standing on one leg.\r\n2. If you miss, you have to say \"Challe\" and try again until you catch it successfully.\r\n3. Record a video of the entire process, including the fails.\r\n4. Upload the video on TikTok with hashtag #Challe\r\n5. Send the link of this video here in Challe app in \"provide the proof\" section.', 100, 5, NULL, NULL, 141, 1, '2024-06-27 15:09:14', '2024-06-27 15:09:14'),
(100, '1. Spin around in place 10 times to make yourself dizzy. Say Challe after every spin\r\n2. After spinning, try to pop a balloon by sitting on it. (Balloon must be at least 5 meters away from spinning place)\r\n3. Record a video of the entire process, including the fails.\r\n5. Upload the video on TikTok with hashtag #Challe\r\n6. Send the link of this video here in Challe app in \"provide the proof\" section.', 10, 3, NULL, NULL, 141, 1, '2024-06-27 15:24:37', '2024-06-27 15:24:37'),
(101, '1. Balance a half-full water bottle on your head and do 10 squats without dropping it.\r\n2. Say \"Challe\" after each squat.\r\n3. If the bottle falls, start over from the beginning.\r\n4. Record a video of the entire process, including any fails.\r\n5. Upload the video on TikTok with hashtag #Challe\r\n6. Send the link of this video here in Challe app in \"provide the proof\" section.', 10, 3, NULL, NULL, 141, 1, '2024-06-27 15:26:02', '2024-06-27 15:26:02'),
(102, '1. Jiggle balloon in the air using only your head 10 times\r\n2. Say \"Challe\" after each hit\r\n3. If the balloon touches the ground, start over from the beginning.\r\n4. Record a video of the entire process, including any fails.\r\n5. Upload the video on TikTok with hashtag #Challe.\r\n6. Send the link of this video here in Challe app in \"provide the proof\" section.', 50, 4, NULL, NULL, 141, 1, '2024-06-27 15:30:48', '2024-06-27 20:39:39'),
(103, 'Challenge Description:\r\n\r\n	1.	Water Bottle Flip:\r\n	•	you must successfully flip a water bottle so that it lands upright 5 times in a row.\r\n	2.	Call Out:\r\n	•	After each successful flip, say “Challe.”\r\n	3.	Recording:\r\n	•	ask a friend to record a video of the entire process, including any failed attempts.\r\n	4.	Upload:\r\n	•	Upload the video on TikTok with the hashtag #Challe and submit the link in the Challe app’s “provide the proof” section.', 1000, 7, NULL, NULL, 141, 1, '2024-06-27 15:37:56', '2024-06-27 20:40:53'),
(104, '1.	Put on a blindfold and toss a coin into the air, then catch it, 3 times in a row.\r\n	2.	Say “Challe” after each successful toss.\r\n	3.	Record a video of the entire process, including any failed attempts.\r\n	4.	Upload the video on TikTok with the hashtag #Challe.\r\n	5.	Send the link of this video here in Challe app in “provide the proof” section.', 50, 4, NULL, NULL, 141, 1, '2024-06-27 15:55:57', '2024-06-27 15:55:57'),
(105, '### Challenge Name: The Cereal Box Challenge\r\n\r\n#### Challenge Rules:\r\n\r\n1. Cut the top half of an empty cereal box off. Place the bottom half on the floor.\r\n2. Using only your mouth, pick up the cereal box without using your hands or letting any other part of your body touch the ground, except your feet.\r\n3. Say \"Challe\" once you\'ve picked up the cereal box successfully.\r\n4. Record a video of the entire process, including any failed attempts.\r\n5. Upload the video on TikTok with the hashtag #Challe.\r\n6. Send the link of this video here in Challe app in \"provide the proof\" section.', 10, 3, NULL, NULL, 141, 1, '2024-06-27 16:02:44', '2024-06-27 16:02:44'),
(106, '1.	Using a straw, transfer 10 mini marshmallows from one plate to another by sucking them up through the straw.\r\n	2.	Say “Challe” after transferring every 10 marshmallows (after each transfer)\r\n	3.	Record a video of the entire process, including any failed attempts.\r\n	4.	Upload the video on TikTok with the hashtag #Challe.\r\n	5.	Send the link of this video here in Challe app in “provide the proof” section.', 100, 5, NULL, NULL, 141, 1, '2024-06-27 16:05:32', '2024-06-27 16:05:32'),
(107, '1. Place a cookie on your forehead.\r\n2. Without using your hands, move the cookie from your forehead to your mouth by only moving your face muscles.\r\n3. Say \"Challe\" once the cookie is in your mouth.\r\n4. Ask a friend to record a video of you and the entire process, including any failed attempts.\r\n5. Upload the video on TikTok with the hashtag #Challe.\r\n6. Send the link of this video here in Challe app in \"provide the proof\" section.', 10, 3, NULL, NULL, 141, 1, '2024-06-27 16:10:05', '2024-06-27 16:27:35'),
(108, '1. Balance a spoon on the edge of a table and flip it to try to catch it in a cup. (3 times)\r\n2. Say \"Challe\" after each successful catch.\r\n3. If you miss, you must do a squat\r\n4. Record a video of the entire process, including any fails (ask a friend)\r\n5. Upload the video on TikTok with the hashtag #Challe.\r\n6. Send the link of this video here in Challe app in \"provide the proof\" section.', 100, 5, NULL, NULL, 141, 1, '2024-06-27 16:13:16', '2024-06-27 16:26:50'),
(109, '1. Go to a crowded public place.\r\n2. Start singing a well-known song loudly for at least 20 seconds.\r\n3. Say \"Challe\" at the end of your performance\r\n4. Record a video of the entire process, including any reactions from the crowd. (Ask a friend)\r\n5. Upload the video on TikTok with the hashtag #Challe.\r\n6. Send the link of this video here in Challe app in \"provide the proof\" section.', 1000, 7, NULL, NULL, 141, 1, '2024-06-27 16:22:48', '2024-06-27 16:26:26'),
(110, '1. Go to a crowded place.\r\n2. Freeze in a funny pose for 60 seconds without moving.\r\n3. Say \"Challe\" once the 60 seconds are up.\r\n4. Record a video of the entire process, including any reactions from the crowd. (Ask a friend)\r\n5. Upload the video on TikTok with the hashtag #Challe.\r\n6. Send the link of this video here in Challe app in \"provide the proof\" section.', 100, 5, NULL, NULL, 141, 1, '2024-06-27 16:25:58', '2024-06-27 16:25:58'),
(111, '1.	Go to a crowded public place\r\n2.	Carry a banana and pretend it’s your phone.\r\n3.	Approach random people and have a serious conversation on your “banana phone.”\r\n4.	Say “Challe” during conversation\r\n5.	prank at least 1 people\r\n6.	Record a video of the entire process (maximum 30 seconds long)\r\n7.	Upload the video on TikTok with the hashtag #Challe.\r\n8.	Send the link of this video here in the Challe app in the “provide the proof” section.', 100, 5, NULL, NULL, 141, 1, '2024-06-27 16:37:41', '2024-06-27 16:37:41'),
(112, '1.	Go to a crowded public place\r\n	2.	Challenge yourself to do as many push-ups as you can in 30 seconds.\r\n	3.	While doing push-ups, shout out funny phrases like “I’m getting stronger!” or “Feel the burn!” after each push-up.\r\n	4.	Say “Challe” at the end of the challenge.\r\n	5.	ask a friend to record a video of the entire process, including the reactions from the crowd.\r\n	6.	Upload the video on TikTok with the hashtag #Challe.\r\n	7.	Send the link of this video here in the Challe app in the “provide the proof” section.', 1000, 7, NULL, NULL, 141, 1, '2024-06-27 16:45:54', '2024-06-27 16:45:54'),
(114, 'გგგ', 10, 3, NULL, 'uploads/videos/video_20240704_235119_94293905.mp4', 229, 0, '2024-07-04 19:51:20', '2024-07-04 19:51:20');

-- --------------------------------------------------------

--
-- Table structure for table `challenge_attempts`
--

CREATE TABLE `challenge_attempts` (
  `id` bigint UNSIGNED NOT NULL,
  `ready_lounge_id` bigint UNSIGNED DEFAULT NULL,
  `challenge_id` bigint UNSIGNED NOT NULL,
  `challenger_1` bigint UNSIGNED NOT NULL,
  `challenger_2` bigint UNSIGNED NOT NULL,
  `is_completed` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=pending,1=complete',
  `winner_id` bigint UNSIGNED DEFAULT NULL,
  `winning_amount` double DEFAULT '0',
  `company_commission` double(8,5) DEFAULT NULL,
  `challenge_creator_commission` double(8,5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `challenge_attempts`
--

INSERT INTO `challenge_attempts` (`id`, `ready_lounge_id`, `challenge_id`, `challenger_1`, `challenger_2`, `is_completed`, `winner_id`, `winning_amount`, `company_commission`, `challenge_creator_commission`, `created_at`, `updated_at`) VALUES
(23, 18, 27, 159, 141, 1, NULL, 1.88, 0.10000, 0.02000, '2024-06-03 06:11:38', '2024-06-03 10:26:44'),
(43, 45, 27, 141, 159, 1, 141, 1.7, 0.30000, 0.00200, '2024-06-05 08:48:02', '2024-06-05 08:51:18'),
(140, 140, 27, 159, 141, 1, 159, 1.78, 0.22000, 0.00200, '2024-06-14 16:30:57', '2024-06-14 16:32:28'),
(141, 141, 27, 159, 141, 1, NULL, 1.78, 0.22000, 0.00200, '2024-06-14 16:35:59', '2024-06-14 16:36:23'),
(153, 153, 27, 141, 159, 1, NULL, 1.78, 0.22000, 0.00200, '2024-06-18 08:25:59', '2024-06-18 22:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `challenge_ratings`
--

CREATE TABLE `challenge_ratings` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `challenge_id` bigint UNSIGNED NOT NULL,
  `challenge_attempt_id` bigint UNSIGNED NOT NULL,
  `rating` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `challenge_ratings`
--

INSERT INTO `challenge_ratings` (`id`, `user_id`, `challenge_id`, `challenge_attempt_id`, `rating`, `created_at`, `updated_at`) VALUES
(17, 141, 27, 43, '5.0', '2024-06-05 08:52:32', '2024-06-05 08:52:32'),
(31, 141, 27, 140, '5.0', '2024-06-14 16:32:35', '2024-06-14 16:32:35'),
(32, 159, 27, 140, '5.0', '2024-06-14 16:32:49', '2024-06-14 16:32:49');

-- --------------------------------------------------------

--
-- Table structure for table `challenge_results`
--

CREATE TABLE `challenge_results` (
  `id` bigint UNSIGNED NOT NULL,
  `likes` double NOT NULL,
  `views` double NOT NULL,
  `challenge_attempt_id` bigint UNSIGNED NOT NULL,
  `challenger_record_submission_id` bigint UNSIGNED NOT NULL,
  `challenger_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `challenge_results`
--

INSERT INTO `challenge_results` (`id`, `likes`, `views`, `challenge_attempt_id`, `challenger_record_submission_id`, `challenger_id`, `created_at`, `updated_at`) VALUES
(32, 7, 7, 43, 69, 141, '2024-06-05 08:50:43', '2024-06-05 08:50:43'),
(33, 6, 6, 43, 70, 159, '2024-06-05 08:51:08', '2024-06-05 08:51:08'),
(46, 8, 8, 140, 252, 141, '2024-06-14 16:32:15', '2024-06-14 16:32:15'),
(47, 9, 9, 140, 251, 159, '2024-06-14 16:32:16', '2024-06-14 16:32:16'),
(48, 9, 9, 140, 251, 159, '2024-06-14 16:32:24', '2024-06-14 16:32:24');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `forfeit_challenges`
--

CREATE TABLE `forfeit_challenges` (
  `id` bigint UNSIGNED NOT NULL,
  `challenger_1` bigint UNSIGNED DEFAULT NULL,
  `challenger_2` bigint UNSIGNED DEFAULT NULL,
  `challenge_id` bigint UNSIGNED DEFAULT NULL,
  `challenger_1_status` text COLLATE utf8mb4_unicode_ci,
  `challenger_2_status` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leaderboards`
--

CREATE TABLE `leaderboards` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `total_likes` double NOT NULL DEFAULT '0',
  `total_views` double NOT NULL DEFAULT '0',
  `total_challenge_participation` double DEFAULT NULL,
  `points` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `leaderboards`
--

INSERT INTO `leaderboards` (`id`, `user_id`, `total_likes`, `total_views`, `total_challenge_participation`, `points`, `created_at`, `updated_at`) VALUES
(8, 141, 191, 215, 10, 5, '2024-05-31 09:47:26', '2024-06-27 08:34:03'),
(10, 159, 25, 25, 4, 2, '2024-06-05 08:51:08', '2024-06-14 16:32:28');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_02_29_124041_create_roles_table', 1),
(6, '2024_02_29_124102_add_role_id_in_users_table', 1),
(8, '2024_03_01_124024_create_challenges_table', 2),
(15, '2024_03_04_105817_create_challenge_attempts_table', 3),
(16, '2024_03_04_124813_create_challenger_record_submission_table', 3),
(17, '2024_03_04_125656_create_challenge_results_table', 3),
(19, '2024_03_07_074518_create_leader_boards_table', 4),
(24, '2024_03_08_100202_create_wallets_logs_table', 5),
(25, '2024_03_08_100203_create_wallets_table', 5),
(26, '2024_03_08_100204_add_notes_and_reference_columns_to_wallets_logs_table', 5),
(27, '2024_03_14_073544_create_settings_table', 6),
(28, '2024_03_14_090028_create_prices_table', 7),
(30, '2024_03_14_095835_change_price_column_in_challenges_table', 8),
(31, '2024_03_14_104845_remove_stripe_fields_in_users_table', 9),
(32, '2024_03_14_105622_rename_column_in_users_table', 10),
(34, '2024_03_15_102043_create_user_notifications_table', 11),
(35, '2024_03_18_060821_make_password_column_nullable_in_users_table', 12),
(37, '2024_03_18_091852_add_title_column_in_prices_table', 14),
(38, '2024_03_18_091853_create_challenge_ratings_table', 15),
(39, '2024_03_18_102103_create_search_histories_table', 16),
(40, '2024_03_21_095013_add_rapyd_payment_column_in_users_table', 17),
(41, '2024_03_21_102619_create_user_cards_table', 18),
(43, '2024_03_22_070310_create_user_payments_table', 19),
(45, '2024_03_25_074840_add_3ds_verification_in_user_cards_table', 20),
(46, '2024_03_26_064904_create_waiting_lounge_table', 21),
(47, '2024_03_26_070341_create_ready_lounges_table', 21),
(48, '2024_03_26_111501_add_column_in_challenge_attempts_table', 22),
(49, '2024_03_27_075724_add_card_brand_column_in_user_cards_table', 23),
(50, '2024_03_28_065552_add_column_in_waiting_lounges_table', 24),
(52, '2024_03_28_093800_add_column_commission_in_challenge_attempts_table', 25),
(55, '2024_03_29_054259_create_withdraw_histories_table', 26),
(56, '2024_04_01_055817_create_notifications_table', 27),
(58, '2024_04_05_053711_remove_title_in_challenges_table', 28),
(59, '2024_05_03_113613_add_customer_id_in_users_table', 29),
(60, '2024_05_06_053144_make_column_field_nullable_in_users_table', 30),
(61, '2024_05_07_061041_add_column_connect_in_users_table', 30),
(62, '2024_05_07_091318_add_status_column_in_withdraw_histories_table', 31),
(63, '2024_05_14_121111_add_column_status_in_challenges_table', 32),
(64, '2024_05_16_091030_create_forfeit_challenges_table', 33),
(65, '2024_05_16_091450_add_comment_in_ready_lounges_table', 33),
(66, '2024_05_29_053604_add_type_column_in_withdraw_histories_table', 34),
(67, '2024_05_29_054047_create_withdraw_history_cards_table', 34),
(68, '2024_05_30_110015_change_comment_column_nullable_in_challenger_record_submissions_table', 35),
(69, '2024_06_03_101708_add_waiting_time_column_in_settings_table', 36),
(70, '2024_06_03_104450_add_waiting_time_column_in_ready_lounges_table', 36),
(71, '2024_06_03_114952_update_timestamps_in_challenge_record_submissions_table', 36),
(72, '2024_06_03_124551_add_submitted_record_time_in_challenger_record_submissions_table', 36),
(73, '2024_06_05_105627_change_column_type_in_settings_table', 37),
(74, '2024_06_05_111357_change_column_types_in_challenge_attempts_table', 38),
(75, '2024_06_25_090754_add_privacy_policy_column_in_settings_table', 39);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('00118c8c-44e2-4d88-af73-d3ca987039d3', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 10, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('0221ede8-009d-4119-a0fc-bf99ac53e48b', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 148, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('071550bd-0071-4bce-9074-76d7f418a239', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 133, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('0814185a-01b9-49f9-b4eb-9e6d8ab143f9', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 154, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('0886ea9f-f574-4602-92d2-06cc52d50912', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 5, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('08da4286-da39-4290-8ff0-588bc400a66e', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 149, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('0a0bf7a8-5edb-48ab-ad6f-dc8baaa0a5d4', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 132, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('0ad7d5ef-8b1d-4cb1-b209-d784c6693910', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 140, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('0b43330a-06c3-49ed-844c-7d0aaba25e93', 'App\\Notifications\\NewCardAdded', 'App\\Models\\User', 129, '{\"notification\":\"notification_message.card_linked\",\"id\":49,\"message\":\"notification_message.card_linked\'\",\"card_id\":\"card_5979ec05ee6e737980dcf90b48ebf180\",\"last_4_digit\":null,\"redirect_url\":\"https:\\/\\/sandboxcheckout.rapyd.net\\/3ds-payment?token=payment_b5c5ab29e019f3ee5ead1649b6d561ea\",\"card_brand\":null,\"type\":\"card_added\"}', NULL, '2024-04-02 04:08:59', '2024-04-02 04:08:59'),
('0b5a13a9-2ab2-4280-a343-d10c8343895e', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 24, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('0b92b519-ed9e-4450-9381-6bac952872df', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 134, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('0c44a964-7b5f-4779-b7dd-82a6f402cd86', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 152, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('1213b697-98a3-48d5-aa22-5c5f9c4c4772', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 144, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('17657c13-287a-4e50-887e-f804f17d256c', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 149, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('19b00a1d-08fb-4975-8d83-c967f5340451', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 22, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('1c13e591-94a3-4503-bc36-cf26548457a8', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 148, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('1cfc8651-fa6a-4a1e-bdc8-3723480ff0fe', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 7, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('1f82db69-c0f7-4a98-adad-535a86c48a6e', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 139, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('24256c34-f51b-45f2-bd99-7807a827e4e2', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 155, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('285d14a5-af6a-444b-903b-7ee1f3590a1e', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 8, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('2a4ea468-28fa-40cd-a93a-e861147f22a9', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 140, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('2c987218-272b-4fea-bb09-11716b98f492', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 141, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('3077d06e-7f4e-4f4d-8a0a-37afe94d1386', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 160, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('338b27bd-0f60-4b7a-b701-f3b0786508e7', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 131, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('3525e80d-ddfa-41d8-8c14-ec7d979e64ec', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 26, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('374a5c7f-316a-4dde-be57-fbec03adc1c9', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 153, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('44bee701-7dc2-4a18-96dd-63907fa29f0a', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 133, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('45d01e2f-7afd-466b-9990-0a4feae87635', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 133, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('487ee347-4324-4a93-bfe6-ba232f990264', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 7, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('4894b89b-0b42-4093-8cb7-6a81f04ee889', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 145, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('4cf51cd6-1ac3-46ab-9713-2d17a3bbb42b', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 4, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('4ecc6b1d-d5f6-4982-a38c-3359c01ab892', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 130, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('5023a305-89b1-40a1-a028-4d0a8cce8da4', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 161, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('50a0d8e4-876d-4884-8e1e-99f98c5ff2cc', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 129, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('50cb34ad-bfa0-4d1d-8e4d-f73dd1a47998', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 156, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('526e3305-7fda-46dc-bb7d-f829cb660c41', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 136, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('54cf592b-dbab-405f-951e-314f06616dd0', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 167, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('5b998f5a-d82a-489a-890a-25dfb35aa2d4', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 166, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('5c663c76-8f40-48c7-984f-473e41dcbee9', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 135, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('5e17a159-e069-4bb3-8890-5e53b6164443', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 130, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('60605504-f6df-4ddf-89d7-3b85924350fc', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 9, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('60921f64-3733-4059-85dd-a9781ad6f465', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 20, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('6231b97e-9299-4eea-8c24-b80229bbc9a5', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 25, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('626dde28-168b-454c-a0db-3dafbc723934', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 142, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('63fecf3d-91b5-44ba-a3a1-8ad585b05903', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 165, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('64ebc7f9-7d76-4e4f-8e57-de799680bb09', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 4, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('656c5891-c675-4db8-ae1d-e336efa4a9c8', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 2, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('66d7d162-59cb-4139-b5ef-df1a70aa5694', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 143, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('6796b2cc-0afd-4569-89ae-d4aa70b9c7b4', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 25, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('6a1107a6-2ba6-4c5d-9392-9e03e73831db', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 22, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('6ac1d4b9-a475-44f6-9c93-c62844353d28', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 130, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('6c506eff-52b4-4ddd-9b66-ffe209e15c1a', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 25, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('6c88de36-8e71-4743-9383-16d1fbe0c7dc', 'App\\Notifications\\NewCardAdded', 'App\\Models\\User', 129, '{\"notification\":\"__(\'notification_message.card_linked\')\",\"id\":47,\"message\":\"__(\'notification_message.card_linked\')\",\"card_id\":\"card_bc9489a955e9e3175a6c81132efa2df5\",\"last_4_digit\":null,\"redirect_url\":\"https:\\/\\/sandboxcheckout.rapyd.net\\/3ds-payment?token=payment_a3724fb2efcfa0d11a2f2c5ba608b4c2\",\"card_brand\":null}', NULL, '2024-04-02 04:05:50', '2024-04-02 04:05:50'),
('6d115d02-5dcf-4d50-931b-abee72c9ff6d', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 159, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('6fb967f6-8216-462d-93cb-8dc1fd27d42f', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 162, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('71cdeeb2-8416-4e3f-b34d-c0e472b28a34', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 137, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('72e8f679-c662-46aa-bac7-018e369b0c9f', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 129, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"50.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-04-02 04:24:28', '2024-04-02 04:24:28'),
('734d5bb5-d150-47fa-b4fd-454dc5550df4', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 26, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('73bfe127-0ec5-49ff-b406-7af5c86f2c11', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 132, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('74e0b1c1-260c-461d-9fe2-58a4dcebf1e6', 'App\\Notifications\\NewCardAdded', 'App\\Models\\User', 131, '{\"notification\":\"notification_message.card_linked\",\"id\":55,\"message\":\"notification_message.card_linked\'\",\"card_id\":\"card_b02332ec616ad58fb068375900079e3a\",\"last_4_digit\":null,\"redirect_url\":\"https:\\/\\/sandboxcheckout.rapyd.net\\/3ds-payment?token=payment_f8c61bb621a795c1cb81fd6dc07da36b\",\"card_brand\":null,\"type\":\"card_added\"}', NULL, '2024-04-23 07:07:26', '2024-04-23 07:07:26'),
('753b4e79-4a89-4ae6-8891-770f4dd7d295', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 151, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('7576fd01-0c83-468b-b4fb-112fe3968a5c', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 135, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('7b4ccf0f-af9a-4399-a73f-4e7b3cbb878e', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 157, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('7c275bb4-ee9f-4cdc-93c4-eb26cb1472a8', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 19, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('7cd1f879-15e3-42f8-9956-e3e370148410', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 4, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('7f43776c-5e9c-46bd-bd20-4e8dbb40c883', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 150, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('810bcfa4-2371-48cb-b269-901438d64b41', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 146, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('838971ee-b7ed-45af-a2d8-87efaff9f428', 'App\\Notifications\\NewCardAdded', 'App\\Models\\User', 129, '{\"notification\":\"notification_message.card_linked\",\"id\":48,\"message\":\"notification_message.card_linked\'\",\"card_id\":\"card_acddc840709ce42197feec2eb83974c8\",\"last_4_digit\":null,\"redirect_url\":\"https:\\/\\/sandboxcheckout.rapyd.net\\/3ds-payment?token=payment_a22ffc34191834be6bf01180a9981137\",\"card_brand\":null}', NULL, '2024-04-02 04:07:26', '2024-04-02 04:07:26'),
('879c0e4b-5cfd-4395-82b6-f9ba609810cb', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 105, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('88a2d1ed-7564-46b4-8183-b8ff42508a5f', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 146, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('899ad840-e5bf-40b5-be8e-6be718e0aa0c', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 157, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('8a084977-e647-416a-8e27-da54b43aad47', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 20, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('8c39d8ea-fbeb-40ae-988c-8e626b086e1c', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 147, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('8e3b9716-e98e-4dbd-953d-f616e9a01fa9', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 131, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('8f9e4685-4007-405b-a059-ca566e3d2f5f', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 6, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('90c0640e-bef3-407a-a44b-1e0fa542c89f', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 27, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('97553347-d9a4-4d0f-8c7f-55386d924a72', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 142, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('98fcedaa-f5f8-4255-81b7-ab6122fde03f', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 164, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('9c46c98a-3e80-4172-ba24-08eef7ce8e7b', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 24, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('9cd52dbd-e47d-463a-8709-5035114ab118', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 20, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('9d4f7668-c5a8-4a02-9931-cc6602c5bcb4', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 150, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('9f63bb56-1ba3-4888-add6-4b3972557e8e', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 147, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('a2969974-1286-462b-9498-2d4d53e8679f', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 158, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('a5cc554c-d651-47ab-b167-07d175d31596', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 139, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('a782213d-02c2-4f6f-9cec-0118d00f970d', 'App\\Notifications\\NewCardAdded', 'App\\Models\\User', 132, '{\"notification\":\"notification_message.card_linked\",\"id\":54,\"message\":\"notification_message.card_linked\'\",\"card_id\":\"card_c715769154e752fc86c797110fe163a8\",\"last_4_digit\":null,\"redirect_url\":\"https:\\/\\/sandboxcheckout.rapyd.net\\/3ds-payment?token=payment_28ace5aa98a36d6822364b6f12ece2e6\",\"card_brand\":null,\"type\":\"card_added\"}', NULL, '2024-04-17 07:09:27', '2024-04-17 07:09:27'),
('a9d99c69-5fd2-4958-98c3-48247d3906ea', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 152, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('aa3011bc-4a6a-4254-b3d8-402af83346f5', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 141, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('ad0b1368-1a2f-4ef8-a4c2-4eb00c5d650c', 'App\\Notifications\\NewCardAdded', 'App\\Models\\User', 129, '{\"notification\":\"Credit Card has been linked\",\"id\":46,\"message\":\"Credit Card has been linked\",\"card_id\":\"card_1d1d4a8890b5d7f1b4483762493270b9\",\"last_4_digit\":null,\"redirect_url\":\"https:\\/\\/sandboxcheckout.rapyd.net\\/3ds-payment?token=payment_7562c01a9fb2b79b39f8f39ee7728837\",\"card_brand\":null}', NULL, '2024-04-02 03:55:55', '2024-04-02 03:55:55'),
('ad8652a1-bc9a-4a86-884e-d05bd5ed424c', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 3, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('af3156e0-a423-4832-b189-7713149a7988', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 169, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('aff21288-3789-47a6-ae18-0ab8cd172dec', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 22, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('b33cb1dd-e63e-4cd7-b2ac-4f0e84e54f2c', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 7, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('b39b305e-2f3e-4f1f-8f02-e07bcb76dd6c', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 8, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('b43b0700-4c6b-4a89-902e-5eaeefc3666f', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 138, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('b76377f7-c793-4611-980f-c21b8de0626f', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 129, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('b772ca4f-3dad-435f-b5fe-feff622dd5b2', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 105, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('b840495f-fc5f-4f95-a46c-d12cfbcd843b', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 10, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('b886ee87-1ae3-424b-8997-d90b77baa696', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 24, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('b8b4fcb5-6809-4512-824b-7f52c8939ca8', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 105, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('b94da804-b840-4bd6-ab9a-c6f53dd47d82', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 145, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('b9f94cc6-6c90-4bbe-a062-87236d1a83a7', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 27, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('bf3a361a-5b07-4338-b7d3-1fe58607905c', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 158, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('c02afccd-b570-4026-a7e7-cf66b2ad0fb2', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 9, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('c1958ade-61ae-4a6f-acc0-a5747c23b4dc', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 163, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('c442acbe-ee9d-4484-91fd-31d23d2d65ce', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 131, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('c4d1bb05-4d70-4c84-8cc2-a5a532def6f0', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 3, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('c6871fd2-dafd-465c-bd7a-27b8d706eb2d', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 144, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('c6aa4210-6994-4ded-9bdb-d4859e8ab3b3', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 143, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('c6dd9bf2-0296-4b42-9044-aab3acf2afa8', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 153, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('ca93433d-195f-4355-8d62-8fa27089587f', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 6, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('cbb6ba39-52f5-487d-93e3-32493bb4a206', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 138, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('cc25f527-a562-48eb-a3b0-3bba58527633', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 159, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('cc4ad4b7-7958-4209-b107-c1c9d9bf217a', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 5, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('cc9d3b8b-1cd7-4372-9eda-6188e0acf012', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 8, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('d0f1fabe-ab70-405c-8684-8cc6b7b1f6c6', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 132, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('d427ed4a-7f52-4dc7-9029-911fef74aa2e', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 137, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('d58c64af-b12a-4fc9-877d-9bd8540d7ffe', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 9, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('d7f86003-dcfb-4c47-b071-a7651074a6fb', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 19, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('d9a15dd1-c1f4-4e75-9909-28fde06de49b', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 6, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('da232b93-5722-4f32-b1ba-8218393d7a18', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 134, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('da62a507-be21-4a6a-bd9f-269753021fba', 'App\\Notifications\\NewCardAdded', 'App\\Models\\User', 132, '{\"notification\":\"notification_message.card_linked\",\"id\":56,\"message\":\"notification_message.card_linked\'\",\"card_id\":\"pm_1PCMWkKxgIbBTP6dPeNTSrmP\",\"last_4_digit\":null,\"redirect_url\":null,\"card_brand\":null,\"type\":\"card_added\"}', NULL, '2024-05-03 08:51:54', '2024-05-03 08:51:54'),
('dc9ccf13-6405-49bf-a2f5-b9e8a4ed9500', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 155, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('dd7a4e65-a05c-41a3-9775-30f045b93b70', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 27, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('ddd270fb-c095-4af1-a402-80fb952899a5', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 2, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('e152cd5b-8a1c-4f13-85f0-637c346b93c7', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 136, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('e171f606-4242-41f0-8f6a-2b25da8ecd78', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 151, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('e371bf3e-5192-45dd-80c9-764846778d7d', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 129, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('eb773660-ec61-4f69-bba8-c032ad3a2cac', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 5, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('ec2092b0-8174-42d3-a544-cf6b3dd1b33f', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 170, '{\"id\":7,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1000.00\",\"title\":\"Challenge 5\",\"type\":\"pack_added\"}', NULL, '2024-06-14 16:34:43', '2024-06-14 16:34:43'),
('f04a9691-5fb3-406f-a901-85c1fe82cb18', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 154, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('f1ac1b0c-1e80-48f7-93e3-fd9e0019a256', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 10, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('f2544632-6efb-4827-8d38-6209bc62c3f1', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 19, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('f4da081e-c3f4-4d89-8a5e-09024084f4fe', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 26, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50'),
('f5dc2530-4229-411e-b15b-672bfd336632', 'App\\Notifications\\NewCardAdded', 'App\\Models\\User', 156, '{\"notification\":\"notification_message.card_linked\",\"id\":57,\"message\":\"notification_message.card_linked\'\",\"card_id\":\"pm_1PCMyBKxgIbBTP6dmlk4Q6JQ\",\"last_4_digit\":null,\"redirect_url\":null,\"card_brand\":null,\"type\":\"card_added\"}', NULL, '2024-05-03 09:20:16', '2024-05-03 09:20:16'),
('f8ca4626-c13c-4eac-aa1b-07a54e161af8', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 134, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message\":\"notification_message.newChallenge 4notification_message.available\",\"price\":\"notification_message.price\",\"title\":\"notification_message.title\"}', NULL, '2024-04-02 04:22:09', '2024-04-02 04:22:09'),
('fc81e689-4c7a-4b8d-91b5-73cedff72e04', 'App\\Notifications\\PopularPackCreateNotification', 'App\\Models\\User', 156, '{\"id\":6,\"notification\":\"notification_message.new_category_challenge\",\"message1\":\"notification_message.new\",\"message2\":\"notification_message.available\",\"price\":\"1.00\",\"title\":\"Challenge 4\",\"type\":\"pack_added\"}', NULL, '2024-05-13 05:02:50', '2024-05-13 05:02:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(8, 'App\\Models\\User', 18, 'ChalleApp', '02b6dc939515e94c3b59434db529475be17f76de5111a9a514668a654396db8d', '[\"*\"]', NULL, NULL, '2024-03-14 05:50:18', '2024-03-14 05:50:18'),
(9, 'App\\Models\\User', 19, 'ChalleApp', 'd5f023f5e08e90d12074afeb4907b84d1d32e20ca4f859662330e45782700164', '[\"*\"]', NULL, NULL, '2024-03-14 05:50:35', '2024-03-14 05:50:35'),
(16, 'App\\Models\\User', 20, 'ChalleApp', '2ad9de008672fe5b7884743b706cb4cb0c3f7d69272c5e3bdd2aa100bd9744a2', '[\"*\"]', '2024-03-20 04:31:54', NULL, '2024-03-14 05:59:03', '2024-03-20 04:31:54'),
(17, 'App\\Models\\User', 22, 'ChalleApp', 'a3ec6a9b81949b7c5b5f4fc66021226370ff0bea69e6f260dc759388ed62329e', '[\"*\"]', NULL, NULL, '2024-03-18 01:10:26', '2024-03-18 01:10:26'),
(18, 'App\\Models\\User', 22, 'ChalleApp', '92a08e8a8769e209964eabcec4a25934d9e659675d8ba214599b548383724460', '[\"*\"]', NULL, NULL, '2024-03-18 01:38:18', '2024-03-18 01:38:18'),
(19, 'App\\Models\\User', 22, 'ChalleApp', '801fbfb5440eec0f94038ee3cac751a91e416a2cfc3baedf6ffb848ff0eae24c', '[\"*\"]', NULL, NULL, '2024-03-18 01:44:40', '2024-03-18 01:44:40'),
(20, 'App\\Models\\User', 22, 'ChalleApp', '3ad703581fe136640d4823a0b78ad68f18a897261bbdd6b39c361d80a5a8bee0', '[\"*\"]', NULL, NULL, '2024-03-18 01:44:45', '2024-03-18 01:44:45'),
(21, 'App\\Models\\User', 24, 'ChalleApp', '5d136f6c7e77f44569ef156f12e92ca1990b94a19cabbf15c50199f2320da3d8', '[\"*\"]', NULL, NULL, '2024-03-18 01:58:59', '2024-03-18 01:58:59'),
(22, 'App\\Models\\User', 25, 'ChalleApp', 'd2c616b75778e488c3005ee298b1d6dcccfdc46d893ed68246d7103615211540', '[\"*\"]', NULL, NULL, '2024-03-18 02:11:45', '2024-03-18 02:11:45'),
(23, 'App\\Models\\User', 26, 'ChalleApp', '4ae22d828594ce22312d6a7eb2cdd403f169986648ca5cd4cc71428e584dd3f7', '[\"*\"]', NULL, NULL, '2024-03-18 04:57:34', '2024-03-18 04:57:34'),
(24, 'App\\Models\\User', 20, 'ChalleApp', '0869e9156cfd0e8eb1dfcf91339f000fcf7a52567a2927d6b865b93e4678b850', '[\"*\"]', NULL, NULL, '2024-03-18 04:58:22', '2024-03-18 04:58:22'),
(103, 'App\\Models\\User', 22, 'ChalleApp', '4507aaa0f60dfcadd5ac9752bf4bdeb5857ed41574882e0fb5fa784cda9a4798', '[\"*\"]', NULL, NULL, '2024-03-21 02:53:15', '2024-03-21 02:53:15'),
(104, 'App\\Models\\User', 105, 'ChalleApp', '9d8d70e4d9ff21f638949327229715d9e8df97606a0c60ef3506490bb6ed3295', '[\"*\"]', NULL, NULL, '2024-03-21 02:53:34', '2024-03-21 02:53:34'),
(128, 'App\\Models\\User', 129, 'ChalleApp', '925a333bcf6a87bea5dd8321334499a7f23c67b7e80cc26d4c1f7c338c4f7a5f', '[\"*\"]', '2024-04-02 04:36:07', NULL, '2024-03-21 04:48:56', '2024-04-02 04:36:07'),
(132, 'App\\Models\\User', 131, 'ChalleApp', '3debd57953ca97659e39358534080369bac2187e67a35be07ddc42cc8c9579ea', '[\"*\"]', '2024-03-28 01:06:55', NULL, '2024-03-28 00:11:12', '2024-03-28 01:06:55'),
(134, 'App\\Models\\User', 131, 'ChalleApp', 'df8e23918a1c583ae30d63d83916589c3748245506307bde75943fe938a56370', '[\"*\"]', '2024-03-28 01:08:17', NULL, '2024-03-28 01:07:32', '2024-03-28 01:08:17'),
(135, 'App\\Models\\User', 131, 'ChalleApp', '9b5d81d12739c5d6b38b8b37291197750cfe1f1f9d521d39c5c5d24ca6cb0bc2', '[\"*\"]', '2024-03-28 01:14:07', NULL, '2024-03-28 01:08:34', '2024-03-28 01:14:07'),
(138, 'App\\Models\\User', 131, 'ChalleApp', 'ecb5481011169cab2675bf38f452c69844b8daaf16c20e91fda8f9956901c7c6', '[\"*\"]', '2024-03-28 01:14:51', NULL, '2024-03-28 01:14:50', '2024-03-28 01:14:51'),
(139, 'App\\Models\\User', 131, 'ChalleApp', 'e7a97533f37a8efb6a5b3ebdff973d9a7c7084f4abbebcd4a81c2a463d5a2ced', '[\"*\"]', '2024-03-28 04:18:08', NULL, '2024-03-28 01:14:51', '2024-03-28 04:18:08'),
(145, 'App\\Models\\User', 133, 'ChalleApp', '37368a6b47099119247de7f7a078570cdd77b7fa43d9df1e2d12f2947d780991', '[\"*\"]', '2024-03-29 02:42:25', NULL, '2024-03-29 00:26:15', '2024-03-29 02:42:25'),
(146, 'App\\Models\\User', 134, 'ChalleApp', '927307f5a2409333b4663e367cefcfcdfda640e1f1ba7bd6cbb7a9103f5b90e3', '[\"*\"]', '2024-03-29 06:28:08', NULL, '2024-03-29 02:50:38', '2024-03-29 06:28:08'),
(151, 'App\\Models\\User', 135, 'ChalleApp', 'ea944e76046558f5b227947ab0fbcc0bdfe49658310420f84d5f2fc677689f7e', '[\"*\"]', NULL, NULL, '2024-03-29 13:03:01', '2024-03-29 13:03:01'),
(152, 'App\\Models\\User', 135, 'ChalleApp', '8b18830d7f23379b3546b4c900c65ddd5cb639637cd650f454bdc5241896bff9', '[\"*\"]', NULL, NULL, '2024-03-29 13:04:53', '2024-03-29 13:04:53'),
(153, 'App\\Models\\User', 135, 'ChalleApp', '50fa847bc41dd1e3e84d90596b7bace9feb59bf9902136517c437e794665db85', '[\"*\"]', NULL, NULL, '2024-03-29 13:05:08', '2024-03-29 13:05:08'),
(156, 'App\\Models\\User', 137, 'ChalleApp', '307b4166b62ab8ef358577c269486da60298928e357d2983014c7f41d8bc75f2', '[\"*\"]', NULL, NULL, '2024-04-01 04:21:22', '2024-04-01 04:21:22'),
(157, 'App\\Models\\User', 131, 'ChalleApp', 'f952a1a2627cf77678dfcf77fd14ed4ded7d9fc5807017f68ee819985e285c4b', '[\"*\"]', '2024-04-23 07:07:24', NULL, '2024-04-01 04:21:39', '2024-04-23 07:07:24'),
(160, 'App\\Models\\User', 138, 'ChalleApp', '8fcc5d9277c7b284dd788669369005e81dadf7a8d73a05ae05d531f8fad4a829', '[\"*\"]', '2024-04-01 05:39:53', NULL, '2024-04-01 05:29:22', '2024-04-01 05:39:53'),
(161, 'App\\Models\\User', 139, 'ChalleApp', '2c6f0ad9f473c904d77e7cabf3cc1e99ce51185bbf590671ad1ce94f283d0ccc', '[\"*\"]', '2024-04-01 06:34:59', NULL, '2024-04-01 06:27:45', '2024-04-01 06:34:59'),
(166, 'App\\Models\\User', 140, 'ChalleApp', 'fa028454fb4c21ab551670128a62bc994633764f9bedf9b6b2534d66b1e2867e', '[\"*\"]', NULL, NULL, '2024-04-03 06:38:32', '2024-04-03 06:38:32'),
(167, 'App\\Models\\User', 140, 'ChalleApp', 'f85cfb2f49b9c43e3d609d5a6864f37ae40483fc6bfb3e964ac5b45dc2932697', '[\"*\"]', NULL, NULL, '2024-04-03 06:39:01', '2024-04-03 06:39:01'),
(168, 'App\\Models\\User', 140, 'ChalleApp', 'b5d2ae48a5ca60bbd52c92f3e7c50164a5a483c3b7ad1ac2ec2d06d8cf5a02d8', '[\"*\"]', NULL, NULL, '2024-04-03 06:39:58', '2024-04-03 06:39:58'),
(169, 'App\\Models\\User', 140, 'ChalleApp', '993c273e54d8212c0f5d84788eba3f689ccb4e86125282cedf4ba8a313229c80', '[\"*\"]', NULL, NULL, '2024-04-03 06:40:34', '2024-04-03 06:40:34'),
(170, 'App\\Models\\User', 140, 'ChalleApp', '6c75ec7c79b91aa4ecfa8dc5a003f59cbd9fe7ff3511afcaed4742f254fd271a', '[\"*\"]', NULL, NULL, '2024-04-03 06:41:04', '2024-04-03 06:41:04'),
(172, 'App\\Models\\User', 142, 'ChalleApp', '8e3f0f2588028580833faa42bc59fea3346435a5f49924a463d534c307abf0ac', '[\"*\"]', '2024-04-08 06:46:27', NULL, '2024-04-04 05:44:45', '2024-04-08 06:46:27'),
(194, 'App\\Models\\User', 144, 'ChalleApp', 'cd8b27019bef50ab15d0e92c1f03b181835882c08d747a7b1cdfafd588a8c7f2', '[\"*\"]', '2024-04-16 04:41:46', NULL, '2024-04-16 04:38:36', '2024-04-16 04:41:46'),
(195, 'App\\Models\\User', 144, 'ChalleApp', 'f2484be27a1563f358560f5ac5261787517e4e458b9db467fafdea3731657366', '[\"*\"]', NULL, NULL, '2024-04-16 04:45:28', '2024-04-16 04:45:28'),
(196, 'App\\Models\\User', 145, 'ChalleApp', 'f33f9f4cd2d8ffbb606afe7088d37a4f74b69102e21ca4b55354cdf6c4721ecd', '[\"*\"]', '2024-04-16 04:46:45', NULL, '2024-04-16 04:46:04', '2024-04-16 04:46:45'),
(197, 'App\\Models\\User', 146, 'ChalleApp', '738e6641a55ee9e1fc1897e847d173ce5bc6508712ed24b3c89a2360a50e70fe', '[\"*\"]', '2024-04-16 04:48:19', NULL, '2024-04-16 04:47:42', '2024-04-16 04:48:19'),
(198, 'App\\Models\\User', 147, 'ChalleApp', 'ca6f6782f131b91fdb475c39ffe410dcd54e699fc4b7ea8778090bf258f705bd', '[\"*\"]', '2024-04-16 04:51:55', NULL, '2024-04-16 04:51:24', '2024-04-16 04:51:55'),
(199, 'App\\Models\\User', 148, 'ChalleApp', '0eff55c3a4e658e21f52b0852564d7c6109942884435adc362d91db600539dbf', '[\"*\"]', NULL, NULL, '2024-04-16 05:14:26', '2024-04-16 05:14:26'),
(200, 'App\\Models\\User', 149, 'ChalleApp', 'fcc592a033598e20862cb4b6b4b48aed80e3e8c82cbfcc2578195e0d70e2bdf1', '[\"*\"]', NULL, NULL, '2024-04-16 05:18:40', '2024-04-16 05:18:40'),
(201, 'App\\Models\\User', 150, 'ChalleApp', 'a20c83b79dd2806d4547be61d4dba1a745068adae15a6b5b4a32dbcd2307d591', '[\"*\"]', '2024-04-16 05:30:39', NULL, '2024-04-16 05:25:40', '2024-04-16 05:30:39'),
(202, 'App\\Models\\User', 144, 'ChalleApp', '90fca71906dc2c46c4359de86001ff17bb616d4cf52e5c62d7e6aaa4f1eb15c8', '[\"*\"]', NULL, NULL, '2024-04-16 05:31:19', '2024-04-16 05:31:19'),
(203, 'App\\Models\\User', 146, 'ChalleApp', 'ef2bb2129707ec8ca98e11fcc6c6981b8e1972a8c32618fbdd3c525324a250a0', '[\"*\"]', NULL, NULL, '2024-04-16 05:32:37', '2024-04-16 05:32:37'),
(204, 'App\\Models\\User', 151, 'ChalleApp', '06d602c4a296c11d3d11c197b7d89c9e1b6982bc552d9ee95d41a1de7cd8cdcc', '[\"*\"]', NULL, NULL, '2024-04-16 05:33:18', '2024-04-16 05:33:18'),
(205, 'App\\Models\\User', 151, 'ChalleApp', 'fe9274801036f11ef4904d65159207d42a6f1b4a0963467473aaa83f70f0f9f2', '[\"*\"]', '2024-04-16 05:34:36', NULL, '2024-04-16 05:33:45', '2024-04-16 05:34:36'),
(206, 'App\\Models\\User', 152, 'ChalleApp', '973fcf0279cb0fa3b5a3772022e00d7043c9c5d265372e46f6ac423b6abd293d', '[\"*\"]', '2024-04-16 05:37:44', NULL, '2024-04-16 05:37:18', '2024-04-16 05:37:44'),
(207, 'App\\Models\\User', 153, 'ChalleApp', '6dd2b515398ec098e1f476f0ce9707024a52020998820516697a74e170c7a334', '[\"*\"]', '2024-04-16 05:40:04', NULL, '2024-04-16 05:39:34', '2024-04-16 05:40:04'),
(208, 'App\\Models\\User', 153, 'ChalleApp', '294917f6751eb685f29d600a22506a8810f3b5798d37923e60cc478627b94406', '[\"*\"]', NULL, NULL, '2024-04-16 05:51:45', '2024-04-16 05:51:45'),
(209, 'App\\Models\\User', 154, 'ChalleApp', '24e48d627bf244f3f7f0e16b0fe5a20ffde07cd489965fba0b3162c581251b38', '[\"*\"]', '2024-04-16 05:52:35', NULL, '2024-04-16 05:52:17', '2024-04-16 05:52:35'),
(232, 'App\\Models\\User', 155, 'ChalleApp', '68218289594a4a1ac9b1d6a4c4173a94e3a4f5aec0cecddaf4e8e2edf3382fa8', '[\"*\"]', NULL, NULL, '2024-04-24 02:23:22', '2024-04-24 02:23:22'),
(233, 'App\\Models\\User', 131, 'ChalleApp', '66d1373bb2bec015dc4a1941ecd69f9a87ef9d5c8b2f9fd8f94499ecb51208b5', '[\"*\"]', '2024-04-29 06:32:19', NULL, '2024-04-29 06:12:10', '2024-04-29 06:32:19'),
(234, 'App\\Models\\User', 134, 'ChalleApp', '839511a763c48eea566514b67935266c56ab6f32d9c9fd65e6d80ad11d1e0c8d', '[\"*\"]', '2024-04-30 07:05:25', NULL, '2024-04-30 07:02:27', '2024-04-30 07:05:25'),
(248, 'App\\Models\\User', 157, 'ChalleApp', '723d46d7d85224c2b35739025b5baf91c06a75a2b2ce971b0ab0e32d16098869', '[\"*\"]', '2024-05-07 10:18:55', NULL, '2024-05-07 10:17:56', '2024-05-07 10:18:55'),
(249, 'App\\Models\\User', 158, 'ChalleApp', 'de8020272218bdcd38a7b29b5d214888220639e669671d01ff3982d850a671e5', '[\"*\"]', '2024-05-07 10:22:37', NULL, '2024-05-07 10:22:07', '2024-05-07 10:22:37'),
(250, 'App\\Models\\User', 159, 'ChalleApp', 'c8e6acc1b452d3a3f0d78a9ef91c6d0911a91380b8933494d6bc9af63156d2b2', '[\"*\"]', '2024-06-14 16:29:04', NULL, '2024-05-07 13:38:31', '2024-06-14 16:29:04'),
(259, 'App\\Models\\User', 160, 'ChalleApp', 'da27708c0b66239708e59f467f325d8d894ebfd48a01b7039bb499e2ce02b085', '[\"*\"]', NULL, NULL, '2024-05-13 05:24:09', '2024-05-13 05:24:09'),
(274, 'App\\Models\\User', 161, 'ChalleApp', 'f8bcfa45d86e7fac344fa7a5a08c5ceb872cdf34de31e348544edbecb50d0cf0', '[\"*\"]', '2024-05-15 06:00:18', NULL, '2024-05-15 05:56:20', '2024-05-15 06:00:18'),
(277, 'App\\Models\\User', 162, 'ChalleApp', 'dfaed95a4f7be39df4d56b488c22fa2c534c48b1d0085cf5589acc7c6454f9c5', '[\"*\"]', '2024-05-15 06:47:30', NULL, '2024-05-15 06:45:25', '2024-05-15 06:47:30'),
(284, 'App\\Models\\User', 163, 'ChalleApp', 'd2266898f7b25739ae4f3f967143382eff66a9d34619d139dcb357ee821a4af5', '[\"*\"]', '2024-05-17 04:50:23', NULL, '2024-05-17 02:57:49', '2024-05-17 04:50:23'),
(292, 'App\\Models\\User', 142, 'ChalleApp', 'f74320f04068e4f80f62001eff0f28c78cb4989e6af79c913e76e90a38d29bdd', '[\"*\"]', '2024-05-17 10:34:10', NULL, '2024-05-17 10:20:42', '2024-05-17 10:34:10'),
(293, 'App\\Models\\User', 165, 'ChalleApp', '7765996c34c46c8eb0ec534dd5b8a0647f754e192a8d682c8170deb12b6ff0ea', '[\"*\"]', NULL, NULL, '2024-05-18 04:29:45', '2024-05-18 04:29:45'),
(300, 'App\\Models\\User', 166, 'ChalleApp', '05c32a5c100c29c0f11664b5036408aa3f96b2618a71a3138507b9e6c503be67', '[\"*\"]', NULL, NULL, '2024-05-20 09:01:03', '2024-05-20 09:01:03'),
(304, 'App\\Models\\User', 142, 'ChalleApp', '91b47af32a52e1697c53ad33904db24569ed8fe60f395b6e8ce37cd408a9f70b', '[\"*\"]', '2024-05-21 14:07:52', NULL, '2024-05-21 07:33:54', '2024-05-21 14:07:52'),
(307, 'App\\Models\\User', 167, 'ChalleApp', '2db743399599fbad884bda682d530e10c5548565c90a348c93037a97381f7fd6', '[\"*\"]', NULL, NULL, '2024-05-24 06:13:28', '2024-05-24 06:13:28'),
(308, 'App\\Models\\User', 142, 'ChalleApp', 'b14ebc0bb73a8b02c1d00f2c806049b126487bc05316cb58bc7c2f94d8d7c871', '[\"*\"]', '2024-05-26 07:31:26', NULL, '2024-05-24 06:57:21', '2024-05-26 07:31:26'),
(316, 'App\\Models\\User', 142, 'ChalleApp', 'd7974e40854d02556f7cdf70ba379a5d7e8ba9b7b9d9542823f8b67a02e73103', '[\"*\"]', '2024-05-30 05:04:44', NULL, '2024-05-30 04:36:30', '2024-05-30 05:04:44'),
(317, 'App\\Models\\User', 142, 'ChalleApp', 'c74d6e685158a4cd20d2ef00db71f66f4fc1ec451eb9d68b67d7685841eb80b3', '[\"*\"]', '2024-06-02 03:36:04', NULL, '2024-05-31 08:58:44', '2024-06-02 03:36:04'),
(319, 'App\\Models\\User', 163, 'ChalleApp', '32dcfac33c80ef5ce4ec9af5a7a8abf982b1673e9a48bf33359f8f0ac60e2116', '[\"*\"]', '2024-06-03 02:43:19', NULL, '2024-06-03 02:43:19', '2024-06-03 02:43:19'),
(320, 'App\\Models\\User', 163, 'ChalleApp', '501667cabd4a535979bc2a48c3b62c1ad2c6c216f1047efacd85f097fc32a159', '[\"*\"]', '2024-06-03 02:57:48', NULL, '2024-06-03 02:57:44', '2024-06-03 02:57:48'),
(323, 'App\\Models\\User', 142, 'ChalleApp', 'dfb353a4349204fedef71fa323e06ec768c2aa08260c1787b1d00addaa112296', '[\"*\"]', '2024-06-04 11:16:45', NULL, '2024-06-04 10:39:23', '2024-06-04 11:16:45'),
(324, 'App\\Models\\User', 159, 'ChalleApp', 'aafb6628f82a430335b45c29c214c1ab1c8755e4abc91348f729d5df8b4ce9a0', '[\"*\"]', '2024-06-05 13:38:58', NULL, '2024-06-05 08:44:43', '2024-06-05 13:38:58'),
(326, 'App\\Models\\User', 20, 'ChalleApp', '1894c754a33956d1c7e34d780a66a31a21868d9fd54ec959cbde4fcf68c71f34', '[\"*\"]', '2024-06-11 02:42:17', NULL, '2024-06-06 05:38:48', '2024-06-11 02:42:17'),
(327, 'App\\Models\\User', 163, 'ChalleApp', '3c0168f563fc8080189692a9e7a94e181684bfe947ff977b6a36a73a841709ac', '[\"*\"]', '2024-06-10 01:31:45', NULL, '2024-06-10 00:16:03', '2024-06-10 01:31:45'),
(351, 'App\\Models\\User', 6, 'ChalleApp', '2488bf17353def68da017011c1280dd7fb88b43fe06accb851edb542a54422ec', '[\"*\"]', '2024-06-13 07:32:46', NULL, '2024-06-13 06:34:48', '2024-06-13 07:32:46'),
(354, 'App\\Models\\User', 163, 'ChalleApp', 'bf168b670e6a18bb9ce1393350e39011474efd1b6459e490e773a28c821a40be', '[\"*\"]', '2024-06-14 12:09:59', NULL, '2024-06-14 12:09:20', '2024-06-14 12:09:59'),
(355, 'App\\Models\\User', 170, 'ChalleApp', '45383d5499d811f5d50531d5e6d6d35a3256279571c9b9b68d5b578efdf45200', '[\"*\"]', '2024-06-14 12:45:43', NULL, '2024-06-14 12:12:52', '2024-06-14 12:45:43'),
(356, 'App\\Models\\User', 170, 'ChalleApp', 'c1206e62ce75173e5e7a6067b7500a1d1e5fa19a5cb89dbf96ece31efb8b815f', '[\"*\"]', '2024-06-14 13:22:57', NULL, '2024-06-14 12:46:39', '2024-06-14 13:22:57'),
(357, 'App\\Models\\User', 170, 'ChalleApp', 'b14fa92fc788793ceced41f449ee0ff5e557afa3a4123c80a2cd59f45898d706', '[\"*\"]', '2024-06-14 14:29:56', NULL, '2024-06-14 13:39:03', '2024-06-14 14:29:56'),
(359, 'App\\Models\\User', 159, 'ChalleApp', '94b20b173326c910d71760a2a27dfb243ba96ce63c867e6d8ae6932b34308986', '[\"*\"]', '2024-06-19 05:42:45', NULL, '2024-06-14 16:30:24', '2024-06-19 05:42:45'),
(360, 'App\\Models\\User', 163, 'ChalleApp', '5c0872f8c9eb193487aee64fb6df82142d5324625b15763e6c5a9ed5693f0675', '[\"*\"]', '2024-06-20 11:04:14', NULL, '2024-06-16 04:03:45', '2024-06-20 11:04:14'),
(363, 'App\\Models\\User', 171, 'ChalleApp', '23d29a34d6b4bb7cd92af3be10bf15e3d78aa237c9c1b6a0de953a86e9c66a55', '[\"*\"]', NULL, NULL, '2024-06-20 12:20:46', '2024-06-20 12:20:46'),
(364, 'App\\Models\\User', 172, 'ChalleApp', 'a0ef33cf638767500b00b59565c35df8f22db8f2a42970c8dd86fb5449418853', '[\"*\"]', '2024-06-20 12:26:04', NULL, '2024-06-20 12:21:48', '2024-06-20 12:26:04'),
(365, 'App\\Models\\User', 173, 'ChalleApp', '5fda47b4a356f8aad237eab4d79bc1aade70fde4c07868a00a3984e1cc53e7bf', '[\"*\"]', NULL, NULL, '2024-06-20 12:23:14', '2024-06-20 12:23:14'),
(366, 'App\\Models\\User', 174, 'ChalleApp', '0b27be586c3a462f5caa2d24ead92a4e35fe65a12e06472eb84d10c07be65bd8', '[\"*\"]', '2024-06-20 12:30:50', NULL, '2024-06-20 12:29:36', '2024-06-20 12:30:50'),
(367, 'App\\Models\\User', 174, 'ChalleApp', 'fdca6c8967f52a08960a02ee1e6cf88d6666436e3842b958080bd9bfb90301aa', '[\"*\"]', NULL, NULL, '2024-06-20 12:31:00', '2024-06-20 12:31:00'),
(368, 'App\\Models\\User', 175, 'ChalleApp', 'ab8e62693baa49eb0d2a13894e394f68903f3756cfdc42ad280b47aa6a5bc2a2', '[\"*\"]', NULL, NULL, '2024-06-20 12:32:31', '2024-06-20 12:32:31'),
(369, 'App\\Models\\User', 176, 'ChalleApp', 'e6164186c4f0802a5693efc1a56ff6ef5bcb06f420b91295825921f7eefe5ed5', '[\"*\"]', '2024-06-20 12:34:53', NULL, '2024-06-20 12:33:11', '2024-06-20 12:34:53'),
(370, 'App\\Models\\User', 175, 'ChalleApp', '55fe883bc648bdc9125d388fc3956efec9de9216086e977309a9e1c9f94ea7cc', '[\"*\"]', NULL, NULL, '2024-06-20 12:33:21', '2024-06-20 12:33:21'),
(372, 'App\\Models\\User', 177, 'ChalleApp', 'b961793abc90b4208e60ab103d9e01f4166b648aa69a745102ed4bea4e2e5c18', '[\"*\"]', NULL, NULL, '2024-06-20 12:48:26', '2024-06-20 12:48:26'),
(373, 'App\\Models\\User', 177, 'ChalleApp', 'e0cc08773f044b1adfc2a9b17f6f6e30df3e4118a9aa1a821187f01eb66281d1', '[\"*\"]', NULL, NULL, '2024-06-20 12:50:01', '2024-06-20 12:50:01'),
(374, 'App\\Models\\User', 178, 'ChalleApp', '2897cd11a9b0fe25cb3a87141067cafbb057828ebc402ab3b414a7c2d9252b69', '[\"*\"]', NULL, NULL, '2024-06-20 12:56:19', '2024-06-20 12:56:19'),
(377, 'App\\Models\\User', 179, 'ChalleApp', 'cd4342006f0ad0e895487ba2a8fa71c846aa2fff107a38bbdd829fe3f357acdb', '[\"*\"]', '2024-06-24 04:28:52', NULL, '2024-06-21 12:37:56', '2024-06-24 04:28:52'),
(378, 'App\\Models\\User', 180, 'ChalleApp', '4b3e2ff580c0da8701b7b88e32bc10e7a50f5644cab84fff21d3f60419d7e139', '[\"*\"]', '2024-06-22 05:37:51', NULL, '2024-06-22 05:36:55', '2024-06-22 05:37:51'),
(381, 'App\\Models\\User', 163, 'ChalleApp', '3057a5196ebcf7e47421c1c423a871f2bf3fb4ce6c2dada7e8fd125eba4c8ff6', '[\"*\"]', '2024-06-24 04:30:40', NULL, '2024-06-24 04:30:28', '2024-06-24 04:30:40'),
(382, 'App\\Models\\User', 181, 'ChalleApp', 'eb1304cef672b97cd65e84ec4a5aaa25260020b94655be02f0a25835a02f4ac7', '[\"*\"]', '2024-06-24 04:33:57', NULL, '2024-06-24 04:33:52', '2024-06-24 04:33:57'),
(383, 'App\\Models\\User', 182, 'ChalleApp', 'c29dcee3d5e35877109391e2d38e9ca99064577b874b964f2da4322e254dbeee', '[\"*\"]', '2024-06-24 04:36:41', NULL, '2024-06-24 04:36:37', '2024-06-24 04:36:41'),
(384, 'App\\Models\\User', 183, 'ChalleApp', '7f602e48f6d5f04ff3d219fb5e91f4c150d41d355d5a0363f81109ddc691586b', '[\"*\"]', '2024-06-24 04:39:44', NULL, '2024-06-24 04:36:57', '2024-06-24 04:39:44'),
(385, 'App\\Models\\User', 184, 'ChalleApp', '510e235338af78ad5f2504ca89d46796a4926947bf68fcc9b4d2065de174693f', '[\"*\"]', '2024-06-24 04:40:04', NULL, '2024-06-24 04:39:55', '2024-06-24 04:40:04'),
(386, 'App\\Models\\User', 184, 'ChalleApp', '560e491e40b33d35d2e2e83fdd8c4a0f9dbb815f6a4494746f8c6c46c49e996e', '[\"*\"]', '2024-06-24 04:41:51', NULL, '2024-06-24 04:40:46', '2024-06-24 04:41:51'),
(387, 'App\\Models\\User', 185, 'ChalleApp', '0787928f81fdaa36842e6341dbcf2efbb8466a251a926e1370014fefe3714a52', '[\"*\"]', NULL, NULL, '2024-06-24 04:42:04', '2024-06-24 04:42:04'),
(388, 'App\\Models\\User', 185, 'ChalleApp', '41d3bdd99cfa459f232cd046b79afcaf864ebf72338ef483a2674206b4e47593', '[\"*\"]', NULL, NULL, '2024-06-24 04:44:39', '2024-06-24 04:44:39'),
(389, 'App\\Models\\User', 185, 'ChalleApp', '5713c8dbccf140c6e3755011781a5e3857e1cf49c0e577a1c3a60e668aab84c4', '[\"*\"]', NULL, NULL, '2024-06-24 04:54:23', '2024-06-24 04:54:23'),
(390, 'App\\Models\\User', 185, 'ChalleApp', 'f501b73f9c386259f66342d3dd50361b96284a0ccb4a76822a3edeac68c6a574', '[\"*\"]', NULL, NULL, '2024-06-24 04:55:52', '2024-06-24 04:55:52'),
(391, 'App\\Models\\User', 185, 'ChalleApp', 'fb1f239d6512ca16db61d1c4fa78c18c32181c6770b075362802fe8c8de8e2e7', '[\"*\"]', '2024-06-24 05:11:32', NULL, '2024-06-24 05:06:16', '2024-06-24 05:11:32'),
(392, 'App\\Models\\User', 185, 'ChalleApp', 'da5584a0cf338568e5cb7b2ba67e18e1459450e884fb9131cef31285f63573eb', '[\"*\"]', NULL, NULL, '2024-06-24 05:11:49', '2024-06-24 05:11:49'),
(393, 'App\\Models\\User', 185, 'ChalleApp', '8f48a35fadd72259ed1984df4b3f83435529e290c006074c22b98f79dc79a723', '[\"*\"]', NULL, NULL, '2024-06-24 05:12:04', '2024-06-24 05:12:04'),
(394, 'App\\Models\\User', 185, 'ChalleApp', '4e0f0d329594d68660bc530add740e5f6ef2b1c22b08c8c59d09a423f2b6a212', '[\"*\"]', NULL, NULL, '2024-06-24 05:13:29', '2024-06-24 05:13:29'),
(395, 'App\\Models\\User', 185, 'ChalleApp', 'aa0be45a582827f322a636745ccd060b96b976516d23ef5ae75582f920fec9eb', '[\"*\"]', '2024-06-24 05:16:30', NULL, '2024-06-24 05:15:51', '2024-06-24 05:16:30'),
(396, 'App\\Models\\User', 186, 'ChalleApp', 'ea38ff28501c54ed2a06390575d327515801f1a5fc7cd458690a129bd6b1969b', '[\"*\"]', '2024-06-24 05:22:43', NULL, '2024-06-24 05:16:42', '2024-06-24 05:22:43'),
(397, 'App\\Models\\User', 187, 'ChalleApp', '4c325fcf45105f59ac6f354a5eb7e99efcbe5c9631efb2732c44bcfb479c0bfb', '[\"*\"]', '2024-06-24 05:23:55', NULL, '2024-06-24 05:22:54', '2024-06-24 05:23:55'),
(398, 'App\\Models\\User', 187, 'ChalleApp', '100680a1428a47350fabc6f01bfdd8915b2b015946b4bb3091d8eaca6db99281', '[\"*\"]', '2024-06-24 05:31:54', NULL, '2024-06-24 05:27:15', '2024-06-24 05:31:54'),
(399, 'App\\Models\\User', 188, 'ChalleApp', '37c5b6c5a08a5014d1f4e15bb834d9c2ab1fbf18b8a5a5124f7a8c8498dc1f44', '[\"*\"]', '2024-06-24 06:35:56', NULL, '2024-06-24 05:32:05', '2024-06-24 06:35:56'),
(400, 'App\\Models\\User', 189, 'ChalleApp', 'c2efe8cb593f795a1fb57c2928c0c7b5982ad4a7fd6bf5b132ad455f4f2a35f3', '[\"*\"]', NULL, NULL, '2024-06-24 10:36:26', '2024-06-24 10:36:26'),
(401, 'App\\Models\\User', 189, 'ChalleApp', '2ff823e749b03ce33274a65b95db2482728fb3d3da7cf8b9fb47dd08cbb550af', '[\"*\"]', NULL, NULL, '2024-06-24 10:37:04', '2024-06-24 10:37:04'),
(402, 'App\\Models\\User', 189, 'ChalleApp', 'e2d9d52be6111cd0592de55fb4bdc8a216e5261915625e2a6231cf507ad1b06b', '[\"*\"]', NULL, NULL, '2024-06-24 10:41:09', '2024-06-24 10:41:09'),
(403, 'App\\Models\\User', 189, 'ChalleApp', '7c81b530ee03d646b7332cb29715bf5507603d4b3eacdbc48c18b82494dc35c2', '[\"*\"]', NULL, NULL, '2024-06-24 10:41:40', '2024-06-24 10:41:40'),
(404, 'App\\Models\\User', 189, 'ChalleApp', '4597ea0f66c8209612b88e71b4aa78304e18ca027863304033796e0b92b6b88c', '[\"*\"]', '2024-06-24 10:50:27', NULL, '2024-06-24 10:47:10', '2024-06-24 10:50:27'),
(405, 'App\\Models\\User', 164, 'ChalleApp', '7597f6b1e81b5d1f3187d606e42863c867300b5fc7544d7f1cdeacc527e63764', '[\"*\"]', '2024-06-24 10:51:30', NULL, '2024-06-24 10:50:56', '2024-06-24 10:51:30'),
(407, 'App\\Models\\User', 188, 'ChalleApp', '528a2e889fee3fea2268fbbd986b1de292fa24702ec66ee8f3face48fd8732b6', '[\"*\"]', '2024-06-25 07:55:00', NULL, '2024-06-24 10:56:03', '2024-06-25 07:55:00'),
(411, 'App\\Models\\User', 188, 'ChalleApp', '232b0ca49e4cfcc408e0c93d8dcae06cb58c64662cb40dcd6a391b86127e7134', '[\"*\"]', '2024-06-27 09:21:49', NULL, '2024-06-25 07:46:06', '2024-06-27 09:21:49'),
(414, 'App\\Models\\User', 130, 'ChalleApp', 'a0e0cd64e763a76509b3b3fcd34210a96e31530c0e59a67529516f6581e4ddb7', '[\"*\"]', '2024-06-28 07:31:48', NULL, '2024-06-25 10:13:26', '2024-06-28 07:31:48'),
(419, 'App\\Models\\User', 191, 'ChalleApp', 'a0aefce78138e0b8fe3527e8813839c25af0c69966eb5263453c9ce77b839cb0', '[\"*\"]', NULL, NULL, '2024-06-25 11:35:33', '2024-06-25 11:35:33'),
(420, 'App\\Models\\User', 192, 'ChalleApp', 'ef9e2eef41432bfb6337349e9bac6a390e9812c88da933d4e1ae9a0699fecfa3', '[\"*\"]', NULL, NULL, '2024-06-25 12:33:20', '2024-06-25 12:33:20'),
(421, 'App\\Models\\User', 192, 'ChalleApp', 'b2fc62623d6d5a56cfc8474ab9ffcce4d5095d0c6c68c523acadd89053882cec', '[\"*\"]', NULL, NULL, '2024-06-25 12:33:43', '2024-06-25 12:33:43'),
(422, 'App\\Models\\User', 192, 'ChalleApp', '6d851cd0df3a51ce87f5ff2fa3cfca0e940e9c621a1988365406bb7167ee93e3', '[\"*\"]', NULL, NULL, '2024-06-25 12:34:11', '2024-06-25 12:34:11'),
(423, 'App\\Models\\User', 192, 'ChalleApp', '8539c7df42a14a28eb1f3a0b70dbd0c54cd69408e9026a033c46714585c61458', '[\"*\"]', NULL, NULL, '2024-06-25 12:36:47', '2024-06-25 12:36:47'),
(425, 'App\\Models\\User', 193, 'ChalleApp', '6ef21984127f0f1b284d4f9d6b2a03df3eec0cb9bbe6985648f47cc6123d9970', '[\"*\"]', NULL, NULL, '2024-06-25 13:44:27', '2024-06-25 13:44:27'),
(430, 'App\\Models\\User', 194, 'ChalleApp', '1600cc4e79c56c4028adbcba37412b172363dfcf1fbc667a9e38577babf433a5', '[\"*\"]', NULL, NULL, '2024-06-26 12:41:55', '2024-06-26 12:41:55'),
(432, 'App\\Models\\User', 157, 'ChalleApp', '972ccc2cc6574a6a10c004ad3da1f0138fd8d5bb732dfd9597afbd93da775611', '[\"*\"]', '2024-06-27 07:54:54', NULL, '2024-06-27 07:52:46', '2024-06-27 07:54:54'),
(434, 'App\\Models\\User', 195, 'ChalleApp', 'c2a8d810925343a9e02345c5efbff8f508248295ce22627859674e67200354a2', '[\"*\"]', '2024-06-27 07:59:12', NULL, '2024-06-27 07:58:49', '2024-06-27 07:59:12'),
(435, 'App\\Models\\User', 195, 'ChalleApp', 'daf82c0e4be02e06259ed6711dce0dfa2d0873a17bc1473781ae45c1e3f3a363', '[\"*\"]', '2024-06-27 08:04:01', NULL, '2024-06-27 08:03:42', '2024-06-27 08:04:01'),
(440, 'App\\Models\\User', 136, 'ChalleApp', '95d8c8273493825b8a6f95797c112e4cde136e7252ce81cda3a6a666c4a7312f', '[\"*\"]', '2024-06-27 08:07:20', NULL, '2024-06-27 08:06:09', '2024-06-27 08:07:20'),
(442, 'App\\Models\\User', 195, 'ChalleApp', '5d573f0b1cd6ec46f644148a695fd2dceec6dbbe8449f5ab12da87a9e357b25a', '[\"*\"]', '2024-06-27 14:48:09', NULL, '2024-06-27 08:21:22', '2024-06-27 14:48:09'),
(445, 'App\\Models\\User', 188, 'ChalleApp', 'bddec8b2b8d2d8fb4c0e257a91519ecfa8a0cbebc0b2ab6d4998f190f5de18b6', '[\"*\"]', '2024-06-27 10:28:48', NULL, '2024-06-27 10:25:54', '2024-06-27 10:28:48'),
(450, 'App\\Models\\User', 198, 'ChalleApp', 'c03bbdee06ab217c43e05b178a5660448ffaf8803187c73d21541f4a996236ee', '[\"*\"]', '2024-06-27 15:23:25', NULL, '2024-06-27 15:21:05', '2024-06-27 15:23:25'),
(451, 'App\\Models\\User', 199, 'ChalleApp', '14d0e4484c708a3860b60d4459729596d2538f58302b9deae0d9dd5a0527ab08', '[\"*\"]', NULL, NULL, '2024-06-27 19:32:14', '2024-06-27 19:32:14'),
(452, 'App\\Models\\User', 6, 'ChalleApp', 'ecd191875101c7f7e66f3b595be86984ad6f34d9dd2eed1859e43e44497e7894', '[\"*\"]', '2024-06-28 10:52:31', NULL, '2024-06-28 06:42:12', '2024-06-28 10:52:31'),
(453, 'App\\Models\\User', 130, 'ChalleApp', 'f11b70ccf618f416d7d1c79cb93ee9d2c26444085e05d3162896013b709a4d9b', '[\"*\"]', '2024-06-28 07:06:41', NULL, '2024-06-28 06:42:20', '2024-06-28 07:06:41'),
(454, 'App\\Models\\User', 188, 'ChalleApp', '45c3e35d5f04163565ee93193224af034ff49fce548a3edb949b7b6e17dd9ebb', '[\"*\"]', '2024-06-28 07:08:14', NULL, '2024-06-28 07:08:06', '2024-06-28 07:08:14'),
(455, 'App\\Models\\User', 188, 'ChalleApp', 'b1fa11d1fdd4d38f1ec159735a19d48d92239db64e09c83bba99c68e029fe935', '[\"*\"]', '2024-06-28 07:08:50', NULL, '2024-06-28 07:08:42', '2024-06-28 07:08:50'),
(456, 'App\\Models\\User', 200, 'ChalleApp', '0f13ac5b121582ddaf56bea4db2902a7e2392b880b542bf312e286e7b1204e92', '[\"*\"]', '2024-06-28 07:10:29', NULL, '2024-06-28 07:09:02', '2024-06-28 07:10:29'),
(457, 'App\\Models\\User', 201, 'ChalleApp', 'ea0727a34d386715442150e41e7dc51cffc983a468b001d1d3474e05d45ee4f3', '[\"*\"]', '2024-06-28 07:14:40', NULL, '2024-06-28 07:13:12', '2024-06-28 07:14:40'),
(458, 'App\\Models\\User', 202, 'ChalleApp', '108c0ebaeb58f0ed9bf47d45af8a323d5a9d91c0befc4c4330e52ef8be7d2d5d', '[\"*\"]', NULL, NULL, '2024-06-28 07:15:22', '2024-06-28 07:15:22'),
(459, 'App\\Models\\User', 201, 'ChalleApp', '355b8ad7e1d1fda034cbf3fc1612ad660d7df42f0334fe86703f83c187b9b3c3', '[\"*\"]', '2024-06-28 07:23:06', NULL, '2024-06-28 07:21:50', '2024-06-28 07:23:06'),
(460, 'App\\Models\\User', 130, 'ChalleApp', 'ca202f173a93d2921b65855f2ff07c2d6710054201e009a3694ca2afb14381e1', '[\"*\"]', '2024-06-28 16:18:32', NULL, '2024-06-28 07:29:02', '2024-06-28 16:18:32'),
(461, 'App\\Models\\User', 201, 'ChalleApp', 'eb361ea63662cd70e019989055bccc0162058eab38401567a090215b1075e8e9', '[\"*\"]', '2024-06-28 11:14:26', NULL, '2024-06-28 10:03:18', '2024-06-28 11:14:26'),
(463, 'App\\Models\\User', 203, 'ChalleApp', 'bdd72a8dd8da5caa2d94c76ea5ac391c881936a5e9cf84d2e5f6326a28e61d26', '[\"*\"]', '2024-06-28 11:24:43', NULL, '2024-06-28 11:14:41', '2024-06-28 11:24:43'),
(464, 'App\\Models\\User', 6, 'ChalleApp', 'ec601f6d5b7159c17d3a1097353be8668a6a902a93fd47aa8f01526dc3f9d439', '[\"*\"]', '2024-06-28 13:52:58', NULL, '2024-06-28 11:25:42', '2024-06-28 13:52:58'),
(473, 'App\\Models\\User', 156, 'ChalleApp', 'c7febaf9d94713b09ac941a56c84ed3eb023831eb0e29647c65341c95e3dfd67', '[\"*\"]', '2024-06-28 17:21:32', NULL, '2024-06-28 14:03:51', '2024-06-28 17:21:32'),
(475, 'App\\Models\\User', 190, 'ChalleApp', '2c8fb7b262bdfa6b49838b625bac9bd5950dc58d614717412c1c2301990b7357', '[\"*\"]', '2024-06-28 17:28:42', NULL, '2024-06-28 17:28:35', '2024-06-28 17:28:42'),
(476, 'App\\Models\\User', 204, 'ChalleApp', '4e838da687f36ad0f326f83b96ac6e4cf6aec8d8a8be5654094693a24edead3f', '[\"*\"]', '2024-06-28 17:30:21', NULL, '2024-06-28 17:29:06', '2024-06-28 17:30:21'),
(477, 'App\\Models\\User', 132, 'ChalleApp', '72043ccad651a2cdff7d94e6a2f52c299fae8b05cbd161189a39300d872c1bc2', '[\"*\"]', '2024-06-30 09:44:40', NULL, '2024-06-28 18:58:59', '2024-06-30 09:44:40'),
(478, 'App\\Models\\User', 205, 'ChalleApp', '3bb8b2d77e5500555aa8a2a57547b522c0236db617e2bb3fc54975d98f5dcd7f', '[\"*\"]', NULL, NULL, '2024-06-29 00:23:27', '2024-06-29 00:23:27'),
(479, 'App\\Models\\User', 205, 'ChalleApp', '8cfd2633b8ea3419632d309a634298a854bc83601b21ed389320eef0e8b22039', '[\"*\"]', NULL, NULL, '2024-06-29 00:23:45', '2024-06-29 00:23:45'),
(480, 'App\\Models\\User', 132, 'ChalleApp', 'fc640a2640539d7d89f9e7212d6c2a934b629f602d33f5a0ee8b55778e5c31ed', '[\"*\"]', '2024-06-29 00:26:00', NULL, '2024-06-29 00:25:27', '2024-06-29 00:26:00'),
(482, 'App\\Models\\User', 206, 'ChalleApp', '9f6c18b627e9af5cfce2053b288f973c2ff341bdad5931bdd86b484b5b496558', '[\"*\"]', '2024-06-29 10:15:31', NULL, '2024-06-29 10:14:02', '2024-06-29 10:15:31'),
(483, 'App\\Models\\User', 207, 'ChalleApp', 'faf32c7e6f23b05eac324a2ad24e98e3a874996156b25d324c36aa9f9e1812e7', '[\"*\"]', NULL, NULL, '2024-07-01 11:03:39', '2024-07-01 11:03:39'),
(484, 'App\\Models\\User', 213, 'ChalleApp', '0deebf4b6cab6c397df9c9c48a6a0f746178eb30fcdf29154453d9d2424229b0', '[\"*\"]', NULL, NULL, '2024-07-01 13:15:37', '2024-07-01 13:15:37'),
(485, 'App\\Models\\User', 213, 'ChalleApp', '402077689e9ce0721cf503942ab555886aec7b32fe4c39d1d8840bea27ea0391', '[\"*\"]', NULL, NULL, '2024-07-01 13:28:10', '2024-07-01 13:28:10'),
(486, 'App\\Models\\User', 213, 'ChalleApp', '2777291ec0757d3301d3835c847255dfddb08acce254663e7905105ab67a84a4', '[\"*\"]', '2024-07-02 08:57:42', NULL, '2024-07-01 13:30:52', '2024-07-02 08:57:42'),
(487, 'App\\Models\\User', 214, 'ChalleApp', 'e0a11f593c9628bdbfdf97e6273b014185417770e63693e11ea9cebce29a214b', '[\"*\"]', '2024-07-05 13:44:32', NULL, '2024-07-01 13:35:37', '2024-07-05 13:44:32'),
(488, 'App\\Models\\User', 215, 'ChalleApp', 'f016c810af742b2398d0ca122d60f6e803ffa7409faee360b9f8b60ecb271453', '[\"*\"]', '2024-07-03 15:30:42', NULL, '2024-07-01 19:02:51', '2024-07-03 15:30:42'),
(489, 'App\\Models\\User', 216, 'ChalleApp', 'f10b4c0aed11d7013a086495ef31a264c80ad9d6fb95e63dfa184b4d735ebc92', '[\"*\"]', '2024-07-01 19:27:30', NULL, '2024-07-01 19:25:16', '2024-07-01 19:27:30'),
(490, 'App\\Models\\User', 217, 'ChalleApp', '4bd685a1a511a1ca53583e3cdbaad3a0eafa988a3a6de4958ab136538213b4c4', '[\"*\"]', '2024-07-02 08:25:27', NULL, '2024-07-02 06:08:53', '2024-07-02 08:25:27'),
(491, 'App\\Models\\User', 218, 'ChalleApp', '8661661b59073b151b135aa7dcfd77d13006d6bac0f7a96ae3370daea32771ea', '[\"*\"]', '2024-07-02 09:31:14', NULL, '2024-07-02 06:57:55', '2024-07-02 09:31:14'),
(492, 'App\\Models\\User', 218, 'ChalleApp', '3fb9933c4eef1521a07d2862687e8077dad739facf7c0d4a7e68252957c273ea', '[\"*\"]', '2024-07-02 09:21:22', NULL, '2024-07-02 07:07:05', '2024-07-02 09:21:22'),
(493, 'App\\Models\\User', 219, 'ChalleApp', 'a2cce250069280ff1797d12e093e3b652535b28e6d9b79ee9d6f3627b7e5097f', '[\"*\"]', NULL, NULL, '2024-07-02 09:47:00', '2024-07-02 09:47:00'),
(494, 'App\\Models\\User', 213, 'ChalleApp', '5557a442d888eb57d9e502a15500821c0d157800db2f66669ba7eed5263841c1', '[\"*\"]', '2024-07-08 06:36:28', NULL, '2024-07-02 09:50:52', '2024-07-08 06:36:28'),
(496, 'App\\Models\\User', 221, 'ChalleApp', '61d8be3d2d50b12a021b9998671f36e10422781b8f2fb4aefe8bc10e5036c8f0', '[\"*\"]', '2024-07-02 18:01:05', NULL, '2024-07-02 17:57:31', '2024-07-02 18:01:05'),
(497, 'App\\Models\\User', 222, 'ChalleApp', 'e700b1da341db171e3781b8f36cf221995e6cf17b4eb6e9c9d1d1955fc40fae6', '[\"*\"]', '2024-07-03 09:20:14', NULL, '2024-07-03 09:18:42', '2024-07-03 09:20:14'),
(498, 'App\\Models\\User', 223, 'ChalleApp', '196ca936ac63be54f3d327c581c7e287caf45b2335fec90e65698f104255b66c', '[\"*\"]', NULL, NULL, '2024-07-03 10:19:16', '2024-07-03 10:19:16'),
(499, 'App\\Models\\User', 224, 'ChalleApp', '3378a4bd38222199f4b805bcffd8ecbb680c11bb2f46070881d6e9b36f46d4c1', '[\"*\"]', NULL, NULL, '2024-07-03 21:51:30', '2024-07-03 21:51:30'),
(500, 'App\\Models\\User', 224, 'ChalleApp', 'cc51c7a89ee06ad0bacc72fd3bcbfa7116fb0a2df7bb8cc4b19d98088ee52a2e', '[\"*\"]', NULL, NULL, '2024-07-03 21:54:09', '2024-07-03 21:54:09'),
(501, 'App\\Models\\User', 225, 'ChalleApp', 'aa5713e302d7c2bb700bec68b2c0e19816c15e768b8bc546bfef0887a91a799a', '[\"*\"]', NULL, NULL, '2024-07-04 13:39:32', '2024-07-04 13:39:32'),
(502, 'App\\Models\\User', 226, 'ChalleApp', '70f48ae11233027c98d8cc86c4d09816db25484d659d80f73a47415c7121bdbc', '[\"*\"]', '2024-07-04 14:40:07', NULL, '2024-07-04 13:42:02', '2024-07-04 14:40:07'),
(503, 'App\\Models\\User', 227, 'ChalleApp', 'fd10c202d7ee795695993046e035e77433b7754b447c73c84f2807d8914811af', '[\"*\"]', '2024-07-04 13:47:22', NULL, '2024-07-04 13:45:42', '2024-07-04 13:47:22'),
(504, 'App\\Models\\User', 228, 'ChalleApp', 'f38e5bc8f3f42ad1213a5f636205973271e93364954c7317adf868507bfb4fe5', '[\"*\"]', '2024-07-04 17:02:32', NULL, '2024-07-04 17:01:25', '2024-07-04 17:02:32'),
(505, 'App\\Models\\User', 229, 'ChalleApp', '864ab8cdf6a220c4c079391ff37962520b2caaa4ef8f33246bced7ad5c520290', '[\"*\"]', '2024-07-04 19:52:12', NULL, '2024-07-04 19:47:48', '2024-07-04 19:52:12'),
(506, 'App\\Models\\User', 230, 'ChalleApp', '56d80704b5acb14cfe3ade4c0ac9fc13d3d4f31a73d623b38ec02bea5db84f38', '[\"*\"]', NULL, NULL, '2024-07-06 12:34:04', '2024-07-06 12:34:04'),
(507, 'App\\Models\\User', 231, 'ChalleApp', 'f4fe9ce6975a2fd83db89f39475d13dc4c79d3b367d55a9b9bf1f044d60cd41d', '[\"*\"]', '2024-07-06 14:23:31', NULL, '2024-07-06 14:20:52', '2024-07-06 14:23:31'),
(508, 'App\\Models\\User', 232, 'ChalleApp', 'ebf5cfd75c63fec2a8bd9ce41010c6b47ca8a1fe14cddf0ba144113489835b97', '[\"*\"]', '2024-07-06 15:41:55', NULL, '2024-07-06 15:36:51', '2024-07-06 15:41:55'),
(509, 'App\\Models\\User', 233, 'ChalleApp', '8d12620c8d3f2235871c6001193eb0d4cb949a17a8c06fd2ca092b97968a6581', '[\"*\"]', NULL, NULL, '2024-07-07 07:11:28', '2024-07-07 07:11:28'),
(511, 'App\\Models\\User', 217, 'ChalleApp', 'd396ad0d84a2b73c1287b90d26634b8e7e0ccc8f73cdde15f618895ce152a89b', '[\"*\"]', '2024-07-09 12:10:44', NULL, '2024-07-09 12:06:57', '2024-07-09 12:10:44'),
(512, 'App\\Models\\User', 234, 'ChalleApp', 'd86aecedebfd90e31d0018ee3dd751ac4ab3cdee21986cabf2b2d1456733d4ac', '[\"*\"]', '2024-07-10 21:02:00', NULL, '2024-07-10 17:23:20', '2024-07-10 21:02:00'),
(513, 'App\\Models\\User', 235, 'ChalleApp', '3ada23d1f9662102134e95ffa9734bc3e6198b13b3e09ebbe8bcfdb98a4d9d50', '[\"*\"]', NULL, NULL, '2024-07-10 19:16:25', '2024-07-10 19:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `title`, `price`, `created_at`, `updated_at`) VALUES
(3, 'Challenge 1', 10.00, '2024-03-14 04:36:13', '2024-03-18 04:24:49'),
(4, 'Challenge 2', 50.00, '2024-03-14 04:36:20', '2024-05-24 06:07:23'),
(5, 'Challenge 3', 100.00, '2024-03-19 05:04:06', '2024-05-24 06:07:30'),
(7, 'Challenge 5', 1000.00, '2024-06-14 16:34:43', '2024-06-14 16:34:43');

-- --------------------------------------------------------

--
-- Table structure for table `ready_lounges`
--

CREATE TABLE `ready_lounges` (
  `id` bigint UNSIGNED NOT NULL,
  `waiting_lounge_id` bigint UNSIGNED NOT NULL,
  `user_1` bigint UNSIGNED NOT NULL,
  `user_2` bigint UNSIGNED NOT NULL,
  `user1_status` int NOT NULL DEFAULT '0' COMMENT '0=not_ready,1=ready,2=forfeit',
  `user2_status` int NOT NULL DEFAULT '0' COMMENT '0=not_ready,1=ready,2=forfeit',
  `waiting_time` int NOT NULL DEFAULT '0' COMMENT 'in_seconds',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ready_lounges`
--

INSERT INTO `ready_lounges` (`id`, `waiting_lounge_id`, `user_1`, `user_2`, `user1_status`, `user2_status`, `waiting_time`, `created_at`, `updated_at`) VALUES
(18, 30, 159, 141, 2, 2, 0, '2024-06-02 02:17:06', '2024-06-03 06:11:38'),
(45, 61, 141, 159, 1, 1, 120, '2024-06-05 08:47:37', '2024-06-05 08:48:00'),
(46, 62, 141, 159, 1, 1, 120, '2024-06-05 10:26:31', '2024-06-05 10:26:53'),
(140, 178, 159, 141, 1, 1, 120, '2024-06-14 16:30:57', '2024-06-14 16:31:10'),
(141, 179, 159, 141, 1, 1, 120, '2024-06-14 16:35:59', '2024-06-14 16:36:07'),
(153, 196, 141, 159, 1, 1, 120, '2024-06-18 08:25:59', '2024-06-18 08:26:41');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '2024-02-29 07:57:00', '2024-02-29 07:57:00'),
(2, 'User', '2024-02-29 07:57:00', '2024-02-29 07:57:00');

-- --------------------------------------------------------

--
-- Table structure for table `search_histories`
--

CREATE TABLE `search_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `search_term` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `search_histories`
--

INSERT INTO `search_histories` (`id`, `user_id`, `search_term`, `created_at`, `updated_at`) VALUES
(146, 218, 'flip', '2024-07-02 06:59:04', '2024-07-02 06:59:04');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint UNSIGNED NOT NULL,
  `company_commission` double(8,2) DEFAULT NULL,
  `challenge_creator_commission` double(8,2) DEFAULT NULL,
  `waiting_time` int NOT NULL DEFAULT '0' COMMENT 'in_seconds',
  `privacy_policy` text COLLATE utf8mb4_unicode_ci,
  `terms_conditions` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `company_commission`, `challenge_creator_commission`, `waiting_time`, `privacy_policy`, `terms_conditions`, `created_at`, `updated_at`) VALUES
(1, 12.55, 0.10, 120, '<p class=\"MsoNormal\">Privacy Policy<o:p></o:p></p><p class=\"MsoNormal\">Last updated: June 24, 2024<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Free Privacy Policy Generator.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Interpretation and Definitions<o:p></o:p></p><p class=\"MsoNormal\">Interpretation<o:p></o:p></p><p class=\"MsoNormal\">The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Definitions<o:p></o:p></p><p class=\"MsoNormal\">For the purposes of this Privacy Policy:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Account means a unique account created for You to access our Service or parts of our Service.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Affiliate means an entity that controls, is controlled by or is under common control with a party, where \"control\" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Application refers to Challe, the software program provided by the Company.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Company (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to Challe LLC, 2020 Menaul Boulevard Northeast.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Cookies are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Country refers to: New Mexico, United States<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Device means any device that can access the Service such as a computer, a cellphone or a digital tablet.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Personal Data is any information that relates to an identified or identifiable individual.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Service refers to the Application or the Website or both.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Service Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Third-party Social Media Service refers to any website or any social network website through which a User can log in or create an account to use the Service.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Usage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Website refers to Challe, accessible from Challe.us<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">You means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Collecting and Using Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">Types of Data Collected<o:p></o:p></p><p class=\"MsoNormal\">Personal Data<o:p></o:p></p><p class=\"MsoNormal\">While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Email address<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">First name and last name<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Phone number<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Address, State, Province, ZIP/Postal code, City<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Usage Data<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Usage Data<o:p></o:p></p><p class=\"MsoNormal\">Usage Data is collected automatically when using the Service.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Usage Data may include information such as Your Device\'s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Information from Third-Party Social Media Services<o:p></o:p></p><p class=\"MsoNormal\">The Company allows You to create an account and log in to use the Service through the following Third-party Social Media Services:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Google<o:p></o:p></p><p class=\"MsoNormal\">Facebook<o:p></o:p></p><p class=\"MsoNormal\">Instagram<o:p></o:p></p><p class=\"MsoNormal\">Twitter<o:p></o:p></p><p class=\"MsoNormal\">LinkedIn<o:p></o:p></p><p class=\"MsoNormal\">If You decide to register through or otherwise grant us access to a Third-Party Social Media Service, We may collect Personal data that is already associated with Your Third-Party Social Media Service\'s account, such as Your name, Your email address, Your activities or Your contact list associated with that account.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">You may also have the option of sharing additional information with the Company through Your Third-Party Social Media Service\'s account. If You choose to provide such information and Personal Data, during registration or otherwise, You are giving the Company permission to use, share, and store it in a manner consistent with this Privacy Policy.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Information Collected while Using the Application<o:p></o:p></p><p class=\"MsoNormal\">While using Our Application, in order to provide features of Our Application, We may collect, with Your prior permission:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Information regarding your location<o:p></o:p></p><p class=\"MsoNormal\">We use this information to provide features of Our Service, to improve and customize Our Service. The information may be uploaded to the Company\'s servers and/or a Service Provider\'s server or it may be simply stored on Your device.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">You can enable or disable access to this information at any time, through Your Device settings.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Tracking Technologies and Cookies<o:p></o:p></p><p class=\"MsoNormal\">We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Cookies or Browser Cookies. A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.<o:p></o:p></p><p class=\"MsoNormal\">Web Beacons. Certain sections of our Service and our emails may contain small electronic files known as web beacons (also referred to as clear gifs, pixel tags, and single-pixel gifs) that permit the Company, for example, to count users who have visited those pages or opened an email and for other related website statistics (for example, recording the popularity of a certain section and verifying system and server integrity).<o:p></o:p></p><p class=\"MsoNormal\">Cookies can be \"Persistent\" or \"Session\" Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser. Learn more about cookies on the Free Privacy Policy website article.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">We use both Session and Persistent Cookies for the purposes set out below:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Necessary / Essential Cookies<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Type: Session Cookies<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Administered by: Us<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Purpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Cookies Policy / Notice Acceptance Cookies<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Type: Persistent Cookies<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Administered by: Us<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Purpose: These Cookies identify if users have accepted the use of cookies on the Website.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Functionality Cookies<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Type: Persistent Cookies<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Administered by: Us<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Purpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy or the Cookies section of our Privacy Policy.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Use of Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">The Company may use Personal Data for the following purposes:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">To provide and maintain our Service, including to monitor the usage of our Service.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">To manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">For the performance of a contract: the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">To contact You: To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application\'s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">To provide You with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">To manage Your requests: To attend and manage Your requests to Us.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">For business transfers: We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">For other purposes: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">We may share Your personal information in the following situations:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">With Service Providers: We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.<o:p></o:p></p><p class=\"MsoNormal\">For business transfers: We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.<o:p></o:p></p><p class=\"MsoNormal\">With Affiliates: We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.<o:p></o:p></p><p class=\"MsoNormal\">With business partners: We may share Your information with Our business partners to offer You certain products, services or promotions.<o:p></o:p></p><p class=\"MsoNormal\">With other users: when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside. If You interact with other users or register through a Third-Party Social Media Service, Your contacts on the Third-Party Social Media Service may see Your name, profile, pictures and description of Your activity. Similarly, other users will be able to view descriptions of Your activity, communicate with You and view Your profile.<o:p></o:p></p><p class=\"MsoNormal\">With Your consent: We may disclose Your personal information for any other purpose with Your consent.<o:p></o:p></p><p class=\"MsoNormal\">Retention of Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Transfer of Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">Your information, including Personal Data, is processed at the Company\'s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Delete Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Our Service may give You the ability to delete certain information about You from within the Service.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">You may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Please note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Disclosure of Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">Business Transactions<o:p></o:p></p><p class=\"MsoNormal\">If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Law enforcement<o:p></o:p></p><p class=\"MsoNormal\">Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Other legal requirements<o:p></o:p></p><p class=\"MsoNormal\">The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Comply with a legal obligation<o:p></o:p></p><p class=\"MsoNormal\">Protect and defend the rights or property of the Company<o:p></o:p></p><p class=\"MsoNormal\">Prevent or investigate possible wrongdoing in connection with the Service<o:p></o:p></p><p class=\"MsoNormal\">Protect the personal safety of Users of the Service or the public<o:p></o:p></p><p class=\"MsoNormal\">Protect against legal liability<o:p></o:p></p><p class=\"MsoNormal\">Security of Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Children\'s Privacy<o:p></o:p></p><p class=\"MsoNormal\">Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">If We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent\'s consent before We collect and use that information.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Links to Other Websites<o:p></o:p></p><p class=\"MsoNormal\">Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party\'s site. We strongly advise You to review the Privacy Policy of every site You visit.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Changes to this Privacy Policy<o:p></o:p></p><p class=\"MsoNormal\">We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the \"Last updated\" date at the top of this Privacy Policy.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Contact Us<o:p></o:p></p><p class=\"MsoNormal\">If you have any questions about this Privacy Policy, You can contact us:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">By email:&nbsp;<a href=\"mailto:%20ChalleCorporation@gmail.com\">ChalleCorporation@gmail.com</a></p>', '<p class=\"MsoNormal\">Privacy Policy<o:p></o:p></p><p class=\"MsoNormal\">Last updated: June 24, 2024<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">We use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Free Privacy Policy Generator.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Interpretation and Definitions<o:p></o:p></p><p class=\"MsoNormal\">Interpretation<o:p></o:p></p><p class=\"MsoNormal\">The words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Definitions<o:p></o:p></p><p class=\"MsoNormal\">For the purposes of this Privacy Policy:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Account means a unique account created for You to access our Service or parts of our Service.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Affiliate means an entity that controls, is controlled by or is under common control with a party, where \"control\" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Application refers to Challe, the software program provided by the Company.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Company (referred to as either \"the Company\", \"We\", \"Us\" or \"Our\" in this Agreement) refers to Challe LLC, 2020 Menaul Boulevard Northeast.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Cookies are small files that are placed on Your computer, mobile device or any other device by a website, containing the details of Your browsing history on that website among its many uses.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Country refers to: New Mexico, United States<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Device means any device that can access the Service such as a computer, a cellphone or a digital tablet.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Personal Data is any information that relates to an identified or identifiable individual.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Service refers to the Application or the Website or both.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Service Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Third-party Social Media Service refers to any website or any social network website through which a User can log in or create an account to use the Service.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Usage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Website refers to Challe, accessible from Challe.us<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">You means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Collecting and Using Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">Types of Data Collected<o:p></o:p></p><p class=\"MsoNormal\">Personal Data<o:p></o:p></p><p class=\"MsoNormal\">While using Our Service, We may ask You to provide Us with certain personally identifiable information that can be used to contact or identify You. Personally identifiable information may include, but is not limited to:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Email address<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">First name and last name<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Phone number<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Address, State, Province, ZIP/Postal code, City<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Usage Data<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Usage Data<o:p></o:p></p><p class=\"MsoNormal\">Usage Data is collected automatically when using the Service.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Usage Data may include information such as Your Device\'s Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">When You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile device, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">We may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Information from Third-Party Social Media Services<o:p></o:p></p><p class=\"MsoNormal\">The Company allows You to create an account and log in to use the Service through the following Third-party Social Media Services:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Google<o:p></o:p></p><p class=\"MsoNormal\">Facebook<o:p></o:p></p><p class=\"MsoNormal\">Instagram<o:p></o:p></p><p class=\"MsoNormal\">Twitter<o:p></o:p></p><p class=\"MsoNormal\">LinkedIn<o:p></o:p></p><p class=\"MsoNormal\">If You decide to register through or otherwise grant us access to a Third-Party Social Media Service, We may collect Personal data that is already associated with Your Third-Party Social Media Service\'s account, such as Your name, Your email address, Your activities or Your contact list associated with that account.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">You may also have the option of sharing additional information with the Company through Your Third-Party Social Media Service\'s account. If You choose to provide such information and Personal Data, during registration or otherwise, You are giving the Company permission to use, share, and store it in a manner consistent with this Privacy Policy.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Information Collected while Using the Application<o:p></o:p></p><p class=\"MsoNormal\">While using Our Application, in order to provide features of Our Application, We may collect, with Your prior permission:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Information regarding your location<o:p></o:p></p><p class=\"MsoNormal\">We use this information to provide features of Our Service, to improve and customize Our Service. The information may be uploaded to the Company\'s servers and/or a Service Provider\'s server or it may be simply stored on Your device.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">You can enable or disable access to this information at any time, through Your Device settings.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Tracking Technologies and Cookies<o:p></o:p></p><p class=\"MsoNormal\">We use Cookies and similar tracking technologies to track the activity on Our Service and store certain information. Tracking technologies used are beacons, tags, and scripts to collect and track information and to improve and analyze Our Service. The technologies We use may include:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Cookies or Browser Cookies. A cookie is a small file placed on Your Device. You can instruct Your browser to refuse all Cookies or to indicate when a Cookie is being sent. However, if You do not accept Cookies, You may not be able to use some parts of our Service. Unless you have adjusted Your browser setting so that it will refuse Cookies, our Service may use Cookies.<o:p></o:p></p><p class=\"MsoNormal\">Web Beacons. Certain sections of our Service and our emails may contain small electronic files known as web beacons (also referred to as clear gifs, pixel tags, and single-pixel gifs) that permit the Company, for example, to count users who have visited those pages or opened an email and for other related website statistics (for example, recording the popularity of a certain section and verifying system and server integrity).<o:p></o:p></p><p class=\"MsoNormal\">Cookies can be \"Persistent\" or \"Session\" Cookies. Persistent Cookies remain on Your personal computer or mobile device when You go offline, while Session Cookies are deleted as soon as You close Your web browser. Learn more about cookies on the Free Privacy Policy website article.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">We use both Session and Persistent Cookies for the purposes set out below:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Necessary / Essential Cookies<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Type: Session Cookies<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Administered by: Us<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Purpose: These Cookies are essential to provide You with services available through the Website and to enable You to use some of its features. They help to authenticate users and prevent fraudulent use of user accounts. Without these Cookies, the services that You have asked for cannot be provided, and We only use these Cookies to provide You with those services.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Cookies Policy / Notice Acceptance Cookies<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Type: Persistent Cookies<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Administered by: Us<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Purpose: These Cookies identify if users have accepted the use of cookies on the Website.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Functionality Cookies<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Type: Persistent Cookies<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Administered by: Us<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Purpose: These Cookies allow us to remember choices You make when You use the Website, such as remembering your login details or language preference. The purpose of these Cookies is to provide You with a more personal experience and to avoid You having to re-enter your preferences every time You use the Website.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">For more information about the cookies we use and your choices regarding cookies, please visit our Cookies Policy or the Cookies section of our Privacy Policy.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Use of Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">The Company may use Personal Data for the following purposes:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">To provide and maintain our Service, including to monitor the usage of our Service.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">To manage Your Account: to manage Your registration as a user of the Service. The Personal Data You provide can give You access to different functionalities of the Service that are available to You as a registered user.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">For the performance of a contract: the development, compliance and undertaking of the purchase contract for the products, items or services You have purchased or of any other contract with Us through the Service.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">To contact You: To contact You by email, telephone calls, SMS, or other equivalent forms of electronic communication, such as a mobile application\'s push notifications regarding updates or informative communications related to the functionalities, products or contracted services, including the security updates, when necessary or reasonable for their implementation.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">To provide You with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless You have opted not to receive such information.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">To manage Your requests: To attend and manage Your requests to Us.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">For business transfers: We may use Your information to evaluate or conduct a merger, divestiture, restructuring, reorganization, dissolution, or other sale or transfer of some or all of Our assets, whether as a going concern or as part of bankruptcy, liquidation, or similar proceeding, in which Personal Data held by Us about our Service users is among the assets transferred.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">For other purposes: We may use Your information for other purposes, such as data analysis, identifying usage trends, determining the effectiveness of our promotional campaigns and to evaluate and improve our Service, products, services, marketing and your experience.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">We may share Your personal information in the following situations:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">With Service Providers: We may share Your personal information with Service Providers to monitor and analyze the use of our Service, to contact You.<o:p></o:p></p><p class=\"MsoNormal\">For business transfers: We may share or transfer Your personal information in connection with, or during negotiations of, any merger, sale of Company assets, financing, or acquisition of all or a portion of Our business to another company.<o:p></o:p></p><p class=\"MsoNormal\">With Affiliates: We may share Your information with Our affiliates, in which case we will require those affiliates to honor this Privacy Policy. Affiliates include Our parent company and any other subsidiaries, joint venture partners or other companies that We control or that are under common control with Us.<o:p></o:p></p><p class=\"MsoNormal\">With business partners: We may share Your information with Our business partners to offer You certain products, services or promotions.<o:p></o:p></p><p class=\"MsoNormal\">With other users: when You share personal information or otherwise interact in the public areas with other users, such information may be viewed by all users and may be publicly distributed outside. If You interact with other users or register through a Third-Party Social Media Service, Your contacts on the Third-Party Social Media Service may see Your name, profile, pictures and description of Your activity. Similarly, other users will be able to view descriptions of Your activity, communicate with You and view Your profile.<o:p></o:p></p><p class=\"MsoNormal\">With Your consent: We may disclose Your personal information for any other purpose with Your consent.<o:p></o:p></p><p class=\"MsoNormal\">Retention of Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">The Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Transfer of Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">Your information, including Personal Data, is processed at the Company\'s operating offices and in any other places where the parties involved in the processing are located. It means that this information may be transferred to — and maintained on — computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Your consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">The Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or a country unless there are adequate controls in place including the security of Your data and other personal information.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Delete Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Our Service may give You the ability to delete certain information about You from within the Service.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">You may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Please note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Disclosure of Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">Business Transactions<o:p></o:p></p><p class=\"MsoNormal\">If the Company is involved in a merger, acquisition or asset sale, Your Personal Data may be transferred. We will provide notice before Your Personal Data is transferred and becomes subject to a different Privacy Policy.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Law enforcement<o:p></o:p></p><p class=\"MsoNormal\">Under certain circumstances, the Company may be required to disclose Your Personal Data if required to do so by law or in response to valid requests by public authorities (e.g. a court or a government agency).<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Other legal requirements<o:p></o:p></p><p class=\"MsoNormal\">The Company may disclose Your Personal Data in the good faith belief that such action is necessary to:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Comply with a legal obligation<o:p></o:p></p><p class=\"MsoNormal\">Protect and defend the rights or property of the Company<o:p></o:p></p><p class=\"MsoNormal\">Prevent or investigate possible wrongdoing in connection with the Service<o:p></o:p></p><p class=\"MsoNormal\">Protect the personal safety of Users of the Service or the public<o:p></o:p></p><p class=\"MsoNormal\">Protect against legal liability<o:p></o:p></p><p class=\"MsoNormal\">Security of Your Personal Data<o:p></o:p></p><p class=\"MsoNormal\">The security of Your Personal Data is important to Us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While We strive to use commercially acceptable means to protect Your Personal Data, We cannot guarantee its absolute security.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Children\'s Privacy<o:p></o:p></p><p class=\"MsoNormal\">Our Service does not address anyone under the age of 13. We do not knowingly collect personally identifiable information from anyone under the age of 13. If You are a parent or guardian and You are aware that Your child has provided Us with Personal Data, please contact Us. If We become aware that We have collected Personal Data from anyone under the age of 13 without verification of parental consent, We take steps to remove that information from Our servers.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">If We need to rely on consent as a legal basis for processing Your information and Your country requires consent from a parent, We may require Your parent\'s consent before We collect and use that information.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Links to Other Websites<o:p></o:p></p><p class=\"MsoNormal\">Our Service may contain links to other websites that are not operated by Us. If You click on a third party link, You will be directed to that third party\'s site. We strongly advise You to review the Privacy Policy of every site You visit.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">We have no control over and assume no responsibility for the content, privacy policies or practices of any third party sites or services.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Changes to this Privacy Policy<o:p></o:p></p><p class=\"MsoNormal\">We may update Our Privacy Policy from time to time. We will notify You of any changes by posting the new Privacy Policy on this page.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">We will let You know via email and/or a prominent notice on Our Service, prior to the change becoming effective and update the \"Last updated\" date at the top of this Privacy Policy.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">You are advised to review this Privacy Policy periodically for any changes. Changes to this Privacy Policy are effective when they are posted on this page.<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">Contact Us<o:p></o:p></p><p class=\"MsoNormal\">If you have any questions about this Privacy Policy, You can contact us:<o:p></o:p></p><p class=\"MsoNormal\"><o:p>&nbsp;</o:p></p><p class=\"MsoNormal\">By email:&nbsp;<a href=\"mailto:%20ChalleCorporation@gmail.com\">ChalleCorporation@gmail.com</a></p>', '2024-03-14 03:04:32', '2024-07-04 19:09:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nick_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'GMAIL,APPLE',
  `provider_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rapyd_customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_customer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stripe_connect_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_language` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'en' COMMENT 'en,ka',
  `is_profile_complete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=no,1=yes',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `nick_name`, `date_of_birth`, `email`, `password`, `phone_number`, `role_id`, `gender`, `fcm_token`, `provider`, `provider_id`, `image`, `rapyd_customer_id`, `stripe_customer_id`, `stripe_connect_id`, `default_language`, `is_profile_complete`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '1990/12/15', 'admin@gmail.com', '$2y$12$6EgPDLib2QPYzh2PJJlEOO/p1V7Bo8g6vXj8Ac1otO5TYPyBRoIou', '+14155559991', 1, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 'en', 0, 'k7gA7hbdY0ObGCaBFc3AjQEmlko9d7Dce0jm6AYiBfHpvgjylCNa2dZDAw8M', '2024-02-29 07:57:00', '2024-02-29 07:57:00'),
(141, 'Challe Corporation', 'Challe', NULL, 'challecorporation@gmail.com', '$2y$12$UaytG0eKTLvC4ZrpyS67Z.ASgGkYDImeHX4pi4r65fpCfyiTsLKMa', '+995555333993', 2, 'Male', NULL, 'GMAIL', 'wSnnvlxsCmO92uTYMbP49Wf7cB52', 'upload/image/user/1718383156-6418.jpg', 'cus_99966e654e77196181645cedfad7cbe1', '', NULL, 'en', 1, NULL, '2024-04-04 03:29:43', '2024-07-05 16:32:28'),
(158, NULL, NULL, NULL, 'constantinmos@gmail.com', NULL, NULL, 2, NULL, 'fE1VBoJmRVuWP5hi-y1o-z:APA91bE6XgjjKvEuAlOegf9tZAZ-P75aHeJPCrNxzDIiaFF6U1S7un_OxtARtfmnWDCflS0GYQfkjN_YSm3qMWsC3AHFhtYdMR4xDrh8LfYFBxa_FUHckmZnG3XeUyzeK29nd5BBrrJ6', 'GMAIL', 'XOEQaDV30md3QLg0i6QP5B7bcpF2', NULL, NULL, NULL, NULL, 'en', 0, NULL, '2024-05-07 10:22:07', '2024-05-07 10:22:07'),
(159, 'Build it', 'build', NULL, 'buildtlc@gmail.com', NULL, '+91', 2, 'Male', 'dt6o8CeiTqixUm2X0AjG7f:APA91bEnAFTv-imkuG_5GfC5w1iF-_ef-yd0OT_39wvbWf_DOWheP0IboDrcyOrmtCakYay8-kg5muqINgepi2yAc14m3bsYQLlqQNv5zU9pYsuYQ4ppaTkE0tw3PsiKAqyEjCHZXSu4', 'GMAIL', 'H4rLeYTxaZYpTRPYpaQXXRldZ8I2', 'upload/image/user/1718383090-8187.jpeg', NULL, 'cus_Q40wKJC4Nr3Dbk', NULL, 'en', 1, NULL, '2024-05-07 13:38:31', '2024-06-14 16:38:10'),
(206, 'tatuka', 'tatuka', NULL, 'gogonagvariani@gmail.com', NULL, NULL, 2, 'Female', '0', 'GMAIL', 'fCdbIpxNFvOPFdfufdndxxA04L92', 'upload/image/user/1719656072-4827.jpg', NULL, 'cus_QNjmn2QWY8A1gc', NULL, 'en', 1, NULL, '2024-06-29 10:14:02', '2024-06-29 10:14:32'),
(207, NULL, NULL, NULL, 'ss@ss.com', '$2y$12$VOk8tHvq7u9rBUsYQEuO4OAlwsHbOukbZgnhVvFMn08fm.HR9NlMy', '+1923151488528', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 0, NULL, '2024-07-01 11:03:39', '2024-07-01 11:03:39'),
(213, 'shoaib', 'she I', '1996/12/12', 'ugidomain@gmail.com', '$2y$12$Uh9O9SyYzLDG9OfT6GKebe5DSndzFpDRyFUSfT3LNGJEZF3ApyXvG', '+13210000000', 2, 'მამრობითი', 'd8_jfvIbFEEjtD982Nj2bX:APA91bEy2eJSA9zTtPV_smBgl7jhdx6XARM0o_f5Ac9t-VMgX6flGs4X0A5Uli7Iteh6BItveMYQm_luFo6RwuDHsVghYoKDx_nxnnCllzg_iO3iIlQjJC4NjQTidfC5G7yREUQEV2nV', NULL, NULL, 'upload/image/user/1719861363-9698.jpg', NULL, 'cus_QOXP7lOVBJHdms', 'acct_1PYafL08qZgK8ChD', 'ka', 1, NULL, '2024-07-01 13:15:37', '2024-07-03 21:24:43'),
(214, 'Miriam', 'Mimi', NULL, 'miriamdshaban@gmail.com', NULL, NULL, 2, 'Female', 'erMfMmbYKkpHpsSkIEeuzr:APA91bGDbOTCZGsZ5f7sY3qV1f5SaPK4HZ28P6BuYtZZA2f_QCkvrKEAPfG_4bxr05a5ou0x8qB75I6nryOe8DEhosbPlMZjX4Q5JWRqgzr2DuEZ8aSAYPqgCQElHkfZ5obXtAYgCsoI', 'GMAIL', 'gF5DGUKbWicXgnRMOaBAhX7yQm92', 'upload/image/user/1719840981-3306.jpg', NULL, 'cus_QOXUpqUjcQVyVl', NULL, 'en', 1, NULL, '2024-07-01 13:35:37', '2024-07-05 13:43:38'),
(215, 'sajjad', 'Sajjan', NULL, 'sajjadahmad44000@gmail.com', NULL, NULL, 2, 'Male', '0', 'GMAIL', 'X6fK2v0BQSPI0MruWtvB5s91Cil2', 'upload/image/user/1719860604-2876.jpg', NULL, 'cus_QOclEf5MuVpSDp', NULL, 'en', 1, NULL, '2024-07-01 19:02:51', '2024-07-01 19:03:24'),
(217, 'shoaib salamat', 'shebi', '1996/12/12', 'shoaibsalamat152@gmail.com', NULL, '+913403779199', 2, 'Male', '0', 'GMAIL', 'Aw0nCnpLo2OqXUhrQBd4Zf0EXdt1', 'upload/image/user/1720526949-7019.jpg', NULL, 'cus_QOnVYM1yjVAmXd', 'acct_1PacrOP7tfDWQZtj', 'en', 1, NULL, '2024-07-02 06:08:53', '2024-07-09 12:09:32'),
(218, 'Eurica Martinez', 'Eur', NULL, 'martinezeurica@gmail.com', NULL, NULL, 2, 'Female', '0', 'GMAIL', 'Vy6UgmKum0NV8bwtJloWvBdG5xY2', 'upload/image/user/1719903525-1416.jpg', NULL, 'cus_QOoIwlnU0JROVM', NULL, 'en', 1, NULL, '2024-07-02 06:57:55', '2024-07-02 06:58:45'),
(219, NULL, NULL, NULL, 'developmentcas@gmail.com', NULL, NULL, 2, NULL, 'exvfJX2Df0QUsT9iUc9lqC:APA91bGLGtphyoiomWl9_kFPVXVXmAsq8SJnLwwjLSrixsQRJ4XcCJ-aZWKzIiGI5T538xT-W1NW8AHZqSuN5pgZGxI3lunj5dwW0cJN6f_nUJJjGDZR-nJcKIVNrrz4azEwsyh8y7TL', 'APPLE', 'b0tN0Zj0iGU0z9OKRKSLxj5jr762', NULL, NULL, NULL, NULL, 'en', 0, NULL, '2024-07-02 09:47:00', '2024-07-02 09:47:00'),
(220, 'Fari Khan', 'khani', NULL, 'farikhanvhr@gmail.com', NULL, '+92+923240577528', 2, 'Female', NULL, 'GMAIL', 'KzuxsoGHzGUCypdTTyC0denQEIn2', 'upload/image/user/1719990541-9375.jpg', NULL, 'cus_QOxkyEyTCNDIfG', NULL, 'en', 1, NULL, '2024-07-02 16:43:17', '2024-07-07 12:13:34'),
(221, 'Leidiná', 'Sales', '2002/04/09', 'salesleidina7@gmail.com', NULL, NULL, 2, 'Male', '0', 'GMAIL', 'YbUAfFplITQO8Nnq5IyAiWFLVhs2', 'upload/image/user/1719943094-5368.jpg', NULL, 'cus_QOyvigbZpH1KG2', NULL, 'en', 1, NULL, '2024-07-02 17:57:31', '2024-07-02 17:58:15'),
(222, 'ajay kumar', 'aj', NULL, 'ajstylefilms007@gmail.com', NULL, '+919877769731', 2, 'Male', 'ct5A74BbRoesvlJEgRs6Ue:APA91bEh837-RTCX9i7u-3GOOfwIihIFogWOLVEmGFeIbcamy-OOphAsa-C_cA3h2PzhrDt7DBVfJNWSGmgiKTDE224-OOi54vF4H2ma44mmSg9vosMpNbQXH6mi9CwbDtZfEJaQ5bZY', 'GMAIL', 'DmWsbKGWW4UDcybZioJGDIsOR3E3', NULL, NULL, 'cus_QPDm9IoENvcHqj', NULL, 'en', 1, NULL, '2024-07-03 09:18:42', '2024-07-03 09:19:05'),
(223, NULL, NULL, NULL, 'djyg4tnrsj@privaterelay.appleid.com', NULL, NULL, 2, NULL, NULL, 'APPLE', 'QAz0bDh7VHgmbQw8sJxpVg9Hdk83', NULL, NULL, NULL, NULL, 'en', 0, NULL, '2024-07-03 10:19:16', '2024-07-03 10:19:16'),
(224, NULL, NULL, NULL, 'wf9d2dr7w9@privaterelay.appleid.com', NULL, NULL, 2, NULL, NULL, 'APPLE', '9FWs4lyILlX7vWxE0eB1oWRudBp2', NULL, NULL, NULL, NULL, 'en', 0, NULL, '2024-07-03 21:51:30', '2024-07-03 21:51:30'),
(225, NULL, NULL, NULL, 'raianrahman112200@gmail.com', '$2y$12$6coLCdJ16GI0X3qu8ntnrub67xBZ8BGiWraDLOY.QC7F.uWZGfPk.', '+880172021000', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'en', 0, NULL, '2024-07-04 13:39:32', '2024-07-04 13:39:32'),
(227, 'LUKA BEZHANIDZE', 'luka', NULL, 'lukabezhanidze33@gmail.com', NULL, '+995557596427', 2, 'Male', 'fetyZnFiSnuO9CD9pxYCMa:APA91bHmtz6HUD1zWTEqm3_kNPRbrXOUwPVlSVjrLcqOzhe-Sgg-0oe8HT9-KZybu2S7HGy0U9SD1RMuzqER6Oxzp_Z4QO1NCxurwJ6y3lCrwvKMsBbrYNf3-lxNIANRk2neXrMZbc3g', 'GMAIL', '9T3a7nuot9gTsC35Tki3aut8Nbv2', NULL, NULL, 'cus_QPfJ8pp1yRH0f7', NULL, 'en', 1, NULL, '2024-07-04 13:45:42', '2024-07-04 13:46:06'),
(228, 'Tato Abashvili', 'Dirextori', NULL, 'abashvilitato3@gmail.com', NULL, '+995514130440', 2, 'Male', 'f_9MQzVXR5GKY8449_zC9o:APA91bGn4IFZx30sjXnqebZrdc8rQyefQ1LwkCw49OyNuNcf3cblee5PRhAguIMRjgIiG9B0SVSdahRtsPdBux0yWs7EssYflOdOYBQIKbRlAlG0gB4CA9rXr7YEsOpGfJvy0AKAhPZ3', 'GMAIL', 'YghgSdNv3JXSwfHrhbaUIFQOU6x2', NULL, NULL, 'cus_QPiTGPKZrHCuWb', NULL, 'en', 1, NULL, '2024-07-04 17:01:25', '2024-07-04 17:02:01'),
(229, 'Elvin Israfilovi', 'elvin', '1996/04/16', 'elvin.israfilovi37@gmail.com', NULL, NULL, 2, 'Male', '0', 'APPLE', 'amgphvp7iefC4I8AthgIhIZrwxC2', 'upload/image/user/1720122540-1344.jpg', NULL, 'cus_QPlA7fZLM8RAwa', NULL, 'en', 1, NULL, '2024-07-04 19:47:48', '2024-07-04 19:49:01'),
(230, NULL, NULL, NULL, 'sbnz2pdtyn@privaterelay.appleid.com', NULL, NULL, 2, NULL, NULL, 'APPLE', 'Y9qnBcfY6fNPVGc3rjFYmPtqUn02', NULL, NULL, NULL, NULL, 'en', 0, NULL, '2024-07-06 12:34:04', '2024-07-06 12:34:04'),
(231, 'Toksi Beselia', 'toksi', '1993/10/01', 'beseliatoksi@gmail.com', NULL, '+995598400110', 2, 'Male', 'eLXvYE1cS325mTC6W6BvdI:APA91bGT9gIhKRMEO8gu-Dhn9usj7oPnh6ncaumCROFnAqTsH38Blc-CVQEwcI8IpGF95NvJkIZGZ0sKbs9OevSdwuUFckdgrxXBxg2wQfTTFEOKVnanG4j2LPd5xXa9qQ7_UtAUC4UN', 'GMAIL', 'ODKFAh6FFuWUoM66bBEcIzRp3Xd2', NULL, NULL, 'cus_QQQMz9Bj6550jH', NULL, 'en', 1, NULL, '2024-07-06 14:20:52', '2024-07-06 14:22:20'),
(232, 'Shakir Hussain', 'hahah', NULL, 'shbhai97@gmail.com', NULL, '+9103038877666', 2, 'Male', 'eoU8y1bVSl2LKbFaALEO13:APA91bGDnCvvceYP4dUXic8nKf4vxE2nALqkeUB65qwB9J7dC--Nixe4tfZZ-jCYJKZsaPfUnH77je4RNbN_j45VqHc_vaeo1xOOtOlA3nxiqHcdxdqWBYz2MBL-dy7wyTaNh5HhldrD', 'GMAIL', 'c68wd6uyDAW3I8BaM09cSjlefG02', NULL, NULL, 'cus_QQRZVOZG0owNZV', NULL, 'en', 1, NULL, '2024-07-06 15:36:51', '2024-07-06 15:37:30'),
(233, NULL, NULL, NULL, 'y8p9jspq7p@privaterelay.appleid.com', NULL, NULL, 2, NULL, 'eudeIlA9B0OFvG_uX4XpF1:APA91bHcp_JmlSnbrqP3gQ6F3_8VoSyCkmGk7A-LRgnyA4UkTM64XAlFmEns2Stjyk9pPkR8Do_nNIk2Bs5FepIQRcaCnOks3UpbJiwWQIWOEAXlB1VWbI0JX1S10qdeigJtItvbQdB3', 'APPLE', 'exrTJmVDXqM4LgN6rEzUOpN3q3C3', NULL, NULL, NULL, NULL, 'en', 0, NULL, '2024-07-07 07:11:28', '2024-07-07 07:11:28'),
(234, 'Tanzil Parvez', 'Fardin', NULL, 'tanzilwhatever@gmail.com', NULL, NULL, 2, 'Male', 'dAffwxHeJkKNigXdAy8lbE:APA91bGgyl2fC8zSvImnxW22qC3xTFAFqJ3XzOI82gmNa2Km-Erhsurvq9-itdONfnaGqG9_a9B3NY8qMo-WE7Y9OMcLjEUqMzXRBh_upRAMkhDP8-s59xWX5iQtsiZQ_bR6wsvoRnpw', 'GMAIL', 'NuHGXcxiD2XiTMCtBKdWKyxjrrm1', 'upload/image/user/1720632234-7520.jpg', NULL, 'cus_QRyBSrMExRNv1E', NULL, 'en', 1, NULL, '2024-07-10 17:23:20', '2024-07-10 17:23:54'),
(235, NULL, NULL, NULL, '29phmtqrtq@privaterelay.appleid.com', NULL, NULL, 2, NULL, NULL, 'APPLE', 'yBSzTPds5tgr69fKWujwCOSA2dW2', NULL, NULL, NULL, NULL, 'en', 0, NULL, '2024-07-10 19:16:25', '2024-07-10 19:16:25');

-- --------------------------------------------------------

--
-- Table structure for table `user_cards`
--

CREATE TABLE `user_cards` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `last_4_digit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `card_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_brand` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_verification` tinyint(1) DEFAULT '0',
  `redirect_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `special_offers` tinyint(1) NOT NULL DEFAULT '0',
  `sound` tinyint(1) NOT NULL DEFAULT '0',
  `general_notification` tinyint(1) NOT NULL DEFAULT '0',
  `payment_option` tinyint(1) NOT NULL DEFAULT '0',
  `app_update` tinyint(1) NOT NULL DEFAULT '0',
  `new_service_available` tinyint(1) NOT NULL DEFAULT '0',
  `new_tips_available` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `special_offers`, `sound`, `general_notification`, `payment_option`, `app_update`, `new_service_available`, `new_tips_available`, `created_at`, `updated_at`) VALUES
(6, 213, 1, 0, 0, 0, 0, 0, 0, '2024-07-02 07:42:02', '2024-07-02 07:42:06');

-- --------------------------------------------------------

--
-- Table structure for table `user_payments`
--

CREATE TABLE `user_payments` (
  `id` bigint UNSIGNED NOT NULL,
  `price_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `payment_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_payments`
--

INSERT INTO `user_payments` (`id`, `price_id`, `user_id`, `payment_id`, `amount`, `created_at`, `updated_at`) VALUES
(8, 3, NULL, 'payment_877f64816681946f056939c33b882f16', '10.00', '2024-03-22 06:02:15', '2024-03-22 06:02:17'),
(15, 3, NULL, 'payment_1effbff49a00b812e947f7d5c85f2755', '10.00', '2024-03-25 06:03:55', '2024-03-25 06:03:56'),
(16, 3, NULL, 'payment_9045867fe415aca03b8f0de714ae8b16', '10.00', '2024-03-26 01:39:31', '2024-03-26 01:39:32'),
(17, 3, NULL, 'payment_9045867fe415aca03b8f0de714ae8b16', '10.00', '2024-03-26 01:39:31', '2024-03-26 01:39:32'),
(22, 4, NULL, 'payment_b36c4e1c37087e7dc2402d702ee5eaaa', '20.00', '2024-03-27 04:36:50', '2024-03-27 04:36:52'),
(23, 3, NULL, 'payment_d172f23e39955a0fa758c9fde317510b', '10.00', '2024-03-27 04:50:55', '2024-03-27 04:51:04'),
(28, 3, NULL, 'payment_e21ee4266d7f1daada53a01301de410d', '10.00', '2024-03-27 05:18:02', '2024-03-27 05:18:04'),
(29, 3, NULL, 'payment_9d97bf7e6a7b15b17ad7af2110105fed', '10.00', '2024-03-27 05:18:30', '2024-03-27 05:18:33'),
(30, 3, NULL, 'payment_1b30b2d65ad612235444263ae757dd1d', '10.00', '2024-03-27 05:19:05', '2024-03-27 05:19:07'),
(31, 3, NULL, 'payment_4e22adfabf2326be28e4788b594634f7', '10.00', '2024-03-27 06:21:36', '2024-03-27 06:21:38'),
(32, 3, NULL, 'payment_b1073060e91386ade9dd2089e23b48e8', '10.00', '2024-03-27 06:22:39', '2024-03-27 06:22:41'),
(33, 3, NULL, 'payment_b790b3bfaeda9fec0109cd58bdc85b1d', '10.00', '2024-03-27 06:23:58', '2024-03-27 06:24:00'),
(34, 3, NULL, 'payment_21bfce9d90ec05a89ce7a0cbb8798b39', '10.00', '2024-03-27 06:25:03', '2024-03-27 06:25:05'),
(35, 3, NULL, 'payment_f137cca13cd5b0e3b26467ad674d75de', '10.00', '2024-03-27 06:26:44', '2024-03-27 06:26:46'),
(36, 4, NULL, 'payment_f07754346baaa712969de14dbaea2ba4', '20.00', '2024-03-28 00:01:11', '2024-03-28 00:01:14'),
(37, 4, NULL, 'payment_cd2271c14cb4eb92dc20a0d1f2d7345c', '20.00', '2024-03-28 00:14:32', '2024-03-28 00:14:34'),
(38, 4, NULL, 'payment_34d64f55a226b9b912790228369a65ee', '20.00', '2024-03-28 00:15:36', '2024-03-28 00:15:37'),
(39, 4, NULL, 'payment_706777ccbc8a6a4e2137db379f7f1315', '20.00', '2024-03-28 00:17:43', '2024-03-28 00:17:44'),
(40, 3, NULL, 'payment_2f1417374f1b7881b73ef9305ba98808', '10.00', '2024-03-28 00:30:25', '2024-03-28 00:30:27'),
(41, 3, NULL, 'payment_67088cd4ed719c7fc2c9349545e8fd1e', '10.00', '2024-03-28 00:43:25', '2024-03-28 00:43:27'),
(42, 3, NULL, 'payment_e9e7c7d5668fb5dfa80eaaa26bd9c00c', '10.00', '2024-03-28 00:44:01', '2024-03-28 00:44:03'),
(43, 3, NULL, 'payment_156adfa0e11f8d90d8a85457aa6eda19', '10.00', '2024-03-28 00:50:38', '2024-03-28 00:50:41'),
(44, 3, NULL, 'payment_0b1c730c0858726fd977ae89e1459881', '10.00', '2024-03-28 01:01:36', '2024-03-28 01:01:38'),
(45, 3, NULL, 'payment_07490201be90a7c7d49abc22e596afa2', '10.00', '2024-03-28 01:06:10', '2024-03-28 01:06:12'),
(46, 3, NULL, 'payment_a948c914c930bbc16ce7ec0049b82ef0', '10.00', '2024-03-28 01:06:52', '2024-03-28 01:06:54'),
(47, 3, NULL, 'payment_8d0f76d199bde667d1b63d99ef1285f2', '10.00', '2024-03-28 01:08:10', '2024-03-28 01:08:12'),
(48, 3, NULL, 'payment_5ada8bc276bd7d41be14eee119eda7d4', '10.00', '2024-03-28 01:08:46', '2024-03-28 01:08:48'),
(49, 3, NULL, 'payment_6594ce5baca611b2dee51fe53dc899b1', '10.00', '2024-03-28 01:10:21', '2024-03-28 01:10:22'),
(50, 3, NULL, 'payment_fc545b9c887d5131e392ab455ebebcf9', '10.00', '2024-03-28 01:10:45', '2024-03-28 01:10:47'),
(51, 3, NULL, 'payment_1b769172674c246ac95a35942ce03bd1', '10.00', '2024-03-28 01:12:43', '2024-03-28 01:12:45'),
(52, 3, NULL, 'payment_6883f8e060610cbb7e149a8a8bb2d9e6', '10.00', '2024-03-28 01:13:21', '2024-03-28 01:13:22'),
(53, 3, NULL, 'payment_c72d7f83647ab59b6a29c9e844d8ea66', '10.00', '2024-03-28 01:14:03', '2024-03-28 01:14:04'),
(54, 3, NULL, 'payment_7442db6e57097513c67227e206eaf3ac', '10.00', '2024-03-28 01:14:58', '2024-03-28 01:14:59'),
(55, 3, NULL, 'payment_1dceabccae45553c2b69e705a5187e1c', '10.00', '2024-03-28 01:15:04', '2024-03-28 01:15:06'),
(56, 3, NULL, 'payment_f88b22ea9726c33729551f9728245a8d', '10.00', '2024-03-28 01:15:45', '2024-03-28 01:15:47'),
(57, 3, NULL, 'payment_7c563f1bcb7ea9cfb64a5360ae1c68b5', '10.00', '2024-03-28 01:17:17', '2024-03-28 01:17:18'),
(58, 3, NULL, 'payment_8d9f19c5028d2369f87d7d5e6252f081', '10.00', '2024-03-28 01:18:14', '2024-03-28 01:18:16'),
(59, 3, NULL, 'payment_92142919f8657c1b3c1d0b97d3c5b266', '10.00', '2024-03-28 01:19:44', '2024-03-28 01:19:46'),
(60, 3, NULL, 'payment_64d2aa58261c27d749ebcc559ae97c66', '10.00', '2024-03-28 01:20:04', '2024-03-28 01:20:05'),
(61, 3, NULL, 'payment_02b10d99c17962f4a0dc01c7199099db', '10.00', '2024-03-28 01:24:50', '2024-03-28 01:24:52'),
(62, 3, NULL, 'payment_5f120c4e7734dca1bf2df2205cdf1671', '10.00', '2024-03-28 01:27:31', '2024-03-28 01:27:33'),
(63, 3, NULL, 'payment_f3082369f1cd65c82b5807bb41763926', '10.00', '2024-03-28 01:28:02', '2024-03-28 01:28:03'),
(64, 3, NULL, 'payment_d916ceed08f4d98eff22099d2ef11927', '10.00', '2024-03-28 01:28:15', '2024-03-28 01:28:16'),
(65, 3, NULL, 'payment_d5eff7cfab8376c71207e1c8bb0ef029', '10.00', '2024-03-28 01:28:35', '2024-03-28 01:28:37'),
(66, 3, NULL, 'payment_631e76d052adede53e6c40307d1bdb09', '10.00', '2024-03-28 01:30:26', '2024-03-28 01:30:28'),
(67, 3, NULL, 'payment_8cb15a18a6947c0d8c59a571d18428c5', '10.00', '2024-03-28 01:30:42', '2024-03-28 01:30:44'),
(68, 3, NULL, 'payment_e4191c4fc5b44775f355ad493767c2c2', '10.00', '2024-03-28 01:46:29', '2024-03-28 01:46:31'),
(69, 3, NULL, 'payment_3017a5538cf0302316ad88ee71e5d3af', '10.00', '2024-03-28 01:51:49', '2024-03-28 01:51:51'),
(70, 3, NULL, 'payment_59ba2cc056d629c7fc0db2a8e7b7a805', '10.00', '2024-03-28 01:53:11', '2024-03-28 01:53:13'),
(71, 3, NULL, 'payment_26d8d1ffdba5394f11a6fe6677e54bc8', '10.00', '2024-03-28 02:02:39', '2024-03-28 02:02:41'),
(72, 3, NULL, 'payment_8a4b6ba245469acea1920b7481865e42', '10.00', '2024-03-28 02:08:53', '2024-03-28 02:08:54'),
(73, 3, NULL, 'payment_b1580887aecb836339a5368a1d6eeb7b', '10.00', '2024-03-28 02:12:16', '2024-03-28 02:12:17'),
(74, 3, NULL, 'payment_5115957aad82fe48a6271be08500a042', '10.00', '2024-03-28 02:12:56', '2024-03-28 02:12:58'),
(75, 3, NULL, 'payment_05508debb7ebac6da2bd892d82b93c26', '10.00', '2024-03-28 02:14:14', '2024-03-28 02:14:15'),
(76, 3, NULL, 'payment_4a95a3c36d00bc04db3c593ec2aa892f', '10.00', '2024-03-28 02:25:14', '2024-03-28 02:25:16'),
(77, 3, NULL, 'payment_d92ec6712b75db36d504d6307d9d5bb6', '10.00', '2024-03-28 02:31:20', '2024-03-28 02:31:22'),
(78, 3, NULL, 'payment_654b535b3d2bb2477694a857fdb2782e', '10.00', '2024-03-28 02:32:42', '2024-03-28 02:32:43'),
(79, 3, NULL, 'payment_737e1be2c6229fd63019521a55c30fae', '10.00', '2024-03-28 02:34:58', '2024-03-28 02:34:59'),
(80, 3, NULL, 'payment_a6cfe58e4be2ca3bda10e974cccc7260', '10.00', '2024-03-28 02:35:10', '2024-03-28 02:35:11'),
(81, 3, NULL, 'payment_6ef71642f5c4f8a90d02fbf2644cb724', '10.00', '2024-03-28 02:36:07', '2024-03-28 02:36:09'),
(82, 3, NULL, 'payment_cd3a5e19ff591bea8fac317da3a5ccd9', '10.00', '2024-03-28 02:36:58', '2024-03-28 02:37:00'),
(83, 3, NULL, 'payment_60e62c841debadd10c91d72c68d6f0c7', '10.00', '2024-03-28 02:37:43', '2024-03-28 02:37:44'),
(84, 3, NULL, 'payment_0b00961c26af8465a39732812eb40b64', '10.00', '2024-03-28 02:38:11', '2024-03-28 02:38:12'),
(85, 3, NULL, 'payment_3caedd96f94b93477143dab10d16519f', '10.00', '2024-03-28 02:39:02', '2024-03-28 02:39:04'),
(86, 3, NULL, 'payment_4f92aeddac1059e99669e58b000c692a', '10.00', '2024-03-28 02:39:23', '2024-03-28 02:39:24'),
(87, 3, NULL, 'payment_36d8436f32a6718166bc73cf589a2090', '10.00', '2024-03-28 02:39:55', '2024-03-28 02:39:56'),
(88, 3, NULL, 'payment_d7c1fa79e201fe9bed34b87a0de4c722', '10.00', '2024-03-28 02:40:10', '2024-03-28 02:40:11'),
(89, 3, NULL, 'payment_37262575334b792b919cfcfc75ed1940', '10.00', '2024-03-28 02:40:28', '2024-03-28 02:40:29'),
(90, 3, NULL, 'payment_9dbf8f5bac10a523fe0ba85f8dcd2048', '10.00', '2024-03-28 02:40:56', '2024-03-28 02:40:57'),
(91, 3, NULL, 'payment_fe554bd46f2c79fc0be8f9b7b8468275', '10.00', '2024-03-28 02:41:10', '2024-03-28 02:41:11'),
(92, 3, NULL, 'payment_2b6d220dca6d1bc5b818d7860a68b285', '10.00', '2024-03-28 02:42:00', '2024-03-28 02:42:02'),
(93, 3, NULL, 'payment_b10ea17deca45dfcb8702db4cb41431a', '10.00', '2024-03-28 02:42:10', '2024-03-28 02:42:12'),
(94, 3, NULL, 'payment_47a2fcc852b6d7af0cd6e4be10223053', '10.00', '2024-03-28 02:43:11', '2024-03-28 02:43:13'),
(95, 3, NULL, 'payment_dfa1a6e932ee180ca9a1caeb8a713bb2', '10.00', '2024-03-28 02:43:40', '2024-03-28 02:43:42'),
(96, 3, NULL, 'payment_38fcdda7aefb84e72cb41efc96cfffe5', '10.00', '2024-03-28 02:44:27', '2024-03-28 02:44:29'),
(97, 3, NULL, 'payment_d054c036fa9f8d1ad695c63d7e96a765', '10.00', '2024-03-28 02:44:50', '2024-03-28 02:44:52'),
(98, 3, NULL, 'payment_5e8b4dac3d4506d30adc5b679672f6c0', '10.00', '2024-03-28 02:50:17', '2024-03-28 02:50:19'),
(99, 3, NULL, 'payment_780e594b0f67d3d0feafba329e31bf8e', '10.00', '2024-03-28 02:50:32', '2024-03-28 02:50:34'),
(100, 3, NULL, 'payment_c106995ee0289d2af09a5109f72366bd', '10.00', '2024-03-28 02:50:55', '2024-03-28 02:50:57'),
(101, 3, NULL, 'payment_bf32a699dda81eef0e0ccde40ef5ffe5', '10.00', '2024-03-28 02:51:21', '2024-03-28 02:51:23'),
(102, 3, NULL, 'payment_faad8ad60676b2506038dcbfbf8975de', '10.00', '2024-03-28 02:51:43', '2024-03-28 02:51:45'),
(103, 3, NULL, 'payment_08a1627798d6bc1606a60c4f2942b1fe', '10.00', '2024-03-28 02:52:09', '2024-03-28 02:52:10'),
(104, 3, NULL, 'payment_3161b153ff728ab427b7f63899527a75', '10.00', '2024-03-28 02:53:11', '2024-03-28 02:53:13'),
(105, 3, NULL, 'payment_c6fc483dd0db88b341a32edbdb607f65', '10.00', '2024-03-28 02:53:48', '2024-03-28 02:53:50'),
(106, 3, NULL, 'payment_e0838018e3e3f8326bc04e3f0bb36297', '10.00', '2024-03-28 02:57:22', '2024-03-28 02:57:24'),
(107, 3, NULL, 'payment_29acf18152a7eb823e36c4ac63814b38', '10.00', '2024-03-28 02:58:08', '2024-03-28 02:58:09'),
(108, 3, NULL, 'payment_f67dfa65d1341165a46f60c48b8dd9ae', '10.00', '2024-03-28 02:58:47', '2024-03-28 02:58:49'),
(109, 3, NULL, 'payment_5ad1deaa524bab385807f215e8d79da3', '10.00', '2024-03-28 02:59:12', '2024-03-28 02:59:13'),
(110, 3, NULL, 'payment_095d3963409b0c9d4def5e517fb64a22', '10.00', '2024-03-28 02:59:35', '2024-03-28 02:59:37'),
(111, 3, NULL, 'payment_2c383f46eaecfc266d77b63d8375b259', '10.00', '2024-03-28 03:00:56', '2024-03-28 03:00:58'),
(112, 3, NULL, 'payment_8f4a356341bfb15d869ee4178bbd156c', '10.00', '2024-03-28 03:01:28', '2024-03-28 03:01:29'),
(113, 3, NULL, 'payment_7d5a124302858931d0e4df18b41ef4b5', '10.00', '2024-03-28 03:05:08', '2024-03-28 03:05:10'),
(114, 3, NULL, 'payment_9b875de66e8656b296bd181bb83e9dfc', '10.00', '2024-03-28 03:05:24', '2024-03-28 03:05:26'),
(115, 3, NULL, 'payment_1dc52422c31eb53dffa5d275ebb26c8b', '10.00', '2024-03-28 03:53:02', '2024-03-28 03:53:04'),
(116, 3, NULL, 'payment_938fc294e96211f795a01a53e0b2871a', '10.00', '2024-03-28 03:54:41', '2024-03-28 03:54:42'),
(117, 3, NULL, 'payment_97b4b8dab493ad7229fdae9bc0ce0422', '10.00', '2024-03-28 04:06:52', '2024-03-28 04:06:54'),
(118, 3, NULL, 'payment_4df1399968eb67305e15ca6a5ce69f15', '10.00', '2024-03-28 04:09:30', '2024-03-28 04:09:32'),
(119, 3, NULL, 'payment_10e842cf5e3ba4f6a76817fca637cd4c', '10.00', '2024-03-28 04:09:42', '2024-03-28 04:09:44'),
(120, 3, NULL, 'payment_41ff603fa100842cc1c4c9590162e524', '10.00', '2024-03-28 04:11:41', '2024-03-28 04:11:42'),
(121, 3, NULL, 'payment_e1fbb0d214298e8b3aa3ca019f3a8f8e', '10.00', '2024-03-28 04:12:17', '2024-03-28 04:12:19'),
(122, 3, NULL, 'payment_3a38776f3117c7413f4f33fc6667d7f1', '10.00', '2024-03-28 04:13:02', '2024-03-28 04:13:04'),
(123, 3, NULL, 'payment_2ff95496123082d8fa48648f4f1984f6', '10.00', '2024-03-28 04:13:14', '2024-03-28 04:13:15'),
(124, 3, NULL, 'payment_1aedc9451135fce4b2216b39925d0849', '10.00', '2024-03-28 04:17:08', '2024-03-28 04:17:10'),
(125, 3, NULL, 'payment_1e078b4050f93d2ce44fbaa41b62b37e', '10.00', '2024-03-28 04:17:53', '2024-03-28 04:17:54'),
(126, 3, NULL, 'payment_091a1843f32c356136a63c3ee2d035f7', '10.00', '2024-03-28 04:33:52', '2024-03-28 04:33:54'),
(127, 3, NULL, 'payment_1fd70f4fd7b31a43380eff462b13df85', '10.00', '2024-03-28 04:34:31', '2024-03-28 04:34:33'),
(128, 3, NULL, 'payment_df4281f1beb043fa752e7a24b041b20c', '10.00', '2024-03-28 04:35:04', '2024-03-28 04:35:05'),
(129, 3, NULL, 'payment_3774dfb8693f873dd347209c752919e6', '10.00', '2024-03-28 04:35:12', '2024-03-28 04:35:14'),
(130, 3, NULL, 'payment_cbbf4037e9306343c2961384586d69ed', '10.00', '2024-03-28 04:35:24', '2024-03-28 04:35:25'),
(132, 3, NULL, 'payment_0d120a4afe78707199dfcd9c5e1b0f2a', '10.00', '2024-03-28 04:39:38', '2024-03-28 04:39:40'),
(133, 3, NULL, 'payment_169d2af5bdb4da4597289cd3d830f2ab', '10.00', '2024-03-28 04:39:44', '2024-03-28 04:39:45'),
(134, 3, NULL, 'payment_b0d93676620add6e5a5b4dd5a2605a6a', '10.00', '2024-03-28 04:41:02', '2024-03-28 04:41:04'),
(135, 3, NULL, 'payment_f8cb8a860855f2dedf666cb13ec98130', '10.00', '2024-03-28 04:41:07', '2024-03-28 04:41:08'),
(136, 3, NULL, 'payment_5aa479c2c906f4c8a405990edd45fe5c', '10.00', '2024-03-28 04:47:24', '2024-03-28 04:47:26'),
(137, 3, NULL, 'payment_9884e047ad94473bec73b599296be2ec', '10.00', '2024-03-28 04:47:29', '2024-03-28 04:47:31'),
(138, 3, NULL, 'payment_012bc713f33ca2d8517e5ca2a65ede59', '10.00', '2024-03-28 05:15:44', '2024-03-28 05:15:46'),
(139, 3, NULL, 'payment_d8813c97f522f250f4d5a0e0b3b14f57', '10.00', '2024-03-28 05:15:54', '2024-03-28 05:15:55'),
(140, 3, NULL, 'payment_2e435afdf0b79907e8feaf7ee0b591f5', '10.00', '2024-03-28 05:17:51', '2024-03-28 05:17:53'),
(141, 3, NULL, 'payment_aade6fa017bc6344a6dc7768b2d12af0', '10.00', '2024-03-28 05:18:16', '2024-03-28 05:18:18'),
(142, 3, NULL, 'payment_226a07fbcd3943ba2d9cd8f6ea4881a3', '10.00', '2024-03-28 05:18:31', '2024-03-28 05:18:32'),
(143, 3, NULL, 'payment_82356621532062ab7899266aafb5b81d', '10.00', '2024-03-28 05:18:32', '2024-03-28 05:18:34'),
(144, 3, NULL, 'payment_4ef6fe369b961a9c8700e5faaee7596a', '10.00', '2024-03-28 05:23:14', '2024-03-28 05:23:16'),
(145, 3, NULL, 'payment_d6d208399425b96dc796816d84876462', '10.00', '2024-03-28 05:23:16', '2024-03-28 05:23:18'),
(146, 3, NULL, 'payment_e5952cdc86f5d3ded86cbe0e4d5cd428', '10.00', '2024-03-28 05:38:19', '2024-03-28 05:38:21'),
(147, 3, NULL, 'payment_1556fb59c4c6bf5a57263febe355d335', '10.00', '2024-03-28 05:38:38', '2024-03-28 05:38:39'),
(148, 3, NULL, 'payment_f31d7bb1e278db85e2fdf72b6b22766d', '10.00', '2024-03-28 05:38:44', '2024-03-28 05:38:46'),
(149, 3, NULL, 'payment_c85dc5e135fabc29e6315f10081e330b', '10.00', '2024-03-28 05:38:58', '2024-03-28 05:38:59'),
(150, 3, NULL, 'payment_ffb9ff4f676e7158287921e21c2fc565', '10.00', '2024-03-28 05:59:47', '2024-03-28 05:59:48'),
(151, 3, NULL, 'payment_f6e65329951a1198c6ecbad6545d37fd', '10.00', '2024-03-28 05:59:49', '2024-03-28 05:59:51'),
(158, 3, NULL, 'payment_3471e3ab05204c83654ad96dd024382c', '10.00', '2024-03-28 06:22:17', '2024-03-28 06:22:19'),
(159, 3, NULL, 'payment_a7b36b54ed036cfcdf9933c941f9eabd', '10.00', '2024-03-28 06:22:51', '2024-03-28 06:22:52'),
(160, 3, NULL, 'payment_1fe8c3d1e8784f7c400afddd24a337f0', '10.00', '2024-03-28 06:23:05', '2024-03-28 06:23:06'),
(161, 3, NULL, 'payment_7659176a8317f546fd637fe71dd99b68', '10.00', '2024-03-28 06:23:07', '2024-03-28 06:23:08'),
(162, 3, NULL, NULL, '10.00', '2024-03-28 06:28:10', '2024-03-28 06:28:10'),
(163, 3, NULL, 'payment_64f84b4458a1d4b6b78cec2c67171021', '10.00', '2024-03-28 06:55:29', '2024-03-28 06:55:31'),
(164, 3, NULL, 'payment_1b7c1ae42a2d42bba7b2b2dfd77ffdcc', '10.00', '2024-03-28 06:55:31', '2024-03-28 06:55:33'),
(165, 3, NULL, 'payment_1a2e6f8b924cfe50003641bb32ff353d', '10.00', '2024-03-28 06:55:44', '2024-03-28 06:55:46'),
(166, 3, NULL, 'payment_51f980c8cbe3395d09350ad2724ae7be', '10.00', '2024-03-29 01:53:19', '2024-03-29 01:53:21'),
(167, 3, NULL, 'payment_ba02c381f3595fd7dd2a9ac82b9111f4', '10.00', '2024-03-29 01:53:34', '2024-03-29 01:53:36'),
(168, 3, NULL, 'payment_934c02a5c279f2ac499cf8693e609465', '10.00', '2024-03-29 02:53:30', '2024-03-29 02:53:32'),
(169, 3, NULL, 'payment_79fd971c53afcf2f3987e1671e68a756', '10.00', '2024-03-29 03:48:33', '2024-03-29 03:48:35'),
(170, 3, NULL, 'payment_c54fd8caa48c8426ea423eb542acd5ee', '10.00', '2024-03-29 03:48:45', '2024-03-29 03:48:46'),
(171, 3, NULL, 'payment_66dc3bd5ef95465d1f104474b06c6710', '10.00', '2024-03-29 03:51:05', '2024-03-29 03:51:07'),
(172, 3, NULL, 'payment_91313cbbb7583c6e697df6ffa3b6cfc0', '10.00', '2024-03-29 03:52:40', '2024-03-29 03:52:42'),
(173, 3, NULL, 'payment_8cbbdbf3dbfd19d429910872b213498a', '10.00', '2024-03-29 03:55:56', '2024-03-29 03:55:58'),
(174, 3, NULL, 'payment_cf18c41abde4f4b6d66a8bb460245569', '10.00', '2024-03-29 03:56:49', '2024-03-29 03:56:50'),
(175, 3, NULL, 'payment_7462c048bcb37fe56e5e7e13cb8bc52a', '10.00', '2024-03-29 11:59:52', '2024-03-29 11:59:53'),
(176, 3, NULL, 'payment_ea71677fd495de2593455a63b78d03e5', '10.00', '2024-03-29 11:59:59', '2024-03-29 12:00:00'),
(177, 3, NULL, 'payment_eae838c31c8e9da1e6bd2413fe695757', '10.00', '2024-03-29 12:00:11', '2024-03-29 12:00:12'),
(178, 3, NULL, 'payment_c486690285ea253f1cdd58b97b3c1ca3', '10.00', '2024-03-29 12:09:22', '2024-03-29 12:09:23'),
(179, 3, NULL, 'payment_1c541e86ca2f5884d74b48430d8ba094', '10.00', '2024-03-29 12:09:37', '2024-03-29 12:09:38'),
(180, 3, NULL, 'payment_8b008548451d05985a0de5801bc639dc', '10.00', '2024-03-30 01:07:18', '2024-03-30 01:07:19'),
(181, 3, NULL, 'payment_49d8f7982daece9a99ca7af886d7d5d6', '10.00', '2024-04-01 01:49:26', '2024-04-01 01:49:27'),
(182, 3, NULL, 'payment_a153fae8215b47a731242af98fe3fcf7', '10.00', '2024-04-01 01:49:41', '2024-04-01 01:49:42'),
(183, 3, NULL, 'payment_6bab686d0789be873a030a2ac688599c', '10.00', '2024-04-01 01:49:48', '2024-04-01 01:49:49'),
(184, 3, NULL, 'payment_e4c096a876a58f8f45265ef4efea7332', '10.00', '2024-04-01 01:50:04', '2024-04-01 01:50:05'),
(185, 4, NULL, 'payment_e2c5ce0b88cc1c5b1b93da8bbe4be4cd', '20.00', '2024-04-01 02:21:08', '2024-04-01 02:21:09'),
(186, 4, NULL, 'payment_226e4cb5e6e54f9ccbe8e53f623faa77', '20.00', '2024-04-01 02:21:09', '2024-04-01 02:21:10'),
(187, 4, NULL, 'payment_5033769c71b0f5038ebd172b40775507', '20.00', '2024-04-01 02:21:26', '2024-04-01 02:21:27'),
(188, 4, NULL, 'payment_55c9118dbba0f8f1c0750d00236277d1', '20.00', '2024-04-01 02:22:49', '2024-04-01 02:22:51'),
(189, 4, NULL, 'payment_69208d4ebb6054ad3f6e27d1acd604c2', '20.00', '2024-04-01 02:22:53', '2024-04-01 02:22:54'),
(190, 4, NULL, 'payment_27602df846fe198218b5d32515939ec3', '20.00', '2024-04-01 02:29:03', '2024-04-01 02:29:04'),
(191, 4, NULL, 'payment_7aef2160d60e7cc0b837437226d8f0a5', '20.00', '2024-04-01 02:30:00', '2024-04-01 02:30:02'),
(192, 4, NULL, 'payment_31bbc494f96aecc6a262a3a95a76cb35', '20.00', '2024-04-01 02:47:42', '2024-04-01 02:47:43'),
(193, 4, NULL, 'payment_f0ca02477e7826184f2ca502f9c23a6a', '20.00', '2024-04-01 02:48:55', '2024-04-01 02:48:56'),
(194, 3, NULL, 'payment_59e724ddb9f3855c82eafc46375b53b3', '10.00', '2024-04-01 02:49:28', '2024-04-01 02:49:29'),
(195, 4, NULL, 'payment_b02fae5ec5764c10571486b9ad53abf8', '20.00', '2024-04-01 02:51:13', '2024-04-01 02:51:14'),
(196, 4, NULL, 'payment_d2225f7af0243c2f38b957e92e7a8cf7', '20.00', '2024-04-01 02:51:15', '2024-04-01 02:51:17'),
(197, 3, NULL, 'payment_afd502fb298e640bcbe5cc7b764522ce', '10.00', '2024-04-01 03:45:41', '2024-04-01 03:45:42'),
(198, 3, NULL, 'payment_19555b2e7f23dfb4926c45d9033ed869', '10.00', '2024-04-01 03:45:44', '2024-04-01 03:45:45'),
(199, 3, NULL, 'payment_bbc4eb39e15803cdb12b4722056ae456', '10.00', '2024-04-01 03:48:55', '2024-04-01 03:48:56'),
(200, 3, NULL, 'payment_0b8c39a92c0027ca418f789814f20e0d', '10.00', '2024-04-01 03:48:58', '2024-04-01 03:49:00'),
(201, 3, NULL, 'payment_fb39167420ae691780b87baba96c2216', '10.00', '2024-04-01 05:04:05', '2024-04-01 05:04:07'),
(202, 3, NULL, NULL, '10.00', '2024-04-01 05:19:48', '2024-04-01 05:19:48'),
(203, 3, NULL, 'payment_5bdcc1744e60b0d942e62a3da3e2d260', '10.00', '2024-04-01 06:38:28', '2024-04-01 06:38:30'),
(204, 3, NULL, 'payment_b5bd5f136e3299952718021a7a6d6818', '10.00', '2024-04-01 06:38:42', '2024-04-01 06:38:43'),
(205, 3, NULL, 'payment_499a0b6ed44d809fadd9992feacf3371', '10.00', '2024-04-01 06:40:53', '2024-04-01 06:40:54'),
(206, 3, NULL, 'payment_b2cf457bc680ad6ec674e2efcb246966', '10.00', '2024-04-01 06:40:59', '2024-04-01 06:41:00'),
(207, 3, NULL, 'payment_2778957e58b0bdf8a702e8b434c99404', '10.00', '2024-04-04 02:54:03', '2024-04-04 02:54:05'),
(208, 3, NULL, 'payment_db1d0a5ce782fdaeca197334b01928a4', '10.00', '2024-04-04 03:03:20', '2024-04-04 03:03:21'),
(209, 3, NULL, 'payment_f1c813fdcfe4fa2be731beb80c02bec3', '10.00', '2024-04-04 03:05:42', '2024-04-04 03:05:44'),
(210, 3, NULL, 'payment_27bdc6bf012aa875223ce0d62e70bfde', '10.00', '2024-04-04 03:06:32', '2024-04-04 03:06:33'),
(211, 3, NULL, 'payment_842ce7d6d76b8137984e01e023f666ee', '10.00', '2024-04-04 03:07:30', '2024-04-04 03:07:31'),
(212, 3, NULL, 'payment_b59022c2fda9698c9f3de19f4173572e', '10.00', '2024-04-04 03:07:31', '2024-04-04 03:07:32'),
(213, 3, NULL, 'payment_17a1f3bf35487c0849f3ac6ef7583a03', '10.00', '2024-04-04 03:08:57', '2024-04-04 03:08:58'),
(215, 3, NULL, 'payment_76d8db74b4a1cb6d2683155f74b9169e', '10.00', '2024-04-04 03:09:13', '2024-04-04 03:09:15'),
(216, 3, NULL, 'payment_6229f13df6615a10efe276d377951697', '10.00', '2024-04-04 03:09:14', '2024-04-04 03:09:15'),
(217, 3, NULL, 'payment_90af8862dd49c81a0313123b1b1b8b74', '10.00', '2024-04-04 03:18:30', '2024-04-04 03:18:32'),
(218, 3, NULL, 'payment_5ce83c36f85290ec542d6d84052fe166', '10.00', '2024-04-04 03:18:30', '2024-04-04 03:18:32'),
(219, 3, NULL, 'payment_a00e0ce810ab9c98fca68412b0a6d4e0', '10.00', '2024-04-04 03:20:01', '2024-04-04 03:20:02'),
(220, 3, NULL, 'payment_c697bdd03c9a06e747bddd5c0bc13987', '10.00', '2024-04-04 03:20:03', '2024-04-04 03:20:04'),
(221, 3, NULL, 'payment_9623b7638b60635efc0916ae319b6a42', '10.00', '2024-04-04 03:41:22', '2024-04-04 03:41:23'),
(222, 3, NULL, 'payment_a7fbfeb1c5f1d8ed81dad53ad478a427', '10.00', '2024-04-04 03:41:24', '2024-04-04 03:41:25'),
(223, 3, NULL, 'payment_5a62a077787805e5f868b6393a50fc61', '10.00', '2024-04-04 03:42:34', '2024-04-04 03:42:35'),
(224, 3, NULL, 'payment_c3843d9e2d71b63f3a563b3bd93b62ab', '10.00', '2024-04-04 03:42:35', '2024-04-04 03:42:36'),
(225, 3, NULL, 'payment_c001f1256fef6b70b8c4657e32ecbc4a', '10.00', '2024-04-08 00:47:20', '2024-04-08 00:47:21'),
(226, 3, NULL, 'payment_d1d620c05865d69aa25d7183c2dbef68', '10.00', '2024-04-08 00:47:20', '2024-04-08 00:47:21'),
(227, 3, NULL, 'payment_b9b42450a5646d7e77349e1f0d10f3fb', '10.00', '2024-05-02 05:16:03', '2024-05-02 05:16:04'),
(231, 3, NULL, '{\"type\":\"error\",\"message\":\"This Customer doesn\'t have any saved payment details. Attach a legacy Token, Card, Bank Account, or Source to this Customer and then try this request again, or use Payment Intents and Payment Methods instead.\"}', '10.00', '2024-05-03 09:20:23', '2024-05-03 09:20:23'),
(236, 3, NULL, '{\"type\":\"error\",\"message\":\"This Customer doesn\'t have any saved payment details. Attach a legacy Token, Card, Bank Account, or Source to this Customer and then try this request again, or use Payment Intents and Payment Methods instead.\"}', '10.00', '2024-05-06 05:45:32', '2024-05-06 05:45:33'),
(242, 4, NULL, 'ch_3PDQOLLOWAL3xmQ81A0M52Vq', '20.00', '2024-05-06 07:11:36', '2024-05-06 07:11:38'),
(243, 3, NULL, 'ch_3PDQPsLOWAL3xmQ81F1gL3Y7', '10.00', '2024-05-06 07:13:12', '2024-05-06 07:13:13'),
(246, 3, NULL, 'ch_3PDQm4LOWAL3xmQ80i7Yp5dL', '10.00', '2024-05-06 07:36:07', '2024-05-06 07:36:08'),
(248, 4, NULL, NULL, '20.00', '2024-05-06 08:30:13', '2024-05-06 08:30:13'),
(249, 3, NULL, NULL, '10.00', '2024-05-06 08:51:24', '2024-05-06 08:51:24'),
(251, 3, NULL, 'ch_3PDmFLLOWAL3xmQ8185UdHjs', '10.00', '2024-05-07 06:31:47', '2024-05-07 06:31:48'),
(252, 3, NULL, 'ch_3PEWkqLOWAL3xmQ81ppu4x3E', '10.00', '2024-05-09 08:11:23', '2024-05-09 08:11:25'),
(253, 3, NULL, 'ch_3PEWl3LOWAL3xmQ81GVy7oQX', '10.00', '2024-05-09 08:11:36', '2024-05-09 08:11:37'),
(254, 3, NULL, 'ch_3PEWlxLOWAL3xmQ81HBMwCFM', '10.00', '2024-05-09 08:12:32', '2024-05-09 08:12:33'),
(255, 3, NULL, 'ch_3PEX85LOWAL3xmQ80Uc5DR7P', '10.00', '2024-05-09 08:35:25', '2024-05-09 08:35:26'),
(256, 3, NULL, 'ch_3PEX89LOWAL3xmQ80cst4Ih3', '10.00', '2024-05-09 08:35:28', '2024-05-09 08:35:30'),
(257, 3, NULL, 'ch_3PEXAcLOWAL3xmQ80SYHFAvj', '10.00', '2024-05-09 08:38:01', '2024-05-09 08:38:03'),
(258, 3, NULL, 'ch_3PEXAgLOWAL3xmQ800P4SLUk', '10.00', '2024-05-09 08:38:06', '2024-05-09 08:38:07'),
(259, 3, NULL, 'ch_3PEXCaLOWAL3xmQ81A8hXzam', '10.00', '2024-05-09 08:40:03', '2024-05-09 08:40:04'),
(260, 3, NULL, 'ch_3PEXDHLOWAL3xmQ80wlB4nLu', '10.00', '2024-05-09 08:40:47', '2024-05-09 08:40:48'),
(261, 3, NULL, 'ch_3PEXH8LOWAL3xmQ80Qvk8Tlw', '10.00', '2024-05-09 08:44:45', '2024-05-09 08:44:46'),
(262, 3, NULL, 'ch_3PEXHHLOWAL3xmQ81ElD7VF8', '10.00', '2024-05-09 08:44:55', '2024-05-09 08:44:56'),
(263, 3, NULL, 'ch_3PEXUcLOWAL3xmQ81i2wG0sd', '10.00', '2024-05-09 08:58:42', '2024-05-09 08:58:43'),
(264, 3, NULL, 'ch_3PEXUeLOWAL3xmQ81UDHbKvy', '10.00', '2024-05-09 08:58:43', '2024-05-09 08:58:44'),
(265, 3, NULL, 'ch_3PEXaTLOWAL3xmQ80qtHEYvj', '10.00', '2024-05-09 09:04:45', '2024-05-09 09:04:46'),
(266, 3, NULL, 'ch_3PEXbDLOWAL3xmQ809y7yrFh', '10.00', '2024-05-09 09:05:31', '2024-05-09 09:05:32'),
(267, 3, NULL, 'ch_3PEXkXLOWAL3xmQ81ILuXkfl', '10.00', '2024-05-09 09:15:08', '2024-05-09 09:15:10'),
(268, 3, NULL, 'ch_3PEXkvLOWAL3xmQ80DEFDZY4', '10.00', '2024-05-09 09:15:33', '2024-05-09 09:15:34'),
(269, 3, NULL, NULL, '10.00', '2024-05-10 00:46:14', '2024-05-10 00:46:14'),
(270, 3, NULL, NULL, '10.00', '2024-05-10 01:34:56', '2024-05-10 01:34:56'),
(271, 3, NULL, NULL, '10.00', '2024-05-10 01:36:14', '2024-05-10 01:36:14'),
(272, 3, NULL, NULL, '10.00', '2024-05-10 02:00:33', '2024-05-10 02:00:33'),
(273, 3, NULL, 'ch_3PEnRtLOWAL3xmQ81iBgD4iw', '10.00', '2024-05-10 02:00:57', '2024-05-10 02:00:58'),
(274, 3, NULL, NULL, '10.00', '2024-05-10 02:03:13', '2024-05-10 02:03:13'),
(275, 3, NULL, NULL, '10.00', '2024-05-10 02:03:27', '2024-05-10 02:03:27'),
(276, 3, NULL, NULL, '10.00', '2024-05-10 02:16:55', '2024-05-10 02:16:55'),
(277, 3, NULL, 'ch_3PEnjZLOWAL3xmQ80klRysl1', '10.00', '2024-05-10 02:19:13', '2024-05-10 02:19:14'),
(278, 3, NULL, NULL, '10.00', '2024-05-10 02:19:28', '2024-05-10 02:19:28'),
(279, 3, NULL, NULL, '10.00', '2024-05-10 02:30:55', '2024-05-10 02:30:55'),
(280, 3, NULL, NULL, '10.00', '2024-05-10 02:31:41', '2024-05-10 02:31:41'),
(281, 3, NULL, NULL, '10.00', '2024-05-10 02:32:26', '2024-05-10 02:32:26'),
(282, 3, NULL, NULL, '10.00', '2024-05-10 02:33:40', '2024-05-10 02:33:40'),
(283, 3, NULL, 'ch_3PEnxoLOWAL3xmQ805WN2Tc3', '10.00', '2024-05-10 02:33:56', '2024-05-10 02:33:57'),
(284, 3, NULL, NULL, '10.00', '2024-05-10 02:36:10', '2024-05-10 02:36:10'),
(285, 3, NULL, 'ch_3PEo0NLOWAL3xmQ81VJZGTOd', '10.00', '2024-05-10 02:36:34', '2024-05-10 02:36:35'),
(286, 3, NULL, NULL, '10.00', '2024-05-10 02:38:59', '2024-05-10 02:38:59'),
(287, 3, NULL, 'ch_3PEo31LOWAL3xmQ805RIWeS1', '10.00', '2024-05-10 02:39:19', '2024-05-10 02:39:20'),
(288, 3, NULL, NULL, '10.00', '2024-05-10 04:41:30', '2024-05-10 04:41:30'),
(289, 3, NULL, 'ch_3PEpxPLOWAL3xmQ81nXNZJYB', '10.00', '2024-05-10 04:41:39', '2024-05-10 04:41:40'),
(290, 3, NULL, NULL, '10.00', '2024-05-10 05:02:57', '2024-05-10 05:02:57'),
(291, 3, NULL, NULL, '10.00', '2024-05-10 05:03:02', '2024-05-10 05:03:02'),
(292, 3, NULL, 'ch_3PFqqfLOWAL3xmQ80tMKHbo9', '10.00', '2024-05-12 23:50:53', '2024-05-12 23:50:54'),
(297, 3, NULL, 'ch_3PFrAELOWAL3xmQ81tNE8Sbz', '10.00', '2024-05-13 00:11:05', '2024-05-13 00:11:07'),
(300, 3, NULL, 'ch_3PFrK6LOWAL3xmQ81Kksd2y2', '10.00', '2024-05-13 00:21:18', '2024-05-13 00:21:19'),
(301, 3, NULL, 'ch_3PFrX7LOWAL3xmQ81m88CGK5', '10.00', '2024-05-13 00:34:44', '2024-05-13 00:34:45'),
(302, 3, NULL, 'ch_3PFrkELOWAL3xmQ81wLxP52v', '10.00', '2024-05-13 00:48:18', '2024-05-13 00:48:19'),
(303, 3, NULL, 'ch_3PFrliLOWAL3xmQ80w1c36cq', '10.00', '2024-05-13 00:49:49', '2024-05-13 00:49:50'),
(304, 3, NULL, 'ch_3PFrrqLOWAL3xmQ80RHHPtJx', '10.00', '2024-05-13 00:56:10', '2024-05-13 00:56:11'),
(305, 3, NULL, 'ch_3PFruDLOWAL3xmQ8154gIhD3', '10.00', '2024-05-13 00:58:37', '2024-05-13 00:58:38'),
(306, 3, NULL, 'ch_3PFrwKLOWAL3xmQ81uX5nMvg', '10.00', '2024-05-13 01:00:47', '2024-05-13 01:00:49'),
(307, 3, NULL, 'ch_3PFsEeLOWAL3xmQ814nFNrzL', '10.00', '2024-05-13 01:19:44', '2024-05-13 01:19:45'),
(308, 3, NULL, 'ch_3PFsJgLOWAL3xmQ81MSjVuZc', '10.00', '2024-05-13 01:24:55', '2024-05-13 01:24:56'),
(309, 3, NULL, 'ch_3PFsMqLOWAL3xmQ806YLsv7r', '10.00', '2024-05-13 01:28:12', '2024-05-13 01:28:13'),
(310, 3, NULL, 'ch_3PFsPQLOWAL3xmQ80PG2hVTr', '10.00', '2024-05-13 01:30:52', '2024-05-13 01:30:53'),
(311, 3, NULL, 'ch_3PFsR8LOWAL3xmQ80kbejcZw', '10.00', '2024-05-13 01:32:37', '2024-05-13 01:32:39'),
(312, 3, NULL, 'ch_3PFsS8LOWAL3xmQ80OFY4kfu', '10.00', '2024-05-13 01:33:40', '2024-05-13 01:33:41'),
(313, 3, NULL, 'ch_3PFsWDLOWAL3xmQ801U0ktfP', '10.00', '2024-05-13 01:37:53', '2024-05-13 01:37:54'),
(314, 3, NULL, 'ch_3PFsY5LOWAL3xmQ81tGoX5Tz', '10.00', '2024-05-13 01:39:48', '2024-05-13 01:39:49'),
(315, 3, NULL, 'ch_3PFsZpLOWAL3xmQ80mPGHLhE', '10.00', '2024-05-13 01:41:37', '2024-05-13 01:41:38'),
(316, 3, NULL, 'ch_3PFsbSLOWAL3xmQ81xykZb64', '10.00', '2024-05-13 01:43:18', '2024-05-13 01:43:19'),
(317, 3, NULL, 'ch_3PFsdoLOWAL3xmQ81yuxsMNS', '10.00', '2024-05-13 01:45:44', '2024-05-13 01:45:45'),
(318, 3, NULL, 'ch_3PFsfwLOWAL3xmQ80ukadtqF', '10.00', '2024-05-13 01:47:55', '2024-05-13 01:47:56'),
(319, 3, NULL, 'ch_3PFsxlLOWAL3xmQ80Sdq3iTH', '10.00', '2024-05-13 02:06:21', '2024-05-13 02:06:22'),
(320, 3, NULL, 'ch_3PFszPLOWAL3xmQ80678Vwbl', '10.00', '2024-05-13 02:08:02', '2024-05-13 02:08:04'),
(321, 3, NULL, 'ch_3PFt0rLOWAL3xmQ81GBOzaPD', '10.00', '2024-05-13 02:09:33', '2024-05-13 02:09:34'),
(322, 3, NULL, 'ch_3PFt1qLOWAL3xmQ81njz33Ph', '10.00', '2024-05-13 02:10:33', '2024-05-13 02:10:35'),
(323, 3, NULL, 'ch_3PFt7CLOWAL3xmQ80DYTdmju', '10.00', '2024-05-13 02:16:05', '2024-05-13 02:16:06'),
(324, 3, NULL, 'ch_3PFt8TLOWAL3xmQ811AEFXZb', '10.00', '2024-05-13 02:17:25', '2024-05-13 02:17:26'),
(325, 3, NULL, 'ch_3PFtCBLOWAL3xmQ81fnYpiJh', '10.00', '2024-05-13 02:21:14', '2024-05-13 02:21:15'),
(326, 3, NULL, 'ch_3PFtSjLOWAL3xmQ81LpYegzA', '10.00', '2024-05-13 02:38:21', '2024-05-13 02:38:22'),
(327, NULL, NULL, NULL, '1.00', '2024-05-13 06:08:26', '2024-05-13 06:08:26'),
(328, NULL, NULL, NULL, '1.00', '2024-05-13 06:09:33', '2024-05-13 06:09:33'),
(329, NULL, 159, 'ch_3PFwqDP7nrCpAwBa0tSN3HeU', '1.00', '2024-05-13 06:14:48', '2024-05-13 06:14:51'),
(330, NULL, NULL, NULL, '1.00', '2024-05-13 06:15:32', '2024-05-13 06:15:32'),
(331, NULL, NULL, NULL, '1.00', '2024-05-13 06:15:40', '2024-05-13 06:15:40'),
(332, NULL, 141, 'ch_3PFwxyP7nrCpAwBa1RpsAl6k', '1.00', '2024-05-13 06:22:49', '2024-05-13 06:22:51'),
(333, NULL, NULL, NULL, '1.00', '2024-05-13 07:26:25', '2024-05-13 07:26:25'),
(334, NULL, NULL, NULL, '1.00', '2024-05-13 07:28:23', '2024-05-13 07:28:23'),
(335, NULL, NULL, NULL, '1.00', '2024-05-13 07:35:14', '2024-05-13 07:35:14'),
(336, NULL, NULL, NULL, '1.00', '2024-05-13 07:35:31', '2024-05-13 07:35:31'),
(337, NULL, NULL, NULL, '1.00', '2024-05-13 07:43:08', '2024-05-13 07:43:08'),
(338, NULL, NULL, NULL, '1.00', '2024-05-13 07:43:21', '2024-05-13 07:43:21'),
(339, NULL, NULL, NULL, '1.00', '2024-05-13 08:24:47', '2024-05-13 08:24:47'),
(340, NULL, NULL, NULL, '1.00', '2024-05-13 08:25:11', '2024-05-13 08:25:11'),
(341, NULL, NULL, NULL, '1.00', '2024-05-14 00:44:47', '2024-05-14 00:44:47'),
(342, NULL, NULL, NULL, '1.00', '2024-05-14 00:44:47', '2024-05-14 00:44:47'),
(343, NULL, NULL, NULL, '1.00', '2024-05-14 01:09:20', '2024-05-14 01:09:20'),
(344, NULL, NULL, NULL, '1.00', '2024-05-14 01:09:35', '2024-05-14 01:09:35'),
(345, NULL, NULL, NULL, '1.00', '2024-05-14 01:12:17', '2024-05-14 01:12:17'),
(346, NULL, NULL, NULL, '1.00', '2024-05-14 01:14:32', '2024-05-14 01:14:32'),
(347, NULL, NULL, NULL, '1.00', '2024-05-14 02:13:54', '2024-05-14 02:13:54'),
(348, NULL, NULL, NULL, '1.00', '2024-05-14 02:37:18', '2024-05-14 02:37:18'),
(349, NULL, NULL, NULL, '1.00', '2024-05-14 02:38:06', '2024-05-14 02:38:06'),
(350, NULL, NULL, NULL, '1.00', '2024-05-14 02:42:59', '2024-05-14 02:42:59'),
(351, NULL, NULL, NULL, '1.00', '2024-05-14 02:43:08', '2024-05-14 02:43:08'),
(352, NULL, NULL, NULL, '1.00', '2024-05-14 02:46:21', '2024-05-14 02:46:21'),
(353, NULL, NULL, NULL, '1.00', '2024-05-14 02:46:36', '2024-05-14 02:46:36'),
(354, NULL, NULL, NULL, '1.00', '2024-05-14 04:22:33', '2024-05-14 04:22:33'),
(355, NULL, NULL, NULL, '1.00', '2024-05-14 04:22:34', '2024-05-14 04:22:34'),
(356, NULL, NULL, NULL, '1.00', '2024-05-14 04:29:10', '2024-05-14 04:29:10'),
(357, NULL, NULL, NULL, '1.00', '2024-05-14 04:29:16', '2024-05-14 04:29:16'),
(358, NULL, NULL, NULL, '1.00', '2024-05-14 04:45:40', '2024-05-14 04:45:40'),
(359, NULL, NULL, NULL, '1.00', '2024-05-14 04:45:49', '2024-05-14 04:45:49'),
(360, NULL, NULL, NULL, '1.00', '2024-05-14 04:49:45', '2024-05-14 04:49:45'),
(361, NULL, NULL, NULL, '1.00', '2024-05-14 04:49:56', '2024-05-14 04:49:56'),
(362, NULL, NULL, NULL, '1.00', '2024-05-14 05:08:53', '2024-05-14 05:08:53'),
(363, NULL, NULL, NULL, '1.00', '2024-05-14 05:09:06', '2024-05-14 05:09:06'),
(364, NULL, NULL, NULL, '1.00', '2024-05-14 05:50:04', '2024-05-14 05:50:04'),
(365, NULL, NULL, NULL, '1.00', '2024-05-14 05:50:17', '2024-05-14 05:50:17'),
(366, NULL, NULL, NULL, '1.00', '2024-05-14 05:54:43', '2024-05-14 05:54:43'),
(367, NULL, NULL, NULL, '1.00', '2024-05-14 05:54:53', '2024-05-14 05:54:53'),
(368, NULL, NULL, NULL, '1.00', '2024-05-14 06:00:51', '2024-05-14 06:00:51'),
(369, NULL, NULL, NULL, '1.00', '2024-05-14 06:00:59', '2024-05-14 06:00:59'),
(370, NULL, NULL, NULL, '1.00', '2024-05-14 06:09:33', '2024-05-14 06:09:33'),
(371, NULL, NULL, NULL, '1.00', '2024-05-14 06:09:40', '2024-05-14 06:09:40'),
(372, NULL, NULL, NULL, '1.00', '2024-05-14 06:11:31', '2024-05-14 06:11:31'),
(373, NULL, NULL, NULL, '1.00', '2024-05-14 06:11:46', '2024-05-14 06:11:46'),
(374, NULL, NULL, NULL, '1.00', '2024-05-14 06:12:39', '2024-05-14 06:12:39'),
(375, NULL, NULL, NULL, '1.00', '2024-05-14 06:12:42', '2024-05-14 06:12:42'),
(376, NULL, NULL, NULL, '1.00', '2024-05-14 06:15:20', '2024-05-14 06:15:20'),
(377, NULL, NULL, NULL, '1.00', '2024-05-14 06:15:31', '2024-05-14 06:15:31'),
(378, NULL, NULL, NULL, '1.00', '2024-05-14 06:29:32', '2024-05-14 06:29:32'),
(379, NULL, NULL, NULL, '1.00', '2024-05-14 06:29:37', '2024-05-14 06:29:37'),
(380, NULL, NULL, NULL, '1.00', '2024-05-14 06:38:31', '2024-05-14 06:38:31'),
(381, NULL, NULL, NULL, '1.00', '2024-05-14 06:38:33', '2024-05-14 06:38:33'),
(382, NULL, NULL, NULL, '1.00', '2024-05-14 06:41:23', '2024-05-14 06:41:23'),
(383, NULL, NULL, NULL, '1.00', '2024-05-14 06:41:23', '2024-05-14 06:41:23'),
(384, NULL, NULL, NULL, '1.00', '2024-05-14 06:41:57', '2024-05-14 06:41:57'),
(385, NULL, NULL, NULL, '1.00', '2024-05-14 06:42:42', '2024-05-14 06:42:42'),
(386, NULL, NULL, NULL, '1.00', '2024-05-14 06:42:42', '2024-05-14 06:42:42'),
(387, NULL, NULL, NULL, '1.00', '2024-05-14 06:57:38', '2024-05-14 06:57:38'),
(388, NULL, NULL, NULL, '1.00', '2024-05-14 06:57:48', '2024-05-14 06:57:48'),
(389, NULL, NULL, NULL, '1.00', '2024-05-14 07:00:08', '2024-05-14 07:00:08'),
(390, NULL, NULL, NULL, '1.00', '2024-05-14 07:00:12', '2024-05-14 07:00:12'),
(391, NULL, NULL, NULL, '1.00', '2024-05-14 07:02:52', '2024-05-14 07:02:52'),
(392, NULL, NULL, NULL, '1.00', '2024-05-14 07:02:55', '2024-05-14 07:02:55'),
(393, NULL, NULL, NULL, '1.00', '2024-05-14 07:04:42', '2024-05-14 07:04:42'),
(394, NULL, NULL, NULL, '1.00', '2024-05-14 07:04:56', '2024-05-14 07:04:56'),
(395, NULL, NULL, NULL, '1.00', '2024-05-14 07:11:00', '2024-05-14 07:11:00'),
(396, NULL, NULL, NULL, '1.00', '2024-05-14 07:11:07', '2024-05-14 07:11:07'),
(397, NULL, NULL, NULL, '1.00', '2024-05-14 07:12:44', '2024-05-14 07:12:44'),
(398, NULL, NULL, NULL, '1.00', '2024-05-14 07:12:54', '2024-05-14 07:12:54'),
(399, NULL, NULL, NULL, '1.00', '2024-05-14 07:14:32', '2024-05-14 07:14:32'),
(400, NULL, NULL, NULL, '1.00', '2024-05-14 07:14:34', '2024-05-14 07:14:34'),
(401, NULL, NULL, NULL, '1.00', '2024-05-14 07:14:45', '2024-05-14 07:14:45'),
(402, NULL, NULL, NULL, '1.00', '2024-05-14 07:14:56', '2024-05-14 07:14:56'),
(403, NULL, NULL, NULL, '1.00', '2024-05-14 07:19:55', '2024-05-14 07:19:55'),
(404, NULL, NULL, NULL, '1.00', '2024-05-14 07:20:06', '2024-05-14 07:20:06'),
(405, NULL, NULL, NULL, '1.00', '2024-05-14 07:21:08', '2024-05-14 07:21:08'),
(406, NULL, NULL, NULL, '1.00', '2024-05-14 07:21:15', '2024-05-14 07:21:15'),
(407, NULL, NULL, NULL, '1.00', '2024-05-14 07:22:16', '2024-05-14 07:22:16'),
(408, NULL, NULL, NULL, '1.00', '2024-05-14 07:22:32', '2024-05-14 07:22:32'),
(409, NULL, NULL, NULL, '1.00', '2024-05-14 07:23:35', '2024-05-14 07:23:35'),
(410, NULL, NULL, NULL, '1.00', '2024-05-14 07:23:55', '2024-05-14 07:23:55'),
(411, NULL, NULL, NULL, '1.00', '2024-05-14 07:29:08', '2024-05-14 07:29:08'),
(412, NULL, NULL, NULL, '1.00', '2024-05-14 07:29:11', '2024-05-14 07:29:11'),
(413, NULL, NULL, NULL, '1.00', '2024-05-14 07:30:09', '2024-05-14 07:30:09'),
(414, NULL, NULL, NULL, '1.00', '2024-05-14 07:30:18', '2024-05-14 07:30:18'),
(415, NULL, NULL, NULL, '1.00', '2024-05-14 07:31:54', '2024-05-14 07:31:54'),
(416, NULL, NULL, NULL, '1.00', '2024-05-14 07:31:58', '2024-05-14 07:31:58'),
(417, NULL, NULL, NULL, '1.00', '2024-05-14 07:34:45', '2024-05-14 07:34:45'),
(418, NULL, NULL, NULL, '1.00', '2024-05-14 07:34:55', '2024-05-14 07:34:55'),
(419, NULL, NULL, NULL, '1.00', '2024-05-14 07:35:57', '2024-05-14 07:35:57'),
(420, NULL, NULL, NULL, '1.00', '2024-05-14 07:36:00', '2024-05-14 07:36:00'),
(421, NULL, NULL, NULL, '1.00', '2024-05-14 07:36:35', '2024-05-14 07:36:35'),
(422, NULL, NULL, NULL, '1.00', '2024-05-14 07:36:42', '2024-05-14 07:36:42'),
(423, NULL, NULL, NULL, '1.00', '2024-05-14 07:51:22', '2024-05-14 07:51:22'),
(424, NULL, NULL, NULL, '1.00', '2024-05-14 07:51:38', '2024-05-14 07:51:38'),
(425, NULL, NULL, NULL, '1.00', '2024-05-14 07:53:56', '2024-05-14 07:53:56'),
(426, NULL, NULL, NULL, '1.00', '2024-05-14 07:53:58', '2024-05-14 07:53:58'),
(427, NULL, NULL, NULL, '1.00', '2024-05-14 07:54:17', '2024-05-14 07:54:17'),
(428, NULL, NULL, NULL, '1.00', '2024-05-14 07:55:20', '2024-05-14 07:55:20'),
(429, NULL, NULL, NULL, '1.00', '2024-05-14 07:55:31', '2024-05-14 07:55:31'),
(430, NULL, NULL, NULL, '1.00', '2024-05-14 07:57:02', '2024-05-14 07:57:02'),
(431, NULL, NULL, NULL, '1.00', '2024-05-14 07:57:10', '2024-05-14 07:57:10'),
(432, NULL, NULL, NULL, '1.00', '2024-05-14 07:58:37', '2024-05-14 07:58:37'),
(433, NULL, NULL, NULL, '1.00', '2024-05-14 07:58:40', '2024-05-14 07:58:40'),
(434, NULL, NULL, NULL, '1.00', '2024-05-14 08:05:02', '2024-05-14 08:05:02'),
(435, 3, NULL, NULL, '10.00', '2024-05-14 08:05:09', '2024-05-14 08:05:09'),
(436, NULL, NULL, NULL, '1.00', '2024-05-14 08:05:53', '2024-05-14 08:05:53'),
(437, NULL, NULL, NULL, '1.00', '2024-05-14 08:05:56', '2024-05-14 08:05:56'),
(438, NULL, NULL, NULL, '1.00', '2024-05-14 08:06:42', '2024-05-14 08:06:42'),
(439, NULL, NULL, NULL, '1.00', '2024-05-14 08:06:51', '2024-05-14 08:06:51'),
(440, NULL, NULL, NULL, '1.00', '2024-05-14 08:08:21', '2024-05-14 08:08:21'),
(441, NULL, NULL, NULL, '1.00', '2024-05-14 08:08:24', '2024-05-14 08:08:24'),
(442, NULL, NULL, NULL, '1.00', '2024-05-14 08:09:05', '2024-05-14 08:09:05'),
(443, NULL, NULL, NULL, '1.00', '2024-05-14 08:09:10', '2024-05-14 08:09:10'),
(444, NULL, NULL, NULL, '1.00', '2024-05-14 08:11:12', '2024-05-14 08:11:12'),
(445, NULL, NULL, NULL, '1.00', '2024-05-14 08:13:31', '2024-05-14 08:13:31'),
(446, NULL, NULL, NULL, '1.00', '2024-05-14 08:14:00', '2024-05-14 08:14:00'),
(447, NULL, NULL, NULL, '1.00', '2024-05-14 08:15:14', '2024-05-14 08:15:14'),
(448, NULL, NULL, NULL, '1.00', '2024-05-14 08:15:15', '2024-05-14 08:15:15'),
(449, NULL, NULL, NULL, '1.00', '2024-05-14 08:17:04', '2024-05-14 08:17:04'),
(450, NULL, NULL, NULL, '1.00', '2024-05-14 08:18:13', '2024-05-14 08:18:13'),
(451, NULL, NULL, NULL, '1.00', '2024-05-14 08:20:05', '2024-05-14 08:20:05'),
(452, NULL, NULL, NULL, '1.00', '2024-05-14 08:20:08', '2024-05-14 08:20:08'),
(453, NULL, NULL, NULL, '1.00', '2024-05-14 08:20:58', '2024-05-14 08:20:58'),
(454, NULL, NULL, NULL, '1.00', '2024-05-14 08:21:00', '2024-05-14 08:21:00'),
(455, NULL, NULL, NULL, '1.00', '2024-05-14 08:21:49', '2024-05-14 08:21:49'),
(456, NULL, NULL, NULL, '1.00', '2024-05-14 08:22:22', '2024-05-14 08:22:22'),
(457, NULL, NULL, NULL, '1.00', '2024-05-14 08:23:04', '2024-05-14 08:23:04'),
(458, NULL, NULL, NULL, '1.00', '2024-05-14 08:23:06', '2024-05-14 08:23:06'),
(459, NULL, NULL, NULL, '1.00', '2024-05-14 08:25:56', '2024-05-14 08:25:56'),
(460, NULL, NULL, NULL, '1.00', '2024-05-14 08:26:04', '2024-05-14 08:26:04'),
(461, 3, NULL, NULL, '10.00', '2024-05-14 08:36:57', '2024-05-14 08:36:57'),
(462, NULL, NULL, NULL, '1.00', '2024-05-14 08:37:43', '2024-05-14 08:37:43'),
(463, NULL, NULL, NULL, '1.00', '2024-05-14 08:41:00', '2024-05-14 08:41:00'),
(464, NULL, NULL, NULL, '1.00', '2024-05-14 08:41:06', '2024-05-14 08:41:06'),
(465, NULL, NULL, NULL, '1.00', '2024-05-14 08:41:18', '2024-05-14 08:41:18'),
(466, NULL, NULL, NULL, '1.00', '2024-05-14 08:43:17', '2024-05-14 08:43:17'),
(467, NULL, NULL, NULL, '1.00', '2024-05-14 08:43:23', '2024-05-14 08:43:23'),
(468, NULL, NULL, NULL, '1.00', '2024-05-14 08:43:59', '2024-05-14 08:43:59'),
(469, NULL, NULL, NULL, '1.00', '2024-05-14 08:45:15', '2024-05-14 08:45:15'),
(470, NULL, NULL, NULL, '1.00', '2024-05-14 08:45:24', '2024-05-14 08:45:24'),
(471, 3, NULL, NULL, '10.00', '2024-05-14 08:47:32', '2024-05-14 08:47:32'),
(472, 5, NULL, NULL, '30.00', '2024-05-14 08:49:02', '2024-05-14 08:49:02'),
(473, NULL, NULL, NULL, '1.00', '2024-05-14 08:50:52', '2024-05-14 08:50:52'),
(474, NULL, NULL, NULL, '1.00', '2024-05-14 08:54:21', '2024-05-14 08:54:21'),
(475, NULL, NULL, NULL, '1.00', '2024-05-14 08:54:21', '2024-05-14 08:54:21'),
(476, NULL, NULL, NULL, '1.00', '2024-05-14 08:59:34', '2024-05-14 08:59:34'),
(477, NULL, NULL, NULL, '1.00', '2024-05-14 08:59:40', '2024-05-14 08:59:40'),
(478, NULL, NULL, NULL, '1.00', '2024-05-14 09:00:50', '2024-05-14 09:00:50'),
(479, NULL, NULL, NULL, '1.00', '2024-05-14 09:01:04', '2024-05-14 09:01:04'),
(480, NULL, NULL, NULL, '1.00', '2024-05-14 09:46:26', '2024-05-14 09:46:26'),
(481, NULL, NULL, NULL, '1.00', '2024-05-14 09:47:00', '2024-05-14 09:47:00'),
(482, NULL, NULL, NULL, '1.00', '2024-05-14 11:01:27', '2024-05-14 11:01:27'),
(483, NULL, NULL, NULL, '1.00', '2024-05-14 11:01:31', '2024-05-14 11:01:31'),
(484, NULL, NULL, NULL, '1.00', '2024-05-14 11:04:29', '2024-05-14 11:04:29'),
(485, NULL, NULL, NULL, '1.00', '2024-05-14 11:04:46', '2024-05-14 11:04:46'),
(486, NULL, NULL, NULL, '1.00', '2024-05-14 11:04:52', '2024-05-14 11:04:52'),
(487, NULL, NULL, NULL, '1.00', '2024-05-14 11:05:21', '2024-05-14 11:05:21'),
(488, NULL, NULL, NULL, '1.00', '2024-05-14 11:05:31', '2024-05-14 11:05:31'),
(489, NULL, NULL, NULL, '1.00', '2024-05-14 11:07:37', '2024-05-14 11:07:37'),
(490, NULL, NULL, NULL, '1.00', '2024-05-14 11:07:52', '2024-05-14 11:07:52'),
(491, NULL, NULL, NULL, '1.00', '2024-05-14 11:11:07', '2024-05-14 11:11:07'),
(492, NULL, NULL, NULL, '1.00', '2024-05-14 11:11:12', '2024-05-14 11:11:12'),
(493, NULL, NULL, NULL, '1.00', '2024-05-14 14:05:51', '2024-05-14 14:05:51'),
(494, NULL, NULL, NULL, '1.00', '2024-05-14 14:06:13', '2024-05-14 14:06:13'),
(495, NULL, NULL, NULL, '1.00', '2024-05-14 14:11:23', '2024-05-14 14:11:23'),
(496, NULL, NULL, NULL, '1.00', '2024-05-14 14:11:30', '2024-05-14 14:11:30'),
(497, NULL, NULL, NULL, '1.00', '2024-05-14 14:12:08', '2024-05-14 14:12:08'),
(498, NULL, NULL, NULL, '1.00', '2024-05-14 14:12:17', '2024-05-14 14:12:17'),
(499, NULL, NULL, NULL, '1.00', '2024-05-14 14:12:55', '2024-05-14 14:12:55'),
(500, NULL, NULL, NULL, '1.00', '2024-05-14 14:13:03', '2024-05-14 14:13:03'),
(501, NULL, NULL, NULL, '1.00', '2024-05-14 15:20:21', '2024-05-14 15:20:21'),
(502, NULL, NULL, NULL, '1.00', '2024-05-14 15:20:34', '2024-05-14 15:20:34'),
(503, NULL, NULL, NULL, '1.00', '2024-05-14 23:40:50', '2024-05-14 23:40:50'),
(504, NULL, NULL, NULL, '1.00', '2024-05-14 23:41:01', '2024-05-14 23:41:01'),
(505, NULL, NULL, NULL, '1.00', '2024-05-14 23:53:00', '2024-05-14 23:53:00'),
(506, NULL, NULL, NULL, '1.00', '2024-05-14 23:53:08', '2024-05-14 23:53:08'),
(507, NULL, NULL, NULL, '1.00', '2024-05-15 00:02:23', '2024-05-15 00:02:23'),
(508, NULL, NULL, NULL, '1.00', '2024-05-15 00:02:50', '2024-05-15 00:02:50'),
(509, NULL, NULL, NULL, '1.00', '2024-05-15 00:16:55', '2024-05-15 00:16:55'),
(510, NULL, NULL, NULL, '1.00', '2024-05-15 00:16:58', '2024-05-15 00:16:58'),
(511, NULL, NULL, NULL, '1.00', '2024-05-15 00:27:54', '2024-05-15 00:27:54'),
(512, NULL, NULL, NULL, '1.00', '2024-05-15 00:28:04', '2024-05-15 00:28:04'),
(513, NULL, NULL, NULL, '1.00', '2024-05-15 00:35:16', '2024-05-15 00:35:16'),
(514, NULL, NULL, NULL, '1.00', '2024-05-15 00:35:22', '2024-05-15 00:35:22'),
(515, NULL, NULL, NULL, '1.00', '2024-05-15 00:41:59', '2024-05-15 00:41:59'),
(516, NULL, NULL, NULL, '1.00', '2024-05-15 00:42:01', '2024-05-15 00:42:01'),
(517, NULL, NULL, NULL, '1.00', '2024-05-15 00:48:43', '2024-05-15 00:48:43'),
(518, NULL, NULL, NULL, '1.00', '2024-05-15 00:48:47', '2024-05-15 00:48:47'),
(519, NULL, NULL, NULL, '1.00', '2024-05-15 03:33:49', '2024-05-15 03:33:49'),
(520, NULL, NULL, NULL, '1.00', '2024-05-15 03:33:56', '2024-05-15 03:33:56'),
(521, NULL, NULL, NULL, '1.00', '2024-05-15 03:34:37', '2024-05-15 03:34:37'),
(522, NULL, NULL, NULL, '1.00', '2024-05-15 03:34:38', '2024-05-15 03:34:38'),
(523, NULL, NULL, NULL, '1.00', '2024-05-15 03:34:57', '2024-05-15 03:34:57'),
(524, NULL, NULL, NULL, '1.00', '2024-05-15 03:35:06', '2024-05-15 03:35:06'),
(525, NULL, NULL, NULL, '1.00', '2024-05-15 04:07:27', '2024-05-15 04:07:27'),
(526, NULL, NULL, NULL, '1.00', '2024-05-15 04:09:29', '2024-05-15 04:09:29'),
(527, NULL, NULL, NULL, '1.00', '2024-05-15 04:10:22', '2024-05-15 04:10:22'),
(528, NULL, NULL, NULL, '1.00', '2024-05-15 04:22:55', '2024-05-15 04:22:55'),
(529, NULL, NULL, NULL, '1.00', '2024-05-15 04:23:10', '2024-05-15 04:23:10'),
(530, NULL, NULL, NULL, '1.00', '2024-05-15 04:23:29', '2024-05-15 04:23:29'),
(531, NULL, NULL, NULL, '1.00', '2024-05-15 04:31:51', '2024-05-15 04:31:51'),
(532, NULL, NULL, NULL, '1.00', '2024-05-15 04:32:14', '2024-05-15 04:32:14'),
(533, NULL, NULL, NULL, '1.00', '2024-05-15 04:32:22', '2024-05-15 04:32:22'),
(534, NULL, NULL, NULL, '1.00', '2024-05-15 05:26:16', '2024-05-15 05:26:16'),
(535, NULL, NULL, NULL, '1.00', '2024-05-15 05:26:16', '2024-05-15 05:26:16'),
(536, NULL, NULL, NULL, '1.00', '2024-05-15 05:27:34', '2024-05-15 05:27:34'),
(537, NULL, NULL, NULL, '1.00', '2024-05-15 05:27:35', '2024-05-15 05:27:35'),
(538, NULL, NULL, NULL, '1.00', '2024-05-15 05:29:34', '2024-05-15 05:29:34'),
(539, NULL, NULL, NULL, '1.00', '2024-05-15 05:29:39', '2024-05-15 05:29:39'),
(540, 3, NULL, NULL, '10.00', '2024-05-15 05:41:34', '2024-05-15 05:41:34'),
(541, 3, NULL, NULL, '10.00', '2024-05-15 05:41:39', '2024-05-15 05:41:39'),
(542, 3, NULL, NULL, '10.00', '2024-05-15 05:46:37', '2024-05-15 05:46:37'),
(543, 3, NULL, NULL, '10.00', '2024-05-15 05:46:38', '2024-05-15 05:46:38'),
(544, NULL, NULL, NULL, '1.00', '2024-05-15 05:48:33', '2024-05-15 05:48:33'),
(545, 3, NULL, NULL, '10.00', '2024-05-15 05:48:36', '2024-05-15 05:48:36'),
(546, NULL, NULL, NULL, '1.00', '2024-05-15 05:52:38', '2024-05-15 05:52:38'),
(547, NULL, NULL, NULL, '1.00', '2024-05-15 05:52:40', '2024-05-15 05:52:40'),
(548, NULL, 159, 'ch_3PGfSwP7nrCpAwBa1RM0qRLx', '1.00', '2024-05-15 05:53:45', '2024-05-15 05:53:47'),
(549, NULL, NULL, NULL, '1.00', '2024-05-15 05:54:27', '2024-05-15 05:54:27'),
(550, NULL, NULL, NULL, '1.00', '2024-05-15 05:54:30', '2024-05-15 05:54:30'),
(551, NULL, NULL, NULL, '1.00', '2024-05-15 05:54:51', '2024-05-15 05:54:51'),
(552, NULL, NULL, NULL, '1.00', '2024-05-15 05:57:50', '2024-05-15 05:57:50'),
(553, NULL, NULL, NULL, '1.00', '2024-05-15 05:58:01', '2024-05-15 05:58:01'),
(554, NULL, NULL, NULL, '1.00', '2024-05-15 06:29:36', '2024-05-15 06:29:36'),
(555, NULL, NULL, NULL, '1.00', '2024-05-15 06:36:52', '2024-05-15 06:36:52'),
(556, NULL, NULL, NULL, '1.00', '2024-05-15 07:53:54', '2024-05-15 07:53:54'),
(557, NULL, NULL, NULL, '1.00', '2024-05-15 07:53:56', '2024-05-15 07:53:56'),
(558, NULL, NULL, NULL, '1.00', '2024-05-15 07:56:19', '2024-05-15 07:56:19'),
(559, NULL, NULL, NULL, '1.00', '2024-05-15 07:56:21', '2024-05-15 07:56:21'),
(560, NULL, NULL, NULL, '1.00', '2024-05-15 07:58:22', '2024-05-15 07:58:22'),
(561, NULL, NULL, NULL, '1.00', '2024-05-15 07:58:23', '2024-05-15 07:58:23'),
(562, NULL, NULL, NULL, '1.00', '2024-05-15 07:59:07', '2024-05-15 07:59:07'),
(563, NULL, NULL, NULL, '1.00', '2024-05-15 07:59:25', '2024-05-15 07:59:25'),
(564, NULL, NULL, NULL, '1.00', '2024-05-15 07:59:31', '2024-05-15 07:59:31'),
(565, NULL, NULL, NULL, '1.00', '2024-05-15 12:32:57', '2024-05-15 12:32:57'),
(566, NULL, NULL, NULL, '1.00', '2024-05-15 12:33:02', '2024-05-15 12:33:02'),
(567, NULL, NULL, NULL, '1.00', '2024-05-15 12:36:21', '2024-05-15 12:36:21'),
(568, NULL, NULL, NULL, '1.00', '2024-05-15 12:36:22', '2024-05-15 12:36:22'),
(569, NULL, NULL, NULL, '1.00', '2024-05-15 12:37:10', '2024-05-15 12:37:10'),
(570, NULL, NULL, NULL, '1.00', '2024-05-15 12:37:22', '2024-05-15 12:37:22'),
(571, NULL, NULL, NULL, '1.00', '2024-05-15 12:38:11', '2024-05-15 12:38:11'),
(572, NULL, NULL, NULL, '1.00', '2024-05-15 12:38:18', '2024-05-15 12:38:18'),
(573, NULL, NULL, NULL, '1.00', '2024-05-15 12:41:03', '2024-05-15 12:41:03'),
(574, NULL, NULL, NULL, '1.00', '2024-05-15 12:41:05', '2024-05-15 12:41:05'),
(575, NULL, NULL, NULL, '1.00', '2024-05-15 12:48:01', '2024-05-15 12:48:01'),
(576, NULL, NULL, NULL, '1.00', '2024-05-15 12:48:42', '2024-05-15 12:48:42'),
(577, 3, NULL, NULL, '10.00', '2024-05-15 12:51:44', '2024-05-15 12:51:44'),
(578, 3, NULL, NULL, '10.00', '2024-05-15 12:51:48', '2024-05-15 12:51:48'),
(579, 3, NULL, NULL, '10.00', '2024-05-15 12:53:21', '2024-05-15 12:53:21'),
(580, 3, NULL, NULL, '10.00', '2024-05-15 12:53:31', '2024-05-15 12:53:31'),
(581, 3, NULL, NULL, '10.00', '2024-05-15 12:55:08', '2024-05-15 12:55:08'),
(582, 3, NULL, NULL, '10.00', '2024-05-15 12:55:10', '2024-05-15 12:55:10'),
(583, 4, NULL, NULL, '20.00', '2024-05-15 12:56:55', '2024-05-15 12:56:55'),
(584, 4, NULL, NULL, '20.00', '2024-05-15 12:57:03', '2024-05-15 12:57:03'),
(585, 4, NULL, NULL, '20.00', '2024-05-15 12:58:05', '2024-05-15 12:58:05');
INSERT INTO `user_payments` (`id`, `price_id`, `user_id`, `payment_id`, `amount`, `created_at`, `updated_at`) VALUES
(586, 4, NULL, NULL, '20.00', '2024-05-15 12:58:10', '2024-05-15 12:58:10'),
(587, 4, NULL, NULL, '20.00', '2024-05-15 13:02:17', '2024-05-15 13:02:17'),
(588, 4, NULL, NULL, '20.00', '2024-05-15 13:02:33', '2024-05-15 13:02:33'),
(589, 4, NULL, NULL, '20.00', '2024-05-15 13:04:32', '2024-05-15 13:04:32'),
(590, 4, NULL, NULL, '20.00', '2024-05-15 13:04:42', '2024-05-15 13:04:42'),
(591, NULL, NULL, NULL, '1.00', '2024-05-16 01:03:09', '2024-05-16 01:03:09'),
(592, NULL, NULL, NULL, '1.00', '2024-05-16 01:03:10', '2024-05-16 01:03:10'),
(593, NULL, NULL, NULL, '1.00', '2024-05-16 01:26:54', '2024-05-16 01:26:54'),
(594, NULL, NULL, NULL, '1.00', '2024-05-16 01:29:20', '2024-05-16 01:29:20'),
(595, NULL, NULL, NULL, '1.00', '2024-05-16 01:29:31', '2024-05-16 01:29:31'),
(596, NULL, NULL, NULL, '1.00', '2024-05-16 01:36:36', '2024-05-16 01:36:36'),
(597, NULL, NULL, NULL, '1.00', '2024-05-16 01:36:37', '2024-05-16 01:36:37'),
(598, NULL, NULL, NULL, '1.00', '2024-05-16 01:37:33', '2024-05-16 01:37:33'),
(599, NULL, NULL, NULL, '1.00', '2024-05-16 01:39:03', '2024-05-16 01:39:03'),
(600, NULL, NULL, NULL, '1.00', '2024-05-16 02:21:52', '2024-05-16 02:21:52'),
(601, NULL, NULL, NULL, '1.00', '2024-05-16 02:21:58', '2024-05-16 02:21:58'),
(602, NULL, NULL, NULL, '1.00', '2024-05-16 02:22:54', '2024-05-16 02:22:54'),
(603, NULL, NULL, NULL, '1.00', '2024-05-16 02:22:55', '2024-05-16 02:22:55'),
(604, NULL, NULL, NULL, '1.00', '2024-05-16 02:23:21', '2024-05-16 02:23:21'),
(605, NULL, NULL, NULL, '1.00', '2024-05-16 02:23:24', '2024-05-16 02:23:24'),
(606, NULL, NULL, NULL, '1.00', '2024-05-16 02:24:14', '2024-05-16 02:24:14'),
(607, NULL, NULL, NULL, '1.00', '2024-05-16 02:24:15', '2024-05-16 02:24:15'),
(608, NULL, NULL, NULL, '1.00', '2024-05-16 02:25:45', '2024-05-16 02:25:45'),
(609, NULL, NULL, NULL, '1.00', '2024-05-16 02:25:45', '2024-05-16 02:25:45'),
(610, NULL, NULL, NULL, '1.00', '2024-05-16 02:26:12', '2024-05-16 02:26:12'),
(611, NULL, NULL, NULL, '1.00', '2024-05-16 02:26:14', '2024-05-16 02:26:14'),
(612, NULL, NULL, NULL, '1.00', '2024-05-16 02:28:12', '2024-05-16 02:28:12'),
(613, NULL, NULL, NULL, '1.00', '2024-05-16 02:28:14', '2024-05-16 02:28:14'),
(614, NULL, NULL, NULL, '1.00', '2024-05-16 02:28:31', '2024-05-16 02:28:31'),
(615, NULL, NULL, NULL, '1.00', '2024-05-16 02:28:56', '2024-05-16 02:28:56'),
(616, NULL, NULL, NULL, '1.00', '2024-05-16 02:30:03', '2024-05-16 02:30:03'),
(617, NULL, NULL, NULL, '1.00', '2024-05-16 02:31:01', '2024-05-16 02:31:01'),
(618, NULL, NULL, NULL, '1.00', '2024-05-16 02:34:09', '2024-05-16 02:34:09'),
(619, NULL, NULL, NULL, '1.00', '2024-05-16 02:34:16', '2024-05-16 02:34:16'),
(620, NULL, NULL, NULL, '1.00', '2024-05-16 02:35:42', '2024-05-16 02:35:42'),
(621, NULL, NULL, NULL, '1.00', '2024-05-16 02:35:51', '2024-05-16 02:35:51'),
(622, NULL, NULL, NULL, '1.00', '2024-05-16 02:38:54', '2024-05-16 02:38:54'),
(623, NULL, NULL, NULL, '1.00', '2024-05-16 02:38:58', '2024-05-16 02:38:58'),
(624, NULL, NULL, NULL, '1.00', '2024-05-16 02:40:42', '2024-05-16 02:40:42'),
(625, NULL, NULL, NULL, '1.00', '2024-05-16 02:40:42', '2024-05-16 02:40:42'),
(626, NULL, NULL, NULL, '1.00', '2024-05-16 02:44:40', '2024-05-16 02:44:40'),
(627, NULL, NULL, NULL, '1.00', '2024-05-16 02:44:43', '2024-05-16 02:44:43'),
(628, NULL, NULL, NULL, '1.00', '2024-05-16 02:55:20', '2024-05-16 02:55:20'),
(629, NULL, NULL, NULL, '1.00', '2024-05-16 02:56:58', '2024-05-16 02:56:58'),
(630, NULL, NULL, NULL, '1.00', '2024-05-16 04:32:36', '2024-05-16 04:32:36'),
(631, NULL, NULL, NULL, '1.00', '2024-05-16 04:32:43', '2024-05-16 04:32:43'),
(632, NULL, NULL, NULL, '1.00', '2024-05-16 04:37:31', '2024-05-16 04:37:31'),
(633, NULL, NULL, NULL, '1.00', '2024-05-16 04:37:33', '2024-05-16 04:37:33'),
(634, NULL, NULL, NULL, '1.00', '2024-05-16 05:06:03', '2024-05-16 05:06:03'),
(635, NULL, NULL, NULL, '1.00', '2024-05-16 05:06:17', '2024-05-16 05:06:17'),
(636, NULL, NULL, NULL, '1.00', '2024-05-16 05:14:45', '2024-05-16 05:14:45'),
(637, NULL, NULL, NULL, '1.00', '2024-05-16 05:14:45', '2024-05-16 05:14:45'),
(638, NULL, NULL, NULL, '1.00', '2024-05-16 05:23:24', '2024-05-16 05:23:24'),
(639, NULL, NULL, NULL, '1.00', '2024-05-16 05:23:29', '2024-05-16 05:23:29'),
(640, NULL, NULL, NULL, '1.00', '2024-05-16 05:24:07', '2024-05-16 05:24:07'),
(641, NULL, NULL, NULL, '1.00', '2024-05-16 05:24:10', '2024-05-16 05:24:10'),
(642, NULL, NULL, NULL, '1.00', '2024-05-16 05:30:07', '2024-05-16 05:30:07'),
(643, NULL, NULL, NULL, '1.00', '2024-05-16 05:30:07', '2024-05-16 05:30:07'),
(644, NULL, NULL, NULL, '1.00', '2024-05-16 05:30:30', '2024-05-16 05:30:30'),
(645, NULL, NULL, NULL, '1.00', '2024-05-16 05:32:32', '2024-05-16 05:32:32'),
(646, NULL, NULL, NULL, '1.00', '2024-05-16 05:32:44', '2024-05-16 05:32:44'),
(647, NULL, NULL, NULL, '1.00', '2024-05-16 05:35:10', '2024-05-16 05:35:10'),
(648, NULL, NULL, NULL, '1.00', '2024-05-16 05:35:28', '2024-05-16 05:35:28'),
(649, NULL, NULL, NULL, '1.00', '2024-05-16 05:36:09', '2024-05-16 05:36:09'),
(650, NULL, NULL, NULL, '1.00', '2024-05-16 05:36:09', '2024-05-16 05:36:09'),
(651, NULL, NULL, NULL, '1.00', '2024-05-16 05:37:10', '2024-05-16 05:37:10'),
(652, NULL, NULL, NULL, '1.00', '2024-05-16 05:37:12', '2024-05-16 05:37:12'),
(653, NULL, NULL, NULL, '1.00', '2024-05-16 05:38:00', '2024-05-16 05:38:00'),
(654, NULL, NULL, NULL, '1.00', '2024-05-16 05:38:01', '2024-05-16 05:38:01'),
(655, NULL, NULL, NULL, '1.00', '2024-05-16 05:38:50', '2024-05-16 05:38:50'),
(656, NULL, NULL, NULL, '1.00', '2024-05-16 05:39:31', '2024-05-16 05:39:31'),
(657, NULL, NULL, NULL, '1.00', '2024-05-16 05:39:31', '2024-05-16 05:39:31'),
(658, NULL, NULL, NULL, '1.00', '2024-05-16 05:43:10', '2024-05-16 05:43:10'),
(659, NULL, NULL, NULL, '1.00', '2024-05-16 05:43:19', '2024-05-16 05:43:19'),
(660, NULL, NULL, NULL, '1.00', '2024-05-16 05:43:56', '2024-05-16 05:43:56'),
(661, NULL, NULL, NULL, '1.00', '2024-05-16 05:43:57', '2024-05-16 05:43:57'),
(662, NULL, NULL, NULL, '1.00', '2024-05-16 05:47:02', '2024-05-16 05:47:02'),
(663, 4, NULL, NULL, '20.00', '2024-05-16 06:25:05', '2024-05-16 06:25:05'),
(664, NULL, NULL, NULL, '1.00', '2024-05-16 06:27:38', '2024-05-16 06:27:38'),
(665, NULL, NULL, NULL, '1.00', '2024-05-16 06:29:39', '2024-05-16 06:29:39'),
(666, NULL, NULL, NULL, '1.00', '2024-05-16 06:32:47', '2024-05-16 06:32:47'),
(667, NULL, NULL, NULL, '1.00', '2024-05-16 06:38:52', '2024-05-16 06:38:52'),
(668, NULL, NULL, NULL, '1.00', '2024-05-16 06:39:26', '2024-05-16 06:39:26'),
(669, NULL, NULL, NULL, '1.00', '2024-05-16 06:40:40', '2024-05-16 06:40:40'),
(670, NULL, NULL, NULL, '1.00', '2024-05-16 06:41:06', '2024-05-16 06:41:06'),
(671, NULL, NULL, NULL, '1.00', '2024-05-16 06:41:42', '2024-05-16 06:41:42'),
(672, NULL, NULL, NULL, '1.00', '2024-05-16 06:41:58', '2024-05-16 06:41:58'),
(673, NULL, NULL, NULL, '1.00', '2024-05-16 06:53:17', '2024-05-16 06:53:17'),
(674, NULL, NULL, NULL, '1.00', '2024-05-16 06:55:06', '2024-05-16 06:55:06'),
(675, NULL, NULL, NULL, '1.00', '2024-05-16 06:55:19', '2024-05-16 06:55:19'),
(676, NULL, NULL, NULL, '1.00', '2024-05-16 06:57:36', '2024-05-16 06:57:36'),
(677, NULL, NULL, NULL, '1.00', '2024-05-16 06:57:54', '2024-05-16 06:57:54'),
(678, NULL, NULL, NULL, '1.00', '2024-05-16 06:58:23', '2024-05-16 06:58:23'),
(679, NULL, NULL, NULL, '1.00', '2024-05-16 07:17:39', '2024-05-16 07:17:39'),
(680, NULL, NULL, NULL, '1.00', '2024-05-16 07:41:40', '2024-05-16 07:41:40'),
(681, NULL, NULL, NULL, '1.00', '2024-05-16 07:42:00', '2024-05-16 07:42:00'),
(682, NULL, NULL, NULL, '1.00', '2024-05-16 13:02:47', '2024-05-16 13:02:47'),
(683, NULL, NULL, NULL, '1.00', '2024-05-16 13:02:49', '2024-05-16 13:02:49'),
(684, NULL, NULL, NULL, '1.00', '2024-05-17 05:10:04', '2024-05-17 05:10:04'),
(685, NULL, NULL, NULL, '1.00', '2024-05-17 05:10:04', '2024-05-17 05:10:04'),
(686, NULL, NULL, NULL, '1.00', '2024-05-17 05:52:02', '2024-05-17 05:52:02'),
(687, NULL, NULL, NULL, '1.00', '2024-05-17 05:52:10', '2024-05-17 05:52:10'),
(688, NULL, NULL, NULL, '1.00', '2024-05-17 05:52:52', '2024-05-17 05:52:52'),
(689, NULL, NULL, NULL, '1.00', '2024-05-17 05:52:53', '2024-05-17 05:52:53'),
(690, NULL, NULL, NULL, '1.00', '2024-05-17 05:58:02', '2024-05-17 05:58:02'),
(691, NULL, NULL, NULL, '1.00', '2024-05-17 05:58:09', '2024-05-17 05:58:09'),
(692, NULL, NULL, NULL, '1.00', '2024-05-17 06:01:29', '2024-05-17 06:01:29'),
(693, NULL, NULL, NULL, '1.00', '2024-05-17 06:01:49', '2024-05-17 06:01:49'),
(694, NULL, NULL, NULL, '1.00', '2024-05-17 06:02:02', '2024-05-17 06:02:02'),
(695, NULL, NULL, NULL, '1.00', '2024-05-17 06:02:37', '2024-05-17 06:02:37'),
(696, NULL, NULL, NULL, '1.00', '2024-05-17 06:02:54', '2024-05-17 06:02:54'),
(697, NULL, NULL, NULL, '1.00', '2024-05-17 06:05:27', '2024-05-17 06:05:27'),
(699, NULL, NULL, NULL, '1.00', '2024-05-17 06:59:31', '2024-05-17 06:59:31'),
(700, NULL, NULL, NULL, '1.00', '2024-05-17 07:00:55', '2024-05-17 07:00:55'),
(701, 3, NULL, NULL, '10.00', '2024-05-17 07:12:20', '2024-05-17 07:12:20'),
(702, 3, NULL, NULL, '10.00', '2024-05-17 07:12:32', '2024-05-17 07:12:32'),
(703, 3, NULL, NULL, '10.00', '2024-05-17 07:12:55', '2024-05-17 07:12:55'),
(704, 3, NULL, NULL, '10.00', '2024-05-17 07:15:11', '2024-05-17 07:15:11'),
(705, 3, NULL, NULL, '10.00', '2024-05-17 07:15:27', '2024-05-17 07:15:27'),
(706, NULL, NULL, NULL, '1.00', '2024-05-17 07:18:02', '2024-05-17 07:18:02'),
(707, NULL, NULL, NULL, '1.00', '2024-05-17 07:21:33', '2024-05-17 07:21:33'),
(708, NULL, NULL, NULL, '1.00', '2024-05-17 07:57:01', '2024-05-17 07:57:01'),
(709, NULL, NULL, NULL, '1.00', '2024-05-17 08:02:50', '2024-05-17 08:02:50'),
(710, NULL, NULL, NULL, '1.00', '2024-05-17 08:06:19', '2024-05-17 08:06:19'),
(711, NULL, NULL, NULL, '1.00', '2024-05-17 08:06:24', '2024-05-17 08:06:24'),
(712, 3, NULL, NULL, '10.00', '2024-05-17 08:12:43', '2024-05-17 08:12:43'),
(713, 3, NULL, NULL, '10.00', '2024-05-17 08:18:58', '2024-05-17 08:18:58'),
(714, 3, NULL, NULL, '10.00', '2024-05-17 08:19:18', '2024-05-17 08:19:18'),
(715, 3, NULL, NULL, '10.00', '2024-05-17 08:22:37', '2024-05-17 08:22:37'),
(716, NULL, 159, 'ch_3PHSfyP7nrCpAwBa0eNHkD9A', '1.00', '2024-05-17 10:26:29', '2024-05-17 10:26:32'),
(717, NULL, NULL, 'ch_3PHSgqP7nrCpAwBa0X8o8XQx', '1.00', '2024-05-17 10:27:23', '2024-05-17 10:27:25'),
(718, NULL, 159, NULL, '1.00', '2024-05-17 10:27:48', '2024-05-17 10:27:48'),
(719, NULL, NULL, NULL, '1.00', '2024-05-20 06:18:10', '2024-05-20 06:18:10'),
(720, NULL, NULL, NULL, '1.00', '2024-05-20 06:28:55', '2024-05-20 06:28:55'),
(721, 4, NULL, NULL, '20.00', '2024-05-20 06:31:59', '2024-05-20 06:31:59'),
(722, NULL, NULL, NULL, '1.00', '2024-05-20 06:32:56', '2024-05-20 06:32:56'),
(723, NULL, NULL, NULL, '1.00', '2024-05-20 06:35:23', '2024-05-20 06:35:23'),
(724, NULL, NULL, NULL, '1.00', '2024-05-20 06:36:01', '2024-05-20 06:36:01'),
(725, NULL, NULL, NULL, '1.00', '2024-05-20 06:36:45', '2024-05-20 06:36:45'),
(726, NULL, NULL, NULL, '1.00', '2024-05-20 06:36:54', '2024-05-20 06:36:54'),
(727, NULL, NULL, NULL, '1.00', '2024-05-20 06:37:40', '2024-05-20 06:37:40'),
(728, NULL, NULL, NULL, '1.00', '2024-05-20 06:39:03', '2024-05-20 06:39:03'),
(729, NULL, NULL, NULL, '1.00', '2024-05-20 06:39:18', '2024-05-20 06:39:18'),
(730, NULL, NULL, NULL, '1.00', '2024-05-20 08:26:57', '2024-05-20 08:26:57'),
(731, 3, NULL, NULL, '10.00', '2024-05-20 08:30:49', '2024-05-20 08:30:49'),
(732, NULL, NULL, NULL, '1.00', '2024-05-20 08:31:04', '2024-05-20 08:31:04'),
(733, NULL, NULL, NULL, '1.00', '2024-05-20 08:31:11', '2024-05-20 08:31:11'),
(734, NULL, 141, 'ch_3PIs0hP7nrCpAwBa0vYKGkI3', '1.00', '2024-05-21 07:41:42', '2024-05-21 07:41:44'),
(735, NULL, NULL, 'ch_3PIs0hP7nrCpAwBa0TC7PHug', '1.00', '2024-05-21 07:41:43', '2024-05-21 07:41:45'),
(737, 3, NULL, 'ch_3PJvTbLOWAL3xmQ81dGfZrsK', '10.00', '2024-05-24 05:35:54', '2024-05-24 05:35:56'),
(738, 3, NULL, 'ch_3PJvU2LOWAL3xmQ81j3skiqo', '10.00', '2024-05-24 05:36:21', '2024-05-24 05:36:22'),
(739, 3, NULL, NULL, '10.00', '2024-05-24 05:54:59', '2024-05-24 05:54:59'),
(740, 3, NULL, 'ch_3PJvmZLOWAL3xmQ80DSJ7aRi', '10.00', '2024-05-24 05:55:31', '2024-05-24 05:55:32'),
(741, 3, NULL, NULL, '10.00', '2024-05-24 05:59:01', '2024-05-24 05:59:01'),
(742, 3, NULL, 'ch_3PJw3CLOWAL3xmQ810YnEYkA', '10.00', '2024-05-24 06:12:41', '2024-05-24 06:12:42'),
(743, 3, NULL, NULL, '10.00', '2024-05-24 06:13:16', '2024-05-24 06:13:16'),
(744, 3, NULL, 'ch_3PJw4WLOWAL3xmQ81lwnoHzp', '10.00', '2024-05-24 06:14:04', '2024-05-24 06:14:05'),
(745, NULL, 141, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-05-26 07:25:03', '2024-05-26 07:25:04'),
(746, NULL, NULL, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-05-26 07:25:03', '2024-05-26 07:25:04'),
(747, NULL, NULL, NULL, '1.00', '2024-05-29 02:07:17', '2024-05-29 02:07:17'),
(748, NULL, NULL, NULL, '1.00', '2024-05-29 02:07:18', '2024-05-29 02:07:18'),
(749, NULL, NULL, NULL, '1.00', '2024-05-29 02:08:52', '2024-05-29 02:08:52'),
(750, NULL, NULL, NULL, '1.00', '2024-05-29 02:08:57', '2024-05-29 02:08:57'),
(751, NULL, NULL, NULL, '1.00', '2024-05-29 02:09:54', '2024-05-29 02:09:54'),
(752, NULL, NULL, NULL, '1.00', '2024-05-29 02:09:54', '2024-05-29 02:09:54'),
(753, NULL, NULL, NULL, '1.00', '2024-05-29 02:10:31', '2024-05-29 02:10:31'),
(754, NULL, NULL, NULL, '1.00', '2024-05-29 02:11:08', '2024-05-29 02:11:08'),
(755, NULL, NULL, NULL, '1.00', '2024-05-29 02:11:23', '2024-05-29 02:11:23'),
(756, NULL, NULL, NULL, '1.00', '2024-05-29 02:11:46', '2024-05-29 02:11:46'),
(757, NULL, NULL, NULL, '1.00', '2024-05-29 02:12:09', '2024-05-29 02:12:09'),
(758, NULL, NULL, NULL, '1.00', '2024-05-29 02:12:22', '2024-05-29 02:12:22'),
(759, NULL, NULL, NULL, '1.00', '2024-05-29 02:12:32', '2024-05-29 02:12:32'),
(760, NULL, NULL, NULL, '1.00', '2024-05-29 02:12:48', '2024-05-29 02:12:48'),
(761, NULL, NULL, NULL, '1.00', '2024-05-29 02:13:02', '2024-05-29 02:13:02'),
(762, NULL, NULL, NULL, '1.00', '2024-05-29 02:13:14', '2024-05-29 02:13:14'),
(763, NULL, NULL, NULL, '1.00', '2024-05-29 02:13:24', '2024-05-29 02:13:24'),
(764, NULL, NULL, NULL, '1.00', '2024-05-29 02:13:36', '2024-05-29 02:13:36'),
(765, NULL, NULL, NULL, '1.00', '2024-05-29 07:12:07', '2024-05-29 07:12:07'),
(766, NULL, NULL, NULL, '1.00', '2024-05-29 07:12:32', '2024-05-29 07:12:32'),
(767, NULL, NULL, NULL, '1.00', '2024-05-29 07:12:38', '2024-05-29 07:12:38'),
(768, NULL, NULL, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-05-30 04:47:46', '2024-05-30 04:47:47'),
(769, NULL, 141, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-05-30 04:47:51', '2024-05-30 04:47:52'),
(770, 3, NULL, NULL, '10.00', '2024-05-30 05:13:38', '2024-05-30 05:13:38'),
(771, 3, NULL, NULL, '10.00', '2024-05-30 05:13:39', '2024-05-30 05:13:39'),
(772, NULL, 141, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-05-31 09:12:24', '2024-05-31 09:12:25'),
(773, NULL, NULL, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-05-31 09:12:25', '2024-05-31 09:12:26'),
(774, NULL, 141, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-05-31 09:41:58', '2024-05-31 09:41:59'),
(775, NULL, NULL, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-05-31 09:42:01', '2024-05-31 09:42:02'),
(776, NULL, NULL, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-05-31 10:27:07', '2024-05-31 10:27:08'),
(777, NULL, 141, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-05-31 10:27:12', '2024-05-31 10:27:13'),
(778, NULL, 141, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-06-01 05:11:19', '2024-06-01 05:11:20'),
(779, NULL, NULL, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-06-01 05:11:36', '2024-06-01 05:11:37'),
(780, NULL, 159, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-06-02 02:08:46', '2024-06-02 02:08:47'),
(781, NULL, 141, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-06-02 02:09:13', '2024-06-02 02:09:14'),
(782, NULL, 141, NULL, '1.00', '2024-06-02 02:09:45', '2024-06-02 02:09:45'),
(783, NULL, 159, NULL, '1.00', '2024-06-02 02:15:49', '2024-06-02 02:15:49'),
(784, NULL, 159, NULL, '1.00', '2024-06-02 02:15:59', '2024-06-02 02:15:59'),
(785, NULL, 159, NULL, '1.00', '2024-06-02 02:16:08', '2024-06-02 02:16:08'),
(786, 3, 141, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '10.00', '2024-06-02 02:16:44', '2024-06-02 02:16:45'),
(787, NULL, 141, NULL, '1.00', '2024-06-02 02:17:04', '2024-06-02 02:17:04'),
(788, NULL, NULL, NULL, '1.00', '2024-06-03 02:34:25', '2024-06-03 02:34:25'),
(789, NULL, NULL, NULL, '1.00', '2024-06-03 02:37:47', '2024-06-03 02:37:47'),
(790, NULL, NULL, NULL, '1.00', '2024-06-03 04:53:39', '2024-06-03 04:53:39'),
(791, NULL, NULL, NULL, '1.00', '2024-06-03 04:53:40', '2024-06-03 04:53:40'),
(792, NULL, NULL, NULL, '1.00', '2024-06-03 04:54:53', '2024-06-03 04:54:53'),
(793, NULL, NULL, NULL, '1.00', '2024-06-03 04:55:00', '2024-06-03 04:55:00'),
(794, NULL, NULL, NULL, '1.00', '2024-06-03 04:57:42', '2024-06-03 04:57:42'),
(795, NULL, NULL, NULL, '1.00', '2024-06-03 04:58:59', '2024-06-03 04:58:59'),
(796, NULL, NULL, NULL, '1.00', '2024-06-03 05:00:16', '2024-06-03 05:00:16'),
(797, NULL, NULL, NULL, '1.00', '2024-06-03 05:05:57', '2024-06-03 05:05:57'),
(798, NULL, NULL, NULL, '1.00', '2024-06-03 05:07:38', '2024-06-03 05:07:38'),
(799, NULL, NULL, NULL, '1.00', '2024-06-03 05:07:56', '2024-06-03 05:07:56'),
(800, NULL, NULL, NULL, '1.00', '2024-06-03 05:08:37', '2024-06-03 05:08:37'),
(801, NULL, NULL, NULL, '1.00', '2024-06-03 05:09:15', '2024-06-03 05:09:15'),
(802, NULL, NULL, NULL, '1.00', '2024-06-03 05:09:19', '2024-06-03 05:09:19'),
(803, NULL, NULL, NULL, '1.00', '2024-06-04 02:54:29', '2024-06-04 02:54:29'),
(804, NULL, NULL, NULL, '1.00', '2024-06-04 05:08:03', '2024-06-04 05:08:03'),
(805, NULL, NULL, NULL, '1.00', '2024-06-04 05:20:51', '2024-06-04 05:20:51'),
(806, NULL, NULL, NULL, '1.00', '2024-06-04 05:23:53', '2024-06-04 05:23:53'),
(807, NULL, NULL, NULL, '1.00', '2024-06-04 05:39:41', '2024-06-04 05:39:41'),
(808, NULL, NULL, NULL, '1.00', '2024-06-04 05:39:52', '2024-06-04 05:39:52'),
(809, NULL, NULL, NULL, '1.00', '2024-06-04 05:47:03', '2024-06-04 05:47:03'),
(810, NULL, NULL, NULL, '1.00', '2024-06-04 05:47:07', '2024-06-04 05:47:07'),
(811, NULL, NULL, NULL, '1.00', '2024-06-04 06:06:07', '2024-06-04 06:06:07'),
(812, NULL, NULL, NULL, '1.00', '2024-06-04 06:06:09', '2024-06-04 06:06:09'),
(813, NULL, NULL, NULL, '1.00', '2024-06-04 06:08:53', '2024-06-04 06:08:53'),
(814, NULL, NULL, NULL, '1.00', '2024-06-04 06:08:57', '2024-06-04 06:08:57'),
(815, NULL, NULL, NULL, '1.00', '2024-06-04 06:59:32', '2024-06-04 06:59:32'),
(816, NULL, NULL, NULL, '1.00', '2024-06-04 07:01:57', '2024-06-04 07:01:57'),
(817, NULL, NULL, NULL, '1.00', '2024-06-04 07:05:34', '2024-06-04 07:05:34'),
(818, NULL, NULL, NULL, '1.00', '2024-06-04 07:06:04', '2024-06-04 07:06:04'),
(819, NULL, NULL, NULL, '1.00', '2024-06-04 07:08:22', '2024-06-04 07:08:22'),
(820, NULL, NULL, 'ch_3PNwAgLOWAL3xmQ80zSbYRV7', '1.00', '2024-06-04 07:08:58', '2024-06-04 07:08:59'),
(821, NULL, NULL, NULL, '1.00', '2024-06-04 07:35:52', '2024-06-04 07:35:52'),
(822, NULL, NULL, NULL, '1.00', '2024-06-04 07:35:57', '2024-06-04 07:35:57'),
(823, NULL, NULL, NULL, '1.00', '2024-06-04 07:37:52', '2024-06-04 07:37:52'),
(824, NULL, NULL, NULL, '1.00', '2024-06-04 07:37:53', '2024-06-04 07:37:53'),
(825, NULL, NULL, NULL, '1.00', '2024-06-04 10:41:01', '2024-06-04 10:41:01'),
(826, NULL, 141, NULL, '1.00', '2024-06-04 10:41:07', '2024-06-04 10:41:07'),
(827, 4, NULL, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '50.00', '2024-06-04 10:58:22', '2024-06-04 10:58:23'),
(828, 4, 141, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '50.00', '2024-06-04 10:59:23', '2024-06-04 10:59:24'),
(829, NULL, NULL, NULL, '1.00', '2024-06-05 05:39:53', '2024-06-05 05:39:53'),
(830, NULL, NULL, NULL, '1.00', '2024-06-05 05:39:59', '2024-06-05 05:39:59'),
(831, NULL, NULL, NULL, '1.00', '2024-06-05 05:43:09', '2024-06-05 05:43:09'),
(832, NULL, NULL, NULL, '1.00', '2024-06-05 05:43:16', '2024-06-05 05:43:16'),
(833, NULL, NULL, NULL, '1.00', '2024-06-05 05:50:07', '2024-06-05 05:50:07'),
(834, NULL, NULL, 'ch_3POHZjLOWAL3xmQ80PYya4PV', '1.00', '2024-06-05 06:00:15', '2024-06-05 06:00:16'),
(835, NULL, NULL, 'ch_3POHlnLOWAL3xmQ80mgBEC8v', '1.00', '2024-06-05 06:12:43', '2024-06-05 06:12:44'),
(836, NULL, NULL, NULL, '1.00', '2024-06-05 06:13:01', '2024-06-05 06:13:01'),
(837, NULL, NULL, NULL, '1.00', '2024-06-05 06:15:21', '2024-06-05 06:15:21'),
(838, NULL, NULL, NULL, '1.00', '2024-06-05 06:15:27', '2024-06-05 06:15:27'),
(839, NULL, NULL, NULL, '1.00', '2024-06-05 06:19:52', '2024-06-05 06:19:52'),
(840, NULL, NULL, NULL, '1.00', '2024-06-05 06:19:54', '2024-06-05 06:19:54'),
(841, NULL, NULL, 'ch_3POI1ZLOWAL3xmQ81JcdaB1u', '1.00', '2024-06-05 06:29:01', '2024-06-05 06:29:02'),
(842, NULL, NULL, 'ch_3POI1aLOWAL3xmQ801NGQ9hA', '1.00', '2024-06-05 06:29:02', '2024-06-05 06:29:03'),
(843, NULL, 141, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-06-05 08:47:24', '2024-06-05 08:47:25'),
(844, NULL, 159, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-06-05 08:47:34', '2024-06-05 08:47:35'),
(845, NULL, 141, NULL, '1.00', '2024-06-05 10:25:35', '2024-06-05 10:25:35'),
(846, NULL, 159, '{\"type\":\"error\",\"message\":\"Your card was declined. Your request was in test mode, but used a non test (live) card. For a list of valid test cards, visit: https:\\/\\/stripe.com\\/docs\\/testing.\"}', '1.00', '2024-06-05 10:26:27', '2024-06-05 10:26:28'),
(847, NULL, NULL, NULL, '1.00', '2024-06-10 01:42:27', '2024-06-10 01:42:27'),
(848, 4, NULL, NULL, '50.00', '2024-06-10 01:52:35', '2024-06-10 01:52:35'),
(849, 4, NULL, NULL, '50.00', '2024-06-10 01:52:40', '2024-06-10 01:52:40'),
(850, NULL, NULL, NULL, '1.00', '2024-06-10 01:54:24', '2024-06-10 01:54:24'),
(851, NULL, NULL, NULL, '1.00', '2024-06-10 01:54:24', '2024-06-10 01:54:24'),
(852, NULL, NULL, NULL, '1.00', '2024-06-10 01:57:06', '2024-06-10 01:57:06'),
(853, NULL, NULL, NULL, '1.00', '2024-06-10 05:30:12', '2024-06-10 05:30:12'),
(854, NULL, NULL, NULL, '1.00', '2024-06-10 06:41:32', '2024-06-10 06:41:32'),
(855, NULL, NULL, NULL, '1.00', '2024-06-10 07:33:26', '2024-06-10 07:33:26'),
(856, NULL, NULL, NULL, '1.00', '2024-06-10 08:20:22', '2024-06-10 08:20:22'),
(857, NULL, NULL, NULL, '1.00', '2024-06-10 08:20:54', '2024-06-10 08:20:54'),
(858, NULL, NULL, NULL, '1.00', '2024-06-10 08:23:55', '2024-06-10 08:23:55'),
(859, 3, NULL, NULL, '10.00', '2024-06-10 08:24:39', '2024-06-10 08:24:39'),
(860, 3, NULL, NULL, '10.00', '2024-06-10 08:33:33', '2024-06-10 08:33:33'),
(861, NULL, NULL, NULL, '1.00', '2024-06-10 08:37:00', '2024-06-10 08:37:00'),
(862, NULL, NULL, NULL, '1.00', '2024-06-10 08:37:07', '2024-06-10 08:37:07'),
(863, NULL, NULL, NULL, '1.00', '2024-06-10 08:38:15', '2024-06-10 08:38:15'),
(864, NULL, NULL, NULL, '1.00', '2024-06-10 08:38:20', '2024-06-10 08:38:20'),
(865, NULL, NULL, NULL, '1.00', '2024-06-10 08:43:58', '2024-06-10 08:43:58'),
(866, NULL, NULL, NULL, '1.00', '2024-06-10 08:44:12', '2024-06-10 08:44:12'),
(867, NULL, NULL, NULL, '1.00', '2024-06-10 08:49:12', '2024-06-10 08:49:12'),
(868, NULL, NULL, NULL, '1.00', '2024-06-10 08:49:50', '2024-06-10 08:49:50'),
(869, NULL, NULL, NULL, '1.00', '2024-06-10 08:51:23', '2024-06-10 08:51:23'),
(870, NULL, NULL, NULL, '1.00', '2024-06-10 08:51:28', '2024-06-10 08:51:28'),
(871, NULL, NULL, NULL, '1.00', '2024-06-10 08:56:23', '2024-06-10 08:56:23'),
(872, NULL, NULL, NULL, '1.00', '2024-06-10 08:56:28', '2024-06-10 08:56:28'),
(873, NULL, NULL, NULL, '1.00', '2024-06-10 08:59:41', '2024-06-10 08:59:41'),
(874, NULL, NULL, NULL, '1.00', '2024-06-10 08:59:45', '2024-06-10 08:59:45'),
(875, NULL, NULL, NULL, '1.00', '2024-06-10 09:08:17', '2024-06-10 09:08:17'),
(876, NULL, NULL, NULL, '1.00', '2024-06-10 09:08:34', '2024-06-10 09:08:34'),
(877, NULL, NULL, NULL, '1.00', '2024-06-10 09:11:37', '2024-06-10 09:11:37'),
(878, NULL, NULL, NULL, '1.00', '2024-06-10 09:11:37', '2024-06-10 09:11:37'),
(879, 3, NULL, NULL, '10.00', '2024-06-10 09:22:52', '2024-06-10 09:22:52'),
(880, 3, NULL, NULL, '10.00', '2024-06-10 09:23:59', '2024-06-10 09:23:59'),
(881, NULL, NULL, NULL, '1.00', '2024-06-10 09:39:05', '2024-06-10 09:39:05'),
(882, NULL, NULL, NULL, '1.00', '2024-06-10 09:39:17', '2024-06-10 09:39:17'),
(883, NULL, NULL, NULL, '1.00', '2024-06-10 09:40:09', '2024-06-10 09:40:09'),
(884, NULL, NULL, NULL, '1.00', '2024-06-10 09:42:18', '2024-06-10 09:42:18'),
(885, NULL, NULL, NULL, '1.00', '2024-06-10 09:50:56', '2024-06-10 09:50:56'),
(886, NULL, NULL, NULL, '1.00', '2024-06-10 09:50:56', '2024-06-10 09:50:56'),
(887, NULL, NULL, NULL, '1.00', '2024-06-10 09:52:36', '2024-06-10 09:52:36'),
(888, NULL, NULL, NULL, '1.00', '2024-06-10 09:52:37', '2024-06-10 09:52:37'),
(889, NULL, NULL, NULL, '1.00', '2024-06-10 09:53:30', '2024-06-10 09:53:30'),
(890, NULL, NULL, NULL, '1.00', '2024-06-10 09:53:36', '2024-06-10 09:53:36'),
(891, NULL, NULL, NULL, '1.00', '2024-06-10 09:54:45', '2024-06-10 09:54:45'),
(892, NULL, NULL, NULL, '1.00', '2024-06-10 09:54:49', '2024-06-10 09:54:49'),
(893, NULL, NULL, NULL, '1.00', '2024-06-10 09:58:49', '2024-06-10 09:58:49'),
(894, NULL, NULL, NULL, '1.00', '2024-06-10 09:58:53', '2024-06-10 09:58:53'),
(895, NULL, NULL, NULL, '1.00', '2024-06-10 10:01:41', '2024-06-10 10:01:41'),
(896, NULL, NULL, NULL, '1.00', '2024-06-10 10:01:43', '2024-06-10 10:01:43'),
(897, NULL, NULL, NULL, '1.00', '2024-06-10 10:03:23', '2024-06-10 10:03:23'),
(898, NULL, NULL, NULL, '1.00', '2024-06-10 10:03:41', '2024-06-10 10:03:41'),
(899, NULL, NULL, NULL, '1.00', '2024-06-10 10:04:22', '2024-06-10 10:04:22'),
(900, NULL, NULL, NULL, '1.00', '2024-06-10 10:04:22', '2024-06-10 10:04:22'),
(901, NULL, NULL, NULL, '1.00', '2024-06-10 10:05:03', '2024-06-10 10:05:03'),
(902, NULL, NULL, NULL, '1.00', '2024-06-10 10:05:47', '2024-06-10 10:05:47'),
(903, NULL, NULL, NULL, '1.00', '2024-06-10 10:05:59', '2024-06-10 10:05:59'),
(904, NULL, NULL, NULL, '1.00', '2024-06-10 10:07:26', '2024-06-10 10:07:26'),
(905, NULL, NULL, NULL, '1.00', '2024-06-10 10:07:29', '2024-06-10 10:07:29'),
(906, NULL, NULL, NULL, '1.00', '2024-06-10 10:09:38', '2024-06-10 10:09:38'),
(907, NULL, NULL, NULL, '1.00', '2024-06-10 10:09:42', '2024-06-10 10:09:42'),
(908, NULL, NULL, NULL, '1.00', '2024-06-10 10:11:03', '2024-06-10 10:11:03'),
(909, NULL, NULL, NULL, '1.00', '2024-06-10 10:11:08', '2024-06-10 10:11:08'),
(910, NULL, NULL, NULL, '1.00', '2024-06-10 10:12:42', '2024-06-10 10:12:42'),
(911, NULL, NULL, NULL, '1.00', '2024-06-10 10:12:43', '2024-06-10 10:12:43'),
(912, NULL, NULL, NULL, '1.00', '2024-06-10 10:17:36', '2024-06-10 10:17:36'),
(913, NULL, NULL, NULL, '1.00', '2024-06-10 10:17:36', '2024-06-10 10:17:36'),
(914, NULL, NULL, NULL, '1.00', '2024-06-10 10:18:17', '2024-06-10 10:18:17'),
(915, NULL, NULL, NULL, '1.00', '2024-06-10 10:18:24', '2024-06-10 10:18:24'),
(916, NULL, NULL, NULL, '1.00', '2024-06-10 10:18:54', '2024-06-10 10:18:54'),
(917, NULL, NULL, NULL, '1.00', '2024-06-10 10:18:58', '2024-06-10 10:18:58'),
(918, NULL, NULL, NULL, '1.00', '2024-06-10 10:33:57', '2024-06-10 10:33:57'),
(919, NULL, NULL, NULL, '1.00', '2024-06-10 10:41:22', '2024-06-10 10:41:22'),
(920, NULL, NULL, NULL, '1.00', '2024-06-10 10:47:32', '2024-06-10 10:47:32'),
(921, NULL, NULL, NULL, '1.00', '2024-06-10 10:47:37', '2024-06-10 10:47:37'),
(922, NULL, NULL, NULL, '1.00', '2024-06-10 10:48:15', '2024-06-10 10:48:15'),
(923, NULL, NULL, NULL, '1.00', '2024-06-10 10:48:16', '2024-06-10 10:48:16'),
(924, NULL, NULL, NULL, '1.00', '2024-06-11 02:08:18', '2024-06-11 02:08:18'),
(925, NULL, NULL, NULL, '1.00', '2024-06-11 02:08:47', '2024-06-11 02:08:47'),
(926, NULL, NULL, NULL, '1.00', '2024-06-11 02:11:44', '2024-06-11 02:11:44'),
(927, NULL, NULL, NULL, '1.00', '2024-06-11 02:11:52', '2024-06-11 02:11:52'),
(928, NULL, NULL, 'ch_3PQOtmLOWAL3xmQ80l0b1vGK', '1.00', '2024-06-11 02:13:42', '2024-06-11 02:13:43'),
(929, NULL, NULL, NULL, '1.00', '2024-06-11 02:15:33', '2024-06-11 02:15:33'),
(930, NULL, NULL, NULL, '1.00', '2024-06-11 02:20:12', '2024-06-11 02:20:12'),
(931, 4, NULL, 'ch_3PQP1rLOWAL3xmQ80ZDRrFHe', '50.00', '2024-06-11 02:22:03', '2024-06-11 02:22:04'),
(932, NULL, NULL, NULL, '1.00', '2024-06-11 02:24:54', '2024-06-11 02:24:54'),
(933, NULL, NULL, NULL, '1.00', '2024-06-11 02:27:46', '2024-06-11 02:27:46'),
(934, 3, NULL, NULL, '10.00', '2024-06-11 02:30:06', '2024-06-11 02:30:06'),
(935, 3, NULL, NULL, '10.00', '2024-06-11 02:36:13', '2024-06-11 02:36:13'),
(936, 3, NULL, NULL, '10.00', '2024-06-11 02:40:46', '2024-06-11 02:40:46'),
(937, 3, NULL, NULL, '10.00', '2024-06-11 02:44:09', '2024-06-11 02:44:09'),
(938, 3, NULL, NULL, '10.00', '2024-06-11 02:47:05', '2024-06-11 02:47:05'),
(939, NULL, NULL, NULL, '1.00', '2024-06-11 05:17:34', '2024-06-11 05:17:34'),
(940, NULL, NULL, NULL, '1.00', '2024-06-11 05:17:49', '2024-06-11 05:17:49'),
(941, NULL, NULL, NULL, '1.00', '2024-06-11 05:22:23', '2024-06-11 05:22:23'),
(942, NULL, NULL, NULL, '1.00', '2024-06-11 05:22:24', '2024-06-11 05:22:24'),
(943, NULL, NULL, NULL, '1.00', '2024-06-11 05:27:47', '2024-06-11 05:27:47'),
(944, NULL, NULL, NULL, '1.00', '2024-06-11 05:28:05', '2024-06-11 05:28:05'),
(945, NULL, NULL, NULL, '1.00', '2024-06-11 05:30:33', '2024-06-11 05:30:33'),
(946, NULL, NULL, NULL, '1.00', '2024-06-11 05:30:43', '2024-06-11 05:30:43'),
(947, NULL, NULL, NULL, '1.00', '2024-06-11 05:32:40', '2024-06-11 05:32:40'),
(948, NULL, NULL, NULL, '1.00', '2024-06-11 05:32:41', '2024-06-11 05:32:41'),
(949, NULL, NULL, NULL, '1.00', '2024-06-11 05:35:43', '2024-06-11 05:35:43'),
(950, NULL, NULL, NULL, '1.00', '2024-06-11 05:35:45', '2024-06-11 05:35:45'),
(951, NULL, NULL, NULL, '1.00', '2024-06-11 05:37:03', '2024-06-11 05:37:03'),
(952, NULL, NULL, NULL, '1.00', '2024-06-11 05:37:14', '2024-06-11 05:37:14'),
(953, NULL, NULL, NULL, '1.00', '2024-06-11 05:50:22', '2024-06-11 05:50:22'),
(954, NULL, NULL, NULL, '1.00', '2024-06-11 05:50:28', '2024-06-11 05:50:28'),
(955, NULL, NULL, NULL, '1.00', '2024-06-12 03:01:01', '2024-06-12 03:01:01'),
(956, NULL, NULL, NULL, '1.00', '2024-06-12 03:01:11', '2024-06-12 03:01:11'),
(957, NULL, NULL, NULL, '1.00', '2024-06-12 03:01:11', '2024-06-12 03:01:11'),
(958, NULL, NULL, NULL, '1.00', '2024-06-12 03:02:01', '2024-06-12 03:02:01'),
(959, 3, NULL, NULL, '10.00', '2024-06-12 03:02:13', '2024-06-12 03:02:13'),
(960, 3, NULL, NULL, '10.00', '2024-06-12 03:02:13', '2024-06-12 03:02:13'),
(961, NULL, NULL, NULL, '1.00', '2024-06-12 03:02:51', '2024-06-12 03:02:51'),
(962, NULL, NULL, NULL, '1.00', '2024-06-12 03:03:16', '2024-06-12 03:03:16'),
(963, NULL, NULL, NULL, '1.00', '2024-06-12 03:04:07', '2024-06-12 03:04:07'),
(964, NULL, NULL, NULL, '1.00', '2024-06-12 04:07:02', '2024-06-12 04:07:02'),
(965, NULL, NULL, NULL, '1.00', '2024-06-12 06:26:10', '2024-06-12 06:26:10'),
(966, NULL, NULL, NULL, '1.00', '2024-06-12 06:27:44', '2024-06-12 06:27:44'),
(967, NULL, NULL, NULL, '1.00', '2024-06-12 06:27:44', '2024-06-12 06:27:44'),
(968, NULL, NULL, NULL, '1.00', '2024-06-12 06:29:07', '2024-06-12 06:29:07'),
(969, NULL, NULL, NULL, '1.00', '2024-06-12 06:29:10', '2024-06-12 06:29:10'),
(970, NULL, NULL, NULL, '1.00', '2024-06-12 06:35:29', '2024-06-12 06:35:29'),
(971, NULL, NULL, NULL, '1.00', '2024-06-12 06:35:35', '2024-06-12 06:35:35'),
(972, NULL, NULL, NULL, '1.00', '2024-06-12 06:38:34', '2024-06-12 06:38:34'),
(973, NULL, NULL, NULL, '1.00', '2024-06-12 06:38:50', '2024-06-12 06:38:50'),
(974, NULL, NULL, NULL, '1.00', '2024-06-12 06:41:17', '2024-06-12 06:41:17'),
(975, NULL, NULL, NULL, '1.00', '2024-06-12 06:41:34', '2024-06-12 06:41:34'),
(976, NULL, NULL, NULL, '1.00', '2024-06-12 06:47:42', '2024-06-12 06:47:42'),
(977, NULL, NULL, NULL, '1.00', '2024-06-12 06:47:42', '2024-06-12 06:47:42'),
(978, NULL, NULL, NULL, '1.00', '2024-06-12 06:55:59', '2024-06-12 06:55:59'),
(979, NULL, NULL, NULL, '1.00', '2024-06-12 06:56:27', '2024-06-12 06:56:27'),
(980, 3, NULL, NULL, '10.00', '2024-06-12 06:57:14', '2024-06-12 06:57:14'),
(981, NULL, NULL, 'ch_3PQpnwLOWAL3xmQ81SvLmw0C', '1.00', '2024-06-12 06:57:28', '2024-06-12 06:57:29'),
(982, NULL, NULL, NULL, '1.00', '2024-06-12 06:58:54', '2024-06-12 06:58:54'),
(983, NULL, NULL, NULL, '1.00', '2024-06-12 06:59:44', '2024-06-12 06:59:44'),
(984, NULL, NULL, NULL, '1.00', '2024-06-12 06:59:57', '2024-06-12 06:59:57'),
(985, NULL, NULL, NULL, '1.00', '2024-06-12 07:04:26', '2024-06-12 07:04:26'),
(986, NULL, NULL, NULL, '1.00', '2024-06-12 07:04:26', '2024-06-12 07:04:26'),
(987, NULL, NULL, NULL, '1.00', '2024-06-12 07:06:00', '2024-06-12 07:06:00'),
(988, NULL, NULL, NULL, '1.00', '2024-06-12 07:06:08', '2024-06-12 07:06:08'),
(989, NULL, NULL, NULL, '1.00', '2024-06-12 07:07:34', '2024-06-12 07:07:34'),
(990, NULL, NULL, NULL, '1.00', '2024-06-12 07:07:45', '2024-06-12 07:07:45'),
(991, NULL, NULL, NULL, '1.00', '2024-06-12 07:08:00', '2024-06-12 07:08:00'),
(992, NULL, NULL, NULL, '1.00', '2024-06-12 07:10:06', '2024-06-12 07:10:06'),
(993, NULL, NULL, NULL, '1.00', '2024-06-12 07:10:10', '2024-06-12 07:10:10'),
(994, NULL, NULL, NULL, '1.00', '2024-06-12 07:12:46', '2024-06-12 07:12:46'),
(995, NULL, NULL, NULL, '1.00', '2024-06-12 07:13:39', '2024-06-12 07:13:39'),
(996, NULL, NULL, NULL, '1.00', '2024-06-12 07:20:01', '2024-06-12 07:20:01'),
(997, NULL, NULL, NULL, '1.00', '2024-06-12 07:20:18', '2024-06-12 07:20:18'),
(998, NULL, NULL, NULL, '1.00', '2024-06-12 07:32:50', '2024-06-12 07:32:50'),
(999, NULL, NULL, NULL, '1.00', '2024-06-12 07:38:05', '2024-06-12 07:38:05'),
(1000, NULL, NULL, NULL, '1.00', '2024-06-12 07:46:16', '2024-06-12 07:46:16'),
(1001, NULL, NULL, NULL, '1.00', '2024-06-12 07:46:25', '2024-06-12 07:46:25'),
(1002, NULL, NULL, NULL, '1.00', '2024-06-13 04:29:34', '2024-06-13 04:29:34'),
(1003, NULL, NULL, NULL, '1.00', '2024-06-13 05:49:18', '2024-06-13 05:49:18'),
(1004, NULL, NULL, NULL, '1.00', '2024-06-13 05:49:21', '2024-06-13 05:49:21'),
(1005, NULL, NULL, NULL, '1.00', '2024-06-13 05:50:41', '2024-06-13 05:50:41'),
(1006, NULL, NULL, NULL, '1.00', '2024-06-13 05:50:42', '2024-06-13 05:50:42'),
(1007, NULL, NULL, NULL, '1.00', '2024-06-13 05:51:52', '2024-06-13 05:51:52'),
(1008, NULL, NULL, NULL, '1.00', '2024-06-13 05:51:59', '2024-06-13 05:51:59'),
(1009, NULL, NULL, NULL, '1.00', '2024-06-13 05:53:01', '2024-06-13 05:53:01'),
(1010, NULL, NULL, NULL, '1.00', '2024-06-13 05:53:05', '2024-06-13 05:53:05'),
(1011, NULL, NULL, NULL, '1.00', '2024-06-13 05:54:04', '2024-06-13 05:54:04'),
(1012, NULL, NULL, NULL, '1.00', '2024-06-13 06:04:04', '2024-06-13 06:04:04'),
(1013, NULL, NULL, NULL, '1.00', '2024-06-13 06:06:33', '2024-06-13 06:06:33'),
(1014, NULL, NULL, NULL, '1.00', '2024-06-13 06:06:39', '2024-06-13 06:06:39'),
(1015, NULL, NULL, NULL, '1.00', '2024-06-13 06:06:46', '2024-06-13 06:06:46'),
(1016, NULL, NULL, NULL, '1.00', '2024-06-13 06:09:11', '2024-06-13 06:09:11'),
(1017, NULL, NULL, NULL, '1.00', '2024-06-13 06:11:16', '2024-06-13 06:11:16'),
(1018, NULL, NULL, NULL, '1.00', '2024-06-13 06:11:18', '2024-06-13 06:11:18'),
(1019, NULL, NULL, NULL, '1.00', '2024-06-13 06:12:25', '2024-06-13 06:12:25'),
(1020, NULL, NULL, NULL, '1.00', '2024-06-13 06:12:25', '2024-06-13 06:12:25'),
(1021, NULL, NULL, NULL, '1.00', '2024-06-13 06:15:24', '2024-06-13 06:15:24'),
(1022, NULL, NULL, NULL, '1.00', '2024-06-13 06:15:50', '2024-06-13 06:15:50'),
(1023, NULL, NULL, NULL, '1.00', '2024-06-13 06:34:59', '2024-06-13 06:34:59'),
(1024, NULL, NULL, NULL, '1.00', '2024-06-13 06:35:15', '2024-06-13 06:35:15'),
(1025, NULL, NULL, NULL, '1.00', '2024-06-13 06:47:38', '2024-06-13 06:47:38'),
(1026, NULL, NULL, NULL, '1.00', '2024-06-13 06:47:38', '2024-06-13 06:47:38'),
(1027, NULL, NULL, NULL, '1.00', '2024-06-13 06:48:23', '2024-06-13 06:48:23'),
(1028, NULL, NULL, NULL, '1.00', '2024-06-13 06:49:54', '2024-06-13 06:49:54'),
(1029, NULL, NULL, NULL, '1.00', '2024-06-13 06:49:54', '2024-06-13 06:49:54'),
(1030, NULL, NULL, NULL, '1.00', '2024-06-13 06:51:37', '2024-06-13 06:51:37'),
(1031, NULL, NULL, NULL, '1.00', '2024-06-13 06:51:37', '2024-06-13 06:51:37'),
(1032, NULL, NULL, NULL, '1.00', '2024-06-13 06:52:52', '2024-06-13 06:52:52'),
(1033, NULL, NULL, NULL, '1.00', '2024-06-13 06:53:13', '2024-06-13 06:53:13'),
(1034, 3, NULL, 'ch_3PRZ2SLOWAL3xmQ81priAzdR', '10.00', '2024-06-14 12:15:27', '2024-06-14 12:15:28'),
(1035, 3, NULL, 'ch_3PRZ38LOWAL3xmQ81cSwsKAg', '10.00', '2024-06-14 12:16:10', '2024-06-14 12:16:11'),
(1036, NULL, NULL, 'ch_3PRZbmLOWAL3xmQ81d2NHqX8', '1.00', '2024-06-14 12:51:57', '2024-06-14 12:51:58'),
(1037, NULL, NULL, NULL, '1.00', '2024-06-14 12:54:35', '2024-06-14 12:54:35'),
(1038, 3, NULL, 'ch_3PRZn7LOWAL3xmQ80kq6loba', '10.00', '2024-06-14 13:03:40', '2024-06-14 13:03:41'),
(1039, 3, NULL, NULL, '10.00', '2024-06-14 13:05:04', '2024-06-14 13:05:04'),
(1040, NULL, NULL, NULL, '1.00', '2024-06-14 13:18:27', '2024-06-14 13:18:27'),
(1041, NULL, NULL, 'ch_3PRa1uLOWAL3xmQ80gdsLf5J', '1.00', '2024-06-14 13:18:58', '2024-06-14 13:18:59'),
(1042, NULL, NULL, 'ch_3PRacjLOWAL3xmQ80Pf6vcbw', '1.00', '2024-06-14 13:57:00', '2024-06-14 13:57:02'),
(1043, NULL, NULL, NULL, '1.00', '2024-06-14 14:13:02', '2024-06-14 14:13:02'),
(1044, NULL, NULL, NULL, '1.00', '2024-06-14 14:14:47', '2024-06-14 14:14:47'),
(1045, NULL, NULL, NULL, '1.00', '2024-06-14 14:15:19', '2024-06-14 14:15:19'),
(1046, NULL, NULL, NULL, '1.00', '2024-06-14 14:15:32', '2024-06-14 14:15:32'),
(1047, NULL, NULL, NULL, '1.00', '2024-06-14 14:16:05', '2024-06-14 14:16:05'),
(1048, NULL, NULL, 'ch_3PRawCLOWAL3xmQ80S9Mv1uc', '1.00', '2024-06-14 14:17:08', '2024-06-14 14:17:09'),
(1049, NULL, NULL, NULL, '1.00', '2024-06-14 14:17:29', '2024-06-14 14:17:29'),
(1050, NULL, NULL, NULL, '1.00', '2024-06-14 14:18:38', '2024-06-14 14:18:38'),
(1051, NULL, NULL, 'ch_3PRaxfLOWAL3xmQ811PdKi97', '1.00', '2024-06-14 14:18:39', '2024-06-14 14:18:40'),
(1052, NULL, NULL, NULL, '1.00', '2024-06-14 14:19:22', '2024-06-14 14:19:22'),
(1053, 4, NULL, 'ch_3PRaywLOWAL3xmQ81sXnf1sb', '50.00', '2024-06-14 14:19:57', '2024-06-14 14:19:58'),
(1054, 4, NULL, 'ch_3PRazeLOWAL3xmQ80zrXOhBI', '50.00', '2024-06-14 14:20:42', '2024-06-14 14:20:43'),
(1055, 5, NULL, 'ch_3PRb33LOWAL3xmQ81mHi9rtX', '100.00', '2024-06-14 14:24:13', '2024-06-14 14:24:14'),
(1056, NULL, NULL, NULL, '1.00', '2024-06-14 14:24:26', '2024-06-14 14:24:26'),
(1057, NULL, NULL, NULL, '1.00', '2024-06-14 14:24:31', '2024-06-14 14:24:31'),
(1058, NULL, NULL, NULL, '1.00', '2024-06-14 14:27:48', '2024-06-14 14:27:48'),
(1059, NULL, NULL, NULL, '1.00', '2024-06-14 14:27:55', '2024-06-14 14:27:55'),
(1060, NULL, NULL, NULL, '1.00', '2024-06-14 14:29:12', '2024-06-14 14:29:12'),
(1061, NULL, NULL, NULL, '1.00', '2024-06-14 14:29:12', '2024-06-14 14:29:12'),
(1062, NULL, 159, NULL, '1.00', '2024-06-14 16:30:50', '2024-06-14 16:30:50'),
(1063, NULL, 141, NULL, '1.00', '2024-06-14 16:30:51', '2024-06-14 16:30:51'),
(1064, NULL, 159, NULL, '1.00', '2024-06-14 16:35:54', '2024-06-14 16:35:55'),
(1065, NULL, 141, NULL, '1.00', '2024-06-14 16:35:58', '2024-06-14 16:35:58'),
(1066, 7, NULL, 'ch_3PSAaALOWAL3xmQ80AHH2jaL', '1000.00', '2024-06-16 04:20:45', '2024-06-16 04:20:47'),
(1067, 7, NULL, 'ch_3PSAb5LOWAL3xmQ81FUEYb17', '1000.00', '2024-06-16 04:21:43', '2024-06-16 04:21:44'),
(1068, 7, NULL, NULL, '1000.00', '2024-06-16 04:22:07', '2024-06-16 04:22:07'),
(1069, 3, NULL, NULL, '10.00', '2024-06-16 04:22:33', '2024-06-16 04:22:33'),
(1070, 3, NULL, NULL, '10.00', '2024-06-16 04:22:47', '2024-06-16 04:22:47'),
(1071, 3, NULL, NULL, '10.00', '2024-06-16 04:32:13', '2024-06-16 04:32:13'),
(1072, 3, NULL, NULL, '10.00', '2024-06-16 04:32:48', '2024-06-16 04:32:48'),
(1073, 3, NULL, NULL, '10.00', '2024-06-16 04:37:19', '2024-06-16 04:37:19'),
(1074, 3, NULL, NULL, '10.00', '2024-06-16 04:37:20', '2024-06-16 04:37:20'),
(1075, 3, NULL, NULL, '10.00', '2024-06-16 04:38:14', '2024-06-16 04:38:14'),
(1076, 3, NULL, NULL, '10.00', '2024-06-16 04:45:09', '2024-06-16 04:45:09'),
(1077, 3, NULL, NULL, '10.00', '2024-06-16 04:45:13', '2024-06-16 04:45:13'),
(1078, NULL, NULL, NULL, '1.00', '2024-06-16 04:49:29', '2024-06-16 04:49:29'),
(1079, NULL, NULL, NULL, '1.00', '2024-06-16 04:49:35', '2024-06-16 04:49:35'),
(1080, NULL, NULL, NULL, '1.00', '2024-06-16 04:55:49', '2024-06-16 04:55:49'),
(1081, NULL, NULL, NULL, '1.00', '2024-06-16 04:56:12', '2024-06-16 04:56:12'),
(1082, NULL, NULL, NULL, '1.00', '2024-06-16 05:00:06', '2024-06-16 05:00:06'),
(1083, NULL, NULL, NULL, '1.00', '2024-06-16 05:00:25', '2024-06-16 05:00:25'),
(1084, NULL, NULL, NULL, '1.00', '2024-06-16 05:03:00', '2024-06-16 05:03:00'),
(1085, NULL, NULL, NULL, '1.00', '2024-06-16 05:03:06', '2024-06-16 05:03:06'),
(1086, NULL, NULL, NULL, '1.00', '2024-06-16 05:03:26', '2024-06-16 05:03:26'),
(1087, NULL, NULL, NULL, '1.00', '2024-06-16 05:06:49', '2024-06-16 05:06:49'),
(1088, NULL, NULL, NULL, '1.00', '2024-06-16 05:07:36', '2024-06-16 05:07:36'),
(1089, NULL, NULL, NULL, '1.00', '2024-06-16 05:12:29', '2024-06-16 05:12:29'),
(1090, NULL, NULL, NULL, '1.00', '2024-06-16 05:12:43', '2024-06-16 05:12:43'),
(1091, NULL, NULL, NULL, '1.00', '2024-06-16 05:13:29', '2024-06-16 05:13:29'),
(1092, NULL, NULL, NULL, '1.00', '2024-06-16 05:13:40', '2024-06-16 05:13:40'),
(1093, NULL, 141, NULL, '1.00', '2024-06-18 08:25:00', '2024-06-18 08:25:00'),
(1094, NULL, 159, NULL, '1.00', '2024-06-18 08:25:02', '2024-06-18 08:25:02'),
(1095, 7, NULL, 'ch_3PVB42LOWAL3xmQ817qrGPS3', '1000.00', '2024-06-24 11:28:02', '2024-06-24 11:28:03'),
(1096, 3, NULL, NULL, '10.00', '2024-06-24 11:29:12', '2024-06-24 11:29:12'),
(1097, 3, NULL, NULL, '10.00', '2024-06-24 11:29:13', '2024-06-24 11:29:13'),
(1098, 3, NULL, NULL, '10.00', '2024-06-24 11:45:06', '2024-06-24 11:45:06'),
(1099, 3, NULL, NULL, '10.00', '2024-06-24 11:45:06', '2024-06-24 11:45:06'),
(1100, 3, NULL, NULL, '10.00', '2024-06-25 07:47:15', '2024-06-25 07:47:15'),
(1101, 7, NULL, 'ch_3PVUMXLOWAL3xmQ81O4r98tx', '1000.00', '2024-06-25 08:04:25', '2024-06-25 08:04:26'),
(1102, 3, NULL, NULL, '10.00', '2024-06-25 08:04:47', '2024-06-25 08:04:47'),
(1103, 3, NULL, NULL, '10.00', '2024-06-25 08:05:37', '2024-06-25 08:05:37'),
(1104, 3, NULL, NULL, '10.00', '2024-06-25 09:10:17', '2024-06-25 09:10:17'),
(1105, 3, NULL, NULL, '10.00', '2024-06-25 09:26:30', '2024-06-25 09:26:30'),
(1106, 3, NULL, NULL, '10.00', '2024-06-25 09:46:57', '2024-06-25 09:46:57'),
(1107, 3, NULL, NULL, '10.00', '2024-06-25 09:46:57', '2024-06-25 09:46:57'),
(1108, 3, NULL, NULL, '10.00', '2024-06-25 09:47:35', '2024-06-25 09:47:35'),
(1109, 3, NULL, NULL, '10.00', '2024-06-25 09:59:57', '2024-06-25 09:59:57'),
(1110, 3, NULL, NULL, '10.00', '2024-06-25 10:00:25', '2024-06-25 10:00:25'),
(1111, 3, NULL, NULL, '10.00', '2024-06-25 10:25:37', '2024-06-25 10:25:37'),
(1112, 3, NULL, NULL, '10.00', '2024-06-25 10:26:05', '2024-06-25 10:26:05'),
(1113, 3, NULL, NULL, '10.00', '2024-06-25 10:26:19', '2024-06-25 10:26:19'),
(1114, 3, NULL, NULL, '10.00', '2024-06-25 10:40:58', '2024-06-25 10:40:58'),
(1115, NULL, NULL, 'ch_3PWDe7P7nrCpAwBa1oBFJ4Xf', '1.00', '2024-06-27 08:25:35', '2024-06-27 08:25:37'),
(1116, NULL, 141, NULL, '1.00', '2024-06-27 08:26:32', '2024-06-27 08:26:32'),
(1117, 3, NULL, NULL, '10.00', '2024-06-28 06:42:26', '2024-06-28 06:42:26'),
(1118, 3, NULL, NULL, '10.00', '2024-06-28 06:42:51', '2024-06-28 06:42:51'),
(1119, 3, NULL, NULL, '10.00', '2024-06-28 06:49:49', '2024-06-28 06:49:49'),
(1120, 3, NULL, NULL, '10.00', '2024-06-28 06:49:59', '2024-06-28 06:49:59'),
(1121, 3, NULL, NULL, '10.00', '2024-06-28 06:53:31', '2024-06-28 06:53:31'),
(1122, 3, NULL, NULL, '10.00', '2024-06-28 06:53:33', '2024-06-28 06:53:33'),
(1123, 3, NULL, NULL, '10.00', '2024-06-28 06:55:25', '2024-06-28 06:55:25'),
(1124, 3, NULL, NULL, '10.00', '2024-06-28 06:55:26', '2024-06-28 06:55:26'),
(1125, 3, NULL, NULL, '10.00', '2024-06-28 06:57:34', '2024-06-28 06:57:34'),
(1126, 3, NULL, NULL, '10.00', '2024-06-28 06:57:38', '2024-06-28 06:57:38'),
(1127, 3, NULL, NULL, '10.00', '2024-06-28 06:59:26', '2024-06-28 06:59:26'),
(1128, 3, NULL, NULL, '10.00', '2024-06-28 06:59:27', '2024-06-28 06:59:27'),
(1129, 3, NULL, NULL, '10.00', '2024-06-28 07:09:20', '2024-06-28 07:09:20'),
(1130, 3, NULL, NULL, '10.00', '2024-06-28 07:10:05', '2024-06-28 07:10:05'),
(1131, 3, NULL, NULL, '10.00', '2024-06-28 07:11:24', '2024-06-28 07:11:24'),
(1132, 3, NULL, NULL, '10.00', '2024-06-28 07:11:38', '2024-06-28 07:11:38'),
(1133, 3, NULL, NULL, '10.00', '2024-06-28 07:13:07', '2024-06-28 07:13:07'),
(1134, 3, NULL, NULL, '10.00', '2024-06-28 07:13:12', '2024-06-28 07:13:12'),
(1136, 3, NULL, NULL, '10.00', '2024-06-28 11:27:58', '2024-06-28 11:27:58'),
(1137, 3, NULL, NULL, '10.00', '2024-06-28 11:33:07', '2024-06-28 11:33:07'),
(1138, 3, NULL, NULL, '10.00', '2024-06-28 11:35:46', '2024-06-28 11:35:46'),
(1139, 3, NULL, NULL, '10.00', '2024-06-28 11:36:21', '2024-06-28 11:36:21'),
(1140, 3, NULL, NULL, '10.00', '2024-06-28 11:39:24', '2024-06-28 11:39:24'),
(1141, 3, NULL, NULL, '10.00', '2024-06-28 11:39:33', '2024-06-28 11:39:33'),
(1142, 3, NULL, NULL, '10.00', '2024-06-28 11:45:45', '2024-06-28 11:45:45'),
(1143, 3, NULL, NULL, '10.00', '2024-06-28 11:45:51', '2024-06-28 11:45:51'),
(1144, 3, NULL, NULL, '10.00', '2024-06-28 11:52:46', '2024-06-28 11:52:46'),
(1145, 3, NULL, NULL, '10.00', '2024-06-28 11:52:47', '2024-06-28 11:52:47'),
(1146, 3, NULL, NULL, '10.00', '2024-06-28 11:56:07', '2024-06-28 11:56:07'),
(1147, 3, NULL, NULL, '10.00', '2024-06-28 11:58:58', '2024-06-28 11:58:58'),
(1148, 3, NULL, NULL, '10.00', '2024-06-28 12:25:17', '2024-06-28 12:25:17'),
(1149, 3, NULL, NULL, '10.00', '2024-06-28 12:26:23', '2024-06-28 12:26:23'),
(1150, 3, NULL, NULL, '10.00', '2024-06-28 12:44:28', '2024-06-28 12:44:28'),
(1151, 3, NULL, NULL, '10.00', '2024-06-28 12:44:31', '2024-06-28 12:44:31'),
(1152, 3, NULL, NULL, '10.00', '2024-06-28 14:03:22', '2024-06-28 14:03:22'),
(1153, 3, NULL, NULL, '10.00', '2024-06-28 14:03:54', '2024-06-28 14:03:54'),
(1154, 3, NULL, NULL, '10.00', '2024-06-28 14:04:36', '2024-06-28 14:04:36'),
(1155, 3, NULL, NULL, '10.00', '2024-06-28 14:04:41', '2024-06-28 14:04:41'),
(1156, 3, NULL, NULL, '10.00', '2024-06-28 16:14:24', '2024-06-28 16:14:24'),
(1157, 3, NULL, NULL, '10.00', '2024-06-28 16:18:00', '2024-06-28 16:18:00');

-- --------------------------------------------------------

--
-- Table structure for table `waiting_lounges`
--

CREATE TABLE `waiting_lounges` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `price_id` bigint UNSIGNED DEFAULT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0=waiting,1=match',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `waiting_lounges`
--

INSERT INTO `waiting_lounges` (`id`, `user_id`, `price_id`, `latitude`, `longitude`, `city`, `status`, `created_at`, `updated_at`) VALUES
(7, 141, NULL, '41.7265735', '44.7690244', 'T\'bilisi', 1, '2024-05-26 07:25:08', '2024-05-26 07:25:16'),
(25, 141, NULL, '41.7258932', '44.7693984', 'Tbilisi', 1, '2024-05-31 10:27:15', '2024-05-31 10:27:16'),
(26, 141, NULL, '41.7258506', '44.7694102', 'Tbilisi', 1, '2024-06-01 05:11:23', '2024-06-01 05:11:39'),
(30, 159, NULL, '41.7258379', '44.769429', 'Tbilisi', 1, '2024-06-02 02:16:09', '2024-06-02 02:17:06'),
(61, 141, NULL, '41.7257377', '44.7693804', 'Tbilisi', 1, '2024-06-05 08:47:27', '2024-06-05 08:47:37'),
(62, 141, NULL, '41.7257991', '44.7694739', 'T\'bilisi', 1, '2024-06-05 10:25:37', '2024-06-05 10:26:31'),
(178, 159, NULL, '41.7258141', '44.769462', 'T\'bilisi', 1, '2024-06-14 16:30:52', '2024-06-14 16:30:57'),
(179, 159, NULL, '41.7259266', '44.7693018', 'T\'bilisi', 1, '2024-06-14 16:35:56', '2024-06-14 16:35:59'),
(196, 141, NULL, '41.725889', '44.7693946', 'Tbilisi', 1, '2024-06-18 08:25:10', '2024-06-18 08:25:59');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint UNSIGNED NOT NULL,
  `owner_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` bigint UNSIGNED NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `balance` decimal(16,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `owner_type`, `owner_id`, `type`, `balance`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 6, 'wallet_1', 1164.24, '2024-03-08 05:12:18', '2024-06-28 12:44:31'),
(9, 'App\\Models\\User', 6, 'wallet_2', 6.92, '2024-03-28 05:48:17', '2024-05-31 10:32:41'),
(10, 'App\\Models\\User', 27, 'wallet_1', 3.36, '2024-03-28 05:48:17', '2024-06-24 11:45:07'),
(11, 'App\\Models\\User', 1, 'wallet_3', 131.92, '2024-03-28 05:48:17', '2024-06-28 17:09:14'),
(12, 'App\\Models\\User', 130, 'wallet_2', 0.00, '2024-04-01 01:56:29', '2024-06-11 02:08:18'),
(13, 'App\\Models\\User', 132, 'wallet_1', 0.68, '2024-04-01 01:56:29', '2024-06-05 06:19:54'),
(14, 'App\\Models\\User', 130, 'wallet_1', 102.54, '2024-04-01 02:13:34', '2024-06-28 17:07:05'),
(18, 'App\\Models\\User', 20, 'wallet_2', 0.58, '2024-04-01 02:55:41', '2024-06-27 08:34:03'),
(19, 'App\\Models\\User', 136, 'wallet_1', 6.80, '2024-04-01 03:55:05', '2024-06-14 13:18:27'),
(20, 'App\\Models\\User', 132, 'wallet_2', 0.02, '2024-05-16 04:57:22', '2024-05-16 04:57:22'),
(21, 'App\\Models\\User', 159, 'wallet_1', 0.56, '2024-05-17 10:27:33', '2024-06-18 08:25:02'),
(22, 'App\\Models\\User', 142, 'wallet_1', 0.88, '2024-05-31 09:47:39', '2024-06-04 10:41:01'),
(23, 'App\\Models\\User', 141, 'wallet_1', 0.24, '2024-05-31 10:32:41', '2024-06-27 08:37:00'),
(24, 'App\\Models\\User', 142, 'wallet_2', 1.10, '2024-06-04 11:03:18', '2024-06-10 01:54:02'),
(25, 'App\\Models\\User', 27, 'wallet_2', 0.00, '2024-06-05 10:31:32', '2024-06-11 05:21:25'),
(26, 'App\\Models\\User', 170, 'wallet_1', 97.00, '2024-06-14 13:58:25', '2024-06-14 14:29:12'),
(27, 'App\\Models\\User', 163, 'wallet_1', 953.00, '2024-06-16 04:21:00', '2024-06-16 05:13:29'),
(28, 'App\\Models\\User', 164, 'wallet_1', 953.00, '2024-06-16 04:21:54', '2024-06-16 05:13:40'),
(29, 'App\\Models\\User', 188, 'wallet_1', 940.00, '2024-06-24 11:28:18', '2024-06-25 09:59:57'),
(30, 'App\\Models\\User', 156, 'wallet_1', 927.78, '2024-06-25 08:04:32', '2024-06-28 17:09:14'),
(31, 'App\\Models\\User', 141, 'wallet_2', 0.40, '2024-06-28 06:48:20', '2024-06-28 17:09:14');

-- --------------------------------------------------------

--
-- Table structure for table `wallets_logs`
--

CREATE TABLE `wallets_logs` (
  `id` bigint UNSIGNED NOT NULL,
  `loggable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loggable_id` bigint UNSIGNED NOT NULL,
  `wallet_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(16,2) NOT NULL,
  `from` decimal(16,2) NOT NULL,
  `to` decimal(16,2) NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pending',
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets_logs`
--

INSERT INTO `wallets_logs` (`id`, `loggable_type`, `loggable_id`, `wallet_name`, `value`, `from`, `to`, `type`, `status`, `notes`, `ip`, `reference`, `created_at`, `updated_at`) VALUES
(1, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 950.00, 0.00, 950.00, 'inc', 'Done', NULL, '127.0.0.1', 'D1YHKiYVzt9L', '2024-03-08 05:12:18', '2024-03-08 05:12:18'),
(2, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 950.00, 950.00, 1900.00, 'inc', 'Done', 'Winning Challenge: Inventore consequatu from Brent Satterfield DDS', '127.0.0.1', 'JfU1tC9BAChh', '2024-03-08 05:17:52', '2024-03-08 05:17:52'),
(5, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 4, 'wallet_1', 18.80, 0.00, 18.80, 'inc', 'Done', 'Winning Challenge: Inventore consequatu from test code', '127.0.0.1', '4jgLYuc33QL8', '2024-03-28 05:42:05', '2024-03-28 05:42:05'),
(6, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 5, 'wallet_2', 0.20, 0.00, 0.20, 'inc', 'Done', 'Challenge: Inventore consequatuAttempt By: test code, test', '127.0.0.1', '3xn9PwuAzOCl', '2024-03-28 05:42:05', '2024-03-28 05:42:05'),
(7, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 6, 'wallet_3', 1.00, 0.00, 1.00, 'inc', 'Done', 'Challenge: Inventore consequatuAttempt By: test code, test', '127.0.0.1', 'F3hAnaox3aZr', '2024-03-28 05:42:05', '2024-03-28 05:42:05'),
(10, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 0.00, 0.20, 'inc', 'Done', 'Challenge: Inventore consequatuAttempt By: test code, test', '127.0.0.1', '5S20lsQi3pPr', '2024-03-28 05:48:17', '2024-03-28 05:48:17'),
(11, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 18.80, 0.00, 18.80, 'inc', 'Done', 'Winning Challenge: Inventore consequatu from test code', '127.0.0.1', 'mKREn0QRbslT', '2024-03-28 05:48:17', '2024-03-28 05:48:17'),
(12, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 0.00, 1.00, 'inc', 'Done', 'Challenge: Inventore consequatuAttempt By: test code, test', '127.0.0.1', 'PS5nEq3lVLdh', '2024-03-28 05:48:17', '2024-03-28 05:48:17'),
(13, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1900.00, 1890.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '127.0.0.1', 'gYzvKadDb8EC', '2024-03-28 06:28:10', '2024-03-28 06:28:10'),
(14, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 100.00, 1890.00, 1790.00, 'dec', 'Done', 'Amount Withdrawn', '127.0.0.1', 'znK4Sx8X8prY', '2024-03-29 04:51:32', '2024-03-29 04:51:32'),
(15, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 123.00, 1790.00, 1667.00, 'dec', 'Done', 'Amount Withdrawn', '127.0.0.1', 'Moraui2zXmOB', '2024-03-29 06:38:36', '2024-03-29 06:38:36'),
(16, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.00, 0.20, 'inc', 'Done', 'Challenge: TypingAttempt By: Mohsin Tariq, m2', '45.249.9.124', 'GXdg1eFZOQGB', '2024-04-01 01:56:29', '2024-04-01 01:56:29'),
(17, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 18.80, 0.00, 18.80, 'inc', 'Done', 'Winning Challenge: Typing from Mohsin Tariq', '45.249.9.124', 'MASbYsCt8c7n', '2024-04-01 01:56:29', '2024-04-01 01:56:29'),
(18, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 1.00, 2.00, 'inc', 'Done', 'Challenge: TypingAttempt By: Mohsin Tariq, m2', '45.249.9.124', 'W9mdPa5DCAIL', '2024-04-01 01:56:29', '2024-04-01 01:56:29'),
(19, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.20, 0.40, 'inc', 'Done', 'Challenge: TypingAttempt By: Mohsin Tariq, Mohsin Tariq', '45.249.9.124', 'JlOZUkxyIefi', '2024-04-01 02:13:34', '2024-04-01 02:13:34'),
(20, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 18.80, 0.00, 18.80, 'inc', 'Done', 'Winning Challenge: Typing from Mohsin Tariq', '45.249.9.124', 'QVkz17F9z77q', '2024-04-01 02:13:34', '2024-04-01 02:13:34'),
(21, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 2.00, 3.00, 'inc', 'Done', 'Challenge: TypingAttempt By: Mohsin Tariq, Mohsin Tariq', '45.249.9.124', 'DosUNVqDZCFn', '2024-04-01 02:13:34', '2024-04-01 02:13:34'),
(31, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.40, 0.00, 0.40, 'inc', 'Done', 'Challenge: titleAttempt By: m2, Mohsin Tariq', '45.249.9.124', 'e5cGfQudI6Kr', '2024-04-01 02:55:41', '2024-04-01 02:55:41'),
(32, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 37.60, 18.80, 56.40, 'inc', 'Done', 'Winning Challenge: title from m2', '45.249.9.124', 'qo6bGNjvuvMr', '2024-04-01 02:55:41', '2024-04-01 02:55:41'),
(33, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.00, 3.00, 5.00, 'inc', 'Done', 'Challenge: titleAttempt By: m2, Mohsin Tariq', '45.249.9.124', 'aIoeKvenDhjV', '2024-04-01 02:55:41', '2024-04-01 02:55:41'),
(34, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 0.20, 0.40, 'inc', 'Done', 'Challenge: Inventore consequatuAttempt By: sajjad ali, sajjad ali', '45.249.9.124', 'ecA1aqnvCozP', '2024-04-01 03:55:05', '2024-04-01 03:55:05'),
(35, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 19, 'wallet_1', 18.80, 0.00, 18.80, 'inc', 'Done', 'Winning Challenge: Inventore consequatu from sajjad ali', '45.249.9.124', 'QZp3JsJerB8A', '2024-04-01 03:55:05', '2024-04-01 03:55:05'),
(36, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 5.00, 6.00, 'inc', 'Done', 'Challenge: Inventore consequatuAttempt By: sajjad ali, sajjad ali', '45.249.9.124', 'Ji9dinNQ7OLw', '2024-04-01 03:55:05', '2024-04-01 03:55:05'),
(37, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.40, 0.40, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'zLFNxDgXXeBN', '2024-04-01 05:19:48', '2024-04-01 05:19:48'),
(38, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 9.60, 56.40, 46.80, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'hnCsLTr9RiTd', '2024-04-01 05:19:48', '2024-04-01 05:19:48'),
(39, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 0.40, 0.60, 'inc', 'Done', 'Challenge: Inventore consequatuAttempt By: Mohsin Tariq, m2', '45.249.9.124', 'x73Ce9DhYZkb', '2024-04-01 06:42:30', '2024-04-01 06:42:30'),
(40, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 18.80, 18.80, 37.60, 'inc', 'Done', 'Winning Challenge: Inventore consequatu from Mohsin Tariq', '45.249.9.124', 'Q9SEnd6f5wLw', '2024-04-01 06:42:30', '2024-04-01 06:42:30'),
(41, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 6.00, 7.00, 'inc', 'Done', 'Challenge: Inventore consequatuAttempt By: Mohsin Tariq, m2', '45.249.9.124', 'ztLqqgL04YjO', '2024-04-01 06:42:30', '2024-04-01 06:42:30'),
(42, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.00, 0.20, 'inc', 'Done', 'Challenge: Attempt By: m2, m2', '124.29.220.229', 'KnbzBzvXl4on', '2024-04-17 07:36:53', '2024-04-17 07:36:53'),
(43, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 18.80, 37.60, 56.40, 'inc', 'Done', 'Winning Challenge:  from m2', '124.29.220.229', 'guCNLRBgMgcB', '2024-04-17 07:36:53', '2024-04-17 07:36:53'),
(44, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 7.00, 8.00, 'inc', 'Done', 'Challenge: Attempt By: m2, m2', '124.29.220.229', 'oYFbxORAWEXO', '2024-04-17 07:36:53', '2024-04-17 07:36:53'),
(45, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.20, 0.00, 'dec', 'Done', 'Amount Withdrawn', '124.29.220.229', 'j4GeZmXELkjj', '2024-04-24 01:40:33', '2024-04-24 01:40:33'),
(46, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 9.80, 46.80, 37.00, 'dec', 'Done', 'Amount Withdrawn', '124.29.220.229', 'pUnRbfHOXLzc', '2024-04-24 01:40:33', '2024-04-24 01:40:33'),
(47, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 20.00, 37.00, 17.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 4', '45.249.9.124', '2bdWOn8oR5It', '2024-05-06 08:30:13', '2024-05-06 08:30:13'),
(48, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 17.00, 7.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'JtKCnNxYq8Dk', '2024-05-06 08:51:24', '2024-05-06 08:51:24'),
(49, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 7.00, 6.00, 'dec', 'Done', 'Amount Withdrawn', '45.249.9.124', 'AWaso9LIKevL', '2024-05-07 09:04:47', '2024-05-07 09:04:47'),
(50, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 2.00, 6.00, 4.00, 'dec', 'Done', 'Amount Withdrawn', '45.249.9.124', 'gPKNDqxMNfjl', '2024-05-07 09:05:44', '2024-05-07 09:05:44'),
(51, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 0.60, 0.80, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'ZD56szP7dSsQ', '2024-05-09 09:09:06', '2024-05-09 09:09:06'),
(52, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1667.00, 1685.80, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'Y92DOpRRYi3R', '2024-05-09 09:09:06', '2024-05-09 09:09:06'),
(53, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 8.00, 9.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'HroAhkwzr5qj', '2024-05-09 09:09:06', '2024-05-09 09:09:06'),
(54, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 0.80, 1.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'ifPek3x6fGzO', '2024-05-09 09:09:09', '2024-05-09 09:09:09'),
(55, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1685.80, 1704.60, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'XnVNTE41Qa4I', '2024-05-09 09:09:09', '2024-05-09 09:09:09'),
(56, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 9.00, 10.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'MFCyBwmtrbTt', '2024-05-09 09:09:09', '2024-05-09 09:09:09'),
(57, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 1.00, 1.20, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'DaT1hyMhMGAC', '2024-05-09 09:09:53', '2024-05-09 09:09:53'),
(58, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1704.60, 1723.40, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'Hr2abSCYIh1X', '2024-05-09 09:09:53', '2024-05-09 09:09:53'),
(59, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 10.00, 11.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', '9VHJhnsP3onZ', '2024-05-09 09:09:53', '2024-05-09 09:09:53'),
(60, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 1.20, 1.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'ItM1oETLUGPA', '2024-05-09 09:10:10', '2024-05-09 09:10:10'),
(61, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 18.80, 4.00, 22.80, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'TKYT3noYWA77', '2024-05-09 09:10:10', '2024-05-09 09:10:10'),
(62, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 11.00, 12.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', '3tl8GMnYsNyS', '2024-05-09 09:10:10', '2024-05-09 09:10:10'),
(63, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 1.40, 1.60, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'UQv1UUUismVA', '2024-05-09 09:10:19', '2024-05-09 09:10:19'),
(64, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1723.40, 1742.20, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'Jn9BYw6egUqg', '2024-05-09 09:10:19', '2024-05-09 09:10:19'),
(65, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 12.00, 13.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'RhOqVxX1hAgS', '2024-05-09 09:10:19', '2024-05-09 09:10:19'),
(66, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 1.60, 1.80, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'Op8rAgNwyb3g', '2024-05-09 09:10:25', '2024-05-09 09:10:25'),
(67, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 18.80, 22.80, 41.60, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'fpKaWW3A0Cq4', '2024-05-09 09:10:25', '2024-05-09 09:10:25'),
(68, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 13.00, 14.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'TIGV6P54xzMR', '2024-05-09 09:10:25', '2024-05-09 09:10:25'),
(69, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 1.80, 2.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'lPG7dKLKFAXK', '2024-05-09 09:10:33', '2024-05-09 09:10:33'),
(70, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1742.20, 1761.00, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'ZOQkCpmTvEcj', '2024-05-09 09:10:33', '2024-05-09 09:10:33'),
(71, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 14.00, 15.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'FeoX9GiDj5C8', '2024-05-09 09:10:33', '2024-05-09 09:10:33'),
(72, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 2.00, 2.20, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'B7PAycaJteDY', '2024-05-09 09:10:47', '2024-05-09 09:10:47'),
(73, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 18.80, 41.60, 60.40, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'Uxfr8Nd9yilu', '2024-05-09 09:10:47', '2024-05-09 09:10:47'),
(74, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 15.00, 16.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'xa6OpcwBNjeN', '2024-05-09 09:10:47', '2024-05-09 09:10:47'),
(75, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 2.20, 2.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', '29fLnEkADDLz', '2024-05-09 09:10:54', '2024-05-09 09:10:54'),
(76, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1761.00, 1779.80, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'Zg1T1SvGxJ2k', '2024-05-09 09:10:54', '2024-05-09 09:10:54'),
(77, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 16.00, 17.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'DYMLbU1uFMI1', '2024-05-09 09:10:54', '2024-05-09 09:10:54'),
(78, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 2.40, 2.60, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', '3wf2sDnLnDUe', '2024-05-09 09:11:30', '2024-05-09 09:11:30'),
(79, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1779.80, 1798.60, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'AIAinr6PGzK8', '2024-05-09 09:11:30', '2024-05-09 09:11:30'),
(80, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 17.00, 18.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', '5JXC8omEA4ba', '2024-05-09 09:11:30', '2024-05-09 09:11:30'),
(81, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 2.60, 2.80, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'LjZYVg7xMimB', '2024-05-09 09:12:12', '2024-05-09 09:12:12'),
(82, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1798.60, 1817.40, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'RcIBsnAbQfbA', '2024-05-09 09:12:12', '2024-05-09 09:12:12'),
(83, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 18.00, 19.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'sf9i8E95MNpv', '2024-05-09 09:12:12', '2024-05-09 09:12:12'),
(84, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 2.80, 3.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'uPvW01kqj1ro', '2024-05-09 09:12:31', '2024-05-09 09:12:31'),
(85, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1817.40, 1836.20, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'BX6Ko4e3sxn6', '2024-05-09 09:12:31', '2024-05-09 09:12:31'),
(86, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 19.00, 20.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'SHHOFSefLQUi', '2024-05-09 09:12:31', '2024-05-09 09:12:31'),
(87, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 3.00, 3.20, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'JB0c2OSQ0Xs6', '2024-05-09 09:13:23', '2024-05-09 09:13:23'),
(88, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1836.20, 1855.00, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'ekaZCWln9tjE', '2024-05-09 09:13:23', '2024-05-09 09:13:23'),
(89, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 20.00, 21.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'GwEWH5JYrrCx', '2024-05-09 09:13:23', '2024-05-09 09:13:23'),
(90, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 3.20, 3.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', '2bRRKuMAjAPU', '2024-05-09 09:13:30', '2024-05-09 09:13:30'),
(91, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 18.80, 60.40, 79.20, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'rcFfXR5ztzGz', '2024-05-09 09:13:30', '2024-05-09 09:13:30'),
(92, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 21.00, 22.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'IfgpmN4ruClB', '2024-05-09 09:13:30', '2024-05-09 09:13:30'),
(93, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 3.40, 3.60, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'NP88rNu8C3RY', '2024-05-09 09:13:36', '2024-05-09 09:13:36'),
(94, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1855.00, 1873.80, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'F9LdCxIthqte', '2024-05-09 09:13:36', '2024-05-09 09:13:36'),
(95, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 22.00, 23.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'A5EFEv7AAb2z', '2024-05-09 09:13:36', '2024-05-09 09:13:36'),
(96, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 3.60, 3.80, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'Cs6eksyZ5Dik', '2024-05-09 09:20:19', '2024-05-09 09:20:19'),
(97, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1873.80, 1892.60, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'uESmJP4EOpVn', '2024-05-09 09:20:19', '2024-05-09 09:20:19'),
(98, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 23.00, 24.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'al6aKQztBe4b', '2024-05-09 09:20:19', '2024-05-09 09:20:19'),
(99, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 3.80, 4.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'VRDiFakYqUBZ', '2024-05-09 09:20:45', '2024-05-09 09:20:45'),
(100, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1892.60, 1911.40, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'IkdVHpSKHypB', '2024-05-09 09:20:45', '2024-05-09 09:20:45'),
(101, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 24.00, 25.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'kGc92tmaLAo9', '2024-05-09 09:20:45', '2024-05-09 09:20:45'),
(102, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 4.00, 4.20, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'wd2eVGtrbEFb', '2024-05-09 09:20:57', '2024-05-09 09:20:57'),
(103, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1911.40, 1930.20, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'RZTurN1P0xpO', '2024-05-09 09:20:57', '2024-05-09 09:20:57'),
(104, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 25.00, 26.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', '8jU1vQoklL6s', '2024-05-09 09:20:57', '2024-05-09 09:20:57'),
(105, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 4.20, 4.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'jUzjTwbOOMQx', '2024-05-09 09:21:04', '2024-05-09 09:21:04'),
(106, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 18.80, 79.20, 98.00, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'qmsWrEEaAf4M', '2024-05-09 09:21:04', '2024-05-09 09:21:04'),
(107, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 26.00, 27.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', '39tgYIhdFLbq', '2024-05-09 09:21:04', '2024-05-09 09:21:04'),
(108, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 4.40, 4.60, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'WYKTAn3FF01H', '2024-05-09 09:21:09', '2024-05-09 09:21:09'),
(109, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1930.20, 1949.00, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', '7PBllEKJFKRo', '2024-05-09 09:21:09', '2024-05-09 09:21:09'),
(110, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 27.00, 28.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'eAjPtwt8XK3h', '2024-05-09 09:21:09', '2024-05-09 09:21:09'),
(111, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 4.60, 4.80, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'r8qpzwQHUph5', '2024-05-09 09:21:16', '2024-05-09 09:21:16'),
(112, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1949.00, 1967.80, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'S0i8G8U1TEpl', '2024-05-09 09:21:16', '2024-05-09 09:21:16'),
(113, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 28.00, 29.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'Eb4z3VSRoKvt', '2024-05-09 09:21:16', '2024-05-09 09:21:16'),
(114, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 4.80, 5.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'l7WrzDJQMMQP', '2024-05-09 09:21:54', '2024-05-09 09:21:54'),
(115, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1967.80, 1986.60, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'Qq5w0ZYQVJ96', '2024-05-09 09:21:54', '2024-05-09 09:21:54'),
(116, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 29.00, 30.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'ZAfbi64dmECe', '2024-05-09 09:21:54', '2024-05-09 09:21:54'),
(117, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 5.00, 5.20, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'f9D4imuJ8Pr0', '2024-05-09 09:22:00', '2024-05-09 09:22:00'),
(118, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1986.60, 2005.40, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'XCY4vkON7qfg', '2024-05-09 09:22:00', '2024-05-09 09:22:00'),
(119, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 30.00, 31.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Brent Satterfield DDS', '45.249.9.124', 'dyVzOlqFg998', '2024-05-09 09:22:00', '2024-05-09 09:22:00'),
(120, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 5.20, 5.40, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 'n77d7QBft3xA', '2024-05-09 09:25:49', '2024-05-09 09:25:49'),
(121, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 2005.40, 2024.20, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '45.249.9.124', 'hitAKHZj8lkR', '2024-05-09 09:25:49', '2024-05-09 09:25:49'),
(122, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 31.00, 32.00, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', '0r8HO3ACRofj', '2024-05-09 09:25:49', '2024-05-09 09:25:49'),
(123, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 5.40, 5.60, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', '1sNmvSY3lr7Z', '2024-05-09 09:25:53', '2024-05-09 09:25:53'),
(124, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 2024.20, 2043.00, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '45.249.9.124', 'xN9zZFvvd02S', '2024-05-09 09:25:53', '2024-05-09 09:25:53'),
(125, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 32.00, 33.00, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', '3xwW2uq7tkks', '2024-05-09 09:25:53', '2024-05-09 09:25:53'),
(126, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 5.60, 5.80, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 'mV9B22xIkhVS', '2024-05-09 09:26:23', '2024-05-09 09:26:23'),
(127, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 2043.00, 2061.80, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '45.249.9.124', 'jzX3JIxkwDXX', '2024-05-09 09:26:23', '2024-05-09 09:26:23'),
(128, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 33.00, 34.00, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 'vjyS9SFntuje', '2024-05-09 09:26:23', '2024-05-09 09:26:23'),
(129, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 5.80, 6.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'LfZIdn4LrZwb', '2024-05-09 09:26:28', '2024-05-09 09:26:28'),
(130, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 18.80, 98.00, 116.80, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', '6Kj4sMNw1dWE', '2024-05-09 09:26:28', '2024-05-09 09:26:28'),
(131, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 34.00, 35.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'dSaRoIgdCOxk', '2024-05-09 09:26:28', '2024-05-09 09:26:28'),
(132, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.20, 6.00, 6.20, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 'G7tViDwXofaI', '2024-05-09 09:26:32', '2024-05-09 09:26:32'),
(133, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 2061.80, 2080.60, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '45.249.9.124', 'zxChMvhrlLOm', '2024-05-09 09:26:32', '2024-05-09 09:26:32'),
(134, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 35.00, 36.00, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', '016ybTkraJOU', '2024-05-09 09:26:32', '2024-05-09 09:26:32'),
(135, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 10.00, 56.40, 46.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '14.192.137.69', '890o47knzTml', '2024-05-10 00:46:14', '2024-05-10 00:46:14'),
(136, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 50.00, 116.80, 66.80, 'dec', 'Done', 'Amount Withdrawn', '45.249.9.124', 'Mg39CEdW7Xjw', '2024-05-10 01:08:02', '2024-05-10 01:08:02'),
(137, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 100.00, 2080.60, 1980.60, 'dec', 'Done', 'Amount Withdrawn', '45.249.9.124', 'IOsJ12o1MfHA', '2024-05-10 01:08:08', '2024-05-10 01:08:08'),
(138, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 66.80, 56.80, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'ao8BbzqnEQMB', '2024-05-10 01:34:56', '2024-05-10 01:34:56'),
(139, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1980.60, 1970.60, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'CgQN61WXE8Ms', '2024-05-10 01:36:14', '2024-05-10 01:36:14'),
(140, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1970.60, 1960.60, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'OOzzuShSSPRr', '2024-05-10 02:00:33', '2024-05-10 02:00:33'),
(141, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 56.80, 46.80, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '154.80.52.185', 'YnrbUpi9u3Aa', '2024-05-10 02:03:13', '2024-05-10 02:03:13'),
(142, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1960.60, 1950.60, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'lHEJIjJnJk0M', '2024-05-10 02:03:27', '2024-05-10 02:03:27'),
(143, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.00, 0.20, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 'nQTQem56NjgN', '2024-05-10 02:06:11', '2024-05-10 02:06:11'),
(144, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 18.80, 1950.60, 1969.40, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '45.249.9.124', 'xNNhPoP489sz', '2024-05-10 02:06:11', '2024-05-10 02:06:11'),
(145, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 36.00, 37.00, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 'KHmmmKASX8oh', '2024-05-10 02:06:11', '2024-05-10 02:06:11'),
(146, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1969.40, 1959.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'oIcZMKg2f9kG', '2024-05-10 02:16:55', '2024-05-10 02:16:55'),
(147, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1959.40, 1949.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'n6IHDfCHQ9yP', '2024-05-10 02:19:28', '2024-05-10 02:19:28'),
(148, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1949.40, 1939.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'S5bC8nQVlB6l', '2024-05-10 02:30:55', '2024-05-10 02:30:55'),
(149, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1939.40, 1929.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'EyeCvorSDwUa', '2024-05-10 02:31:41', '2024-05-10 02:31:41'),
(150, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.20, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'RFYBQtKshrhU', '2024-05-10 02:32:26', '2024-05-10 02:32:26'),
(151, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 9.80, 46.80, 37.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'KAKFdUp1w8xQ', '2024-05-10 02:32:26', '2024-05-10 02:32:26'),
(152, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1929.40, 1919.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'kFP3goiBdm0Z', '2024-05-10 02:33:40', '2024-05-10 02:33:40'),
(153, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1919.40, 1909.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'jYXBFL7efGw4', '2024-05-10 02:36:10', '2024-05-10 02:36:10'),
(154, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1909.40, 1899.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'PNZm2YYKjmzD', '2024-05-10 02:38:59', '2024-05-10 02:38:59'),
(155, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1899.40, 1889.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'h8pekTHir00B', '2024-05-10 04:41:30', '2024-05-10 04:41:30'),
(156, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.00, 0.20, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'rwqEGbq9MCU5', '2024-05-10 04:51:46', '2024-05-10 04:51:46'),
(157, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 18.80, 37.00, 55.80, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'TtVAmgAnqHUP', '2024-05-10 04:51:46', '2024-05-10 04:51:46'),
(158, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 37.00, 38.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', '6ohn7hlc4UHv', '2024-05-10 04:51:46', '2024-05-10 04:51:46'),
(159, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.20, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'Wjr4cmdWfMKo', '2024-05-10 05:02:57', '2024-05-10 05:02:57'),
(160, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 9.80, 55.80, 46.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'ZxrW6Bp0TuGe', '2024-05-10 05:02:57', '2024-05-10 05:02:57'),
(161, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1889.40, 1879.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'U2QB3W6VL7Nc', '2024-05-10 05:03:02', '2024-05-10 05:03:02'),
(162, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1879.40, 1878.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '8HqPQRiCj7mF', '2024-05-13 06:08:26', '2024-05-13 06:08:26'),
(163, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 46.40, 45.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '37VGesid9X5O', '2024-05-13 06:09:33', '2024-05-13 06:09:33'),
(164, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 45.40, 44.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'YTQW87JTElLp', '2024-05-13 06:15:32', '2024-05-13 06:15:32'),
(165, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1878.40, 1877.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'emT1xv48LNwi', '2024-05-13 06:15:40', '2024-05-13 06:15:40'),
(166, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1877.40, 1876.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'p8r6sX5ZFRMb', '2024-05-13 07:26:25', '2024-05-13 07:26:25'),
(167, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 44.40, 43.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'sloGrLNrMjgW', '2024-05-13 07:28:23', '2024-05-13 07:28:23'),
(168, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1876.40, 1875.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '6IsS9CoTsrsn', '2024-05-13 07:35:14', '2024-05-13 07:35:14'),
(169, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 43.40, 42.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'qeF38TL9uVNY', '2024-05-13 07:35:31', '2024-05-13 07:35:31'),
(170, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 42.40, 41.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'fbMYy5kd8sal', '2024-05-13 07:43:08', '2024-05-13 07:43:08'),
(171, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1875.40, 1874.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'GUlqq8EgH8h9', '2024-05-13 07:43:21', '2024-05-13 07:43:21'),
(172, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1874.40, 1873.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'JUK46Kh6oaaj', '2024-05-13 08:24:47', '2024-05-13 08:24:47'),
(173, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 41.40, 40.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Ylyxojz5WZ3o', '2024-05-13 08:25:11', '2024-05-13 08:25:11'),
(174, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1873.40, 1872.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '7qcJ4CF00Hix', '2024-05-14 00:44:47', '2024-05-14 00:44:47'),
(175, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 40.40, 39.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'G6GDi1TtduRC', '2024-05-14 00:44:47', '2024-05-14 00:44:47'),
(176, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1872.40, 1871.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Ct29nOJHL7SV', '2024-05-14 01:09:20', '2024-05-14 01:09:20'),
(177, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 39.40, 38.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'QHcfz5sua8Iq', '2024-05-14 01:09:35', '2024-05-14 01:09:35'),
(178, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1871.40, 1870.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Sc21wKkgDfGT', '2024-05-14 01:12:17', '2024-05-14 01:12:17'),
(179, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 38.40, 37.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'tfT1qfxr7mue', '2024-05-14 01:14:32', '2024-05-14 01:14:32'),
(180, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1870.40, 1869.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'gqVk5yho41II', '2024-05-14 02:13:54', '2024-05-14 02:13:54'),
(181, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1869.40, 1868.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ABf2hSU9fb2H', '2024-05-14 02:37:18', '2024-05-14 02:37:18'),
(182, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 37.40, 36.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'jW3uau5ziaXe', '2024-05-14 02:38:06', '2024-05-14 02:38:06'),
(183, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 36.40, 35.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'mS3OvXxn5OTW', '2024-05-14 02:42:59', '2024-05-14 02:42:59'),
(184, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1868.40, 1867.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'wrHY1YcqoPmQ', '2024-05-14 02:43:08', '2024-05-14 02:43:08'),
(185, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1867.40, 1866.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'y6waseaEPWne', '2024-05-14 02:46:21', '2024-05-14 02:46:21'),
(186, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 35.40, 34.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'AuDufH9MP8wU', '2024-05-14 02:46:36', '2024-05-14 02:46:36'),
(187, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1866.40, 1865.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 't6pZZt1Fg4Ja', '2024-05-14 04:22:33', '2024-05-14 04:22:33'),
(188, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 34.40, 33.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'YmBj0TQ7wbau', '2024-05-14 04:22:34', '2024-05-14 04:22:34'),
(189, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 33.40, 32.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'B5URaXO1awiL', '2024-05-14 04:29:10', '2024-05-14 04:29:10'),
(190, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1865.40, 1864.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'qNb8S8idctTY', '2024-05-14 04:29:16', '2024-05-14 04:29:16'),
(191, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1864.40, 1863.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'SlJDvQO9XdIC', '2024-05-14 04:45:40', '2024-05-14 04:45:40'),
(192, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 32.40, 31.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '0L731SpXJpDn', '2024-05-14 04:45:49', '2024-05-14 04:45:49'),
(193, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1863.40, 1862.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'wxwi3eOECH4z', '2024-05-14 04:49:45', '2024-05-14 04:49:45'),
(194, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 31.40, 30.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'vqLWDG8cYakX', '2024-05-14 04:49:56', '2024-05-14 04:49:56'),
(195, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1862.40, 1861.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'EdCdYZLwjhHR', '2024-05-14 05:08:53', '2024-05-14 05:08:53'),
(196, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 30.40, 29.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '4ehOFq9coOId', '2024-05-14 05:09:06', '2024-05-14 05:09:06'),
(197, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1861.40, 1860.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'hLTchlGZP8Nl', '2024-05-14 05:50:04', '2024-05-14 05:50:04'),
(198, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 29.40, 28.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'CD99aJoYBG5L', '2024-05-14 05:50:17', '2024-05-14 05:50:17'),
(199, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1860.40, 1859.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'U8nlfELTHOnF', '2024-05-14 05:54:43', '2024-05-14 05:54:43'),
(200, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 28.40, 27.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '9DV3hTioWY8q', '2024-05-14 05:54:53', '2024-05-14 05:54:53'),
(201, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1859.40, 1858.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '06AYF1LZQaFW', '2024-05-14 06:00:51', '2024-05-14 06:00:51'),
(202, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 27.40, 26.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'RlYqpv1jojCt', '2024-05-14 06:00:59', '2024-05-14 06:00:59'),
(203, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1858.40, 1857.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '7qYVcqk0aVtP', '2024-05-14 06:09:33', '2024-05-14 06:09:33'),
(204, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 26.40, 25.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'gZANIW2ILZXJ', '2024-05-14 06:09:40', '2024-05-14 06:09:40'),
(205, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1857.40, 1856.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'zw8638OE9l4k', '2024-05-14 06:11:31', '2024-05-14 06:11:31'),
(206, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 25.40, 24.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'aqDkz1y22TPm', '2024-05-14 06:11:46', '2024-05-14 06:11:46'),
(207, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1856.40, 1855.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'q0VEVBAwZ1kg', '2024-05-14 06:12:39', '2024-05-14 06:12:39'),
(208, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 24.40, 23.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'hJptoF9CWGiG', '2024-05-14 06:12:42', '2024-05-14 06:12:42'),
(209, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1855.40, 1854.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'KymCTRClRjQI', '2024-05-14 06:15:20', '2024-05-14 06:15:20'),
(210, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 23.40, 22.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ytmluISQbygq', '2024-05-14 06:15:31', '2024-05-14 06:15:31'),
(211, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1854.40, 1853.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'As3H30WteoZH', '2024-05-14 06:29:32', '2024-05-14 06:29:32'),
(212, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 22.40, 21.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'SruYstCfk0iJ', '2024-05-14 06:29:37', '2024-05-14 06:29:37'),
(213, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1853.40, 1852.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'p6bDXbLSwfU6', '2024-05-14 06:38:31', '2024-05-14 06:38:31'),
(214, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 21.40, 20.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'RgMJHecaGX0S', '2024-05-14 06:38:33', '2024-05-14 06:38:33'),
(215, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1852.40, 1851.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'dFkI2N57GESr', '2024-05-14 06:41:23', '2024-05-14 06:41:23'),
(216, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 20.40, 19.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ekrf6cpP5DHu', '2024-05-14 06:41:23', '2024-05-14 06:41:23'),
(217, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1851.40, 1850.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'eXr6QaAD6vz9', '2024-05-14 06:41:57', '2024-05-14 06:41:57'),
(218, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1850.40, 1849.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'dc74uRi0QM9S', '2024-05-14 06:42:42', '2024-05-14 06:42:42'),
(219, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 19.40, 18.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'aCH60UyZdAyq', '2024-05-14 06:42:42', '2024-05-14 06:42:42'),
(220, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 18.40, 17.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'M0izoicXPDng', '2024-05-14 06:57:38', '2024-05-14 06:57:38'),
(221, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1849.40, 1848.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'gcfAYqijEdVg', '2024-05-14 06:57:48', '2024-05-14 06:57:48'),
(222, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1848.40, 1847.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'AEReVsbOA4GM', '2024-05-14 07:00:08', '2024-05-14 07:00:08'),
(223, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 17.40, 16.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'K3JPBknN2ZFu', '2024-05-14 07:00:12', '2024-05-14 07:00:12');
INSERT INTO `wallets_logs` (`id`, `loggable_type`, `loggable_id`, `wallet_name`, `value`, `from`, `to`, `type`, `status`, `notes`, `ip`, `reference`, `created_at`, `updated_at`) VALUES
(224, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1847.40, 1846.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'A9GhwHleGQ3Z', '2024-05-14 07:02:52', '2024-05-14 07:02:52'),
(225, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 16.40, 15.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'BNZJHvaBeBTK', '2024-05-14 07:02:55', '2024-05-14 07:02:55'),
(226, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1846.40, 1845.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'g4tjUzV0A3VM', '2024-05-14 07:04:42', '2024-05-14 07:04:42'),
(227, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 15.40, 14.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'nV0w5xaIs2af', '2024-05-14 07:04:56', '2024-05-14 07:04:56'),
(228, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 14.40, 13.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '0yjXeWlQkuM1', '2024-05-14 07:11:00', '2024-05-14 07:11:00'),
(229, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1845.40, 1844.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ZnpHZPD4dzU6', '2024-05-14 07:11:07', '2024-05-14 07:11:07'),
(230, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1844.40, 1843.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'A7XoK2hbh05n', '2024-05-14 07:12:44', '2024-05-14 07:12:44'),
(231, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 13.40, 12.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '4O9yhrWGg6p9', '2024-05-14 07:12:54', '2024-05-14 07:12:54'),
(232, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1843.40, 1842.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '1KHmooLCK6oO', '2024-05-14 07:14:32', '2024-05-14 07:14:32'),
(233, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 12.40, 11.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'HRraFqeW4GRF', '2024-05-14 07:14:34', '2024-05-14 07:14:34'),
(234, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1842.40, 1841.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ch4O51Ne9BWq', '2024-05-14 07:14:45', '2024-05-14 07:14:45'),
(235, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 11.40, 10.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '9EyACbCATsR6', '2024-05-14 07:14:56', '2024-05-14 07:14:56'),
(236, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 10.40, 9.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'n6MqBHPvkL4s', '2024-05-14 07:19:55', '2024-05-14 07:19:55'),
(237, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1841.40, 1840.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'oT74MSEKjeaL', '2024-05-14 07:20:06', '2024-05-14 07:20:06'),
(238, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1840.40, 1839.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'XX26BDdYT00f', '2024-05-14 07:21:08', '2024-05-14 07:21:08'),
(239, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 9.40, 8.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '8FFbZ7gEHRya', '2024-05-14 07:21:15', '2024-05-14 07:21:15'),
(240, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1839.40, 1838.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'A5Si6oITaoTS', '2024-05-14 07:22:16', '2024-05-14 07:22:16'),
(241, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 8.40, 7.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'VzBiSpg3t0ON', '2024-05-14 07:22:32', '2024-05-14 07:22:32'),
(242, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1838.40, 1837.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'lIoonoR6jPRF', '2024-05-14 07:23:35', '2024-05-14 07:23:35'),
(243, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 7.40, 6.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '6Ie6pRjhSxUG', '2024-05-14 07:23:55', '2024-05-14 07:23:55'),
(244, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1837.40, 1836.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'sVdBTTKcKBoP', '2024-05-14 07:29:08', '2024-05-14 07:29:08'),
(245, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 6.40, 5.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'VHOQ4QtM1TVO', '2024-05-14 07:29:11', '2024-05-14 07:29:11'),
(246, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1836.40, 1835.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'oGa6TKMNC5RU', '2024-05-14 07:30:09', '2024-05-14 07:30:09'),
(247, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 5.40, 4.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'plmuYM9o1X5f', '2024-05-14 07:30:18', '2024-05-14 07:30:18'),
(248, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1835.40, 1834.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'CciMUVjWlL4l', '2024-05-14 07:31:54', '2024-05-14 07:31:54'),
(249, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 4.40, 3.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'pHr6cXGgAVBi', '2024-05-14 07:31:58', '2024-05-14 07:31:58'),
(250, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1834.40, 1833.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '2209spGHbNEz', '2024-05-14 07:34:45', '2024-05-14 07:34:45'),
(251, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 3.40, 2.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ZUxXHXdc0KVC', '2024-05-14 07:34:55', '2024-05-14 07:34:55'),
(252, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1833.40, 1832.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'tnM4OfXz66Vw', '2024-05-14 07:35:57', '2024-05-14 07:35:57'),
(253, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 2.40, 1.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '7C3I2CcjnhXO', '2024-05-14 07:36:00', '2024-05-14 07:36:00'),
(254, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1832.40, 1831.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'MGKlg10SaaHb', '2024-05-14 07:36:35', '2024-05-14 07:36:35'),
(255, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 1.40, 0.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'tzmYOvgJ5DFm', '2024-05-14 07:36:42', '2024-05-14 07:36:42'),
(256, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 950.00, 0.40, 950.40, 'inc', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'tzmYOvgJ5DFm', '2024-05-14 07:36:42', '2024-05-14 07:36:42'),
(257, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.00, 0.20, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, mohsin …', '45.249.9.124', 'R8PMuZJXTEG4', '2024-05-14 07:47:24', '2024-05-14 07:47:24'),
(259, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 38.00, 39.00, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, mohsin …', '45.249.9.124', 'DXuuqET6GoOC', '2024-05-14 07:47:24', '2024-05-14 07:47:24'),
(261, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1831.40, 1830.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'waP5zTsBnecz', '2024-05-14 07:51:22', '2024-05-14 07:51:22'),
(262, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 19.20, 18.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'V6elE8BiSaxP', '2024-05-14 07:51:38', '2024-05-14 07:51:38'),
(263, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.20, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'HNnvdqKjPKNJ', '2024-05-14 07:53:56', '2024-05-14 07:53:56'),
(264, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 0.80, 46.00, 45.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '71vhCX77jqPo', '2024-05-14 07:53:56', '2024-05-14 07:53:56'),
(265, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 18.20, 17.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'K9KlTF0Ip7Oy', '2024-05-14 07:53:58', '2024-05-14 07:53:58'),
(266, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 17.20, 16.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'jzLPvizuhxKf', '2024-05-14 07:54:17', '2024-05-14 07:54:17'),
(267, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1830.40, 1829.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'LDbzbQSCWjRW', '2024-05-14 07:55:20', '2024-05-14 07:55:20'),
(268, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 45.20, 44.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Z250QHInRcUQ', '2024-05-14 07:55:31', '2024-05-14 07:55:31'),
(269, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1829.40, 1828.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '36RCpVZi7tLH', '2024-05-14 07:57:02', '2024-05-14 07:57:02'),
(270, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 44.20, 43.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '2nYlXVl7qPvj', '2024-05-14 07:57:10', '2024-05-14 07:57:10'),
(271, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 16.20, 15.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'VlihaHOARr5p', '2024-05-14 07:58:37', '2024-05-14 07:58:37'),
(272, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 43.20, 42.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'UTUXIiJ3rydK', '2024-05-14 07:58:40', '2024-05-14 07:58:40'),
(273, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 15.20, 14.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'vaoTC3b6O0FO', '2024-05-14 08:05:02', '2024-05-14 08:05:02'),
(274, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 42.20, 32.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'yLToodVqgtDN', '2024-05-14 08:05:09', '2024-05-14 08:05:09'),
(275, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 32.20, 31.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Y47ByeQrpDr1', '2024-05-14 08:05:53', '2024-05-14 08:05:53'),
(276, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 14.20, 13.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'jZGvg85TW4Nq', '2024-05-14 08:05:56', '2024-05-14 08:05:56'),
(277, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 13.20, 12.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'W670mLr3KOvm', '2024-05-14 08:06:42', '2024-05-14 08:06:42'),
(278, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 31.20, 30.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'EJajtcDyAk8J', '2024-05-14 08:06:51', '2024-05-14 08:06:51'),
(279, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 30.20, 29.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'DER7HihQpz84', '2024-05-14 08:08:21', '2024-05-14 08:08:21'),
(280, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 12.20, 11.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'MWkqOZ3WRIDB', '2024-05-14 08:08:24', '2024-05-14 08:08:24'),
(281, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 11.20, 10.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'QJF5GJdJPZKC', '2024-05-14 08:09:05', '2024-05-14 08:09:05'),
(282, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1828.40, 1827.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'vMP1eSmJVNUN', '2024-05-14 08:09:10', '2024-05-14 08:09:10'),
(283, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 29.20, 28.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.33.34', 'JlXWXREX7KCs', '2024-05-14 08:11:12', '2024-05-14 08:11:12'),
(284, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 28.20, 27.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.33.34', 'qiMSODBFXpBK', '2024-05-14 08:13:31', '2024-05-14 08:13:31'),
(285, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 10.20, 9.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', 'pm8zVq03MtiO', '2024-05-14 08:14:00', '2024-05-14 08:14:00'),
(286, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 27.20, 26.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.33.34', 'twAwIR9eKWk0', '2024-05-14 08:15:14', '2024-05-14 08:15:14'),
(287, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 9.20, 8.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', 'rbTK2LsdLKjt', '2024-05-14 08:15:15', '2024-05-14 08:15:15'),
(288, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1827.40, 1826.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Sc45nL2AkNZS', '2024-05-14 08:17:04', '2024-05-14 08:17:04'),
(289, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 26.20, 25.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.33.34', '06y8NXtvtZ4F', '2024-05-14 08:18:13', '2024-05-14 08:18:13'),
(290, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 8.20, 7.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', '0XqE0T9ilCKq', '2024-05-14 08:20:05', '2024-05-14 08:20:05'),
(291, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 25.20, 24.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.33.34', 'hNzdMGA7dFjk', '2024-05-14 08:20:08', '2024-05-14 08:20:08'),
(292, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 24.20, 23.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.33.34', 'lAqHDH2Oo3L9', '2024-05-14 08:20:58', '2024-05-14 08:20:58'),
(293, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 7.20, 6.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', 'l9JySvSPyRDq', '2024-05-14 08:21:00', '2024-05-14 08:21:00'),
(294, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1826.40, 1825.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'u4SnRoCLZHL1', '2024-05-14 08:21:49', '2024-05-14 08:21:49'),
(295, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 6.20, 5.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', '9qekV7crnLZ3', '2024-05-14 08:22:22', '2024-05-14 08:22:22'),
(296, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1825.40, 1824.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'WyZRcvrp4n2X', '2024-05-14 08:23:04', '2024-05-14 08:23:04'),
(297, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 5.20, 4.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', 'GhYF8pLL7gq8', '2024-05-14 08:23:06', '2024-05-14 08:23:06'),
(298, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 4.20, 3.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', 'HeeqKoN9qNss', '2024-05-14 08:25:56', '2024-05-14 08:25:56'),
(299, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 23.20, 22.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.33.34', 'GesMbwFT88nt', '2024-05-14 08:26:04', '2024-05-14 08:26:04'),
(300, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1824.40, 1814.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'SkpIZSBQjc2Z', '2024-05-14 08:36:57', '2024-05-14 08:36:57'),
(301, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1814.40, 1813.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'zN1ZMlSKk1Ng', '2024-05-14 08:37:43', '2024-05-14 08:37:43'),
(302, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1813.40, 1812.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'wM1ByZwh4V0Y', '2024-05-14 08:41:00', '2024-05-14 08:41:00'),
(303, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 3.20, 2.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', '0UgqodJk0NdP', '2024-05-14 08:41:06', '2024-05-14 08:41:06'),
(304, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 22.20, 21.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.33.34', 'QsVrtm1mUqaC', '2024-05-14 08:41:18', '2024-05-14 08:41:18'),
(305, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1812.40, 1811.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '68C0I4lJUbFG', '2024-05-14 08:43:17', '2024-05-14 08:43:17'),
(306, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 2.20, 1.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', 'OehvE47VHbxq', '2024-05-14 08:43:23', '2024-05-14 08:43:23'),
(307, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1811.40, 1810.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Zs50qaoajBJn', '2024-05-14 08:43:59', '2024-05-14 08:43:59'),
(308, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 1.20, 0.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', 'NpGiarofATDl', '2024-05-14 08:45:15', '2024-05-14 08:45:15'),
(309, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1810.40, 1809.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'aTuEuMcqgthh', '2024-05-14 08:45:24', '2024-05-14 08:45:24'),
(310, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1809.40, 1799.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'piR6oLFh0niW', '2024-05-14 08:47:32', '2024-05-14 08:47:32'),
(311, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 30.00, 1799.40, 1769.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 5', '45.249.9.124', 'djdj422Bv0qb', '2024-05-14 08:49:02', '2024-05-14 08:49:02'),
(312, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1769.40, 1768.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '10F7XIRqSfCi', '2024-05-14 08:50:52', '2024-05-14 08:50:52'),
(313, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 18.80, 17.80, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', 'RpBnDxSAEcYn', '2024-05-14 08:54:21', '2024-05-14 08:54:21'),
(314, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1768.40, 1767.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.33.34', 'dJ0GGJwqmgMh', '2024-05-14 08:54:21', '2024-05-14 08:54:21'),
(315, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.20, 6.22, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'KbJxlVww6Yby', '2024-05-14 08:55:42', '2024-05-14 08:55:42'),
(316, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 17.80, 19.68, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', '6JVzrWcYP4zU', '2024-05-14 08:55:42', '2024-05-14 08:55:42'),
(317, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 39.00, 39.10, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', '3slvgDb54FVU', '2024-05-14 08:55:42', '2024-05-14 08:55:42'),
(318, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 19.68, 18.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', 'tHicg0wmzHgF', '2024-05-14 08:59:34', '2024-05-14 08:59:34'),
(319, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1767.40, 1766.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '2IaEIWJCY38l', '2024-05-14 08:59:40', '2024-05-14 08:59:40'),
(320, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1766.40, 1765.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'NrLcDaSWLfi9', '2024-05-14 09:00:50', '2024-05-14 09:00:50'),
(321, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 18.68, 17.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', 'rV5q5c7I1Z1j', '2024-05-14 09:01:04', '2024-05-14 09:01:04'),
(322, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1765.40, 1764.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '3K3cfZXvw4OB', '2024-05-14 09:46:26', '2024-05-14 09:46:26'),
(323, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 17.68, 16.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.156.76', 't05FYlDP0APK', '2024-05-14 09:47:00', '2024-05-14 09:47:00'),
(324, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1764.40, 1763.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'eehLwXK3Om5J', '2024-05-14 11:01:27', '2024-05-14 11:01:27'),
(325, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 16.68, 15.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '0Kd3qOAA2p7e', '2024-05-14 11:01:31', '2024-05-14 11:01:31'),
(326, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 15.68, 14.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Nx8qo2sAH6mu', '2024-05-14 11:04:29', '2024-05-14 11:04:29'),
(327, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 14.68, 13.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'sCP5PSxq93Pl', '2024-05-14 11:04:46', '2024-05-14 11:04:46'),
(328, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1763.40, 1762.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '5HDuOJ239FjA', '2024-05-14 11:04:52', '2024-05-14 11:04:52'),
(329, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1762.40, 1761.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ti2EiMwpAZQP', '2024-05-14 11:05:21', '2024-05-14 11:05:21'),
(330, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 13.68, 12.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '5POHnybLrjrH', '2024-05-14 11:05:31', '2024-05-14 11:05:31'),
(331, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 12.68, 11.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'WNm2yjFSfK7q', '2024-05-14 11:07:37', '2024-05-14 11:07:37'),
(332, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1761.40, 1760.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Fk092k1BsS5j', '2024-05-14 11:07:52', '2024-05-14 11:07:52'),
(333, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1760.40, 1759.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '7qySdQ25Btks', '2024-05-14 11:11:07', '2024-05-14 11:11:07'),
(334, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 11.68, 10.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '0UY9D7ImnCr8', '2024-05-14 11:11:12', '2024-05-14 11:11:12'),
(335, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1759.40, 1758.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'q9XFInopX0zk', '2024-05-14 14:05:51', '2024-05-14 14:05:51'),
(336, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 10.68, 9.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', '1qOewnYPgkWg', '2024-05-14 14:06:13', '2024-05-14 14:06:13'),
(337, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1758.40, 1757.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', '21DBGSZKV97f', '2024-05-14 14:11:23', '2024-05-14 14:11:23'),
(338, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 9.68, 8.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'XYvX9czbwNFw', '2024-05-14 14:11:30', '2024-05-14 14:11:30'),
(339, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1757.40, 1756.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', '4R385ZlT6jY9', '2024-05-14 14:12:08', '2024-05-14 14:12:08'),
(340, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 8.68, 7.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'EFesOS5GymWy', '2024-05-14 14:12:17', '2024-05-14 14:12:17'),
(341, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1756.40, 1755.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'eOyKQK0u5aam', '2024-05-14 14:12:55', '2024-05-14 14:12:55'),
(342, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 7.68, 6.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'mkgrdyoKED3H', '2024-05-14 14:13:03', '2024-05-14 14:13:03'),
(343, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1755.40, 1754.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'RD1LypBCsS08', '2024-05-14 15:20:21', '2024-05-14 15:20:21'),
(344, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 6.68, 5.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'jjnLfGbmjl7V', '2024-05-14 15:20:34', '2024-05-14 15:20:34'),
(345, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.22, 6.24, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '103.117.160.9', 'AQ92REMHzRIN', '2024-05-14 15:41:10', '2024-05-14 15:41:10'),
(346, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.88, 1754.40, 1756.28, 'inc', 'Done', 'Winning Challenge:  from test', '103.117.160.9', 'JHsA5H2zZgBv', '2024-05-14 15:41:10', '2024-05-14 15:41:10'),
(347, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 39.10, 39.20, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '103.117.160.9', 'cKL5PfTSnoY3', '2024-05-14 15:41:10', '2024-05-14 15:41:10'),
(348, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1756.28, 1755.28, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'TnS5a4gjSaAt', '2024-05-14 23:40:50', '2024-05-14 23:40:50'),
(349, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 5.68, 4.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ki5epr03zNnv', '2024-05-14 23:41:01', '2024-05-14 23:41:01'),
(350, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.24, 6.26, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '45.249.9.124', 'UcM7rj6wNIaD', '2024-05-14 23:44:05', '2024-05-14 23:44:05'),
(351, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.88, 1755.28, 1757.16, 'inc', 'Done', 'Winning Challenge:  from test', '45.249.9.124', 'NtYWNdpjq5RN', '2024-05-14 23:44:05', '2024-05-14 23:44:05'),
(352, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 39.20, 39.30, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '45.249.9.124', '3unpqycTi8Uk', '2024-05-14 23:44:05', '2024-05-14 23:44:05'),
(353, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1757.16, 1756.16, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '3b9tXKxjDuAi', '2024-05-14 23:53:00', '2024-05-14 23:53:00'),
(354, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 4.68, 3.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'qy1BP42i1rkq', '2024-05-14 23:53:08', '2024-05-14 23:53:08'),
(355, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.26, 6.28, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'HkTJTQHm0Aiw', '2024-05-14 23:55:38', '2024-05-14 23:55:38'),
(356, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 3.68, 5.56, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'B1yg2BSmeQ1c', '2024-05-14 23:55:38', '2024-05-14 23:55:38'),
(357, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 39.30, 39.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'azCYzivCsL1h', '2024-05-14 23:55:38', '2024-05-14 23:55:38'),
(358, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.28, 6.30, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '45.249.9.124', 'hW2D5vG5dSo4', '2024-05-14 23:57:35', '2024-05-14 23:57:35'),
(359, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.88, 1756.16, 1758.04, 'inc', 'Done', 'Winning Challenge:  from test', '45.249.9.124', 'o5o8vs1lhbFv', '2024-05-14 23:57:35', '2024-05-14 23:57:35'),
(360, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 39.40, 39.50, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '45.249.9.124', 'RVKFe6f8Di7S', '2024-05-14 23:57:35', '2024-05-14 23:57:35'),
(361, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 5.56, 4.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'KCmnLawDg55N', '2024-05-15 00:02:23', '2024-05-15 00:02:23'),
(362, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1758.04, 1757.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'gj8SQasPBioi', '2024-05-15 00:02:50', '2024-05-15 00:02:50'),
(363, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.30, 6.32, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'aWLHjpIbrhwQ', '2024-05-15 00:05:27', '2024-05-15 00:05:27'),
(364, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 4.56, 6.44, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', '9j5xqnGga6Lj', '2024-05-15 00:05:27', '2024-05-15 00:05:27'),
(365, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 39.50, 39.60, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'E2KfAQVRhosc', '2024-05-15 00:05:27', '2024-05-15 00:05:27'),
(366, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 6.44, 5.44, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '2bGpniieSiwh', '2024-05-15 00:16:55', '2024-05-15 00:16:55'),
(367, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1757.04, 1756.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'whKaotVs12Cz', '2024-05-15 00:16:58', '2024-05-15 00:16:58'),
(368, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.32, 6.34, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'RMYYKZUgoVOD', '2024-05-15 00:21:25', '2024-05-15 00:21:25'),
(369, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 5.44, 7.32, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'jx8vnrgavY4x', '2024-05-15 00:21:25', '2024-05-15 00:21:25'),
(370, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 39.60, 39.70, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'IYFUf5z817Hw', '2024-05-15 00:21:25', '2024-05-15 00:21:25'),
(371, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1756.04, 1755.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Cb97CwDwDNPD', '2024-05-15 00:27:54', '2024-05-15 00:27:54'),
(372, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 7.32, 6.32, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'TtOXkFEOU5Fs', '2024-05-15 00:28:04', '2024-05-15 00:28:04'),
(373, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.34, 6.36, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'Mr0WD8HBTIG1', '2024-05-15 00:32:46', '2024-05-15 00:32:46'),
(374, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 6.32, 8.20, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'NKym1iYLT1KU', '2024-05-15 00:32:46', '2024-05-15 00:32:46'),
(375, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 39.70, 39.80, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'SAcCnoErpZNc', '2024-05-15 00:32:46', '2024-05-15 00:32:46'),
(376, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1755.04, 1754.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'M1MtGUD5jS8D', '2024-05-15 00:35:16', '2024-05-15 00:35:16'),
(377, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 8.20, 7.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'IcqXwejft2K7', '2024-05-15 00:35:22', '2024-05-15 00:35:22'),
(378, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.36, 6.38, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'yV2S5kggZNmL', '2024-05-15 00:40:07', '2024-05-15 00:40:07'),
(379, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 7.20, 9.08, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'nyzy0j2nM80i', '2024-05-15 00:40:07', '2024-05-15 00:40:07'),
(380, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 39.80, 39.90, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'CBf86F9ASvS6', '2024-05-15 00:40:07', '2024-05-15 00:40:07'),
(381, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1754.04, 1753.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'QPTOU7T0ncic', '2024-05-15 00:41:59', '2024-05-15 00:41:59'),
(382, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 9.08, 8.08, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'yqOs0wUQ0VZT', '2024-05-15 00:42:01', '2024-05-15 00:42:01'),
(383, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.38, 6.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'ea72NsgBxHvt', '2024-05-15 00:47:36', '2024-05-15 00:47:36'),
(384, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 8.08, 9.96, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'nOTsjUMfKyOj', '2024-05-15 00:47:36', '2024-05-15 00:47:36'),
(385, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 39.90, 40.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'aA24yiJEKY31', '2024-05-15 00:47:36', '2024-05-15 00:47:36'),
(386, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 9.96, 8.96, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'SYHnqkDvAyxQ', '2024-05-15 00:48:43', '2024-05-15 00:48:43'),
(387, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1753.04, 1752.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'FFNzINlvZ7vz', '2024-05-15 00:48:47', '2024-05-15 00:48:47'),
(388, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.40, 6.42, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', '0QB0gQSefCXG', '2024-05-15 00:51:11', '2024-05-15 00:51:11'),
(389, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 8.96, 10.84, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'SIQTwsTAwYbZ', '2024-05-15 00:51:11', '2024-05-15 00:51:11'),
(390, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 40.00, 40.10, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'pU8vtiRkoeph', '2024-05-15 00:51:11', '2024-05-15 00:51:11'),
(391, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 10.84, 9.84, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.138.63', 'eg0WqRmhTP0h', '2024-05-15 03:33:49', '2024-05-15 03:33:49'),
(392, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1752.04, 1751.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.39.158', 'ZvgKP40Htrl3', '2024-05-15 03:33:56', '2024-05-15 03:33:56'),
(393, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 9.84, 8.84, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.138.63', 'qjT7R1e2mfwr', '2024-05-15 03:34:37', '2024-05-15 03:34:37'),
(394, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 8.84, 7.84, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.138.63', '2k6TdQRKWiQW', '2024-05-15 03:34:38', '2024-05-15 03:34:38'),
(395, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 7.84, 6.84, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.138.63', 'q4Y1vHPoHNmk', '2024-05-15 03:34:57', '2024-05-15 03:34:57'),
(396, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1751.04, 1750.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.39.158', 'jyrXb8rMKWAX', '2024-05-15 03:35:06', '2024-05-15 03:35:06'),
(397, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1750.04, 1749.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'X0U2sTRGIK47', '2024-05-15 04:07:27', '2024-05-15 04:07:27'),
(398, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1749.04, 1748.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'DX28XfypMleW', '2024-05-15 04:09:29', '2024-05-15 04:09:29'),
(399, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 6.84, 5.84, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'TUZiDdKfL2Se', '2024-05-15 04:10:22', '2024-05-15 04:10:22'),
(400, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.42, 6.44, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'j74o7s6VUiqp', '2024-05-15 04:12:59', '2024-05-15 04:12:59'),
(401, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 5.84, 7.72, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'hbYN78kw5F4e', '2024-05-15 04:12:59', '2024-05-15 04:12:59'),
(402, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 40.10, 40.20, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'VYzzyeEjOGmb', '2024-05-15 04:12:59', '2024-05-15 04:12:59'),
(403, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1748.04, 1747.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'OwXAiu779hxj', '2024-05-15 04:22:55', '2024-05-15 04:22:55'),
(404, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 7.72, 6.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '5D2FSScoloWO', '2024-05-15 04:23:10', '2024-05-15 04:23:10'),
(405, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1747.04, 1746.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'KXtCUp5l2wBW', '2024-05-15 04:23:29', '2024-05-15 04:23:29'),
(406, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 6.72, 5.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'qziUd15r7DGm', '2024-05-15 04:31:51', '2024-05-15 04:31:51'),
(407, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 5.72, 4.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'yv6YMq8mNJ80', '2024-05-15 04:32:14', '2024-05-15 04:32:14'),
(408, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1746.04, 1745.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'O0dtLxrrQmXF', '2024-05-15 04:32:22', '2024-05-15 04:32:22'),
(409, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1745.04, 1744.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'wM5GwG4cuTbo', '2024-05-15 05:26:16', '2024-05-15 05:26:16'),
(410, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 4.72, 3.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'KRqWIJxy3S6q', '2024-05-15 05:26:16', '2024-05-15 05:26:16'),
(411, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 3.72, 2.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '8rH1sV5ogpUM', '2024-05-15 05:27:34', '2024-05-15 05:27:34'),
(412, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1744.04, 1743.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'LuOrZfpTgbhT', '2024-05-15 05:27:35', '2024-05-15 05:27:35'),
(413, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1743.04, 1742.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'uVbHYrEpsW9p', '2024-05-15 05:29:34', '2024-05-15 05:29:34'),
(414, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 2.72, 1.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Y5mzjkUpASkv', '2024-05-15 05:29:39', '2024-05-15 05:29:39'),
(415, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 21.20, 11.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'U69qYlmcGUQj', '2024-05-15 05:41:34', '2024-05-15 05:41:34'),
(416, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1742.04, 1732.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'KAYxI1QqmgOF', '2024-05-15 05:41:39', '2024-05-15 05:41:39'),
(417, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 11.20, 1.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'VHjCnQZg99yH', '2024-05-15 05:46:37', '2024-05-15 05:46:37'),
(418, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1732.04, 1722.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'yeMakZSp3PdN', '2024-05-15 05:46:38', '2024-05-15 05:46:38'),
(419, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 1.20, 0.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'DGlvxYX24Jfw', '2024-05-15 05:48:33', '2024-05-15 05:48:33'),
(420, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1722.04, 1712.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'bPxVDa2tOdIg', '2024-05-15 05:48:36', '2024-05-15 05:48:36'),
(421, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.44, 6.46, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'N45ksxywyAr0', '2024-05-15 05:51:03', '2024-05-15 05:51:03'),
(422, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 1.72, 3.60, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'nfBICXAAx4Y0', '2024-05-15 05:51:03', '2024-05-15 05:51:03'),
(423, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 40.20, 40.30, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'uzALI0dCcrF1', '2024-05-15 05:51:03', '2024-05-15 05:51:03'),
(424, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.46, 6.48, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'Nx0dIMg1yWNQ', '2024-05-15 05:51:27', '2024-05-15 05:51:27'),
(425, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 3.60, 5.48, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', '7ArFEZIlpUix', '2024-05-15 05:51:27', '2024-05-15 05:51:27'),
(426, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 40.30, 40.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', '1h9iAGfQhJLV', '2024-05-15 05:51:27', '2024-05-15 05:51:27'),
(427, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 5.48, 4.48, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'yuBv7XWkYegT', '2024-05-15 05:52:38', '2024-05-15 05:52:38'),
(428, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1712.04, 1711.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'UJ78Cs4r4uzi', '2024-05-15 05:52:40', '2024-05-15 05:52:40'),
(429, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 4.48, 3.48, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'cmeLJmS7ZtX4', '2024-05-15 05:54:27', '2024-05-15 05:54:27'),
(430, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1711.04, 1710.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'AeBvRsl1D7Bz', '2024-05-15 05:54:30', '2024-05-15 05:54:30'),
(431, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 3.48, 2.48, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'OkYdt7aY76Sf', '2024-05-15 05:54:51', '2024-05-15 05:54:51'),
(432, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1710.04, 1709.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'bjuatGJSoh85', '2024-05-15 05:57:50', '2024-05-15 05:57:50'),
(433, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 2.48, 1.48, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'mMsNOqmBVdYj', '2024-05-15 05:58:01', '2024-05-15 05:58:01'),
(434, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1709.04, 1708.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.36.158', 'AyYrPp2uwQEn', '2024-05-15 06:29:36', '2024-05-15 06:29:36'),
(435, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1708.04, 1707.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.36.158', 'nAp09c45ugyh', '2024-05-15 06:36:52', '2024-05-15 06:36:52'),
(436, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1707.04, 1706.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'vPsy0NQbD5S9', '2024-05-15 07:53:54', '2024-05-15 07:53:54'),
(437, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 1.48, 0.48, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'RcNjxb7DmOQU', '2024-05-15 07:53:56', '2024-05-15 07:53:56'),
(438, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.48, 6.50, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'Je7ZhQN02iQ7', '2024-05-15 07:55:56', '2024-05-15 07:55:56'),
(439, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 0.48, 2.36, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'CDUbrj6Y3bwS', '2024-05-15 07:55:56', '2024-05-15 07:55:56'),
(440, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 40.40, 40.50, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', '940Cj1LtXdfV', '2024-05-15 07:55:56', '2024-05-15 07:55:56'),
(441, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1706.04, 1705.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'NdoXy0hU4iws', '2024-05-15 07:56:19', '2024-05-15 07:56:19');
INSERT INTO `wallets_logs` (`id`, `loggable_type`, `loggable_id`, `wallet_name`, `value`, `from`, `to`, `type`, `status`, `notes`, `ip`, `reference`, `created_at`, `updated_at`) VALUES
(442, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 2.36, 1.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '5Ii0BYybhveV', '2024-05-15 07:56:21', '2024-05-15 07:56:21'),
(443, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.50, 6.52, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'XzyO8lx4ht4Z', '2024-05-15 07:57:54', '2024-05-15 07:57:54'),
(444, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 1.36, 3.24, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'de9pRzZLPKv5', '2024-05-15 07:57:54', '2024-05-15 07:57:54'),
(445, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 40.50, 40.60, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'zH25JhaJDcdy', '2024-05-15 07:57:54', '2024-05-15 07:57:54'),
(446, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1705.04, 1704.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '462D2Ed1oNHr', '2024-05-15 07:58:22', '2024-05-15 07:58:22'),
(447, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 3.24, 2.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '8wdAztRU74e1', '2024-05-15 07:58:23', '2024-05-15 07:58:23'),
(448, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1704.04, 1703.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'pwxToYUY0DgN', '2024-05-15 07:59:07', '2024-05-15 07:59:07'),
(449, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1703.04, 1702.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'H95kplbhFQvC', '2024-05-15 07:59:25', '2024-05-15 07:59:25'),
(450, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 2.24, 1.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'X1Npgf0hsP1S', '2024-05-15 07:59:31', '2024-05-15 07:59:31'),
(451, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.52, 6.54, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'Wff1vpWPV6yU', '2024-05-15 08:01:52', '2024-05-15 08:01:52'),
(452, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 1.24, 3.12, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'pZ9NL9KHOVgq', '2024-05-15 08:01:52', '2024-05-15 08:01:52'),
(453, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 40.60, 40.70, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', '0BRTJgEI8Hon', '2024-05-15 08:01:52', '2024-05-15 08:01:52'),
(454, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 3.12, 2.12, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'fzgdc7KXg7j2', '2024-05-15 12:32:57', '2024-05-15 12:32:57'),
(455, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1702.04, 1701.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'JUb11twbeQqy', '2024-05-15 12:33:02', '2024-05-15 12:33:02'),
(456, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.54, 6.56, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'JzYljBv1ZxWy', '2024-05-15 12:35:51', '2024-05-15 12:35:51'),
(457, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 2.12, 4.00, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', 'Iu1lhKpVt3sB', '2024-05-15 12:35:51', '2024-05-15 12:35:51'),
(458, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 40.70, 40.80, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'ROJo8vDhxDca', '2024-05-15 12:35:51', '2024-05-15 12:35:51'),
(459, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 4.00, 3.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', '5cCsNNGJkjGD', '2024-05-15 12:36:21', '2024-05-15 12:36:21'),
(460, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1701.04, 1700.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'NsIgtFz6Eacg', '2024-05-15 12:36:22', '2024-05-15 12:36:22'),
(461, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1700.04, 1699.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'QYieSfuOK36D', '2024-05-15 12:37:10', '2024-05-15 12:37:10'),
(462, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 3.00, 2.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'X7ghBbdC9TRZ', '2024-05-15 12:37:22', '2024-05-15 12:37:22'),
(463, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1699.04, 1698.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'y8VejNYBjyyz', '2024-05-15 12:38:11', '2024-05-15 12:38:11'),
(464, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 2.00, 1.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'nfSAIrFlAKyj', '2024-05-15 12:38:18', '2024-05-15 12:38:18'),
(465, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1698.04, 1697.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'dq5bO93JLEks', '2024-05-15 12:41:03', '2024-05-15 12:41:03'),
(466, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 1.00, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'jrr3V6h0IfQK', '2024-05-15 12:41:05', '2024-05-15 12:41:05'),
(467, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.56, 6.58, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', '4k3fAcKBg9T4', '2024-05-15 12:42:20', '2024-05-15 12:42:20'),
(468, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 0.00, 1.88, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', 'lTvVYCrLU8Zj', '2024-05-15 12:42:20', '2024-05-15 12:42:20'),
(469, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 40.80, 40.90, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', '5LsnmpVb70im', '2024-05-15 12:42:20', '2024-05-15 12:42:20'),
(470, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.58, 6.60, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'OtLBcO5xgtx1', '2024-05-15 12:43:04', '2024-05-15 12:43:04'),
(471, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 1.88, 3.76, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', 'es4VPwEHbifG', '2024-05-15 12:43:04', '2024-05-15 12:43:04'),
(472, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 40.90, 41.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'We1unaBjWCeW', '2024-05-15 12:43:04', '2024-05-15 12:43:04'),
(473, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.60, 6.62, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'ftjglQRXeGU6', '2024-05-15 12:44:05', '2024-05-15 12:44:05'),
(474, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 3.76, 5.64, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', 'B5lkhLK4yh1c', '2024-05-15 12:44:05', '2024-05-15 12:44:05'),
(475, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 41.00, 41.10, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'j9hmwagIsRfM', '2024-05-15 12:44:05', '2024-05-15 12:44:05'),
(476, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.62, 6.64, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'x2CK2i7m3fdZ', '2024-05-15 12:45:31', '2024-05-15 12:45:31'),
(477, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 5.64, 7.52, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', 'oHdibAZSjpbj', '2024-05-15 12:45:31', '2024-05-15 12:45:31'),
(478, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 41.10, 41.20, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'NyAs1VH7dPlQ', '2024-05-15 12:45:31', '2024-05-15 12:45:31'),
(479, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.64, 6.66, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'g3n62CtP6SFz', '2024-05-15 12:46:32', '2024-05-15 12:46:32'),
(480, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 7.52, 9.40, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', 'HqJS1CwMle7s', '2024-05-15 12:46:32', '2024-05-15 12:46:32'),
(481, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 41.20, 41.30, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'jm8D4e5VMRTB', '2024-05-15 12:46:32', '2024-05-15 12:46:32'),
(482, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1697.04, 1696.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 'AyM3ySRRLWnc', '2024-05-15 12:48:01', '2024-05-15 12:48:01'),
(483, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 9.40, 8.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '103.117.160.9', 's5zraWKzpKOz', '2024-05-15 12:48:42', '2024-05-15 12:48:42'),
(484, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.66, 6.68, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'dZHKYFexC3bX', '2024-05-15 12:50:51', '2024-05-15 12:50:51'),
(485, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 8.40, 10.28, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', 'uTqXSBecnDw9', '2024-05-15 12:50:51', '2024-05-15 12:50:51'),
(486, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 41.30, 41.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'Mul3nBLAuwHb', '2024-05-15 12:50:51', '2024-05-15 12:50:51'),
(487, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1696.04, 1686.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '103.117.160.9', '1CG6fFiD7dxl', '2024-05-15 12:51:44', '2024-05-15 12:51:44'),
(488, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 10.28, 0.28, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '103.117.160.9', 'kafQ9EkiIwCR', '2024-05-15 12:51:48', '2024-05-15 12:51:48'),
(489, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.00, 0.20, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'adnAtScu0MPg', '2024-05-15 12:52:47', '2024-05-15 12:52:47'),
(490, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 18.80, 0.28, 19.08, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', 'WHnUFhOJWB7i', '2024-05-15 12:52:47', '2024-05-15 12:52:47'),
(491, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 41.40, 42.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', '5yVKkI7GEOX5', '2024-05-15 12:52:47', '2024-05-15 12:52:47'),
(492, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1686.04, 1676.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '103.117.160.9', '6sAZb60rOsQL', '2024-05-15 12:53:21', '2024-05-15 12:53:21'),
(493, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 19.08, 9.08, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '103.117.160.9', '4Ui3DU5GwU1H', '2024-05-15 12:53:31', '2024-05-15 12:53:31'),
(494, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.20, 0.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'HTs6ExiEKcb7', '2024-05-15 12:54:28', '2024-05-15 12:54:28'),
(495, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 18.80, 9.08, 27.88, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', 'jKebIjlJ9Pvn', '2024-05-15 12:54:28', '2024-05-15 12:54:28'),
(496, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 42.40, 43.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', '1E65UtnuAdLe', '2024-05-15 12:54:28', '2024-05-15 12:54:28'),
(497, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1676.04, 1666.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '103.117.160.9', 'durCPbgQdOJa', '2024-05-15 12:55:08', '2024-05-15 12:55:08'),
(498, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 27.88, 17.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '103.117.160.9', 'waGhKnPgQqC5', '2024-05-15 12:55:10', '2024-05-15 12:55:10'),
(499, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.40, 0.60, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'qyPPJ4qCuFy1', '2024-05-15 12:55:58', '2024-05-15 12:55:58'),
(500, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 18.80, 17.88, 36.68, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', 'b3RQPX9R24Qw', '2024-05-15 12:55:58', '2024-05-15 12:55:58'),
(501, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 43.40, 44.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'Em4EwLU4BT6r', '2024-05-15 12:55:58', '2024-05-15 12:55:58'),
(502, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 20.00, 1666.04, 1646.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 4', '103.117.160.9', 'B8AvzBK6htz8', '2024-05-15 12:56:55', '2024-05-15 12:56:55'),
(503, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 20.00, 36.68, 16.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 4', '103.117.160.9', '0Y3Z7AUeDQjx', '2024-05-15 12:57:03', '2024-05-15 12:57:03'),
(504, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.40, 0.60, 1.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'FEuyAczdaGZq', '2024-05-15 12:57:49', '2024-05-15 12:57:49'),
(505, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 37.60, 16.68, 54.28, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', 'SfE3n4mFZFAC', '2024-05-15 12:57:49', '2024-05-15 12:57:49'),
(506, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.00, 44.40, 46.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', '1Is2QDiobwRK', '2024-05-15 12:57:49', '2024-05-15 12:57:49'),
(507, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 20.00, 1646.04, 1626.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 4', '103.117.160.9', 'hF9JMN7UwRUu', '2024-05-15 12:58:05', '2024-05-15 12:58:05'),
(508, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 20.00, 54.28, 34.28, 'dec', 'Done', 'Paying Price of Starting Challenge: 4', '103.117.160.9', 'LjHk2VRX9odb', '2024-05-15 12:58:10', '2024-05-15 12:58:10'),
(509, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.40, 1.00, 1.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'WTQnEXduJ4B7', '2024-05-15 13:01:53', '2024-05-15 13:01:53'),
(510, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 37.60, 34.28, 71.88, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', 'rKBh330ZoV3Q', '2024-05-15 13:01:53', '2024-05-15 13:01:53'),
(511, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.00, 46.40, 48.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', '5Oqq5OiMMiZw', '2024-05-15 13:01:53', '2024-05-15 13:01:53'),
(512, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 20.00, 1626.04, 1606.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 4', '103.117.160.9', 'aMvzRi43Ds8d', '2024-05-15 13:02:17', '2024-05-15 13:02:17'),
(513, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 20.00, 71.88, 51.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 4', '103.117.160.9', 'ehVzUQsNDqcd', '2024-05-15 13:02:33', '2024-05-15 13:02:33'),
(514, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.40, 1.40, 1.80, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', '8bojthWwQw9C', '2024-05-15 13:04:08', '2024-05-15 13:04:08'),
(515, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 37.60, 51.88, 89.48, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', '6hwO4ImnwGuH', '2024-05-15 13:04:08', '2024-05-15 13:04:08'),
(516, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.00, 48.40, 50.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'BPy3zbmywNdc', '2024-05-15 13:04:08', '2024-05-15 13:04:08'),
(517, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 20.00, 1606.04, 1586.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 4', '103.117.160.9', 'j9lkCQ00RAW1', '2024-05-15 13:04:32', '2024-05-15 13:04:32'),
(518, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 20.00, 89.48, 69.48, 'dec', 'Done', 'Paying Price of Starting Challenge: 4', '103.117.160.9', 'wRtvEvrxK1uV', '2024-05-15 13:04:42', '2024-05-15 13:04:42'),
(519, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.40, 1.80, 2.20, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 'UMnwgTxW2zCH', '2024-05-15 13:05:44', '2024-05-15 13:05:44'),
(520, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 37.60, 69.48, 107.08, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '103.117.160.9', 'xTeUATrzMvFF', '2024-05-15 13:05:44', '2024-05-15 13:05:44'),
(521, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.00, 50.40, 52.40, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '103.117.160.9', 's9tJHRerZ0op', '2024-05-15 13:05:44', '2024-05-15 13:05:44'),
(522, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 107.08, 106.08, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'JkmXZCrBkcCD', '2024-05-16 01:03:09', '2024-05-16 01:03:09'),
(523, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1586.04, 1585.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'jJBI7JS2D6Lp', '2024-05-16 01:03:10', '2024-05-16 01:03:10'),
(524, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.68, 6.70, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'Z5TT51k4UuFz', '2024-05-16 01:07:24', '2024-05-16 01:07:24'),
(525, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 106.08, 107.96, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'MT1uMNF9ydiq', '2024-05-16 01:07:24', '2024-05-16 01:07:24'),
(526, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 52.40, 52.50, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'D8tEgO8TQ1o3', '2024-05-16 01:07:24', '2024-05-16 01:07:24'),
(527, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 107.96, 106.96, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'PyvbrlWlT9KY', '2024-05-16 01:26:54', '2024-05-16 01:26:54'),
(528, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1585.04, 1584.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'NfywMOcoLz1O', '2024-05-16 01:29:20', '2024-05-16 01:29:20'),
(529, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 106.96, 105.96, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'IvcOWX1zoT8n', '2024-05-16 01:29:31', '2024-05-16 01:29:31'),
(530, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.70, 6.72, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'NBocsdtAHVlq', '2024-05-16 01:32:32', '2024-05-16 01:32:32'),
(531, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 105.96, 107.84, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', '9OWPOWOzbRc4', '2024-05-16 01:32:32', '2024-05-16 01:32:32'),
(532, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 52.50, 52.60, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'tWfAIAohRRCb', '2024-05-16 01:32:32', '2024-05-16 01:32:32'),
(533, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 107.84, 106.84, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '1AMDRv3XJ3zD', '2024-05-16 01:36:36', '2024-05-16 01:36:36'),
(534, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1584.04, 1583.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '6LxdwIlCu7LG', '2024-05-16 01:36:37', '2024-05-16 01:36:37'),
(535, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1583.04, 1582.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '4H4uvdjwfGiC', '2024-05-16 01:37:33', '2024-05-16 01:37:33'),
(536, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 106.84, 105.84, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'svJEPuLTUiji', '2024-05-16 01:39:03', '2024-05-16 01:39:03'),
(537, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.72, 6.74, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'SIZvIPY5QcDK', '2024-05-16 01:41:35', '2024-05-16 01:41:35'),
(538, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 105.84, 107.72, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', '0IRr5ETnG1K1', '2024-05-16 01:41:35', '2024-05-16 01:41:35'),
(539, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 52.60, 52.70, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'rrBrtq6kR5Z6', '2024-05-16 01:41:35', '2024-05-16 01:41:35'),
(540, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1582.04, 1581.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'aSZ59DIySAni', '2024-05-16 02:21:52', '2024-05-16 02:21:52'),
(541, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 107.72, 106.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ZDvgTygzPvMu', '2024-05-16 02:21:58', '2024-05-16 02:21:58'),
(542, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1581.04, 1580.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'DcFRzhT8Eivp', '2024-05-16 02:22:54', '2024-05-16 02:22:54'),
(543, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 106.72, 105.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'KAZE46vdGINv', '2024-05-16 02:22:55', '2024-05-16 02:22:55'),
(544, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1580.04, 1579.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'wabCx9DdzG9e', '2024-05-16 02:23:21', '2024-05-16 02:23:21'),
(545, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 105.72, 104.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '5JQqGf491Quz', '2024-05-16 02:23:24', '2024-05-16 02:23:24'),
(546, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1579.04, 1578.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'I6nVExkvgsrE', '2024-05-16 02:24:14', '2024-05-16 02:24:14'),
(547, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 104.72, 103.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'mJoYc3Bwa5TW', '2024-05-16 02:24:15', '2024-05-16 02:24:15'),
(548, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 103.72, 102.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'nRtDMVCN1A5m', '2024-05-16 02:25:45', '2024-05-16 02:25:45'),
(549, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1578.04, 1577.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'hL1lxZxAX2dG', '2024-05-16 02:25:45', '2024-05-16 02:25:45'),
(550, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1577.04, 1576.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'OVBtofxh52sA', '2024-05-16 02:26:12', '2024-05-16 02:26:12'),
(551, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 102.72, 101.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'YQNWRYQC6Ajv', '2024-05-16 02:26:14', '2024-05-16 02:26:14'),
(552, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 101.72, 100.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '6WBFAhKHxcc3', '2024-05-16 02:28:12', '2024-05-16 02:28:12'),
(553, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1576.04, 1575.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'x4p7nnoJmkT6', '2024-05-16 02:28:14', '2024-05-16 02:28:14'),
(554, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1575.04, 1574.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'zWPytiSH7aaJ', '2024-05-16 02:28:31', '2024-05-16 02:28:31'),
(555, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 100.72, 99.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'TSN1mkb3Oo6X', '2024-05-16 02:28:56', '2024-05-16 02:28:56'),
(556, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 99.72, 98.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '8NZNqNahWccz', '2024-05-16 02:30:03', '2024-05-16 02:30:03'),
(557, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 98.72, 97.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'POt9bynRBboN', '2024-05-16 02:31:01', '2024-05-16 02:31:01'),
(558, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 97.72, 96.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'KclVo2wxEva6', '2024-05-16 02:34:09', '2024-05-16 02:34:09'),
(559, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1574.04, 1573.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'IApVWOXvVkf0', '2024-05-16 02:34:16', '2024-05-16 02:34:16'),
(560, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1573.04, 1572.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '9t30uxH9XEvo', '2024-05-16 02:35:42', '2024-05-16 02:35:42'),
(561, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 96.72, 95.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'B5bdPoSwLLum', '2024-05-16 02:35:51', '2024-05-16 02:35:51'),
(562, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1572.04, 1571.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '0X7vazyhw0nH', '2024-05-16 02:38:54', '2024-05-16 02:38:54'),
(563, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 95.72, 94.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '5vd7CYHkGwv7', '2024-05-16 02:38:58', '2024-05-16 02:38:58'),
(564, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1571.04, 1570.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '5pJByKhreDQr', '2024-05-16 02:40:42', '2024-05-16 02:40:42'),
(565, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 94.72, 93.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'SS9Ljn22LHdd', '2024-05-16 02:40:42', '2024-05-16 02:40:42'),
(566, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1570.04, 1569.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'xuUxAnX0yE0X', '2024-05-16 02:44:40', '2024-05-16 02:44:40'),
(567, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 93.72, 92.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'frzr9wRNF7hs', '2024-05-16 02:44:43', '2024-05-16 02:44:43'),
(568, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1569.04, 1568.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'a45HfSzWAYHB', '2024-05-16 02:55:20', '2024-05-16 02:55:20'),
(569, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 92.72, 91.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'TLwgAOfKabkT', '2024-05-16 02:56:58', '2024-05-16 02:56:58'),
(570, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1568.04, 1567.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'hNO7dHiKm0MX', '2024-05-16 04:32:36', '2024-05-16 04:32:36'),
(571, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 91.72, 90.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'nyhvIz0IcMBR', '2024-05-16 04:32:43', '2024-05-16 04:32:43'),
(572, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 90.72, 89.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Ptt64pPX9nEK', '2024-05-16 04:37:31', '2024-05-16 04:37:31'),
(573, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1567.04, 1566.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'EUTwinMMNmly', '2024-05-16 04:37:33', '2024-05-16 04:37:33'),
(574, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 20, 'wallet_2', 0.02, 0.00, 0.02, 'inc', 'Done', 'Challenge: Attempt By: mohsin …, Mohsin Tariq', '45.249.9.124', 'gPGn7BtGUbQX', '2024-05-16 04:57:22', '2024-05-16 04:57:22'),
(575, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.88, 0.20, 2.08, 'inc', 'Done', 'Winning Challenge:  from mohsin …', '45.249.9.124', '63WKUCBQEPaa', '2024-05-16 04:57:22', '2024-05-16 04:57:22'),
(576, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 52.70, 52.80, 'inc', 'Done', 'Challenge: Attempt By: mohsin …, Mohsin Tariq', '45.249.9.124', 'GSiWt5VHxwtY', '2024-05-16 04:57:22', '2024-05-16 04:57:22'),
(577, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1566.04, 1565.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Esj3Kk0K5jDf', '2024-05-16 05:06:03', '2024-05-16 05:06:03'),
(578, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 89.72, 88.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'VgdGxqKOkUSV', '2024-05-16 05:06:17', '2024-05-16 05:06:17'),
(579, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1565.04, 1564.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'W8xlWOkj9XnQ', '2024-05-16 05:14:45', '2024-05-16 05:14:45'),
(580, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 88.72, 87.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'kR4jp4FANWrF', '2024-05-16 05:14:45', '2024-05-16 05:14:45'),
(581, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 87.72, 86.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'pUdh4LMfs8AK', '2024-05-16 05:23:24', '2024-05-16 05:23:24'),
(582, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1564.04, 1563.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'XhjpfNhyVDrI', '2024-05-16 05:23:29', '2024-05-16 05:23:29'),
(583, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1563.04, 1562.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'XPZnZIJKCmo7', '2024-05-16 05:24:07', '2024-05-16 05:24:07'),
(584, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 86.72, 85.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'EIlz5WQ1QmAk', '2024-05-16 05:24:10', '2024-05-16 05:24:10'),
(585, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1562.04, 1561.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Iu4q3uxTO9AQ', '2024-05-16 05:30:07', '2024-05-16 05:30:07'),
(586, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 85.72, 84.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '6VukInOy67TO', '2024-05-16 05:30:07', '2024-05-16 05:30:07'),
(587, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1561.04, 1560.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'pjqYOJ6CHhC5', '2024-05-16 05:30:30', '2024-05-16 05:30:30'),
(588, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1560.04, 1559.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'RTKUxeR22k0Q', '2024-05-16 05:32:32', '2024-05-16 05:32:32'),
(589, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 84.72, 83.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '1WORfnWKeZoo', '2024-05-16 05:32:44', '2024-05-16 05:32:44'),
(590, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 83.72, 82.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'DMREE41Y7o7G', '2024-05-16 05:35:10', '2024-05-16 05:35:10'),
(591, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1559.04, 1558.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '1w0LIcJoZApQ', '2024-05-16 05:35:28', '2024-05-16 05:35:28'),
(592, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1558.04, 1557.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'xI2ku4MrfqUH', '2024-05-16 05:36:09', '2024-05-16 05:36:09'),
(593, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 82.72, 81.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'VH3uMLbIjqTk', '2024-05-16 05:36:09', '2024-05-16 05:36:09'),
(594, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 81.72, 80.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'uGzCxQabaqC9', '2024-05-16 05:37:10', '2024-05-16 05:37:10'),
(595, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1557.04, 1556.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '5hCkq53Fstwl', '2024-05-16 05:37:12', '2024-05-16 05:37:12'),
(596, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 80.72, 79.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'KgX8GEiqxwG2', '2024-05-16 05:38:00', '2024-05-16 05:38:00'),
(597, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1556.04, 1555.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'FGZMobNC6dUe', '2024-05-16 05:38:01', '2024-05-16 05:38:01'),
(598, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1555.04, 1554.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'hbwRLv5VFYdZ', '2024-05-16 05:38:50', '2024-05-16 05:38:50'),
(599, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1554.04, 1553.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'HIjlaOIoWBLD', '2024-05-16 05:39:31', '2024-05-16 05:39:31'),
(600, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 79.72, 78.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '0PIN28wC7Wr1', '2024-05-16 05:39:31', '2024-05-16 05:39:31'),
(601, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1553.04, 1552.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'lWytVKF7CZ3c', '2024-05-16 05:43:10', '2024-05-16 05:43:10'),
(602, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 78.72, 77.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'lC4QfrH3L8t7', '2024-05-16 05:43:19', '2024-05-16 05:43:19'),
(603, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1552.04, 1551.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'nC3x0KPqJlxF', '2024-05-16 05:43:56', '2024-05-16 05:43:56'),
(604, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 77.72, 76.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Zw8JJpKIfTyW', '2024-05-16 05:43:57', '2024-05-16 05:43:57'),
(605, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 76.72, 75.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'MXQBzah1hpuM', '2024-05-16 05:47:02', '2024-05-16 05:47:02'),
(606, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 20.00, 1551.04, 1531.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 4', '45.249.9.124', 'uyqIn1ZpTXmn', '2024-05-16 06:25:05', '2024-05-16 06:25:05'),
(607, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1531.04, 1530.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '1SGMWQjlsB5Q', '2024-05-16 06:27:38', '2024-05-16 06:27:38'),
(608, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1530.04, 1529.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'EJGxa4oNZm3g', '2024-05-16 06:29:39', '2024-05-16 06:29:39'),
(609, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1529.04, 1528.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'F9qjpjGHTEAL', '2024-05-16 06:32:47', '2024-05-16 06:32:47'),
(610, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1528.04, 1527.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'WYVqNnfQ5k9M', '2024-05-16 06:38:52', '2024-05-16 06:38:52'),
(611, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1527.04, 1528.04, 'inc', 'Done', NULL, '45.249.9.124', 'fAXUdWuGLdCZ', '2024-05-16 06:39:04', '2024-05-16 06:39:04'),
(612, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1528.04, 1527.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 't7sQy0IalrSC', '2024-05-16 06:39:26', '2024-05-16 06:39:26'),
(613, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1527.04, 1528.04, 'inc', 'Done', NULL, '45.249.9.124', 'qXX72FbDQckd', '2024-05-16 06:40:29', '2024-05-16 06:40:29'),
(614, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1528.04, 1527.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'tChUybjDuTNP', '2024-05-16 06:40:40', '2024-05-16 06:40:40'),
(615, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 75.72, 74.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '0C7ANc8fFWq7', '2024-05-16 06:41:06', '2024-05-16 06:41:06'),
(616, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1527.04, 1528.04, 'inc', 'Done', NULL, '45.249.9.124', 'W9iNZacMXX65', '2024-05-16 06:41:15', '2024-05-16 06:41:15'),
(617, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1528.04, 1527.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'SdPlo46jYeau', '2024-05-16 06:41:42', '2024-05-16 06:41:42'),
(618, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 74.72, 73.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'xMCIeGulPFhV', '2024-05-16 06:41:58', '2024-05-16 06:41:58'),
(619, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1527.04, 1526.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'liy0xzOvmGkK', '2024-05-16 06:53:17', '2024-05-16 06:53:17'),
(620, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1526.04, 1525.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '5cvTV5SoECbT', '2024-05-16 06:55:06', '2024-05-16 06:55:06'),
(621, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 73.72, 72.72, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '02wIqfTvSo0S', '2024-05-16 06:55:19', '2024-05-16 06:55:19'),
(622, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1525.04, 1524.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'NmLZ5zySvQk1', '2024-05-16 06:57:36', '2024-05-16 06:57:36'),
(623, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1524.04, 1525.04, 'inc', 'Done', NULL, '45.249.9.124', 'fO1HsUw5clMM', '2024-05-16 06:57:49', '2024-05-16 06:57:49'),
(624, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1525.04, 1524.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'YuQJDPPU36hs', '2024-05-16 06:57:54', '2024-05-16 06:57:54'),
(625, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1524.04, 1525.04, 'inc', 'Done', NULL, '45.249.9.124', 'M4ahKqc1pZJG', '2024-05-16 06:58:04', '2024-05-16 06:58:04'),
(626, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1525.04, 1524.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ChiDTuliFr6Q', '2024-05-16 06:58:23', '2024-05-16 06:58:23'),
(627, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1524.04, 1525.04, 'inc', 'Done', NULL, '45.249.9.124', 'YGTxhTvKKYKc', '2024-05-16 07:00:23', '2024-05-16 07:00:23'),
(628, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1525.04, 1524.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'wy4n6wA9nGZ9', '2024-05-16 07:17:39', '2024-05-16 07:17:39'),
(629, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1524.04, 1525.04, 'inc', 'Done', NULL, '45.249.9.124', 'YADckA1QoP8r', '2024-05-16 07:18:45', '2024-05-16 07:18:45'),
(630, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.74, 6.76, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'iFq34sF9UZna', '2024-05-16 07:23:12', '2024-05-16 07:23:12'),
(631, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 72.72, 74.60, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'x1IllzAGCTWF', '2024-05-16 07:23:12', '2024-05-16 07:23:12'),
(632, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 52.80, 52.90, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', '6WvXCXUDP1RL', '2024-05-16 07:23:12', '2024-05-16 07:23:12'),
(633, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.76, 6.78, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '45.249.9.124', '6UG9GNvWuXWS', '2024-05-16 07:38:00', '2024-05-16 07:38:00'),
(634, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.88, 1525.04, 1526.92, 'inc', 'Done', 'Winning Challenge:  from test', '45.249.9.124', '49P58NxvCN35', '2024-05-16 07:38:00', '2024-05-16 07:38:00'),
(635, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 52.90, 53.00, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '45.249.9.124', 'lBGu85TprQM9', '2024-05-16 07:38:00', '2024-05-16 07:38:00'),
(636, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.78, 6.80, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'adOqt87Lixmu', '2024-05-16 07:38:33', '2024-05-16 07:38:33'),
(637, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 74.60, 76.48, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'He92h4AA86H3', '2024-05-16 07:38:33', '2024-05-16 07:38:33'),
(638, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 53.00, 53.10, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'RYw9Hsyopd3L', '2024-05-16 07:38:33', '2024-05-16 07:38:33'),
(639, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.80, 6.82, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '45.249.9.124', 'ZsZGZHIHqIEC', '2024-05-16 07:39:25', '2024-05-16 07:39:25'),
(640, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.88, 1526.92, 1528.80, 'inc', 'Done', 'Winning Challenge:  from test', '45.249.9.124', 'vncc0NJpL9CP', '2024-05-16 07:39:25', '2024-05-16 07:39:25'),
(641, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 53.10, 53.20, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '45.249.9.124', '4g2Low2pzVza', '2024-05-16 07:39:25', '2024-05-16 07:39:25'),
(642, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.82, 6.84, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'kwhcRqvSCy3Y', '2024-05-16 07:39:56', '2024-05-16 07:39:56'),
(643, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 76.48, 78.36, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'jjAnfR04idai', '2024-05-16 07:39:56', '2024-05-16 07:39:56'),
(644, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 53.20, 53.30, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'KIB77osWtoSy', '2024-05-16 07:39:56', '2024-05-16 07:39:56'),
(645, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1528.80, 1527.80, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'uMaPlb4cPy1U', '2024-05-16 07:41:40', '2024-05-16 07:41:40'),
(646, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 78.36, 77.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'GKEKrDS49Kao', '2024-05-16 07:42:00', '2024-05-16 07:42:00'),
(647, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.84, 6.86, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '45.249.9.124', 'g2cxP1OpisMF', '2024-05-16 07:44:09', '2024-05-16 07:44:09'),
(648, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.88, 1527.80, 1529.68, 'inc', 'Done', 'Winning Challenge:  from test', '45.249.9.124', 'jvKRsUiIn6rt', '2024-05-16 07:44:09', '2024-05-16 07:44:09'),
(649, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 53.30, 53.40, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '45.249.9.124', 'mA9IuTfSSWuh', '2024-05-16 07:44:09', '2024-05-16 07:44:09'),
(650, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.86, 6.88, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'Kkcjs9stbNss', '2024-05-16 07:50:47', '2024-05-16 07:50:47'),
(651, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 77.36, 79.24, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'zWOFmPOkmXzK', '2024-05-16 07:50:47', '2024-05-16 07:50:47'),
(652, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 53.40, 53.50, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'GXUAxrgyQjgN', '2024-05-16 07:50:47', '2024-05-16 07:50:47'),
(653, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1529.68, 1528.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.164.87', '4dtjKZMfF3H1', '2024-05-16 13:02:47', '2024-05-16 13:02:47'),
(654, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 79.24, 78.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '37.111.164.87', 'uvCnFvJ4HxF5', '2024-05-16 13:02:49', '2024-05-16 13:02:49'),
(655, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1528.68, 1527.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'OeUe9RlIM426', '2024-05-17 05:10:04', '2024-05-17 05:10:04'),
(656, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 78.24, 77.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'a9hKYQAHK6G0', '2024-05-17 05:10:04', '2024-05-17 05:10:04');
INSERT INTO `wallets_logs` (`id`, `loggable_type`, `loggable_id`, `wallet_name`, `value`, `from`, `to`, `type`, `status`, `notes`, `ip`, `reference`, `created_at`, `updated_at`) VALUES
(657, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1527.68, 1526.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'FmwqvwO9Zppm', '2024-05-17 05:52:02', '2024-05-17 05:52:02'),
(658, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 77.24, 76.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'teZlFGF0Ggel', '2024-05-17 05:52:10', '2024-05-17 05:52:10'),
(659, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1526.68, 1527.68, 'inc', 'Done', NULL, '45.249.9.124', 'DvQN4SHcaeGb', '2024-05-17 05:52:35', '2024-05-17 05:52:35'),
(660, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1527.68, 1526.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ECynvfaou17d', '2024-05-17 05:52:52', '2024-05-17 05:52:52'),
(661, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 76.24, 75.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'VNeadSeDf2Q4', '2024-05-17 05:52:53', '2024-05-17 05:52:53'),
(662, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1526.68, 1525.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '2n2Zruvq1lH8', '2024-05-17 05:58:02', '2024-05-17 05:58:02'),
(663, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 75.24, 74.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'mUAGBl2BJhuN', '2024-05-17 05:58:09', '2024-05-17 05:58:09'),
(664, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 74.24, 73.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '9rRNs1I3WbPq', '2024-05-17 06:01:29', '2024-05-17 06:01:29'),
(665, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 73.24, 72.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'TFoHefFvFUKK', '2024-05-17 06:01:49', '2024-05-17 06:01:49'),
(666, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 72.24, 71.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'nS3SyYddHJ6F', '2024-05-17 06:02:02', '2024-05-17 06:02:02'),
(667, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 71.24, 70.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'uvxPvh5cPWvm', '2024-05-17 06:02:37', '2024-05-17 06:02:37'),
(668, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 70.24, 69.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'xSNVmgwjIIyO', '2024-05-17 06:02:54', '2024-05-17 06:02:54'),
(669, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 69.24, 68.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'uGuj8EHP9chZ', '2024-05-17 06:05:27', '2024-05-17 06:05:27'),
(670, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 1.00, 2.20, 1.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'SNH1XPKEYxSM', '2024-05-17 06:59:31', '2024-05-17 06:59:31'),
(671, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 1.00, 1.20, 0.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ddTO5cb2PSdR', '2024-05-17 07:00:55', '2024-05-17 07:00:55'),
(672, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1525.68, 1515.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'WAzaJ3Ofmmpl', '2024-05-17 07:12:20', '2024-05-17 07:12:20'),
(673, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1515.68, 1525.68, 'inc', 'Done', NULL, '45.249.9.124', 'rdK2sbhVijKg', '2024-05-17 07:12:24', '2024-05-17 07:12:24'),
(674, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1525.68, 1515.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'naQKdZ8IR5YX', '2024-05-17 07:12:32', '2024-05-17 07:12:32'),
(675, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1515.68, 1525.68, 'inc', 'Done', NULL, '45.249.9.124', 'Nroon2MMgFWJ', '2024-05-17 07:12:35', '2024-05-17 07:12:35'),
(676, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1525.68, 1515.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'ZrIMBIqWIq79', '2024-05-17 07:12:55', '2024-05-17 07:12:55'),
(677, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1515.68, 1525.68, 'inc', 'Done', NULL, '45.249.9.124', 'fDIyWqGiosoK', '2024-05-17 07:13:00', '2024-05-17 07:13:00'),
(678, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1525.68, 1515.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'kNBtzSjchwqK', '2024-05-17 07:15:11', '2024-05-17 07:15:11'),
(679, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1515.68, 1525.68, 'inc', 'Done', NULL, '45.249.9.124', 'MwgL1kgohRfD', '2024-05-17 07:15:18', '2024-05-17 07:15:18'),
(680, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1525.68, 1515.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'YfIEicMCUhYG', '2024-05-17 07:15:27', '2024-05-17 07:15:27'),
(681, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1515.68, 1525.68, 'inc', 'Done', NULL, '45.249.9.124', '9hH6oGA0R84r', '2024-05-17 07:15:32', '2024-05-17 07:15:32'),
(682, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1525.68, 1524.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '7f2x4CdxXaWh', '2024-05-17 07:18:02', '2024-05-17 07:18:02'),
(683, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1524.68, 1525.68, 'inc', 'Done', NULL, '45.249.9.124', 'ho6EZOFsKWCc', '2024-05-17 07:18:09', '2024-05-17 07:18:09'),
(684, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 68.24, 67.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'gvhIOlaDUQ9U', '2024-05-17 07:21:33', '2024-05-17 07:21:33'),
(685, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 67.24, 66.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'YXL8ny2eZRJn', '2024-05-17 07:57:01', '2024-05-17 07:57:01'),
(686, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 66.24, 65.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'qOu74z3jZTpf', '2024-05-17 08:02:50', '2024-05-17 08:02:50'),
(687, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 65.24, 66.24, 'inc', 'Done', NULL, '45.249.9.124', 'A8ObY7Asj09e', '2024-05-17 08:03:21', '2024-05-17 08:03:21'),
(688, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 66.24, 65.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'I2gDutBBXxxr', '2024-05-17 08:06:19', '2024-05-17 08:06:19'),
(689, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1525.68, 1524.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'j2CvQx7jmXCp', '2024-05-17 08:06:24', '2024-05-17 08:06:24'),
(690, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1524.68, 1514.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'Fk02fhIXmVZv', '2024-05-17 08:12:43', '2024-05-17 08:12:43'),
(691, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 65.24, 55.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'z8io9HUh9RqV', '2024-05-17 08:18:58', '2024-05-17 08:18:58'),
(692, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 55.24, 45.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'gRzAdGQd6lLs', '2024-05-17 08:19:18', '2024-05-17 08:19:18'),
(693, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 45.24, 55.24, 'inc', 'Done', NULL, '45.249.9.124', '9mjnEqIUtmZe', '2024-05-17 08:19:21', '2024-05-17 08:19:21'),
(694, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1514.68, 1504.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'sjnJCMDlekMa', '2024-05-17 08:22:37', '2024-05-17 08:22:37'),
(695, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1504.68, 1514.68, 'inc', 'Done', NULL, '45.249.9.124', '446mRSbbMVL9', '2024-05-17 08:22:40', '2024-05-17 08:22:40'),
(696, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 21, 'wallet_1', 1.00, 0.00, 1.00, 'inc', 'Done', NULL, '87.253.57.203', 'SVvJ5xp3VZ7o', '2024-05-17 10:27:33', '2024-05-17 10:27:33'),
(697, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 21, 'wallet_1', 1.00, 1.00, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', '3lYWBNGGjumd', '2024-05-17 10:27:48', '2024-05-17 10:27:48'),
(698, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1514.68, 1513.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '14.192.137.69', 'JaM7UsE5gxKZ', '2024-05-20 06:18:10', '2024-05-20 06:18:10'),
(699, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 55.24, 54.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '14.192.137.69', '4CaB7pZj3FNe', '2024-05-20 06:28:55', '2024-05-20 06:28:55'),
(700, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 54.24, 55.24, 'inc', 'Done', NULL, '14.192.137.69', 'GPfkCQtNIjeu', '2024-05-20 06:30:28', '2024-05-20 06:30:28'),
(701, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 20.00, 55.24, 35.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 4', '14.192.137.69', 'T5EuV07grFiR', '2024-05-20 06:31:59', '2024-05-20 06:31:59'),
(702, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1513.68, 1512.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '14.192.137.69', 'a0SNi6u57uds', '2024-05-20 06:32:56', '2024-05-20 06:32:56'),
(703, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1512.68, 1511.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '14.192.137.69', 'T5kyIfk42WdB', '2024-05-20 06:35:23', '2024-05-20 06:35:23'),
(704, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 20.00, 35.24, 55.24, 'inc', 'Done', NULL, '14.192.137.69', 'AFNPrP1dfWE8', '2024-05-20 06:35:48', '2024-05-20 06:35:48'),
(705, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 55.24, 54.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '14.192.137.69', 'xaKb0u7cuM4K', '2024-05-20 06:36:01', '2024-05-20 06:36:01'),
(706, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1511.68, 1510.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '14.192.137.69', 'UAui55Bo4oCk', '2024-05-20 06:36:45', '2024-05-20 06:36:45'),
(707, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 54.24, 53.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '14.192.137.69', 'vbN4dNouKwSA', '2024-05-20 06:36:54', '2024-05-20 06:36:54'),
(708, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 53.24, 52.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '14.192.137.69', 'XJ1Xic5ERfSR', '2024-05-20 06:37:40', '2024-05-20 06:37:40'),
(709, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 52.24, 53.24, 'inc', 'Done', NULL, '14.192.137.69', '4PX8rVYWkaVl', '2024-05-20 06:37:57', '2024-05-20 06:37:57'),
(710, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1510.68, 1509.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '14.192.137.69', '9kUjTeT5yTn7', '2024-05-20 06:39:03', '2024-05-20 06:39:03'),
(711, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 53.24, 52.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '14.192.137.69', '5c8rU9R3QZfe', '2024-05-20 06:39:18', '2024-05-20 06:39:18'),
(712, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.20, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'vbnHcTJnCvsZ', '2024-05-20 08:26:57', '2024-05-20 08:26:57'),
(713, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 0.80, 2.08, 1.28, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'I6ubMnWuk9Dx', '2024-05-20 08:26:57', '2024-05-20 08:26:57'),
(714, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 1.28, 2.28, 'inc', 'Done', NULL, '45.249.9.124', 'IxSHjRKSfuzc', '2024-05-20 08:29:49', '2024-05-20 08:29:49'),
(715, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 52.24, 42.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'LOqt3AjWTyY4', '2024-05-20 08:30:49', '2024-05-20 08:30:49'),
(716, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 42.24, 52.24, 'inc', 'Done', NULL, '45.249.9.124', 'oEtR1Sjfmq2l', '2024-05-20 08:30:57', '2024-05-20 08:30:57'),
(717, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 2.28, 1.28, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '1G2qW5xP6m2o', '2024-05-20 08:31:04', '2024-05-20 08:31:04'),
(718, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 52.24, 51.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'TL0Ngs5GsCbh', '2024-05-20 08:31:11', '2024-05-20 08:31:11'),
(719, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.00, 0.20, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'qC5sd8QQbklU', '2024-05-24 05:03:56', '2024-05-24 05:03:56'),
(720, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 18.80, 51.24, 70.04, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'lRn1Na0ANXjO', '2024-05-24 05:03:56', '2024-05-24 05:03:56'),
(721, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 53.50, 54.50, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'RVgv6PIwFdsz', '2024-05-24 05:03:56', '2024-05-24 05:03:56'),
(722, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.20, 0.40, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, mohsin …', '45.249.9.124', 'xFxbEnHBuKn5', '2024-05-24 05:47:46', '2024-05-24 05:47:46'),
(723, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 18.80, 0.20, 19.00, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '45.249.9.124', 'SMfxwaeR0PEL', '2024-05-24 05:47:46', '2024-05-24 05:47:46'),
(724, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 54.50, 55.50, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, mohsin …', '45.249.9.124', 'Nee9JrxjAFfE', '2024-05-24 05:47:46', '2024-05-24 05:47:46'),
(725, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 10.00, 19.00, 9.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', '3G5NqnJ5mHiK', '2024-05-24 05:54:59', '2024-05-24 05:54:59'),
(726, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.20, 0.40, 0.60, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, mohsin …', '45.249.9.124', 'ij8dFCQOYmzo', '2024-05-24 05:56:51', '2024-05-24 05:56:51'),
(727, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 18.80, 9.00, 27.80, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '45.249.9.124', 'dZJxKXxx16FV', '2024-05-24 05:56:51', '2024-05-24 05:56:51'),
(728, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 1.00, 55.50, 56.50, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, mohsin …', '45.249.9.124', 'bjRxJEKwsjiW', '2024-05-24 05:56:51', '2024-05-24 05:56:51'),
(729, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 10.00, 27.80, 17.80, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'g4kVwjlr7w2v', '2024-05-24 05:59:01', '2024-05-24 05:59:01'),
(730, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 10.00, 17.80, 27.80, 'inc', 'Done', NULL, '45.249.9.124', 'kx50rilT7gDL', '2024-05-24 05:59:04', '2024-05-24 05:59:04'),
(731, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 1.28, 11.28, 'inc', 'Done', NULL, '45.249.9.124', 'ZueGRi7xemmt', '2024-05-24 06:12:52', '2024-05-24 06:12:52'),
(732, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.60, 0.60, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'snL8tM4CSdF0', '2024-05-24 06:13:16', '2024-05-24 06:13:16'),
(733, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 9.40, 11.28, 1.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'bNwOfs56HoUQ', '2024-05-24 06:13:16', '2024-05-24 06:13:16'),
(734, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 1.88, 11.88, 'inc', 'Done', NULL, '45.249.9.124', 'BxFFPSrEIMtM', '2024-05-24 06:13:27', '2024-05-24 06:13:27'),
(735, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 11.88, 21.88, 'inc', 'Done', NULL, '45.249.9.124', 'XgvcL3WsBlh6', '2024-05-24 06:14:10', '2024-05-24 06:14:10'),
(736, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1509.68, 1508.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ybVYepmFpwMA', '2024-05-29 02:07:17', '2024-05-29 02:07:17'),
(737, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 70.04, 69.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'L7Ord8DHYdni', '2024-05-29 02:07:18', '2024-05-29 02:07:18'),
(738, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1508.68, 1507.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'xJ12TrnHkL2C', '2024-05-29 02:08:52', '2024-05-29 02:08:52'),
(739, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 69.04, 68.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '8FFnyFOAWA6S', '2024-05-29 02:08:57', '2024-05-29 02:08:57'),
(740, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1507.68, 1506.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'nwbash2RKB2y', '2024-05-29 02:09:54', '2024-05-29 02:09:54'),
(741, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 68.04, 67.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'MMlfufUuoxqt', '2024-05-29 02:09:54', '2024-05-29 02:09:54'),
(742, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1506.68, 1505.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'e2sFGOKKOKNF', '2024-05-29 02:10:31', '2024-05-29 02:10:31'),
(743, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1505.68, 1504.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'NfIM9BTrtv6D', '2024-05-29 02:11:08', '2024-05-29 02:11:08'),
(744, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1504.68, 1503.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'jvSVM1F8SkqS', '2024-05-29 02:11:23', '2024-05-29 02:11:23'),
(745, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 67.04, 66.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'YbFYQa3Oy1GB', '2024-05-29 02:11:46', '2024-05-29 02:11:46'),
(746, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 66.04, 65.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'iIQAxUfZkb2d', '2024-05-29 02:12:09', '2024-05-29 02:12:09'),
(747, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 65.04, 64.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'kkgVEaIu2g2u', '2024-05-29 02:12:22', '2024-05-29 02:12:22'),
(748, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 64.04, 63.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'TCHmDk8I7wFy', '2024-05-29 02:12:32', '2024-05-29 02:12:32'),
(749, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 63.04, 64.04, 'inc', 'Done', NULL, '45.249.9.124', '5pF9EZptiiQr', '2024-05-29 02:12:41', '2024-05-29 02:12:41'),
(750, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 64.04, 63.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'RgI3uiDbdLZI', '2024-05-29 02:12:48', '2024-05-29 02:12:48'),
(751, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 63.04, 64.04, 'inc', 'Done', NULL, '45.249.9.124', 'LeALuRj0cc6a', '2024-05-29 02:12:57', '2024-05-29 02:12:57'),
(752, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 64.04, 63.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '2GaNFE3vHDvg', '2024-05-29 02:13:02', '2024-05-29 02:13:02'),
(753, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 63.04, 64.04, 'inc', 'Done', NULL, '45.249.9.124', 'i1fIE13zm8uF', '2024-05-29 02:13:07', '2024-05-29 02:13:07'),
(754, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 64.04, 63.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '3ao9OMdkgNNQ', '2024-05-29 02:13:14', '2024-05-29 02:13:14'),
(755, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 63.04, 64.04, 'inc', 'Done', NULL, '45.249.9.124', 'QziZEzFhaxxl', '2024-05-29 02:13:18', '2024-05-29 02:13:18'),
(756, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 64.04, 63.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'qyNZDHhEIrJ4', '2024-05-29 02:13:24', '2024-05-29 02:13:24'),
(757, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 63.04, 64.04, 'inc', 'Done', NULL, '45.249.9.124', 'ch8WoAxzwiCs', '2024-05-29 02:13:29', '2024-05-29 02:13:29'),
(758, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1503.68, 1502.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'z4NCeNCnUcZ8', '2024-05-29 02:13:36', '2024-05-29 02:13:36'),
(759, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 27.80, 26.80, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'cT2WyzXOheRl', '2024-05-29 07:12:07', '2024-05-29 07:12:07'),
(760, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 26.80, 25.80, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'cvmlAt7km6U7', '2024-05-29 07:12:32', '2024-05-29 07:12:32'),
(761, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 21.88, 20.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Eq7elXp6JKue', '2024-05-29 07:12:38', '2024-05-29 07:12:38'),
(762, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 20.88, 10.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'MeAXKeo3nRou', '2024-05-30 05:13:38', '2024-05-30 05:13:38'),
(763, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 10.00, 25.80, 15.80, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', '9u5nE14mVEv9', '2024-05-30 05:13:39', '2024-05-30 05:13:39'),
(764, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.88, 6.90, 'inc', 'Done', 'Challenge: Attempt By: Challe Corporation, Infosha corporation', '87.253.57.203', 'oKJNdmHbuXVV', '2024-05-31 09:47:39', '2024-05-31 09:47:39'),
(765, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 22, 'wallet_1', 1.88, 0.00, 1.88, 'inc', 'Done', 'Winning Challenge:  from Challe Corporation', '87.253.57.203', 'IBkcx1GHmLeE', '2024-05-31 09:47:39', '2024-05-31 09:47:39'),
(766, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 56.50, 56.60, 'inc', 'Done', 'Challenge: Attempt By: Challe Corporation, Infosha corporation', '87.253.57.203', 'rRlUrY27LnaA', '2024-05-31 09:47:39', '2024-05-31 09:47:39'),
(767, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 9, 'wallet_2', 0.02, 6.90, 6.92, 'inc', 'Done', 'Challenge: Attempt By: Infosha corporation, Challe Corporation', '87.253.57.203', '1LPvWvZoyq7g', '2024-05-31 10:32:41', '2024-05-31 10:32:41'),
(768, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 1.88, 0.00, 1.88, 'inc', 'Done', 'Winning Challenge:  from Infosha corporation', '87.253.57.203', 'jZkYSUd3QXKN', '2024-05-31 10:32:41', '2024-05-31 10:32:41'),
(769, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 56.60, 56.70, 'inc', 'Done', 'Challenge: Attempt By: Infosha corporation, Challe Corporation', '87.253.57.203', 'ouWgZy02R84A', '2024-05-31 10:32:41', '2024-05-31 10:32:41'),
(770, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 1.00, 1.88, 0.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'uMKyIuDlVDfl', '2024-06-02 02:09:45', '2024-06-02 02:09:45'),
(771, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 21, 'wallet_1', 1.00, 0.00, 1.00, 'inc', 'Done', NULL, '87.253.57.203', '0yYkiQaLXiF6', '2024-06-02 02:15:37', '2024-06-02 02:15:37'),
(772, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 21, 'wallet_1', 1.00, 1.00, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'y7ATDgDdXxb0', '2024-06-02 02:15:49', '2024-06-02 02:15:49'),
(773, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 21, 'wallet_1', 1.00, 0.00, 1.00, 'inc', 'Done', NULL, '87.253.57.203', 'KazIA1G99MxL', '2024-06-02 02:15:52', '2024-06-02 02:15:52'),
(774, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 21, 'wallet_1', 1.00, 1.00, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', '7MLW8w0A129r', '2024-06-02 02:15:59', '2024-06-02 02:15:59'),
(775, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 21, 'wallet_1', 1.00, 0.00, 1.00, 'inc', 'Done', NULL, '87.253.57.203', 'r5veNOlIvWMA', '2024-06-02 02:16:03', '2024-06-02 02:16:03'),
(776, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 21, 'wallet_1', 1.00, 1.00, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'WL7FSL63m6c5', '2024-06-02 02:16:08', '2024-06-02 02:16:08'),
(777, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 10.00, 0.88, 10.88, 'inc', 'Done', NULL, '87.253.57.203', 'k6dRYDvpONFj', '2024-06-02 02:16:57', '2024-06-02 02:16:57'),
(778, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 1.00, 10.88, 9.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'OfhrfEqLAj34', '2024-06-02 02:17:04', '2024-06-02 02:17:04'),
(779, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 15.80, 14.80, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '0IwbQUBsHVcj', '2024-06-03 02:34:25', '2024-06-03 02:34:25'),
(780, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 10.88, 9.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'BimJlt07Q2EU', '2024-06-03 02:37:47', '2024-06-03 02:37:47'),
(781, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 64.04, 63.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', '12Z8Pwhkz51X', '2024-06-03 04:53:39', '2024-06-03 04:53:39'),
(782, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1502.68, 1501.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'b8atV4OU2iDA', '2024-06-03 04:53:40', '2024-06-03 04:53:40'),
(783, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1501.68, 1500.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'Z5PxQx3Ajhxw', '2024-06-03 04:54:53', '2024-06-03 04:54:53'),
(784, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 63.04, 62.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'yVUWw1rTQvvn', '2024-06-03 04:55:00', '2024-06-03 04:55:00'),
(785, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1500.68, 1499.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'qwsY84jFYtZs', '2024-06-03 04:57:42', '2024-06-03 04:57:42'),
(786, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1499.68, 1498.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'NpXHBE2yGeAF', '2024-06-03 04:58:59', '2024-06-03 04:58:59'),
(787, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1498.68, 1497.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'IcuJmimWlZcZ', '2024-06-03 05:00:16', '2024-06-03 05:00:16'),
(788, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1497.68, 1496.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'l5uVvrtPP5pc', '2024-06-03 05:05:57', '2024-06-03 05:05:57'),
(789, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1496.68, 1497.68, 'inc', 'Done', NULL, '154.208.60.11', 'KQqtdciQew5j', '2024-06-03 05:06:32', '2024-06-03 05:06:32'),
(790, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1497.68, 1496.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'IkZ83yixwRmm', '2024-06-03 05:07:38', '2024-06-03 05:07:38'),
(791, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1496.68, 1497.68, 'inc', 'Done', NULL, '154.208.60.11', '86QueK9sWPzf', '2024-06-03 05:07:48', '2024-06-03 05:07:48'),
(792, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1497.68, 1496.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'HTCVLa7ltukL', '2024-06-03 05:07:56', '2024-06-03 05:07:56'),
(793, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1496.68, 1497.68, 'inc', 'Done', NULL, '154.208.60.11', 'VsfEUrPns4fX', '2024-06-03 05:08:06', '2024-06-03 05:08:06'),
(794, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 62.04, 61.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'P3fpKLqb3e9W', '2024-06-03 05:08:37', '2024-06-03 05:08:37'),
(795, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1497.68, 1496.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'EwGwvk4eEL7i', '2024-06-03 05:09:15', '2024-06-03 05:09:15'),
(796, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 61.04, 60.04, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'KlSr4I2F3dML', '2024-06-03 05:09:19', '2024-06-03 05:09:19'),
(797, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.02, 0.40, 0.42, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, mohsin …', '154.208.60.11', 'mmUN7jvTfuJf', '2024-06-03 06:31:50', '2024-06-03 06:31:50'),
(798, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.88, 14.80, 16.68, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '154.208.60.11', 'EnkzHpUhiF1u', '2024-06-03 06:31:50', '2024-06-03 06:31:50'),
(799, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 56.70, 56.80, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, mohsin …', '154.208.60.11', 'uUK5XJhqHu1W', '2024-06-03 06:31:50', '2024-06-03 06:31:50'),
(800, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.02, 0.42, 0.44, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '154.208.60.11', 'zdwFrA3k5jUN', '2024-06-03 06:33:02', '2024-06-03 06:33:02'),
(801, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.88, 1496.68, 1498.56, 'inc', 'Done', 'Winning Challenge:  from test', '154.208.60.11', 'of65QTf8e99v', '2024-06-03 06:33:02', '2024-06-03 06:33:02'),
(802, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 56.80, 56.90, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '154.208.60.11', 'WAo6UhWCz4gf', '2024-06-03 06:33:02', '2024-06-03 06:33:02'),
(803, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.02, 0.44, 0.46, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '154.208.60.11', 'RlsvYz97DD1O', '2024-06-03 06:34:12', '2024-06-03 06:34:12'),
(804, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 60.04, 61.92, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '154.208.60.11', '0YrMqqcvyMNn', '2024-06-03 06:34:12', '2024-06-03 06:34:12'),
(805, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 56.90, 57.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '154.208.60.11', 'KgNqXNtLCBhJ', '2024-06-03 06:34:12', '2024-06-03 06:34:12'),
(806, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.02, 0.46, 0.48, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '154.208.60.11', 'olyK9KYnXSXA', '2024-06-03 06:35:22', '2024-06-03 06:35:22'),
(807, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 61.92, 63.80, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '154.208.60.11', 'PeKHjFmjWZtl', '2024-06-03 06:35:22', '2024-06-03 06:35:22'),
(808, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 57.00, 57.10, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '154.208.60.11', 'ZUDg86R8qDC9', '2024-06-03 06:35:22', '2024-06-03 06:35:22'),
(809, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.02, 0.48, 0.50, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '154.208.60.11', 'RqQMjhVLLDHM', '2024-06-03 06:35:25', '2024-06-03 06:35:25'),
(810, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.88, 63.80, 65.68, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '154.208.60.11', 'rTN0f7uXxdsP', '2024-06-03 06:35:25', '2024-06-03 06:35:25'),
(811, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 57.10, 57.20, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '154.208.60.11', 'qEalnmX6a0U5', '2024-06-03 06:35:25', '2024-06-03 06:35:25'),
(812, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 9.88, 8.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'qLXgu2tlHnqc', '2024-06-04 02:54:29', '2024-06-04 02:54:29'),
(813, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 8.88, 7.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'k4jyB36hDIqF', '2024-06-04 05:08:03', '2024-06-04 05:08:03'),
(814, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 7.88, 6.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'T4AiGwm4kEqC', '2024-06-04 05:20:51', '2024-06-04 05:20:51'),
(815, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 16.68, 15.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'fleS2LSEcGpw', '2024-06-04 05:23:53', '2024-06-04 05:23:53'),
(816, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 15.68, 14.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'KZtG32A47qwx', '2024-06-04 05:39:41', '2024-06-04 05:39:41'),
(817, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 6.88, 5.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '6UVC8Fh9whFr', '2024-06-04 05:39:52', '2024-06-04 05:39:52'),
(818, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 5.88, 4.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'osj9RuJ73AQV', '2024-06-04 05:47:03', '2024-06-04 05:47:03'),
(819, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 14.68, 13.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'KjsbyMNwFOIL', '2024-06-04 05:47:07', '2024-06-04 05:47:07'),
(820, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 4.88, 3.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'vBJdbBvYqqnc', '2024-06-04 06:06:07', '2024-06-04 06:06:07'),
(821, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 13.68, 12.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '7NUXuS62kFKg', '2024-06-04 06:06:09', '2024-06-04 06:06:09'),
(822, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 12.68, 11.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'mTdGNIBbyQfe', '2024-06-04 06:08:53', '2024-06-04 06:08:53'),
(823, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 3.88, 2.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'hzHgsM27ylyv', '2024-06-04 06:08:57', '2024-06-04 06:08:57'),
(824, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 2.88, 1.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Kjdw4F698EEL', '2024-06-04 06:59:32', '2024-06-04 06:59:32'),
(825, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 11.68, 10.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'IPxYZwrnBAxA', '2024-06-04 07:01:57', '2024-06-04 07:01:57'),
(826, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 10.68, 9.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'o1z8vYWPW9Jl', '2024-06-04 07:05:34', '2024-06-04 07:05:34'),
(827, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 1.88, 0.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ECMq6DLqdjiB', '2024-06-04 07:06:04', '2024-06-04 07:06:04'),
(828, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 9.68, 8.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'i2LCqqlrV2Pn', '2024-06-04 07:08:22', '2024-06-04 07:08:22'),
(829, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.02, 0.50, 0.52, 'inc', 'Done', 'Challenge: Attempt By: mohsin …, Mohsin Tariq', '45.249.9.124', '2KcgYRnHoQmT', '2024-06-04 07:11:49', '2024-06-04 07:11:49'),
(830, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.88, 0.88, 2.76, 'inc', 'Done', 'Winning Challenge:  from mohsin …', '45.249.9.124', 'MMWnTH2ymF0x', '2024-06-04 07:11:49', '2024-06-04 07:11:49'),
(831, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 57.20, 57.30, 'inc', 'Done', 'Challenge: Attempt By: mohsin …, Mohsin Tariq', '45.249.9.124', 'lCduEb4Qv3IP', '2024-06-04 07:11:49', '2024-06-04 07:11:49'),
(832, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.02, 0.52, 0.54, 'inc', 'Done', 'Challenge: Attempt By: mohsin …, Mohsin Tariq', '45.249.9.124', 'GLYPcxrzPmA3', '2024-06-04 07:12:33', '2024-06-04 07:12:33'),
(833, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.88, 2.76, 4.64, 'inc', 'Done', 'Winning Challenge:  from mohsin …', '45.249.9.124', 'hLnUdo3HYsX7', '2024-06-04 07:12:33', '2024-06-04 07:12:33'),
(834, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 57.30, 57.40, 'inc', 'Done', 'Challenge: Attempt By: mohsin …, Mohsin Tariq', '45.249.9.124', 'vzLUFLhybVr4', '2024-06-04 07:12:33', '2024-06-04 07:12:33'),
(835, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 4.64, 3.64, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'CDganoX80Jja', '2024-06-04 07:35:52', '2024-06-04 07:35:52'),
(836, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 8.68, 7.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'gxJEt3Czde2K', '2024-06-04 07:35:57', '2024-06-04 07:35:57'),
(837, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 7.68, 6.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'lKebxHaGdyOv', '2024-06-04 07:37:52', '2024-06-04 07:37:52'),
(838, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 3.64, 2.64, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ehG1MwSUmbIN', '2024-06-04 07:37:53', '2024-06-04 07:37:53'),
(839, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 22, 'wallet_1', 1.00, 1.88, 0.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'IfXBukMHJh0o', '2024-06-04 10:41:01', '2024-06-04 10:41:01'),
(840, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 1.00, 9.88, 8.88, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'lztu58vnc3pf', '2024-06-04 10:41:07', '2024-06-04 10:41:07'),
(841, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.02, 0.54, 0.56, 'inc', 'Done', 'Challenge: Attempt By: Infosha corporation, Challe Corporation', '87.253.57.203', 'un4pLPZwBVGp', '2024-06-04 10:46:42', '2024-06-04 10:46:42'),
(842, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 1.88, 8.88, 10.76, 'inc', 'Done', 'Winning Challenge:  from Infosha corporation', '87.253.57.203', 'W361bvRbKdul', '2024-06-04 10:46:42', '2024-06-04 10:46:42'),
(843, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.10, 57.40, 57.50, 'inc', 'Done', 'Challenge: Attempt By: Infosha corporation, Challe Corporation', '87.253.57.203', 'oHQioiAququ6', '2024-06-04 10:46:42', '2024-06-04 10:46:42'),
(844, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 100.00, 1498.56, 1398.56, 'dec', 'Done', 'Amount Withdrawn', '87.253.57.203', '1vgD82DbxKke', '2024-06-04 10:57:24', '2024-06-04 10:57:24'),
(845, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 24, 'wallet_2', 1.00, 0.00, 1.00, 'inc', 'Done', 'Challenge: Attempt By: Infosha corporation, Challe Corporation', '87.253.57.203', 'JpIkOVWrCh73', '2024-06-04 11:03:18', '2024-06-04 11:03:18'),
(846, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 84.00, 10.76, 94.76, 'inc', 'Done', 'Winning Challenge:  from Infosha corporation', '87.253.57.203', 'B8WQ4eVoui6n', '2024-06-04 11:03:18', '2024-06-04 11:03:18'),
(847, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 15.00, 57.50, 72.50, 'inc', 'Done', 'Challenge: Attempt By: Infosha corporation, Challe Corporation', '87.253.57.203', 'JIdEPe9YGGFy', '2024-06-04 11:03:18', '2024-06-04 11:03:18'),
(848, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 6.68, 5.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'QQDsYLRVhojn', '2024-06-05 05:39:53', '2024-06-05 05:39:53'),
(849, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 2.64, 1.64, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'mDmiMWlXYWSP', '2024-06-05 05:39:59', '2024-06-05 05:39:59'),
(850, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 5.68, 4.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'viFt8DeVYXt5', '2024-06-05 05:43:09', '2024-06-05 05:43:09'),
(851, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 1.64, 0.64, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'oNRYcuwwLMNl', '2024-06-05 05:43:16', '2024-06-05 05:43:16'),
(852, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 4.68, 3.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'j8loA9DfvM1D', '2024-06-05 05:50:07', '2024-06-05 05:50:07'),
(853, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.02, 0.56, 0.58, 'inc', 'Done', 'Challenge: Attempt By: mohsin …, Mohsin Tariq', '45.249.9.124', 'lMTse9ioDPPS', '2024-06-05 06:12:40', '2024-06-05 06:12:40'),
(854, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.70, 0.64, 2.34, 'inc', 'Done', 'Winning Challenge:  from mohsin …', '45.249.9.124', 'MGpZ933fZsBS', '2024-06-05 06:12:40', '2024-06-05 06:12:40'),
(855, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.30, 72.50, 72.80, 'inc', 'Done', 'Challenge: Attempt By: mohsin …, Mohsin Tariq', '45.249.9.124', 'm92FDG6h55JR', '2024-06-05 06:12:40', '2024-06-05 06:12:40'),
(856, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 3.68, 2.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '0CqgWSRaz9FB', '2024-06-05 06:13:01', '2024-06-05 06:13:01'),
(857, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 2.68, 1.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'OKX6FTmoJwOz', '2024-06-05 06:15:21', '2024-06-05 06:15:21'),
(858, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 2.34, 1.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Z2tIErHNZ9YD', '2024-06-05 06:15:27', '2024-06-05 06:15:27'),
(859, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 1.34, 0.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'fqqTYenXmC5l', '2024-06-05 06:19:52', '2024-06-05 06:19:52'),
(860, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 13, 'wallet_1', 1.00, 1.68, 0.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'umtoIdzEI8en', '2024-06-05 06:19:54', '2024-06-05 06:19:54'),
(861, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.00, 0.58, 0.58, 'inc', 'Done', 'Challenge: Attempt By: mohsin …, Mohsin Tariq', '45.249.9.124', 'FtZjSqVMUEBD', '2024-06-05 06:33:34', '2024-06-05 06:33:34'),
(862, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.70, 0.34, 2.04, 'inc', 'Done', 'Winning Challenge:  from mohsin …', '45.249.9.124', '0FMCctQMumka', '2024-06-05 06:33:34', '2024-06-05 06:33:34'),
(863, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.30, 72.80, 73.10, 'inc', 'Done', 'Challenge: Attempt By: mohsin …, Mohsin Tariq', '45.249.9.124', 'RtTvN44ojW4Q', '2024-06-05 06:33:34', '2024-06-05 06:33:34'),
(864, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.00, 0.58, 0.58, 'inc', 'Done', 'Challenge: Attempt By: Build it, Challe Corporation', '87.253.57.203', 'DwfuclsDp4gm', '2024-06-05 08:51:18', '2024-06-05 08:51:18'),
(865, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 1.70, 94.76, 96.46, 'inc', 'Done', 'Winning Challenge:  from Build it', '87.253.57.203', 'PpRLJYmNSlRu', '2024-06-05 08:51:18', '2024-06-05 08:51:18'),
(866, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.30, 73.10, 73.40, 'inc', 'Done', 'Challenge: Attempt By: Build it, Challe Corporation', '87.253.57.203', 'pqL4iGOfzFIr', '2024-06-05 08:51:18', '2024-06-05 08:51:18'),
(867, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 1.00, 96.46, 95.46, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'aAcROgYbKt0L', '2024-06-05 10:25:35', '2024-06-05 10:25:35'),
(868, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 25, 'wallet_2', 0.00, 0.00, 0.00, 'inc', 'Done', 'Challenge: Attempt By: Challe Corporation, Build it', '87.253.57.203', 'VmmsOxtqs1HX', '2024-06-05 10:31:32', '2024-06-05 10:31:32'),
(869, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 21, 'wallet_1', 1.78, 0.00, 1.78, 'inc', 'Done', 'Winning Challenge:  from Challe Corporation', '87.253.57.203', 'p8oaJodlEC9A', '2024-06-05 10:31:32', '2024-06-05 10:31:32'),
(870, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.22, 73.40, 73.62, 'inc', 'Done', 'Challenge: Attempt By: Challe Corporation, Build it', '87.253.57.203', '9CRd1CILPJQs', '2024-06-05 10:31:32', '2024-06-05 10:31:32'),
(871, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 65.68, 64.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'kXK6qUoJ0kNF', '2024-06-10 01:42:27', '2024-06-10 01:42:27'),
(872, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 64.68, 65.68, 'inc', 'Done', NULL, '45.249.9.124', 'hKGXtKu8je3Z', '2024-06-10 01:43:09', '2024-06-10 01:43:09'),
(873, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 50.00, 1398.56, 1348.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 4', '45.249.9.124', 'VXxijcUgPEo9', '2024-06-10 01:52:35', '2024-06-10 01:52:35'),
(874, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 50.00, 65.68, 15.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 4', '45.249.9.124', '7JDxAsxHUwjd', '2024-06-10 01:52:40', '2024-06-10 01:52:40'),
(875, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 24, 'wallet_2', 0.10, 1.00, 1.10, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'UcsubdnHcglQ', '2024-06-10 01:54:02', '2024-06-10 01:54:02'),
(876, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 88.90, 15.68, 104.58, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'ZzQSr3KDBIOJ', '2024-06-10 01:54:02', '2024-06-10 01:54:02'),
(877, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 11.00, 73.62, 84.62, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'tJskes7ZIoo9', '2024-06-10 01:54:02', '2024-06-10 01:54:02');
INSERT INTO `wallets_logs` (`id`, `loggable_type`, `loggable_id`, `wallet_name`, `value`, `from`, `to`, `type`, `status`, `notes`, `ip`, `reference`, `created_at`, `updated_at`) VALUES
(878, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1348.56, 1347.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'LFZEYrsDZ2Dd', '2024-06-10 01:54:24', '2024-06-10 01:54:24'),
(879, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 104.58, 103.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '2wX3KiDbl6oo', '2024-06-10 01:54:24', '2024-06-10 01:54:24'),
(880, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1347.56, 1348.56, 'inc', 'Done', NULL, '45.249.9.124', 'SMEWgcSP4Lo9', '2024-06-10 01:56:51', '2024-06-10 01:56:51'),
(881, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1348.56, 1347.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'MHuctCCbFoiy', '2024-06-10 01:57:06', '2024-06-10 01:57:06'),
(882, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 103.58, 102.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'CdhIc3YCiJv5', '2024-06-10 05:30:12', '2024-06-10 05:30:12'),
(883, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1347.56, 1346.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ZvVAPzXTUsug', '2024-06-10 06:41:32', '2024-06-10 06:41:32'),
(884, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 102.58, 101.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'EPwqWBpKNED9', '2024-06-10 07:33:26', '2024-06-10 07:33:26'),
(885, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1346.56, 1345.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'JQE9jnoOqeMj', '2024-06-10 08:20:22', '2024-06-10 08:20:22'),
(886, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1345.56, 1344.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'L0aetNh5EeOP', '2024-06-10 08:20:54', '2024-06-10 08:20:54'),
(887, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1344.56, 1343.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'lVBCvWDHbjHr', '2024-06-10 08:23:55', '2024-06-10 08:23:55'),
(888, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1343.56, 1333.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'mybA0P7A55bb', '2024-06-10 08:24:39', '2024-06-10 08:24:39'),
(889, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 101.58, 91.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'SdLY9z6bIs7B', '2024-06-10 08:33:33', '2024-06-10 08:33:33'),
(890, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1333.56, 1332.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'LKxLfrtNl7ue', '2024-06-10 08:37:00', '2024-06-10 08:37:00'),
(891, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 91.58, 90.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'a1DYcaQ7Qbk4', '2024-06-10 08:37:07', '2024-06-10 08:37:07'),
(892, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 90.58, 89.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'AFL586eePOEt', '2024-06-10 08:38:15', '2024-06-10 08:38:15'),
(893, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1332.56, 1331.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'JC82qeBEsKij', '2024-06-10 08:38:20', '2024-06-10 08:38:20'),
(894, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1331.56, 1330.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'nnh0zEMjsplm', '2024-06-10 08:43:58', '2024-06-10 08:43:58'),
(895, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 89.58, 88.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'dhlOTUd3DALG', '2024-06-10 08:44:12', '2024-06-10 08:44:12'),
(896, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 88.58, 87.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'r1VbSuGQYPFy', '2024-06-10 08:49:12', '2024-06-10 08:49:12'),
(897, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1330.56, 1329.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ow7lUDy96hLl', '2024-06-10 08:49:50', '2024-06-10 08:49:50'),
(898, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 87.58, 86.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'SUoLGtnZqqN8', '2024-06-10 08:51:23', '2024-06-10 08:51:23'),
(899, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1329.56, 1328.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'wL9IaLmixgue', '2024-06-10 08:51:28', '2024-06-10 08:51:28'),
(900, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1328.56, 1327.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'FzCpHc5VjFL0', '2024-06-10 08:56:23', '2024-06-10 08:56:23'),
(901, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 86.58, 85.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'c9JMJ63NrPT1', '2024-06-10 08:56:28', '2024-06-10 08:56:28'),
(902, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 85.58, 84.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'aVNCI1M9wmKv', '2024-06-10 08:59:41', '2024-06-10 08:59:41'),
(903, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1327.56, 1326.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'EpRZVC0kf9d8', '2024-06-10 08:59:45', '2024-06-10 08:59:45'),
(904, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1326.56, 1325.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'QBWty1R4nr1d', '2024-06-10 09:08:17', '2024-06-10 09:08:17'),
(905, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 84.58, 83.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'uLpxzGKtXmIA', '2024-06-10 09:08:34', '2024-06-10 09:08:34'),
(906, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1325.56, 1324.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'KhRxua1Nlp9n', '2024-06-10 09:11:37', '2024-06-10 09:11:37'),
(907, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 83.58, 82.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'O9Oa1VjF8qv7', '2024-06-10 09:11:37', '2024-06-10 09:11:37'),
(908, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 82.58, 72.58, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'RbBu1V8gqECf', '2024-06-10 09:22:52', '2024-06-10 09:22:52'),
(909, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1324.56, 1314.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'bwuSrAEyz0Lq', '2024-06-10 09:23:59', '2024-06-10 09:23:59'),
(910, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.02, 0.00, 0.02, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'avs4HAwScTVd', '2024-06-10 09:27:44', '2024-06-10 09:27:44'),
(911, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 17.78, 72.58, 90.36, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', '54yKdswDNmWx', '2024-06-10 09:27:44', '2024-06-10 09:27:44'),
(912, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 84.62, 86.82, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, test', '45.249.9.124', 'YQBvXXqM9mNk', '2024-06-10 09:27:44', '2024-06-10 09:27:44'),
(913, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1314.56, 1313.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'SdiZfvVtWGvl', '2024-06-10 09:39:05', '2024-06-10 09:39:05'),
(914, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 90.36, 89.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '3l4JSZ3sX2wM', '2024-06-10 09:39:17', '2024-06-10 09:39:17'),
(915, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1313.56, 1312.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'mDdfo3gWaauE', '2024-06-10 09:40:09', '2024-06-10 09:40:09'),
(916, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 89.36, 88.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'OnTwlK5bXODw', '2024-06-10 09:42:18', '2024-06-10 09:42:18'),
(917, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1312.56, 1311.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'xtiYlufoWd0E', '2024-06-10 09:50:56', '2024-06-10 09:50:56'),
(918, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 88.36, 87.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'HOaBjOqeB8J4', '2024-06-10 09:50:56', '2024-06-10 09:50:56'),
(919, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1311.56, 1310.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'F6CyrjUc6sPo', '2024-06-10 09:52:36', '2024-06-10 09:52:36'),
(920, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 87.36, 86.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'MD9Lu3bCgegq', '2024-06-10 09:52:37', '2024-06-10 09:52:37'),
(921, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 86.36, 85.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'CacrycxDSs6V', '2024-06-10 09:53:30', '2024-06-10 09:53:30'),
(922, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1310.56, 1309.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'HF46c02CPSkl', '2024-06-10 09:53:36', '2024-06-10 09:53:36'),
(923, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 85.36, 84.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '5NEjj3zHQ90L', '2024-06-10 09:54:45', '2024-06-10 09:54:45'),
(924, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1309.56, 1308.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'CizyH727GNuE', '2024-06-10 09:54:49', '2024-06-10 09:54:49'),
(925, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 84.36, 83.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'lffj5oXHw7Rz', '2024-06-10 09:58:49', '2024-06-10 09:58:49'),
(926, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1308.56, 1307.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'BTCUWc6rlgSL', '2024-06-10 09:58:53', '2024-06-10 09:58:53'),
(927, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 83.36, 82.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'dC7uJgOGoV7G', '2024-06-10 10:01:41', '2024-06-10 10:01:41'),
(928, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1307.56, 1306.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'SVLuR0hUYcp1', '2024-06-10 10:01:43', '2024-06-10 10:01:43'),
(929, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 82.36, 81.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'BzYinoMDjghx', '2024-06-10 10:03:23', '2024-06-10 10:03:23'),
(930, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1306.56, 1305.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '7TUMHtpuPA0V', '2024-06-10 10:03:41', '2024-06-10 10:03:41'),
(931, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1305.56, 1304.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'YgCs90UTZJfA', '2024-06-10 10:04:22', '2024-06-10 10:04:22'),
(932, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 81.36, 80.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '6IJOFM1vDdaX', '2024-06-10 10:04:22', '2024-06-10 10:04:22'),
(933, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 80.36, 81.36, 'inc', 'Done', NULL, '45.249.9.124', 'BwXp4Ab31Mhd', '2024-06-10 10:04:56', '2024-06-10 10:04:56'),
(934, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 81.36, 80.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'gK9qUhdhUlC2', '2024-06-10 10:05:03', '2024-06-10 10:05:03'),
(935, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1304.56, 1303.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ZEJjOARlQr6q', '2024-06-10 10:05:47', '2024-06-10 10:05:47'),
(936, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 80.36, 79.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'j98pqx2miYC5', '2024-06-10 10:05:59', '2024-06-10 10:05:59'),
(937, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 79.36, 78.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '21HmuF7CyrTE', '2024-06-10 10:07:26', '2024-06-10 10:07:26'),
(938, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1303.56, 1302.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Gej0UCpEilAO', '2024-06-10 10:07:29', '2024-06-10 10:07:29'),
(939, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1302.56, 1301.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ONBE8LcDpJnR', '2024-06-10 10:09:39', '2024-06-10 10:09:39'),
(940, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 78.36, 77.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'mWG3F6AlJi0Z', '2024-06-10 10:09:42', '2024-06-10 10:09:42'),
(941, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1301.56, 1300.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'D5nQlMMLavTU', '2024-06-10 10:11:03', '2024-06-10 10:11:03'),
(942, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 77.36, 76.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Vht8dUCirQHS', '2024-06-10 10:11:08', '2024-06-10 10:11:08'),
(943, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1300.56, 1299.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Dmglg1hf4KRM', '2024-06-10 10:12:42', '2024-06-10 10:12:42'),
(944, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 76.36, 75.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '8AoC9fnzRnwF', '2024-06-10 10:12:43', '2024-06-10 10:12:43'),
(945, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1299.56, 1298.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'lJqJe2w2aI54', '2024-06-10 10:17:36', '2024-06-10 10:17:36'),
(946, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 75.36, 74.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'pAw4zhjhrLQC', '2024-06-10 10:17:36', '2024-06-10 10:17:36'),
(947, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1298.56, 1297.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'YxKFakaly5jP', '2024-06-10 10:18:17', '2024-06-10 10:18:17'),
(948, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 74.36, 73.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'NFAl7Gye4Ye7', '2024-06-10 10:18:24', '2024-06-10 10:18:24'),
(949, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 73.36, 72.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'kRMK1AvpYGZ4', '2024-06-10 10:18:54', '2024-06-10 10:18:54'),
(950, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1297.56, 1296.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'A04Y0wZufYEi', '2024-06-10 10:18:58', '2024-06-10 10:18:58'),
(951, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 72.36, 71.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '19qv9PhXhSx8', '2024-06-10 10:33:57', '2024-06-10 10:33:57'),
(952, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1296.56, 1295.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'YqnMnRBvIsRf', '2024-06-10 10:41:22', '2024-06-10 10:41:22'),
(953, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 71.36, 70.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'rU9zLptZZAuj', '2024-06-10 10:47:32', '2024-06-10 10:47:32'),
(954, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1295.56, 1294.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'aOQnCPdVY5rk', '2024-06-10 10:47:37', '2024-06-10 10:47:37'),
(955, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1294.56, 1293.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'rWsVuPJq9pMa', '2024-06-10 10:48:15', '2024-06-10 10:48:15'),
(956, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 70.36, 69.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ONMLllAWDj8q', '2024-06-10 10:48:16', '2024-06-10 10:48:16'),
(957, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 12, 'wallet_2', 0.02, 0.02, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'UdDzIHk6JjKE', '2024-06-11 02:08:18', '2024-06-11 02:08:18'),
(958, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 0.98, 2.04, 1.06, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'mJNJnKpZX3ex', '2024-06-11 02:08:18', '2024-06-11 02:08:18'),
(959, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1293.56, 1292.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'sGYtvX4Ds82Q', '2024-06-11 02:08:47', '2024-06-11 02:08:47'),
(960, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 1.06, 0.06, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'TzWtigRFPWeV', '2024-06-11 02:11:44', '2024-06-11 02:11:44'),
(961, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1292.56, 1291.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'iGAqjQA2cLzE', '2024-06-11 02:11:52', '2024-06-11 02:11:52'),
(962, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1291.56, 1290.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'GQZ1eWB5E4SF', '2024-06-11 02:15:33', '2024-06-11 02:15:33'),
(963, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1290.56, 1289.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'dhUA3GnCIvZh', '2024-06-11 02:20:12', '2024-06-11 02:20:12'),
(964, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1289.56, 1290.56, 'inc', 'Done', NULL, '45.249.9.124', 'g4qoyWtLphDu', '2024-06-11 02:20:20', '2024-06-11 02:20:20'),
(965, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 50.00, 0.06, 50.06, 'inc', 'Done', NULL, '45.249.9.124', 'jGgwNEkUFtMU', '2024-06-11 02:23:10', '2024-06-11 02:23:10'),
(966, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 50.06, 49.06, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '5M0YkilxfMq6', '2024-06-11 02:24:54', '2024-06-11 02:24:54'),
(967, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 69.36, 68.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ZoulrjGbvbIp', '2024-06-11 02:27:46', '2024-06-11 02:27:46'),
(968, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 49.06, 39.06, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'm8XmH75eH0ua', '2024-06-11 02:30:06', '2024-06-11 02:30:06'),
(969, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 39.06, 49.06, 'inc', 'Done', NULL, '45.249.9.124', '4BB1ehI8ORWx', '2024-06-11 02:32:57', '2024-06-11 02:32:57'),
(970, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 49.06, 39.06, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'yJDoBHYwmPCL', '2024-06-11 02:36:13', '2024-06-11 02:36:13'),
(971, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 39.06, 49.06, 'inc', 'Done', NULL, '45.249.9.124', 'U0V8kAgWcmIu', '2024-06-11 02:40:23', '2024-06-11 02:40:23'),
(972, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 49.06, 39.06, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'GetRqlbffajx', '2024-06-11 02:40:46', '2024-06-11 02:40:46'),
(973, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 39.06, 49.06, 'inc', 'Done', NULL, '45.249.9.124', 'ltsFNxowFWnf', '2024-06-11 02:43:58', '2024-06-11 02:43:58'),
(974, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 49.06, 39.06, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'IlWX1VDi724i', '2024-06-11 02:44:09', '2024-06-11 02:44:09'),
(975, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 39.06, 49.06, 'inc', 'Done', NULL, '45.249.9.124', 'a0Rr2TsrzMAD', '2024-06-11 02:44:17', '2024-06-11 02:44:17'),
(976, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 49.06, 39.06, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'izytFSzw8w1w', '2024-06-11 02:47:05', '2024-06-11 02:47:05'),
(977, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 39.06, 49.06, 'inc', 'Done', NULL, '45.249.9.124', 'ka5PyAhXSjMm', '2024-06-11 02:47:07', '2024-06-11 02:47:07'),
(978, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1290.56, 1289.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'p54POdiw1wnt', '2024-06-11 05:17:34', '2024-06-11 05:17:34'),
(979, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 68.36, 67.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '1pEMvfBqo6lo', '2024-06-11 05:17:49', '2024-06-11 05:17:49'),
(980, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.00, 0.58, 0.58, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '45.249.9.124', 'ddq9jUm8APav', '2024-06-11 05:20:21', '2024-06-11 05:20:21'),
(981, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.78, 1289.56, 1291.34, 'inc', 'Done', 'Winning Challenge:  from test', '45.249.9.124', 'zLsxQiFWgRsk', '2024-06-11 05:20:21', '2024-06-11 05:20:21'),
(982, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.22, 86.82, 87.04, 'inc', 'Done', 'Challenge: Attempt By: test, Brent Satterfield DDS', '45.249.9.124', 'L4PaoueFY8Gf', '2024-06-11 05:20:21', '2024-06-11 05:20:21'),
(983, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.00, 0.58, 0.58, 'inc', 'Done', 'Challenge: Attempt By: test, Mohsin Tariq', '45.249.9.124', 'eWLA0Svvp2iY', '2024-06-11 05:21:04', '2024-06-11 05:21:04'),
(984, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.78, 49.06, 50.84, 'inc', 'Done', 'Winning Challenge:  from test', '45.249.9.124', 'iVAgzPmCrBqA', '2024-06-11 05:21:04', '2024-06-11 05:21:04'),
(985, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.22, 87.04, 87.26, 'inc', 'Done', 'Challenge: Attempt By: test, Mohsin Tariq', '45.249.9.124', 'VGTEGuN0sI6K', '2024-06-11 05:21:04', '2024-06-11 05:21:04'),
(986, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 25, 'wallet_2', 0.00, 0.00, 0.00, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'PPgaBBhsQLPP', '2024-06-11 05:21:25', '2024-06-11 05:21:25'),
(987, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.78, 50.84, 52.62, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'nyTz2QIalDVi', '2024-06-11 05:21:25', '2024-06-11 05:21:25'),
(988, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.22, 87.26, 87.48, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'M7mpKQmeU1nb', '2024-06-11 05:21:25', '2024-06-11 05:21:25'),
(989, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1291.34, 1290.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'qLzruvQG96FJ', '2024-06-11 05:22:23', '2024-06-11 05:22:23'),
(990, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 67.36, 66.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'dsVBLRCWpCTw', '2024-06-11 05:22:24', '2024-06-11 05:22:24'),
(991, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1290.34, 1289.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '35IBcfeC2pJe', '2024-06-11 05:27:47', '2024-06-11 05:27:47'),
(992, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 66.36, 65.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'v7sbqtpUwHjh', '2024-06-11 05:28:05', '2024-06-11 05:28:05'),
(993, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 65.36, 64.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'i0w48GLamWwr', '2024-06-11 05:30:33', '2024-06-11 05:30:33'),
(994, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1289.34, 1288.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '3BnN1kEglpNC', '2024-06-11 05:30:43', '2024-06-11 05:30:43'),
(995, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1288.34, 1287.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '9S40AooWcoA8', '2024-06-11 05:32:40', '2024-06-11 05:32:40'),
(996, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 64.36, 63.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'qBQWiIHVhKRT', '2024-06-11 05:32:41', '2024-06-11 05:32:41'),
(997, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1287.34, 1286.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'o7gwY88LQDBQ', '2024-06-11 05:35:43', '2024-06-11 05:35:43'),
(998, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 63.36, 62.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'TiQvTAIEVJKo', '2024-06-11 05:35:45', '2024-06-11 05:35:45'),
(999, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1286.34, 1285.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'KEGNWxKhL4zE', '2024-06-11 05:37:03', '2024-06-11 05:37:03'),
(1000, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 62.36, 61.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'p6BlgiShkItQ', '2024-06-11 05:37:14', '2024-06-11 05:37:14'),
(1001, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1285.34, 1284.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'yUMqrWFU0KQQ', '2024-06-11 05:50:22', '2024-06-11 05:50:22'),
(1002, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 61.36, 60.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'JbEAl7I6TQrf', '2024-06-11 05:50:28', '2024-06-11 05:50:28'),
(1003, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1284.34, 1283.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.54.168', 'JP0qOkr5DHKA', '2024-06-12 03:01:01', '2024-06-12 03:01:01'),
(1004, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 60.36, 59.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '124.29.220.229', '24fA47G1WIZv', '2024-06-12 03:01:11', '2024-06-12 03:01:11'),
(1005, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 59.36, 58.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '124.29.220.229', 'WedWd8wnkTaE', '2024-06-12 03:01:11', '2024-06-12 03:01:11'),
(1006, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1283.34, 1282.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.54.168', 'VYA93D4Nwu1i', '2024-06-12 03:02:01', '2024-06-12 03:02:01'),
(1007, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 58.36, 48.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '124.29.220.229', 'jQtKIjQnLPt0', '2024-06-12 03:02:13', '2024-06-12 03:02:13'),
(1008, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 48.36, 38.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '124.29.220.229', 'YZ545fDS5nHY', '2024-06-12 03:02:13', '2024-06-12 03:02:13'),
(1009, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1282.34, 1281.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.54.168', 'Iy4JrSJlVX29', '2024-06-12 03:02:51', '2024-06-12 03:02:51'),
(1010, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 38.36, 48.36, 'inc', 'Done', NULL, '124.29.220.229', 'CYBxEUGoKl6M', '2024-06-12 03:03:06', '2024-06-12 03:03:06'),
(1011, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 48.36, 47.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '124.29.220.229', 'JCZXJEiKwxVa', '2024-06-12 03:03:16', '2024-06-12 03:03:16'),
(1012, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1281.34, 1280.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.80.54.168', '9P4bVme84csS', '2024-06-12 03:04:07', '2024-06-12 03:04:07'),
(1013, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1280.34, 1279.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'fppf0I5Uyuyb', '2024-06-12 04:07:02', '2024-06-12 04:07:02'),
(1014, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1279.34, 1280.34, 'inc', 'Done', NULL, '45.249.9.124', 'JfNdq3DxokP3', '2024-06-12 04:07:13', '2024-06-12 04:07:13'),
(1015, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1280.34, 1281.34, 'inc', 'Done', NULL, '45.249.9.124', '44aLNkmxNAhm', '2024-06-12 05:36:24', '2024-06-12 05:36:24'),
(1016, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1281.34, 1282.34, 'inc', 'Done', NULL, '45.249.9.124', 'iCnSJqcKab0t', '2024-06-12 05:36:42', '2024-06-12 05:36:42'),
(1017, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1282.34, 1281.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'dzPdYH7YZ0QX', '2024-06-12 06:26:10', '2024-06-12 06:26:10'),
(1018, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 47.36, 46.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'SR6t5z0NFnPA', '2024-06-12 06:27:44', '2024-06-12 06:27:44'),
(1019, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 46.36, 45.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'AFDe2boOqwqw', '2024-06-12 06:27:44', '2024-06-12 06:27:44'),
(1020, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 45.36, 44.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'L44YJjg9wbJJ', '2024-06-12 06:29:07', '2024-06-12 06:29:07'),
(1021, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1281.34, 1280.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'zUHAa5iJAyGr', '2024-06-12 06:29:10', '2024-06-12 06:29:10'),
(1022, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 44.36, 43.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'f58Ikabn5IoN', '2024-06-12 06:35:29', '2024-06-12 06:35:29'),
(1023, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1280.34, 1279.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ukEsx22g0rkR', '2024-06-12 06:35:35', '2024-06-12 06:35:35'),
(1024, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 43.36, 42.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'R1GZ2mIxOHa2', '2024-06-12 06:38:34', '2024-06-12 06:38:34'),
(1025, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1279.34, 1278.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Z9ZhnMHApQHM', '2024-06-12 06:38:50', '2024-06-12 06:38:50'),
(1026, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 42.36, 41.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'xa15qHoVjIle', '2024-06-12 06:41:17', '2024-06-12 06:41:17'),
(1027, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1278.34, 1277.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '18IvpLw1M6cq', '2024-06-12 06:41:34', '2024-06-12 06:41:34'),
(1028, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1277.34, 1276.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'u38EDokMFZYb', '2024-06-12 06:47:42', '2024-06-12 06:47:42'),
(1029, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 41.36, 40.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'gNIPC2bXICS6', '2024-06-12 06:47:42', '2024-06-12 06:47:42'),
(1030, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1276.34, 1275.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '4Dy6jlZ1ynVj', '2024-06-12 06:55:59', '2024-06-12 06:55:59'),
(1031, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1275.34, 1274.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ZLt1DLfKvxa3', '2024-06-12 06:56:27', '2024-06-12 06:56:27'),
(1032, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1274.34, 1264.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'qhItBMO2rz0z', '2024-06-12 06:57:14', '2024-06-12 06:57:14'),
(1033, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 40.36, 41.36, 'inc', 'Done', NULL, '45.249.9.124', 'PMmKFbj4tt82', '2024-06-12 06:58:47', '2024-06-12 06:58:47'),
(1034, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 41.36, 40.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'AJFQg3LZkkgi', '2024-06-12 06:58:54', '2024-06-12 06:58:54'),
(1035, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 40.36, 41.36, 'inc', 'Done', NULL, '45.249.9.124', 'p5DcIeHKRMXW', '2024-06-12 06:58:59', '2024-06-12 06:58:59'),
(1036, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1264.34, 1274.34, 'inc', 'Done', NULL, '45.249.9.124', 'o4eV7vYlNwo8', '2024-06-12 06:59:36', '2024-06-12 06:59:36'),
(1037, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1274.34, 1273.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'b82j13X6tufB', '2024-06-12 06:59:44', '2024-06-12 06:59:44'),
(1038, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 41.36, 40.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'tkOJG3AR2K78', '2024-06-12 06:59:57', '2024-06-12 06:59:57'),
(1039, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1273.34, 1272.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'VLg8l87gLgc0', '2024-06-12 07:04:26', '2024-06-12 07:04:26'),
(1040, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 40.36, 39.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'PLxbPRRIVVsE', '2024-06-12 07:04:26', '2024-06-12 07:04:26'),
(1041, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 39.36, 38.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Kk9JFgeE1j3W', '2024-06-12 07:06:00', '2024-06-12 07:06:00'),
(1042, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1272.34, 1271.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'R8JIQAjyJtQ5', '2024-06-12 07:06:08', '2024-06-12 07:06:08'),
(1043, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 38.36, 37.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'HOa4BCG0YMz4', '2024-06-12 07:07:34', '2024-06-12 07:07:34'),
(1044, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 52.62, 51.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '6yytEp7Vaz4A', '2024-06-12 07:07:45', '2024-06-12 07:07:45'),
(1045, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1271.34, 1270.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'sQ41FsF5iVv9', '2024-06-12 07:08:00', '2024-06-12 07:08:00'),
(1046, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 51.62, 50.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '8aP1KMmdIykV', '2024-06-12 07:10:06', '2024-06-12 07:10:06'),
(1047, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1270.34, 1269.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'zlcqdnxmgOYX', '2024-06-12 07:10:10', '2024-06-12 07:10:10'),
(1048, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 50.62, 49.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'kmolS3CK2SNE', '2024-06-12 07:12:46', '2024-06-12 07:12:46'),
(1049, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1269.34, 1268.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'SnZ9Q6Dyc6gY', '2024-06-12 07:13:39', '2024-06-12 07:13:39'),
(1050, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 49.62, 48.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'F0kowqC1aXMk', '2024-06-12 07:20:01', '2024-06-12 07:20:01'),
(1051, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1268.34, 1267.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '6QQiPbYLvqob', '2024-06-12 07:20:18', '2024-06-12 07:20:18'),
(1052, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 48.62, 47.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'wx8DMGxR6dRL', '2024-06-12 07:32:50', '2024-06-12 07:32:50'),
(1053, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1267.34, 1266.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'HC5Vf3vLtAd7', '2024-06-12 07:38:05', '2024-06-12 07:38:05'),
(1054, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 47.62, 46.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'iVbGURkb1oje', '2024-06-12 07:46:16', '2024-06-12 07:46:16'),
(1055, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1266.34, 1265.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'vySMSN2FpPv8', '2024-06-12 07:46:25', '2024-06-12 07:46:25'),
(1056, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1265.34, 1264.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'nVwq94GCjXI1', '2024-06-13 04:29:34', '2024-06-13 04:29:34'),
(1057, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1264.34, 1265.34, 'inc', 'Done', NULL, '45.249.9.124', 'CpeHYdg8gdvb', '2024-06-13 04:29:40', '2024-06-13 04:29:40'),
(1058, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1265.34, 1264.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'OSZVr7fyXAWI', '2024-06-13 05:49:18', '2024-06-13 05:49:18'),
(1059, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 37.36, 36.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'H0LcBugGwIPG', '2024-06-13 05:49:21', '2024-06-13 05:49:21'),
(1060, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1264.34, 1263.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 's8Ysudpj6cdO', '2024-06-13 05:50:41', '2024-06-13 05:50:41'),
(1061, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 36.36, 35.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'RoW8ruKk9s12', '2024-06-13 05:50:42', '2024-06-13 05:50:42'),
(1062, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 35.36, 34.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'vebRQ1dR0sLl', '2024-06-13 05:51:52', '2024-06-13 05:51:52'),
(1063, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1263.34, 1262.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'iqCKAwEaSFSI', '2024-06-13 05:51:59', '2024-06-13 05:51:59'),
(1064, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 46.62, 45.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'hrIYgBtZQraS', '2024-06-13 05:53:01', '2024-06-13 05:53:01'),
(1065, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 34.36, 33.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '7Nx9jVu5Lp40', '2024-06-13 05:53:05', '2024-06-13 05:53:05'),
(1066, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1262.34, 1261.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Xf7yIYWrR19k', '2024-06-13 05:54:04', '2024-06-13 05:54:04'),
(1067, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 33.36, 32.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'A5hbI5HT9jG6', '2024-06-13 06:04:04', '2024-06-13 06:04:04'),
(1068, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 45.62, 44.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '1Lqex3aCorMK', '2024-06-13 06:06:33', '2024-06-13 06:06:33'),
(1069, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 32.36, 31.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'SHNBZ47zb2dl', '2024-06-13 06:06:39', '2024-06-13 06:06:39'),
(1070, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1261.34, 1260.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'enqDgpHnef8r', '2024-06-13 06:06:46', '2024-06-13 06:06:46'),
(1071, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 44.62, 43.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '0dRnX8VSVBhY', '2024-06-13 06:09:11', '2024-06-13 06:09:11'),
(1072, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 43.62, 42.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Uxx9PYlXjiBT', '2024-06-13 06:11:16', '2024-06-13 06:11:16'),
(1073, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 31.36, 30.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ONUnD5cLEGL8', '2024-06-13 06:11:18', '2024-06-13 06:11:18'),
(1074, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 30.36, 29.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '5fX0J9bTrvzR', '2024-06-13 06:12:25', '2024-06-13 06:12:25'),
(1075, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 42.62, 41.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'iM4yV4io36hS', '2024-06-13 06:12:25', '2024-06-13 06:12:25'),
(1076, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 41.62, 40.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ERcyo50FCAuF', '2024-06-13 06:15:24', '2024-06-13 06:15:24'),
(1077, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 29.36, 28.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'RveF4Y8LSyIw', '2024-06-13 06:15:50', '2024-06-13 06:15:50'),
(1078, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1260.34, 1259.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'BXaYn0XqjmGk', '2024-06-13 06:34:59', '2024-06-13 06:34:59'),
(1079, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 28.36, 27.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'hK1uoJ8ofzBE', '2024-06-13 06:35:15', '2024-06-13 06:35:15'),
(1080, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1259.34, 1258.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'DhYa7f2epk8t', '2024-06-13 06:47:38', '2024-06-13 06:47:38'),
(1081, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 27.36, 26.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'fRFApNLos5NR', '2024-06-13 06:47:38', '2024-06-13 06:47:38'),
(1082, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 26.36, 27.36, 'inc', 'Done', NULL, '45.249.9.124', 'UeEpFBNLbCqx', '2024-06-13 06:48:06', '2024-06-13 06:48:06'),
(1083, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 27.36, 26.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ckBV0fhbC9e2', '2024-06-13 06:48:23', '2024-06-13 06:48:23'),
(1084, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 26.36, 25.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'guXwpyIt5nHY', '2024-06-13 06:49:54', '2024-06-13 06:49:54'),
(1085, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1258.34, 1257.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'S1rCmk26x7C3', '2024-06-13 06:49:54', '2024-06-13 06:49:54'),
(1086, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1257.34, 1256.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'bQyPfQXAaZsa', '2024-06-13 06:51:37', '2024-06-13 06:51:37'),
(1087, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 25.36, 24.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'Ce48Dkbmrhcs', '2024-06-13 06:51:37', '2024-06-13 06:51:37'),
(1088, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 1.00, 1256.34, 1255.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'E0mS31RTPdrb', '2024-06-13 06:52:52', '2024-06-13 06:52:52'),
(1089, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 1.00, 24.36, 23.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'NvMYteIfZnZr', '2024-06-13 06:53:13', '2024-06-13 06:53:13'),
(1090, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 19, 'wallet_1', 1.00, 18.80, 17.80, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '116.71.179.192', 'rA3v8kXd7MtT', '2024-06-14 12:54:35', '2024-06-14 12:54:35'),
(1091, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 19, 'wallet_1', 10.00, 17.80, 7.80, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '116.71.179.192', 'AvuVFh2b2j16', '2024-06-14 13:05:04', '2024-06-14 13:05:04'),
(1092, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 19, 'wallet_1', 1.00, 7.80, 6.80, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '116.71.179.192', '8OgOH1AivAp6', '2024-06-14 13:18:27', '2024-06-14 13:18:27'),
(1093, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 26, 'wallet_1', 1.00, 0.00, 1.00, 'inc', 'Done', NULL, '45.249.9.124', 'pzHWw9nxates', '2024-06-14 13:58:25', '2024-06-14 13:58:25'),
(1094, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 26, 'wallet_1', 1.00, 1.00, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'HTTJAYj6j9TI', '2024-06-14 14:13:02', '2024-06-14 14:13:02'),
(1095, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 26, 'wallet_1', 1.00, 0.00, 1.00, 'inc', 'Done', NULL, '45.249.9.124', 'Nfyqo6SWr5sv', '2024-06-14 14:14:20', '2024-06-14 14:14:20'),
(1096, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 26, 'wallet_1', 1.00, 1.00, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'mKDBcvJzS3HK', '2024-06-14 14:14:47', '2024-06-14 14:14:47'),
(1097, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 40.62, 39.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'NYU5cXgM6cVl', '2024-06-14 14:15:19', '2024-06-14 14:15:19');
INSERT INTO `wallets_logs` (`id`, `loggable_type`, `loggable_id`, `wallet_name`, `value`, `from`, `to`, `type`, `status`, `notes`, `ip`, `reference`, `created_at`, `updated_at`) VALUES
(1098, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 26, 'wallet_1', 1.00, 0.00, 1.00, 'inc', 'Done', NULL, '45.249.9.124', 'MThjHN1EGwB9', '2024-06-14 14:15:29', '2024-06-14 14:15:29'),
(1099, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 26, 'wallet_1', 1.00, 1.00, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ZGXBLYerIR1B', '2024-06-14 14:15:32', '2024-06-14 14:15:32'),
(1100, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 39.62, 38.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'rkEiVzEsU7Ot', '2024-06-14 14:16:05', '2024-06-14 14:16:05'),
(1101, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 38.62, 37.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'NuslxpsoP1Pi', '2024-06-14 14:17:29', '2024-06-14 14:17:29'),
(1102, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 37.62, 36.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'doaRKo9IzCUi', '2024-06-14 14:18:38', '2024-06-14 14:18:38'),
(1103, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 36.62, 35.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'qJWfrEhaklgt', '2024-06-14 14:19:22', '2024-06-14 14:19:22'),
(1104, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 35.62, 36.62, 'inc', 'Done', NULL, '45.249.9.124', 'phVaDA0kKKqS', '2024-06-14 14:20:06', '2024-06-14 14:20:06'),
(1105, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 26, 'wallet_1', 100.00, 0.00, 100.00, 'inc', 'Done', NULL, '45.249.9.124', 'Gb72IGLdbEjM', '2024-06-14 14:24:23', '2024-06-14 14:24:23'),
(1106, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 26, 'wallet_1', 1.00, 100.00, 99.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'TVDclKTwi8j1', '2024-06-14 14:24:26', '2024-06-14 14:24:26'),
(1107, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 36.62, 35.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ap9wZyTLM5Za', '2024-06-14 14:24:31', '2024-06-14 14:24:31'),
(1108, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 26, 'wallet_1', 1.00, 99.00, 98.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '3hFAp7YXxzoR', '2024-06-14 14:27:48', '2024-06-14 14:27:48'),
(1109, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 35.62, 34.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'SwYYoZD5pvzg', '2024-06-14 14:27:55', '2024-06-14 14:27:55'),
(1110, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 1.00, 34.62, 33.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', '9sJwD6fpnVij', '2024-06-14 14:29:12', '2024-06-14 14:29:12'),
(1111, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 26, 'wallet_1', 1.00, 98.00, 97.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '45.249.9.124', 'ZD9QaN8pHe6l', '2024-06-14 14:29:12', '2024-06-14 14:29:12'),
(1112, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 21, 'wallet_1', 1.00, 1.78, 0.78, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'K9JktFpbJWmx', '2024-06-14 16:30:50', '2024-06-14 16:30:50'),
(1113, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 1.00, 95.46, 94.46, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'hv0aA5roSHPh', '2024-06-14 16:30:51', '2024-06-14 16:30:51'),
(1114, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.00, 0.58, 0.58, 'inc', 'Done', 'Challenge: Attempt By: Challe Corporation, Build it', '87.253.57.203', '38MTCpIn2PV5', '2024-06-14 16:32:28', '2024-06-14 16:32:28'),
(1115, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 21, 'wallet_1', 1.78, 0.78, 2.56, 'inc', 'Done', 'Winning Challenge:  from Challe Corporation', '87.253.57.203', 'DqqHtr7jfyZg', '2024-06-14 16:32:28', '2024-06-14 16:32:28'),
(1116, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.22, 87.48, 87.70, 'inc', 'Done', 'Challenge: Attempt By: Challe Corporation, Build it', '87.253.57.203', '8weHChtcGa82', '2024-06-14 16:32:28', '2024-06-14 16:32:28'),
(1117, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 21, 'wallet_1', 1.00, 2.56, 1.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'Bnb5vL6OVWes', '2024-06-14 16:35:55', '2024-06-14 16:35:55'),
(1118, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 1.00, 94.46, 93.46, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'VJM26dT1izyO', '2024-06-14 16:35:58', '2024-06-14 16:35:58'),
(1119, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 1000.00, 0.00, 1000.00, 'inc', 'Done', NULL, '154.208.60.11', 'JueuqnhwWtsy', '2024-06-16 04:21:00', '2024-06-16 04:21:00'),
(1120, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 1000.00, 0.00, 1000.00, 'inc', 'Done', NULL, '154.208.60.11', 'pICpJaJjWMil', '2024-06-16 04:21:54', '2024-06-16 04:21:54'),
(1121, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 1000.00, 1000.00, 0.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 7', '154.208.60.11', 'nyAVIvLwdnj9', '2024-06-16 04:22:07', '2024-06-16 04:22:07'),
(1122, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 1000.00, 0.00, 1000.00, 'inc', 'Done', NULL, '154.208.60.11', 'R4Y5P9v8pyWG', '2024-06-16 04:22:26', '2024-06-16 04:22:26'),
(1123, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 10.00, 1000.00, 990.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '154.208.60.11', '3CWYXeqg8bPP', '2024-06-16 04:22:33', '2024-06-16 04:22:33'),
(1124, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 10.00, 1000.00, 990.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '154.208.60.11', '26ugnsxNkHG0', '2024-06-16 04:22:47', '2024-06-16 04:22:47'),
(1125, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 10.00, 990.00, 980.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '154.208.60.11', 'FlaUX4KakMCx', '2024-06-16 04:32:13', '2024-06-16 04:32:13'),
(1126, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 10.00, 990.00, 980.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '154.208.60.11', 'QYJ6QnCh5EsP', '2024-06-16 04:32:48', '2024-06-16 04:32:48'),
(1127, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 10.00, 980.00, 970.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '154.208.60.11', 'OvxVoQnXLBSS', '2024-06-16 04:37:19', '2024-06-16 04:37:19'),
(1128, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 10.00, 980.00, 970.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '154.208.60.11', '1Ucm1EqI5ZKx', '2024-06-16 04:37:20', '2024-06-16 04:37:20'),
(1129, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 10.00, 970.00, 980.00, 'inc', 'Done', NULL, '154.208.60.11', 'zQWvnlQgyPss', '2024-06-16 04:37:35', '2024-06-16 04:37:35'),
(1130, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 10.00, 980.00, 970.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '154.208.60.11', 'UoLATmMloOYt', '2024-06-16 04:38:14', '2024-06-16 04:38:14'),
(1131, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 10.00, 970.00, 960.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '154.208.60.11', 'JUhwVg6MxR1K', '2024-06-16 04:45:09', '2024-06-16 04:45:09'),
(1132, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 10.00, 970.00, 960.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '154.208.60.11', 'zRHFuRK5xOMf', '2024-06-16 04:45:13', '2024-06-16 04:45:13'),
(1133, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 1.00, 960.00, 959.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', '10L0fbHmrP4j', '2024-06-16 04:49:29', '2024-06-16 04:49:29'),
(1134, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 1.00, 960.00, 959.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'WHNFE4iaJqlu', '2024-06-16 04:49:35', '2024-06-16 04:49:35'),
(1135, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 1.00, 959.00, 958.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'dP2hzYbZrpfi', '2024-06-16 04:55:49', '2024-06-16 04:55:49'),
(1136, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 1.00, 959.00, 958.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', '3b538J25bOXL', '2024-06-16 04:56:12', '2024-06-16 04:56:12'),
(1137, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 1.00, 958.00, 957.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'F3HTlcQ0wJnQ', '2024-06-16 05:00:06', '2024-06-16 05:00:06'),
(1138, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 1.00, 958.00, 957.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'sgn4VIFHZvgu', '2024-06-16 05:00:25', '2024-06-16 05:00:25'),
(1139, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 1.00, 957.00, 956.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'AtfQCgGEmXWZ', '2024-06-16 05:03:00', '2024-06-16 05:03:00'),
(1140, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 1.00, 957.00, 956.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'snBaBBHwz2Th', '2024-06-16 05:03:06', '2024-06-16 05:03:06'),
(1141, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 1.00, 956.00, 957.00, 'inc', 'Done', NULL, '154.208.60.11', 'hh74YcgaPPJZ', '2024-06-16 05:03:18', '2024-06-16 05:03:18'),
(1142, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 1.00, 957.00, 956.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'vVdE8iZRbhYN', '2024-06-16 05:03:26', '2024-06-16 05:03:26'),
(1143, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 1.00, 956.00, 955.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'rtMWHK2weHZv', '2024-06-16 05:06:49', '2024-06-16 05:06:49'),
(1144, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 1.00, 956.00, 955.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'colBFopIjD1c', '2024-06-16 05:07:36', '2024-06-16 05:07:36'),
(1145, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 1.00, 955.00, 954.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'bHL3PFQuUtNV', '2024-06-16 05:12:29', '2024-06-16 05:12:29'),
(1146, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 1.00, 955.00, 954.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'cQKOVIsYS43R', '2024-06-16 05:12:43', '2024-06-16 05:12:43'),
(1147, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 27, 'wallet_1', 1.00, 954.00, 953.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'NJGwLjWW41X2', '2024-06-16 05:13:29', '2024-06-16 05:13:29'),
(1148, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 28, 'wallet_1', 1.00, 954.00, 953.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '154.208.60.11', 'C30NJWL9PqlC', '2024-06-16 05:13:40', '2024-06-16 05:13:40'),
(1149, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 1.00, 93.46, 92.46, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'PVVS6KuJowvz', '2024-06-18 08:25:00', '2024-06-18 08:25:00'),
(1150, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 21, 'wallet_1', 1.00, 1.56, 0.56, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'pgzPZnrcSrXA', '2024-06-18 08:25:02', '2024-06-18 08:25:02'),
(1151, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 29, 'wallet_1', 1000.00, 0.00, 1000.00, 'inc', 'Done', NULL, '45.249.9.124', 'Adgbc7lAmtwO', '2024-06-24 11:28:18', '2024-06-24 11:28:18'),
(1152, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 29, 'wallet_1', 10.00, 1000.00, 990.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'aqNuMKGiZFtS', '2024-06-24 11:29:12', '2024-06-24 11:29:12'),
(1153, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 23.36, 13.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'Bw1yO3uwsqqc', '2024-06-24 11:29:13', '2024-06-24 11:29:13'),
(1154, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 29, 'wallet_1', 10.00, 990.00, 980.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'uReCSvlzgTkh', '2024-06-24 11:45:06', '2024-06-24 11:45:06'),
(1155, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 10, 'wallet_1', 10.00, 13.36, 3.36, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'nrpDaTcQcM0e', '2024-06-24 11:45:06', '2024-06-24 11:45:07'),
(1156, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 29, 'wallet_1', 10.00, 980.00, 970.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'ZNSF1vBZeRIC', '2024-06-25 07:47:15', '2024-06-25 07:47:15'),
(1157, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 29, 'wallet_1', 10.00, 970.00, 980.00, 'inc', 'Done', NULL, '45.249.9.124', 'bQWfbauQCt1q', '2024-06-25 08:04:02', '2024-06-25 08:04:02'),
(1158, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 30, 'wallet_1', 1000.00, 0.00, 1000.00, 'inc', 'Done', NULL, '45.249.9.124', 'rWYFU9aV9puB', '2024-06-25 08:04:32', '2024-06-25 08:04:32'),
(1159, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 29, 'wallet_1', 10.00, 980.00, 970.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'bsYMmhEDQNQN', '2024-06-25 08:04:47', '2024-06-25 08:04:47'),
(1160, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 30, 'wallet_1', 10.00, 1000.00, 990.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'N3IIViKEYw63', '2024-06-25 08:05:37', '2024-06-25 08:05:37'),
(1161, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 29, 'wallet_1', 10.00, 970.00, 960.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'eBbJP6ynp7vv', '2024-06-25 09:10:17', '2024-06-25 09:10:17'),
(1162, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 30, 'wallet_1', 10.00, 990.00, 980.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'GnlNn1OvouBS', '2024-06-25 09:26:30', '2024-06-25 09:26:30'),
(1163, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 29, 'wallet_1', 10.00, 960.00, 950.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', '6SBHH3w8Oib9', '2024-06-25 09:46:57', '2024-06-25 09:46:57'),
(1164, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 30, 'wallet_1', 10.00, 980.00, 970.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'h9Gy9i3dyWdm', '2024-06-25 09:46:57', '2024-06-25 09:46:57'),
(1165, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 30, 'wallet_1', 10.00, 970.00, 980.00, 'inc', 'Done', NULL, '45.249.9.124', 'lCa2suSNUCLZ', '2024-06-25 09:47:08', '2024-06-25 09:47:08'),
(1166, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 30, 'wallet_1', 10.00, 980.00, 970.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', '8touU0Ypzsij', '2024-06-25 09:47:35', '2024-06-25 09:47:35'),
(1167, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 29, 'wallet_1', 10.00, 950.00, 940.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'taH6BhCNIqfT', '2024-06-25 09:59:57', '2024-06-25 09:59:57'),
(1168, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 30, 'wallet_1', 10.00, 970.00, 960.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'Tv5UE4vtLOEM', '2024-06-25 10:00:25', '2024-06-25 10:00:25'),
(1169, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 33.62, 23.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'WtRV55bow7N3', '2024-06-25 10:25:37', '2024-06-25 10:25:37'),
(1170, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 23.62, 13.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'lcWetFIgzoRa', '2024-06-25 10:26:05', '2024-06-25 10:26:05'),
(1171, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 13.62, 23.62, 'inc', 'Done', NULL, '45.249.9.124', '6e58wDfeVLm4', '2024-06-25 10:26:10', '2024-06-25 10:26:10'),
(1172, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 23.62, 13.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'ADh8rZpVYput', '2024-06-25 10:26:19', '2024-06-25 10:26:19'),
(1173, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 13.62, 23.62, 'inc', 'Done', NULL, '45.249.9.124', 'Bb6G6q5DlfcH', '2024-06-25 10:26:21', '2024-06-25 10:26:21'),
(1174, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 23.62, 13.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'U53g7uNMWjUY', '2024-06-25 10:40:58', '2024-06-25 10:40:58'),
(1175, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 13.62, 23.62, 'inc', 'Done', NULL, '45.249.9.124', 'BBcdfsdtISpx', '2024-06-25 10:41:00', '2024-06-25 10:41:00'),
(1176, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 1.00, 92.46, 91.46, 'dec', 'Done', 'Paying Price of Starting Challenge: 6', '87.253.57.203', 'nrHd1PZ19Yqe', '2024-06-27 08:26:32', '2024-06-27 08:26:32'),
(1177, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 18, 'wallet_2', 0.00, 0.58, 0.58, 'inc', 'Done', 'Challenge: Attempt By: go, Challe Corporation', '87.253.57.203', 'FKHlKbnbHULg', '2024-06-27 08:34:03', '2024-06-27 08:34:03'),
(1178, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 1.78, 91.46, 93.24, 'inc', 'Done', 'Winning Challenge:  from go', '87.253.57.203', 'EARVwiTbQhVi', '2024-06-27 08:34:03', '2024-06-27 08:34:03'),
(1179, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 0.22, 87.70, 87.92, 'inc', 'Done', 'Challenge: Attempt By: go, Challe Corporation', '87.253.57.203', 'Rcgn1Oos8lis', '2024-06-27 08:34:03', '2024-06-27 08:34:03'),
(1180, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 23, 'wallet_1', 93.00, 93.24, 0.24, 'dec', 'Done', 'Amount Withdrawn', '87.253.57.203', '25KerxQd8zI9', '2024-06-27 08:37:00', '2024-06-27 08:37:00'),
(1181, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1255.34, 1245.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', '1NmTI5UTi9ng', '2024-06-28 06:42:26', '2024-06-28 06:42:26'),
(1182, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 23.62, 13.62, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'AHgzK3VNMAHW', '2024-06-28 06:42:51', '2024-06-28 06:42:51'),
(1183, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.00, 0.02, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'qWnkPLEDIlnY', '2024-06-28 06:48:20', '2024-06-28 06:48:20'),
(1184, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 13.62, 31.40, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'HlHGGPfcBAGo', '2024-06-28 06:48:20', '2024-06-28 06:48:20'),
(1185, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 87.92, 90.12, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'mNy5YS5PF0Ua', '2024-06-28 06:48:20', '2024-06-28 06:48:20'),
(1186, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 31.40, 21.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', '3z29o20AtLbE', '2024-06-28 06:49:49', '2024-06-28 06:49:49'),
(1187, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1245.34, 1235.34, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'teNzykSngClr', '2024-06-28 06:49:59', '2024-06-28 06:49:59'),
(1188, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.02, 0.04, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 't2FKM6IZVrBY', '2024-06-28 06:52:11', '2024-06-28 06:52:11'),
(1189, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 17.78, 1235.34, 1253.12, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '45.249.9.124', '4ZtS7CxRcqmi', '2024-06-28 06:52:11', '2024-06-28 06:52:11'),
(1190, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 90.12, 92.32, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 'x4DpMjeczXqG', '2024-06-28 06:52:11', '2024-06-28 06:52:11'),
(1191, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1253.12, 1243.12, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'WauLBbV6gNo5', '2024-06-28 06:53:31', '2024-06-28 06:53:31'),
(1192, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 21.40, 11.40, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'Zu28SaCM6eMo', '2024-06-28 06:53:33', '2024-06-28 06:53:33'),
(1193, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.04, 0.06, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', '0HIk0YYdJ1ZO', '2024-06-28 06:54:50', '2024-06-28 06:54:50'),
(1194, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 11.40, 29.18, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'D3AZSVCC68qh', '2024-06-28 06:54:50', '2024-06-28 06:54:50'),
(1195, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 92.32, 94.52, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'BW3phjpoA5Rf', '2024-06-28 06:54:50', '2024-06-28 06:54:50'),
(1196, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 29.18, 19.18, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'xwtPoU4mpYir', '2024-06-28 06:55:25', '2024-06-28 06:55:25'),
(1197, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1243.12, 1233.12, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'EJwuDnRpBFoR', '2024-06-28 06:55:26', '2024-06-28 06:55:26'),
(1198, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.06, 0.08, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'LNpsh8pJy9fd', '2024-06-28 06:56:17', '2024-06-28 06:56:17'),
(1199, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 19.18, 36.96, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'JpI18PskwRoD', '2024-06-28 06:56:17', '2024-06-28 06:56:17'),
(1200, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 94.52, 96.72, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'eIY5vQNZXNOP', '2024-06-28 06:56:17', '2024-06-28 06:56:17'),
(1201, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 36.96, 26.96, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', '4j2eCU934HVk', '2024-06-28 06:57:34', '2024-06-28 06:57:34'),
(1202, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1233.12, 1223.12, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'jJ8XiB4Ws7Ld', '2024-06-28 06:57:38', '2024-06-28 06:57:38'),
(1203, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.08, 0.10, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'rx0cNrAGWdLe', '2024-06-28 06:58:56', '2024-06-28 06:58:56'),
(1204, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 26.96, 44.74, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'GJJ61hMsBE8l', '2024-06-28 06:58:56', '2024-06-28 06:58:56'),
(1205, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 96.72, 98.92, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'Kk775A03Xt3D', '2024-06-28 06:58:56', '2024-06-28 06:58:56'),
(1206, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1223.12, 1213.12, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'NeUKE0u9aZWW', '2024-06-28 06:59:26', '2024-06-28 06:59:26'),
(1207, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 44.74, 34.74, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'mtnFdkBdMLTk', '2024-06-28 06:59:27', '2024-06-28 06:59:27'),
(1208, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.10, 0.12, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'jImGIM6XwcUt', '2024-06-28 07:00:27', '2024-06-28 07:00:27'),
(1209, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 34.74, 52.52, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'rIUWFTuG6fPp', '2024-06-28 07:00:27', '2024-06-28 07:00:27'),
(1210, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 98.92, 101.12, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'qS3J5eouHd31', '2024-06-28 07:00:27', '2024-06-28 07:00:27'),
(1211, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1213.12, 1203.12, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'vXlUf1U2vpvX', '2024-06-28 07:09:20', '2024-06-28 07:09:20'),
(1212, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1203.12, 1193.12, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'KczQCdRYyAI4', '2024-06-28 07:10:05', '2024-06-28 07:10:05'),
(1213, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1193.12, 1183.12, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'DTmKzYjfdkXj', '2024-06-28 07:11:24', '2024-06-28 07:11:24'),
(1214, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 52.52, 42.52, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', '6GdJJd6d3egR', '2024-06-28 07:11:38', '2024-06-28 07:11:38'),
(1215, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.12, 0.14, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'AaPOoeCSN6vV', '2024-06-28 07:12:48', '2024-06-28 07:12:48'),
(1216, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 42.52, 60.30, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'DowI10v5VGrP', '2024-06-28 07:12:48', '2024-06-28 07:12:48'),
(1217, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 101.12, 103.32, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', '29yPvBXWADLT', '2024-06-28 07:12:48', '2024-06-28 07:12:48'),
(1218, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 60.30, 50.30, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'nTO5gA92wjoR', '2024-06-28 07:13:07', '2024-06-28 07:13:07'),
(1219, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1183.12, 1173.12, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'LKlmIcokAXAx', '2024-06-28 07:13:12', '2024-06-28 07:13:12'),
(1220, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.14, 0.16, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'pX6Uw1LByhBN', '2024-06-28 07:14:22', '2024-06-28 07:14:22'),
(1221, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 50.30, 68.08, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'swER5rqgQ8pn', '2024-06-28 07:14:22', '2024-06-28 07:14:22'),
(1222, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 103.32, 105.52, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'A0ckOAb0Qfjn', '2024-06-28 07:14:22', '2024-06-28 07:14:22'),
(1223, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.16, 0.18, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'UAwbUB291Ocm', '2024-06-28 07:16:54', '2024-06-28 07:16:54'),
(1224, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 68.08, 85.86, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'wIq6xA4U2sOq', '2024-06-28 07:16:54', '2024-06-28 07:16:54'),
(1225, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 105.52, 107.72, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'T6sCIxpUh7N2', '2024-06-28 07:16:54', '2024-06-28 07:16:54'),
(1226, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.18, 0.20, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', '3XJ4awww8cb6', '2024-06-28 07:30:01', '2024-06-28 07:30:01'),
(1227, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 85.86, 103.64, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'dtfJMGLakqqJ', '2024-06-28 07:30:01', '2024-06-28 07:30:01'),
(1228, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 107.72, 109.92, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'CY4UtBNR0hGi', '2024-06-28 07:30:01', '2024-06-28 07:30:01'),
(1229, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.20, 0.22, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'TJUlE215vOsK', '2024-06-28 07:34:23', '2024-06-28 07:34:23'),
(1230, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 103.64, 121.42, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'wL8E9sD36zbQ', '2024-06-28 07:34:23', '2024-06-28 07:34:23'),
(1231, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 109.92, 112.12, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'D5Blr9g0mpkk', '2024-06-28 07:34:23', '2024-06-28 07:34:23'),
(1232, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 121.42, 111.42, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'fOUsd686psUM', '2024-06-28 11:27:58', '2024-06-28 11:27:58'),
(1233, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1173.12, 1163.12, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'iFavtVcnRViC', '2024-06-28 11:33:07', '2024-06-28 11:33:07'),
(1234, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.22, 0.24, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', '7PicLhqubMib', '2024-06-28 11:34:56', '2024-06-28 11:34:56'),
(1235, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 17.78, 1163.12, 1180.90, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '45.249.9.124', 'OC2cVM6pXnDC', '2024-06-28 11:34:56', '2024-06-28 11:34:56'),
(1236, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 112.12, 114.32, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 'FxK6IKmzoi8f', '2024-06-28 11:34:56', '2024-06-28 11:34:56'),
(1237, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 111.42, 101.42, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', '27xM2FdfGaAL', '2024-06-28 11:35:46', '2024-06-28 11:35:46'),
(1238, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1180.90, 1170.90, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', '7iFu9LHYQyG0', '2024-06-28 11:36:21', '2024-06-28 11:36:21'),
(1239, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.24, 0.26, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 'l6hHCpTBsYKx', '2024-06-28 11:39:15', '2024-06-28 11:39:15'),
(1240, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 17.78, 1170.90, 1188.68, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '45.249.9.124', 'NUW0uFULQz2z', '2024-06-28 11:39:15', '2024-06-28 11:39:15'),
(1241, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 114.32, 116.52, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', '2w6PujzynXCU', '2024-06-28 11:39:15', '2024-06-28 11:39:15'),
(1242, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 101.42, 91.42, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'Nyqjrqo9Nno1', '2024-06-28 11:39:24', '2024-06-28 11:39:24'),
(1243, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1188.68, 1178.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'gpCZ3TE9nf5q', '2024-06-28 11:39:33', '2024-06-28 11:39:33'),
(1244, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.26, 0.28, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'J0zp8DY8tcHQ', '2024-06-28 11:40:20', '2024-06-28 11:40:20'),
(1245, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 91.42, 109.20, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', '1e3HfYzY45RK', '2024-06-28 11:40:20', '2024-06-28 11:40:20'),
(1246, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 116.52, 118.72, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'w2l7aFcT3TdR', '2024-06-28 11:40:20', '2024-06-28 11:40:20'),
(1247, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 109.20, 99.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'c3VVoRIhUa3U', '2024-06-28 11:45:45', '2024-06-28 11:45:45'),
(1248, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1178.68, 1168.68, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'd4MBfbex4LqR', '2024-06-28 11:45:51', '2024-06-28 11:45:51'),
(1249, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.28, 0.30, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 'dEBap9h6BVX0', '2024-06-28 11:48:16', '2024-06-28 11:48:16'),
(1250, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 17.78, 1168.68, 1186.46, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '45.249.9.124', '5VyrKeZPujdN', '2024-06-28 11:48:16', '2024-06-28 11:48:16'),
(1251, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 118.72, 120.92, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 'FgfAakhjS3sk', '2024-06-28 11:48:16', '2024-06-28 11:48:16'),
(1252, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1186.46, 1176.46, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', '9ZnxtEucQwbJ', '2024-06-28 11:52:46', '2024-06-28 11:52:46'),
(1253, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 99.20, 89.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'lJDyUfzwcmFM', '2024-06-28 11:52:47', '2024-06-28 11:52:47'),
(1254, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.30, 0.32, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 'iZr9YKAWEsp9', '2024-06-28 11:54:00', '2024-06-28 11:54:00'),
(1255, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 17.78, 1176.46, 1194.24, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '45.249.9.124', '6LEwObJQf0XM', '2024-06-28 11:54:00', '2024-06-28 11:54:00'),
(1256, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 120.92, 123.12, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, Brent Satterfield DDS', '45.249.9.124', 'OzegC7rLd8un', '2024-06-28 11:54:00', '2024-06-28 11:54:00'),
(1257, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 89.20, 79.20, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'ddAxOL86f5eU', '2024-06-28 11:56:07', '2024-06-28 11:56:07'),
(1258, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1194.24, 1184.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'g1TrTZGGpI59', '2024-06-28 11:58:58', '2024-06-28 11:58:58'),
(1259, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.32, 0.34, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'Gppwo9wbI2oR', '2024-06-28 11:59:54', '2024-06-28 11:59:54'),
(1260, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 79.20, 96.98, 'inc', 'Done', 'Winning Challenge:  from Brent Satterfield DDS', '45.249.9.124', 'zTSkowfEMpMJ', '2024-06-28 11:59:54', '2024-06-28 11:59:54'),
(1261, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 123.12, 125.32, 'inc', 'Done', 'Challenge: Attempt By: Brent Satterfield DDS, Mohsin Tariq', '45.249.9.124', 'Spdnh2pSO2Yj', '2024-06-28 11:59:54', '2024-06-28 11:59:54'),
(1262, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1184.24, 1174.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'YxrgNfjTPoFG', '2024-06-28 12:25:17', '2024-06-28 12:25:17'),
(1263, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 30, 'wallet_1', 10.00, 960.00, 950.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'MpQIuYaxfDeO', '2024-06-28 12:26:23', '2024-06-28 12:26:23'),
(1264, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 30, 'wallet_1', 10.00, 950.00, 940.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'cDYtUQSO1xX2', '2024-06-28 12:44:28', '2024-06-28 12:44:28'),
(1265, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 1, 'wallet_1', 10.00, 1174.24, 1164.24, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', '3cpM0mBVt8UB', '2024-06-28 12:44:31', '2024-06-28 12:44:31'),
(1266, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 96.98, 86.98, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'BVipxYx85Zmq', '2024-06-28 14:03:22', '2024-06-28 14:03:22'),
(1267, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 30, 'wallet_1', 10.00, 940.00, 930.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', '4hOF2HefdMQx', '2024-06-28 14:03:54', '2024-06-28 14:03:54'),
(1268, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 86.98, 76.98, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'GHvTLr5zXqiH', '2024-06-28 14:04:36', '2024-06-28 14:04:36'),
(1269, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 30, 'wallet_1', 10.00, 930.00, 920.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'Vm8x4HfECLO9', '2024-06-28 14:04:41', '2024-06-28 14:04:41'),
(1270, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.34, 0.36, 'inc', 'Done', 'Challenge: Attempt By: mtest, Mohsin Tariq', '45.249.9.124', 'MNdeM4Ko4bhz', '2024-06-28 14:07:23', '2024-06-28 14:07:23'),
(1271, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 76.98, 94.76, 'inc', 'Done', 'Winning Challenge:  from mtest', '45.249.9.124', 'lAcq8xTXdpon', '2024-06-28 14:07:23', '2024-06-28 14:07:23'),
(1272, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 125.32, 127.52, 'inc', 'Done', 'Challenge: Attempt By: mtest, Mohsin Tariq', '45.249.9.124', 'LFIFU71Ry7LU', '2024-06-28 14:07:23', '2024-06-28 14:07:23'),
(1273, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 30, 'wallet_1', 10.00, 920.00, 910.00, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '45.249.9.124', 'ETeS4QjlKHCy', '2024-06-28 16:14:24', '2024-06-28 16:14:24'),
(1274, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 10.00, 94.76, 84.76, 'dec', 'Done', 'Paying Price of Starting Challenge: 3', '72.255.40.139', 'LXewvOJp0ZOZ', '2024-06-28 16:18:00', '2024-06-28 16:18:00'),
(1275, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.36, 0.38, 'inc', 'Done', 'Challenge: Attempt By: mtest, Mohsin Tariq', '103.117.160.2', 'RM4t8M1apfaC', '2024-06-28 17:07:05', '2024-06-28 17:07:05'),
(1276, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 14, 'wallet_1', 17.78, 84.76, 102.54, 'inc', 'Done', 'Winning Challenge:  from mtest', '103.117.160.2', 'sA7S5yNrvX2y', '2024-06-28 17:07:05', '2024-06-28 17:07:05'),
(1277, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 127.52, 129.72, 'inc', 'Done', 'Challenge: Attempt By: mtest, Mohsin Tariq', '103.117.160.2', 'KYE1duAQU8LW', '2024-06-28 17:07:05', '2024-06-28 17:07:05'),
(1278, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 31, 'wallet_2', 0.02, 0.38, 0.40, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, mtest', '103.117.160.2', 'SROOHGoipW7a', '2024-06-28 17:09:14', '2024-06-28 17:09:14'),
(1279, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 30, 'wallet_1', 17.78, 910.00, 927.78, 'inc', 'Done', 'Winning Challenge:  from Mohsin Tariq', '103.117.160.2', 'i6kQ1vrTVvCI', '2024-06-28 17:09:14', '2024-06-28 17:09:14'),
(1280, 'HPWebdeveloper\\LaravelPayPocket\\Models\\Wallet', 11, 'wallet_3', 2.20, 129.72, 131.92, 'inc', 'Done', 'Challenge: Attempt By: Mohsin Tariq, mtest', '103.117.160.2', 'crkhodZHPyMf', '2024-06-28 17:09:14', '2024-06-28 17:09:14');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_histories`
--

CREATE TABLE `withdraw_histories` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `stripe_transfer_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL COMMENT '0=pending,1=approved',
  `request_type` int NOT NULL DEFAULT '0' COMMENT '0=stripe_transfer,1=card',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_histories`
--

INSERT INTO `withdraw_histories` (`id`, `user_id`, `amount`, `stripe_transfer_id`, `status`, `request_type`, `created_at`, `updated_at`) VALUES
(46, 141, 93.00, NULL, 1, 1, '2024-06-27 08:35:44', '2024-06-27 08:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_history_cards`
--

CREATE TABLE `withdraw_history_cards` (
  `id` bigint UNSIGNED NOT NULL,
  `withdraw_history_id` bigint UNSIGNED NOT NULL,
  `card_holder_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_expiry_month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `card_expiry_year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_history_cards`
--

INSERT INTO `withdraw_history_cards` (`id`, `withdraw_history_id`, `card_holder_name`, `card_number`, `card_expiry_month`, `card_expiry_year`, `created_at`, `updated_at`) VALUES
(4, 46, 'go', '5583280264140528', '11', '27', '2024-06-27 08:35:44', '2024-06-27 08:35:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `challenger_record_submissions`
--
ALTER TABLE `challenger_record_submissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `challenger_record_submissions_challenge_attempt_id_foreign` (`challenge_attempt_id`),
  ADD KEY `challenger_record_submissions_challenger_id_foreign` (`challenger_id`);

--
-- Indexes for table `challenges`
--
ALTER TABLE `challenges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `challenges_created_by_foreign` (`created_by`),
  ADD KEY `challenges_price_id_foreign` (`price_id`);

--
-- Indexes for table `challenge_attempts`
--
ALTER TABLE `challenge_attempts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `challenge_attempts_challenge_id_foreign` (`challenge_id`),
  ADD KEY `challenge_attempts_challenger_1_foreign` (`challenger_1`),
  ADD KEY `challenge_attempts_challenger_2_foreign` (`challenger_2`),
  ADD KEY `challenge_attempts_winner_id_foreign` (`winner_id`),
  ADD KEY `challenge_attempts_ready_lounge_id_foreign` (`ready_lounge_id`);

--
-- Indexes for table `challenge_ratings`
--
ALTER TABLE `challenge_ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `challenge_ratings_user_id_foreign` (`user_id`),
  ADD KEY `challenge_ratings_challenge_id_foreign` (`challenge_id`),
  ADD KEY `challenge_ratings_challenge_attempt_id_foreign` (`challenge_attempt_id`);

--
-- Indexes for table `challenge_results`
--
ALTER TABLE `challenge_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `challenge_results_challenge_attempt_id_foreign` (`challenge_attempt_id`),
  ADD KEY `challenge_results_challenger_record_submission_id_foreign` (`challenger_record_submission_id`),
  ADD KEY `challenge_results_challenger_id_foreign` (`challenger_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `forfeit_challenges`
--
ALTER TABLE `forfeit_challenges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `forfeit_challenges_challenger_1_foreign` (`challenger_1`),
  ADD KEY `forfeit_challenges_challenger_2_foreign` (`challenger_2`),
  ADD KEY `forfeit_challenges_challenge_id_foreign` (`challenge_id`);

--
-- Indexes for table `leaderboards`
--
ALTER TABLE `leaderboards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaderboards_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ready_lounges`
--
ALTER TABLE `ready_lounges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ready_lounges_waiting_lounge_id_foreign` (`waiting_lounge_id`),
  ADD KEY `ready_lounges_user_1_foreign` (`user_1`),
  ADD KEY `ready_lounges_user_2_foreign` (`user_2`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_histories`
--
ALTER TABLE `search_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_number_unique` (`phone_number`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_cards`
--
ALTER TABLE `user_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_cards_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_notifications_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_payments`
--
ALTER TABLE `user_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_payments_price_id_foreign` (`price_id`),
  ADD KEY `user_payments_user_id_foreign` (`user_id`);

--
-- Indexes for table `waiting_lounges`
--
ALTER TABLE `waiting_lounges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `waiting_lounges_user_id_foreign` (`user_id`),
  ADD KEY `waiting_lounges_price_id_foreign` (`price_id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_owner_type_owner_id_index` (`owner_type`,`owner_id`);

--
-- Indexes for table `wallets_logs`
--
ALTER TABLE `wallets_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wallets_logs_loggable_type_loggable_id_index` (`loggable_type`,`loggable_id`);

--
-- Indexes for table `withdraw_histories`
--
ALTER TABLE `withdraw_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraw_histories_user_id_foreign` (`user_id`);

--
-- Indexes for table `withdraw_history_cards`
--
ALTER TABLE `withdraw_history_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraw_history_cards_withdraw_history_id_foreign` (`withdraw_history_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `challenger_record_submissions`
--
ALTER TABLE `challenger_record_submissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- AUTO_INCREMENT for table `challenges`
--
ALTER TABLE `challenges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `challenge_attempts`
--
ALTER TABLE `challenge_attempts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `challenge_ratings`
--
ALTER TABLE `challenge_ratings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `challenge_results`
--
ALTER TABLE `challenge_results`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `forfeit_challenges`
--
ALTER TABLE `forfeit_challenges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaderboards`
--
ALTER TABLE `leaderboards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=514;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ready_lounges`
--
ALTER TABLE `ready_lounges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `search_histories`
--
ALTER TABLE `search_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=236;

--
-- AUTO_INCREMENT for table `user_cards`
--
ALTER TABLE `user_cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_payments`
--
ALTER TABLE `user_payments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1158;

--
-- AUTO_INCREMENT for table `waiting_lounges`
--
ALTER TABLE `waiting_lounges`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `wallets_logs`
--
ALTER TABLE `wallets_logs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1281;

--
-- AUTO_INCREMENT for table `withdraw_histories`
--
ALTER TABLE `withdraw_histories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `withdraw_history_cards`
--
ALTER TABLE `withdraw_history_cards`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `challenger_record_submissions`
--
ALTER TABLE `challenger_record_submissions`
  ADD CONSTRAINT `challenger_record_submissions_challenge_attempt_id_foreign` FOREIGN KEY (`challenge_attempt_id`) REFERENCES `challenge_attempts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `challenger_record_submissions_challenger_id_foreign` FOREIGN KEY (`challenger_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `challenges`
--
ALTER TABLE `challenges`
  ADD CONSTRAINT `challenges_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `challenges_price_id_foreign` FOREIGN KEY (`price_id`) REFERENCES `prices` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `challenge_attempts`
--
ALTER TABLE `challenge_attempts`
  ADD CONSTRAINT `challenge_attempts_challenge_id_foreign` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `challenge_attempts_challenger_1_foreign` FOREIGN KEY (`challenger_1`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `challenge_attempts_challenger_2_foreign` FOREIGN KEY (`challenger_2`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `challenge_attempts_ready_lounge_id_foreign` FOREIGN KEY (`ready_lounge_id`) REFERENCES `ready_lounges` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `challenge_attempts_winner_id_foreign` FOREIGN KEY (`winner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `challenge_ratings`
--
ALTER TABLE `challenge_ratings`
  ADD CONSTRAINT `challenge_ratings_challenge_attempt_id_foreign` FOREIGN KEY (`challenge_attempt_id`) REFERENCES `challenge_attempts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `challenge_ratings_challenge_id_foreign` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `challenge_ratings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `challenge_results`
--
ALTER TABLE `challenge_results`
  ADD CONSTRAINT `challenge_results_challenge_attempt_id_foreign` FOREIGN KEY (`challenge_attempt_id`) REFERENCES `challenge_attempts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `challenge_results_challenger_id_foreign` FOREIGN KEY (`challenger_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `challenge_results_challenger_record_submission_id_foreign` FOREIGN KEY (`challenger_record_submission_id`) REFERENCES `challenger_record_submissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `forfeit_challenges`
--
ALTER TABLE `forfeit_challenges`
  ADD CONSTRAINT `forfeit_challenges_challenge_id_foreign` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `forfeit_challenges_challenger_1_foreign` FOREIGN KEY (`challenger_1`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `forfeit_challenges_challenger_2_foreign` FOREIGN KEY (`challenger_2`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `leaderboards`
--
ALTER TABLE `leaderboards`
  ADD CONSTRAINT `leaderboards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ready_lounges`
--
ALTER TABLE `ready_lounges`
  ADD CONSTRAINT `ready_lounges_user_1_foreign` FOREIGN KEY (`user_1`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ready_lounges_user_2_foreign` FOREIGN KEY (`user_2`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ready_lounges_waiting_lounge_id_foreign` FOREIGN KEY (`waiting_lounge_id`) REFERENCES `waiting_lounges` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `search_histories`
--
ALTER TABLE `search_histories`
  ADD CONSTRAINT `search_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_cards`
--
ALTER TABLE `user_cards`
  ADD CONSTRAINT `user_cards_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD CONSTRAINT `user_notifications_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_payments`
--
ALTER TABLE `user_payments`
  ADD CONSTRAINT `user_payments_price_id_foreign` FOREIGN KEY (`price_id`) REFERENCES `prices` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `user_payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `waiting_lounges`
--
ALTER TABLE `waiting_lounges`
  ADD CONSTRAINT `waiting_lounges_price_id_foreign` FOREIGN KEY (`price_id`) REFERENCES `prices` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `waiting_lounges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraw_histories`
--
ALTER TABLE `withdraw_histories`
  ADD CONSTRAINT `withdraw_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraw_history_cards`
--
ALTER TABLE `withdraw_history_cards`
  ADD CONSTRAINT `withdraw_history_cards_withdraw_history_id_foreign` FOREIGN KEY (`withdraw_history_id`) REFERENCES `withdraw_histories` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
