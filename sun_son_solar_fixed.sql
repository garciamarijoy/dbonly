-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2026 at 02:02 PM
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
-- Database: `sun_son_solar`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `message` text DEFAULT NULL,
  `status` enum('pending','confirmed','completed','cancelled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `blog_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(150) DEFAULT 'Sun Son Solar',
  `status` enum('Draft','Published') NOT NULL DEFAULT 'Draft',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_info`
--

CREATE TABLE `company_info` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(200) NOT NULL DEFAULT 'Sun Son Solar',
  `description` text DEFAULT NULL,
  `tagline` varchar(255) DEFAULT 'Clean energy, made simple',
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(30) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `instagram_url` varchar(500) DEFAULT NULL,
  `facebook_url` varchar(500) DEFAULT NULL,
  `linkedin_url` varchar(500) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company_info`
--

INSERT INTO `company_info` (`company_id`, `company_name`, `description`, `tagline`, `address`, `contact_number`, `contact_email`, `instagram_url`, `facebook_url`, `linkedin_url`, `updated_at`) VALUES
(1, 'Sun Son Solar', 'Thoughtful solar guidance, installation, and ongoing support.', 'Clean energy, made simple', NULL, NULL, NULL, NULL, NULL, NULL, '2026-10-20 13:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(50) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `department` varchar(100) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_announcements`
--

CREATE TABLE `employee_announcements` (
  `announcement_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `body` text NOT NULL,
  `audience` enum('all','department') NOT NULL DEFAULT 'all',
  `department` varchar(100) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `published_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `faq_id` int(11) NOT NULL,
  `question` varchar(500) NOT NULL,
  `answer` text NOT NULL,
  `status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`faq_id`, `question`, `answer`, `status`, `sort_order`, `created_at`) VALUES
(1, 'How does solar power work?', 'Solar panels convert sunlight into electricity for your home. The right setup depends on your energy needs and property.', 'Active', 1, '2026-10-20 13:39:44'),
(2, 'Can I request a solar consultation?', 'Yes. Submit the consultation request form on our homepage so our team can discuss your requirements.', 'Active', 2, '2026-10-20 13:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `installations`
--

CREATE TABLE `installations` (
  `installation_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `installation_date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `system_capacity` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Scheduled',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance_records`
--

CREATE TABLE `maintenance_records` (
  `maintenance_id` int(11) NOT NULL,
  `installation_id` int(11) NOT NULL,
  `maintenance_date` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Scheduled',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `recipient_type` enum('customer','employee') NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `body` text NOT NULL,
  `category` enum('reminder','promotion','schedule','announcement','general') NOT NULL DEFAULT 'general',
  `read_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `installation_id` int(11) DEFAULT NULL,
  `receipt_number` varchar(40) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` enum('pending','paid','refunded','cancelled') NOT NULL DEFAULT 'pending',
  `paid_at` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quote_requests`
--

CREATE TABLE `quote_requests` (
  `quote_id` int(11) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(30) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `service_id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `status` enum('pending','contacted','approved','rejected','completed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,2) NOT NULL DEFAULT 0.00,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_reports`
--

CREATE TABLE `service_reports` (
  `report_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `report_type` enum('equipment_problem','customer_concern','service_summary','safety') NOT NULL,
  `details` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `ticket_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `status` enum('open','in_progress','resolved','closed') NOT NULL DEFAULT 'open',
  `assigned_admin_id` int(11) DEFAULT NULL,
  `admin_response` text DEFAULT NULL,
  `responded_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`ticket_id`, `customer_id`, `subject`, `message`, `status`, `assigned_admin_id`, `admin_response`, `responded_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'dsfvb', 'fdhgh', 'open', NULL, NULL, NULL, '2026-10-22 08:08:23', '2026-10-22 08:08:23');

-- --------------------------------------------------------

--
-- Table structure for table `technician_assignments`
--

CREATE TABLE `technician_assignments` (
  `assignment_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `installation_id` int(11) DEFAULT NULL,
  `assigned_by` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `status` enum('assigned','in_progress','completed','cancelled') NOT NULL DEFAULT 'assigned',
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `technician_checkins`
--

CREATE TABLE `technician_checkins` (
  `checkin_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `arrived_at` datetime NOT NULL,
  `departed_at` datetime DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `activity_note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `testimonial_id` int(11) NOT NULL,
  `customer_name` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `rating` tinyint(3) UNSIGNED DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('customer','admin') NOT NULL DEFAULT 'customer',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `birthday`, `gender`, `email`, `phone_number`, `address`, `username`, `password_hash`, `role`, `created_at`) VALUES
(1, 'fghjkl;khjgfdghjkl;udsfhgjlk;hgb', 'fghb', 'fdsffffffffffffffffffffffffffffffffffffffffg', '2026-10-19', 'f', 'bnggom@gmail.com', '+639936011743', 'fff', 'marijoygarcia', '$2y$10$d3GSJFyB2BZvkh4iX2m/E.PhJJ6Wxq0CVgB3EhuGu7q9D990HSHbK', 'customer', '2026-10-22 07:53:14'),
(2, 'dsf', 'dsf', 'dsf', '2026-10-16', 'ds', 'sunsonsolar@gmail.com', '+639936011743', 'sunsonsolar', 'katherine', '$2y$10$v65O8qcOojjYMFK7yK3QPelE/MPwz56RN6YZaiwp4kHAsMXr7vyoe', 'customer', '2026-10-22 08:10:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `idx_appointment_customer` (`customer_id`),
  ADD KEY `idx_appointment_service` (`service_id`),
  ADD KEY `idx_appointment_date` (`appointment_date`,`status`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `company_info`
--
ALTER TABLE `company_info`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_employee_id` (`employee_id`),
  ADD UNIQUE KEY `uq_employee_email` (`email`),
  ADD UNIQUE KEY `uq_employee_username` (`username`);

--
-- Indexes for table `employee_announcements`
--
ALTER TABLE `employee_announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `idx_announcement_publish` (`published_at`),
  ADD KEY `fk_announcement_admin` (`created_by`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`faq_id`);

--
-- Indexes for table `installations`
--
ALTER TABLE `installations`
  ADD PRIMARY KEY (`installation_id`),
  ADD KEY `idx_installation_customer` (`customer_id`),
  ADD KEY `idx_installation_service` (`service_id`);

--
-- Indexes for table `maintenance_records`
--
ALTER TABLE `maintenance_records`
  ADD PRIMARY KEY (`maintenance_id`),
  ADD KEY `idx_maintenance_installation` (`installation_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `idx_notification_recipient` (`recipient_type`,`recipient_id`,`read_at`,`created_at`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `uq_payment_receipt` (`receipt_number`),
  ADD KEY `idx_payment_customer` (`customer_id`,`status`,`paid_at`),
  ADD KEY `idx_payment_appointment` (`appointment_id`),
  ADD KEY `idx_payment_installation` (`installation_id`),
  ADD KEY `fk_payment_admin` (`created_by`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `quote_requests`
--
ALTER TABLE `quote_requests`
  ADD PRIMARY KEY (`quote_id`),
  ADD KEY `idx_quote_email` (`email`),
  ADD KEY `idx_quote_status` (`status`),
  ADD KEY `fk_quote_service` (`service_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `service_reports`
--
ALTER TABLE `service_reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `idx_report_employee` (`employee_id`,`created_at`),
  ADD KEY `fk_report_assignment` (`assignment_id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `idx_ticket_customer` (`customer_id`,`created_at`),
  ADD KEY `idx_ticket_status` (`status`,`updated_at`),
  ADD KEY `fk_ticket_admin` (`assigned_admin_id`);

--
-- Indexes for table `technician_assignments`
--
ALTER TABLE `technician_assignments`
  ADD PRIMARY KEY (`assignment_id`),
  ADD KEY `idx_assignment_employee` (`employee_id`,`status`),
  ADD KEY `idx_assignment_appointment` (`appointment_id`),
  ADD KEY `idx_assignment_installation` (`installation_id`),
  ADD KEY `fk_assignment_admin` (`assigned_by`);

--
-- Indexes for table `technician_checkins`
--
ALTER TABLE `technician_checkins`
  ADD PRIMARY KEY (`checkin_id`),
  ADD KEY `idx_checkin_employee` (`employee_id`,`arrived_at`),
  ADD KEY `fk_checkin_assignment` (`assignment_id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`testimonial_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_email` (`email`),
  ADD UNIQUE KEY `uq_users_username` (`username`),
  ADD KEY `idx_users_role` (`role`);

--
-- Default active services required by the homepage and booking forms.
INSERT INTO `services` (`service_name`, `description`, `price`, `status`) VALUES
('Solar Consultation', 'Discuss your energy needs and available solar options.', 0.00, 'active'),
('Solar Panel Installation', 'Professional solar panel system installation for your property.', 0.00, 'active'),
('Solar Maintenance', 'Inspection and maintenance support for an existing solar system.', 0.00, 'active');

-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_info`
--
ALTER TABLE `company_info`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_announcements`
--
ALTER TABLE `employee_announcements`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `faq_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `installations`
--
ALTER TABLE `installations`
  MODIFY `installation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance_records`
--
ALTER TABLE `maintenance_records`
  MODIFY `maintenance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quote_requests`
--
ALTER TABLE `quote_requests`
  MODIFY `quote_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_reports`
--
ALTER TABLE `service_reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `technician_assignments`
--
ALTER TABLE `technician_assignments`
  MODIFY `assignment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `technician_checkins`
--
ALTER TABLE `technician_checkins`
  MODIFY `checkin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `testimonial_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_appointment_customer` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_appointment_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);

--
-- Constraints for table `employee_announcements`
--
ALTER TABLE `employee_announcements`
  ADD CONSTRAINT `fk_announcement_admin` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `installations`
--
ALTER TABLE `installations`
  ADD CONSTRAINT `fk_installation_customer` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_installation_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);

--
-- Constraints for table `maintenance_records`
--
ALTER TABLE `maintenance_records`
  ADD CONSTRAINT `fk_maintenance_installation` FOREIGN KEY (`installation_id`) REFERENCES `installations` (`installation_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payment_admin` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_payment_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`),
  ADD CONSTRAINT `fk_payment_customer` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_payment_installation` FOREIGN KEY (`installation_id`) REFERENCES `installations` (`installation_id`);

--
-- Constraints for table `quote_requests`
--
ALTER TABLE `quote_requests`
  ADD CONSTRAINT `fk_quote_service` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);

--
-- Constraints for table `service_reports`
--
ALTER TABLE `service_reports`
  ADD CONSTRAINT `fk_report_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `technician_assignments` (`assignment_id`),
  ADD CONSTRAINT `fk_report_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD CONSTRAINT `fk_ticket_admin` FOREIGN KEY (`assigned_admin_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_ticket_customer` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `technician_assignments`
--
ALTER TABLE `technician_assignments`
  ADD CONSTRAINT `fk_assignment_admin` FOREIGN KEY (`assigned_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `fk_assignment_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`appointment_id`),
  ADD CONSTRAINT `fk_assignment_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `fk_assignment_installation` FOREIGN KEY (`installation_id`) REFERENCES `installations` (`installation_id`);

--
-- Constraints for table `technician_checkins`
--
ALTER TABLE `technician_checkins`
  ADD CONSTRAINT `fk_checkin_assignment` FOREIGN KEY (`assignment_id`) REFERENCES `technician_assignments` (`assignment_id`),
  ADD CONSTRAINT `fk_checkin_employee` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
