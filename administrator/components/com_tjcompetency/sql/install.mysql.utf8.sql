CREATE TABLE IF NOT EXISTS `#__tjcompetency_frameworks` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `unique_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uc_unique_code` (`unique_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `#__tjcompetency_skills` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `framework_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `lft` int(11) NOT NULL DEFAULT '0',
  `rgt` int(11) NOT NULL DEFAULT '0',
  `level` int(10) NOT NULL DEFAULT '0',
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `unique_code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uc_framework_id_unique_code` (`framework_id`,`unique_code`),
  KEY `idx_path` (`path`(100)),
  KEY `idx_left_right` (`lft`,`rgt`),
  KEY `idx_alias` (`alias`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;

INSERT INTO `#__tjcompetency_skills` (`id`, `framework_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `description`, `unique_code`, `params`, `state`, `checked_out`, `checked_out_time`, `created_on`, `created_by`, `modified_on`, `modified_by`) VALUES ('1', '0', '0', '0', '0', '0', '', 'ROOT', 'root', NULL, 'root', '', '1', '0', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', '0', '0000-00-00 00:00:00.000000', '0');


CREATE TABLE IF NOT EXISTS `#__tjcompetency_scale_sets` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `params` text NOT NULL DEFAULT '',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `#__tjcompetency_scales` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `scale_set_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `params` text NOT NULL DEFAULT '',
  `sequence_number` int(5) NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_scale_set_id` (`scale_set_id`),
  UNIQUE KEY `idx_uc_scale_set_seq` (`scale_set_id`,`sequence_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `#__tjcompetency_skill_content_map` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `skill_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `scale_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `client` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `outcome_rule` tinyint(3) NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uc_client_skill_scale` (`client`,`client_id`,`skill_id`,`scale_id`),
  KEY `idx_skill_id` (`skill_id`),
  KEY `idx_scale_id` (`scale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `#__tjcompetency_skill_user_content_map` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `client` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT '0',
  `skill_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `scale_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `reviewer_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `note` mediumtext COLLATE utf8mb4_unicode_ci,
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) UNSIGNED NOT NULL DEFAULT '0',
   PRIMARY KEY (`id`),
   UNIQUE KEY `idx_uc_user_client_skill_scale` (`user_id`,`client`,`client_id`,`skill_id`, `scale_id`),
   KEY `idx_reviewer_id` (`reviewer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;

CREATE VIEW `#__tjcompetency_skill_user_map` AS
SELECT MAX(`c`.`sequence_number`) AS `max_sequence_number`, `a`.`user_id`, `s`.`title` AS `skill_title`,
`a`.`skill_id`, `c`.`scale_set_id`, `sc`.`title` AS `scale_set_title`
FROM `#__tjcompetency_skill_user_content_map` AS `a`
INNER JOIN `#__tjcompetency_skills` AS `s` ON (`a`.`skill_id` = `s`.`id`)
INNER JOIN `#__tjcompetency_scales` AS `c` ON (`a`.`scale_id` = `c`.`id`)
INNER JOIN `#__tjcompetency_scale_sets` AS `sc` ON (`c`.`scale_set_id` = `sc`.`id`)
WHERE `a`.`state` = '1' GROUP by `c`.`scale_set_id`, `a`.`user_id`, `a`.`skill_id`;
