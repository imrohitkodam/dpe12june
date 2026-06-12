CREATE TABLE IF NOT EXISTS `#__simplesharing_websites` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,

`website_name` VARCHAR(255)  NOT NULL ,
`website_url` VARCHAR(255)  NOT NULL ,
`admin_username` VARCHAR(255)  NOT NULL ,
`admin_password` VARCHAR(255)  NOT NULL ,
`token` VARCHAR(255)  NOT NULL ,
`debug_mode` tinytext NOT NULL,
`ordering` INT(11)  NOT NULL ,
`state` TINYINT(1)  NOT NULL ,
`checked_out` INT(11)  NOT NULL ,
`checked_out_time` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
`created_by` INT(11)  NOT NULL ,
PRIMARY KEY (`id`)
) DEFAULT COLLATE=utf8_general_ci;

