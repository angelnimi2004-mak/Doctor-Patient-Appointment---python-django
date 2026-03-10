-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2025 at 07:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `consultpharm_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add login', 7, 'add_login'),
(26, 'Can change login', 7, 'change_login'),
(27, 'Can delete login', 7, 'delete_login'),
(28, 'Can view login', 7, 'view_login'),
(29, 'Can add doctor register', 8, 'add_doctorregister'),
(30, 'Can change doctor register', 8, 'change_doctorregister'),
(31, 'Can delete doctor register', 8, 'delete_doctorregister'),
(32, 'Can view doctor register', 8, 'view_doctorregister'),
(33, 'Can add user register', 9, 'add_userregister'),
(34, 'Can change user register', 9, 'change_userregister'),
(35, 'Can delete user register', 9, 'delete_userregister'),
(36, 'Can view user register', 9, 'view_userregister'),
(37, 'Can add feedback', 10, 'add_feedback'),
(38, 'Can change feedback', 10, 'change_feedback'),
(39, 'Can delete feedback', 10, 'delete_feedback'),
(40, 'Can view feedback', 10, 'view_feedback'),
(41, 'Can add consult', 11, 'add_consult'),
(42, 'Can change consult', 11, 'change_consult'),
(43, 'Can delete consult', 11, 'delete_consult'),
(44, 'Can view consult', 11, 'view_consult'),
(45, 'Can add booking', 12, 'add_booking'),
(46, 'Can change booking', 12, 'change_booking'),
(47, 'Can delete booking', 12, 'delete_booking'),
(48, 'Can view booking', 12, 'view_booking'),
(49, 'Can add news', 13, 'add_news'),
(50, 'Can change news', 13, 'change_news'),
(51, 'Can delete news', 13, 'delete_news'),
(52, 'Can view news', 13, 'view_news');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$uxc9fOIsAWgIJS4WTmpK0j$2Ehp3iO1xqUlsjdmjDgMM5p/7E9r7FH6NZzQjOU56EA=', NULL, 1, 'admin', '', '', '', 1, 1, '2025-03-21 18:38:21.626838');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(12, 'consult_app', 'booking'),
(11, 'consult_app', 'consult'),
(8, 'consult_app', 'doctorregister'),
(10, 'consult_app', 'feedback'),
(7, 'consult_app', 'login'),
(13, 'consult_app', 'news'),
(9, 'consult_app', 'userregister'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-03-21 18:37:57.491624'),
(2, 'auth', '0001_initial', '2025-03-21 18:37:58.179735'),
(3, 'admin', '0001_initial', '2025-03-21 18:37:58.320753'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-03-21 18:37:58.335943'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-03-21 18:37:58.341877'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-03-21 18:37:58.425547'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-03-21 18:37:58.504921'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-03-21 18:37:58.520578'),
(9, 'auth', '0004_alter_user_username_opts', '2025-03-21 18:37:58.520578'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-03-21 18:37:58.588789'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-03-21 18:37:58.599739'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-03-21 18:37:58.608089'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-03-21 18:37:58.632379'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-03-21 18:37:58.649458'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-03-21 18:37:58.663293'),
(16, 'auth', '0011_update_proxy_permissions', '2025-03-21 18:37:58.663293'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-03-21 18:37:58.684547'),
(18, 'consult_app', '0001_initial', '2025-03-21 18:37:59.119952'),
(19, 'consult_app', '0002_remove_booking_card_number_remove_booking_cvv_and_more', '2025-03-21 18:37:59.157444'),
(20, 'consult_app', '0003_alter_booking_amount_alter_booking_status', '2025-03-21 18:37:59.169785'),
(21, 'consult_app', '0004_alter_booking_amount', '2025-03-21 18:37:59.217783'),
(22, 'consult_app', '0005_news', '2025-03-21 18:37:59.237300'),
(23, 'sessions', '0001_initial', '2025-03-21 18:37:59.280566');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_booking`
--

CREATE TABLE `tbl_booking` (
  `b_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `booking_date` datetime(6) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_booking`
--

INSERT INTO `tbl_booking` (`b_id`, `item_name`, `booking_date`, `amount`, `status`, `user_id`) VALUES
(1, 'Aspirin ,Nitroglycerin,Statins ', '2025-03-22 23:46:17.965520', 235, 'Delivered', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_consult`
--

CREATE TABLE `tbl_consult` (
  `c_id` int(11) NOT NULL,
  `problem` varchar(50) NOT NULL,
  `reply` longtext DEFAULT NULL,
  `medicines` longtext DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_consult`
--

INSERT INTO `tbl_consult` (`c_id`, `problem`, `reply`, `medicines`, `date`, `doctor_id`, `user_id`) VALUES
(1, 'Frequent Chest Pain and Shortness of Breath', 'Frequent chest pain and shortness of breath require immediate attention to rule out heart conditions like angina or arrhythmia. Medications like aspirin, beta-blockers (e.g., Metoprolol), nitroglycerin, and statins (e.g., Atorvastatin) are commonly prescribed based on diagnosis.', 'Aspirin ,Nitroglycerin,Statins ', '2025-03-22 18:14:11.521402', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_doctor_register`
--

CREATE TABLE `tbl_doctor_register` (
  `d_id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `department_name` varchar(50) DEFAULT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` longtext NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_doctor_register`
--

INSERT INTO `tbl_doctor_register` (`d_id`, `Name`, `department_name`, `phone_number`, `Email`, `Address`, `status`, `login_id`) VALUES
(1, 'Ram kumar', 'Cardiology', 7788676858, 'ram1212@gmail.com', 'myhouse,kollam', 'Available', 2),
(2, 'Meera  ', 'Psychiatry', 8786867585, 'meera122@gmail.com', 'meeraHouse', NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_feedback`
--

CREATE TABLE `tbl_feedback` (
  `fd_id` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `feedback` longtext NOT NULL,
  `reply` longtext DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_feedback`
--

INSERT INTO `tbl_feedback` (`fd_id`, `date`, `feedback`, `reply`, `user_id`) VALUES
(1, '2025-03-22 18:10:09.446887', 'The website is intuitive, well-structured, and offers valuable resources, making it easy and efficient to schedule consultations and access medical advice from top doctors', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `login_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` longtext NOT NULL,
  `Usertype` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`login_id`, `username`, `password`, `Usertype`, `status`) VALUES
(1, 'riya12', 'riya12', 'User', 'Approved'),
(2, 'ram12', 'ram12', 'Doctor', 'Approved'),
(3, 'meera12', 'meera12', 'Doctor', 'Approved');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_news`
--

CREATE TABLE `tbl_news` (
  `news_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_news`
--

INSERT INTO `tbl_news` (`news_id`, `title`, `description`, `date`) VALUES
(1, 'New Breakthrough in Cancer Treatment: Targeting Tumor Blood Vessels', 'Researchers have developed a promising new therapy that targets the blood vessels feeding tumors, effectively starving them of oxygen and nutrients. This innovative treatment shows potential in slowing cancer growth and improving patient outcomes, particularly in aggressive cancers like melanoma and lung cancer. Early clinical trials have yielded encouraging results, marking a significant step forward in cancer treatment.', '2025-03-22 18:08:15.168707'),
(2, 'AI-Powered Tool Detects Early Signs of Alzheimer\'s Disease', 'A new AI-driven diagnostic tool has shown promise in detecting early signs of Alzheimer\'s disease, even before symptoms appear. By analyzing brain scans and patient data, the tool can identify subtle changes that traditional methods may miss, offering the potential for earlier intervention and better treatment outcomes for patients at risk. This breakthrough could revolutionize the way Alzheimer\'s is diagnosed and managed.\r\n\r\n\r\n\r\n', '2025-03-22 18:08:38.538397');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_register`
--

CREATE TABLE `tbl_user_register` (
  `user_id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `phone_number` bigint(20) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` longtext NOT NULL,
  `login_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_user_register`
--

INSERT INTO `tbl_user_register` (`user_id`, `Name`, `phone_number`, `Email`, `Address`, `login_id`) VALUES
(1, 'Riya p', 9987675673, 'riya12@gmail.com', 'riyavilla,Kottayam', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD PRIMARY KEY (`b_id`),
  ADD KEY `tbl_booking_user_id_96f0e99f_fk_tbl_user_register_user_id` (`user_id`);

--
-- Indexes for table `tbl_consult`
--
ALTER TABLE `tbl_consult`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `tbl_consult_doctor_id_cddee8a5_fk_tbl_doctor_register_d_id` (`doctor_id`),
  ADD KEY `tbl_consult_user_id_2f7f5fe6_fk_tbl_user_register_user_id` (`user_id`);

--
-- Indexes for table `tbl_doctor_register`
--
ALTER TABLE `tbl_doctor_register`
  ADD PRIMARY KEY (`d_id`),
  ADD KEY `tbl_doctor_register_login_id_94f02216_fk_tbl_login_login_id` (`login_id`);

--
-- Indexes for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD PRIMARY KEY (`fd_id`),
  ADD KEY `tbl_feedback_user_id_3cb0c17a_fk_tbl_user_register_user_id` (`user_id`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`login_id`);

--
-- Indexes for table `tbl_news`
--
ALTER TABLE `tbl_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `tbl_user_register`
--
ALTER TABLE `tbl_user_register`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `tbl_user_register_login_id_62163e64_fk_tbl_login_login_id` (`login_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_consult`
--
ALTER TABLE `tbl_consult`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_doctor_register`
--
ALTER TABLE `tbl_doctor_register`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  MODIFY `fd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_news`
--
ALTER TABLE `tbl_news`
  MODIFY `news_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_user_register`
--
ALTER TABLE `tbl_user_register`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `tbl_booking`
--
ALTER TABLE `tbl_booking`
  ADD CONSTRAINT `tbl_booking_user_id_96f0e99f_fk_tbl_user_register_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user_register` (`user_id`);

--
-- Constraints for table `tbl_consult`
--
ALTER TABLE `tbl_consult`
  ADD CONSTRAINT `tbl_consult_doctor_id_cddee8a5_fk_tbl_doctor_register_d_id` FOREIGN KEY (`doctor_id`) REFERENCES `tbl_doctor_register` (`d_id`),
  ADD CONSTRAINT `tbl_consult_user_id_2f7f5fe6_fk_tbl_user_register_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user_register` (`user_id`);

--
-- Constraints for table `tbl_doctor_register`
--
ALTER TABLE `tbl_doctor_register`
  ADD CONSTRAINT `tbl_doctor_register_login_id_94f02216_fk_tbl_login_login_id` FOREIGN KEY (`login_id`) REFERENCES `tbl_login` (`login_id`);

--
-- Constraints for table `tbl_feedback`
--
ALTER TABLE `tbl_feedback`
  ADD CONSTRAINT `tbl_feedback_user_id_3cb0c17a_fk_tbl_user_register_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user_register` (`user_id`);

--
-- Constraints for table `tbl_user_register`
--
ALTER TABLE `tbl_user_register`
  ADD CONSTRAINT `tbl_user_register_login_id_62163e64_fk_tbl_login_login_id` FOREIGN KEY (`login_id`) REFERENCES `tbl_login` (`login_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
