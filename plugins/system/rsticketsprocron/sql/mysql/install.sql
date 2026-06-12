CREATE TABLE IF NOT EXISTS `#__rsticketspro_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `server` varchar(255) NOT NULL,
  `protocol` enum('pop3','imap') NOT NULL DEFAULT 'pop3',
  `port` int(11) NOT NULL,
  `security` varchar(255) NOT NULL,
  `validate` tinyint(1) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `last_check` int(11) NOT NULL,
  `check_interval` tinyint(4) NOT NULL,
  `accept` tinyint(1) NOT NULL,
  `department_id` int(11) NOT NULL,
  `priority_id` int(11) NOT NULL,
  `blacklist` text NOT NULL,
  `accept_all_replies` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL,
  `ordering` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `#__rsticketspro_accounts_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `account_id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`)
) DEFAULT CHARSET=utf8;