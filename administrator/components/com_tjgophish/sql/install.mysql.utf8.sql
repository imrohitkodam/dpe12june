CREATE TABLE IF NOT EXISTS `#__tjgophish_group_ref` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
`gophish_group_id` INT(11)  NOT NULL,
`gophish_group_title` VARCHAR(250)  NOT NULL,
`cluster_id` INT(11)  NOT NULL,
`all_cluster_users` TINYINT  NOT NULL DEFAULT 0,
`checked_out` INT(11)  NOT NULL,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`created_by` INT(11)  NOT NULL,
`created_date` DATETIME NOT NULL,
`modified_by` INT(11)  NOT NULL,
`modified_date` DATETIME NOT NULL,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `#__tjgophish_campaign_ref` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
`gophish_campaign_id` INT(11)  NOT NULL,
`gophish_campaign_title` VARCHAR(250)  NOT NULL,
`gophish_campaign_status` VARCHAR(250)  NOT NULL,
`gophish_groups` TEXT  NOT NULL,
`cluster_id` INT(11)  NOT NULL,
`checked_out` INT(11)  NOT NULL,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`created_by` INT(11)  NOT NULL,
`created_date` DATETIME NOT NULL,
`modified_by` INT(11)  NOT NULL,
`modified_date` DATETIME NOT NULL,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8mb4_unicode_ci;
