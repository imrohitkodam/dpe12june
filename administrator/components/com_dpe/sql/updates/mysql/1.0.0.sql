--
-- Table structure for table `#__rsticket_integration_xref`
--

CREATE TABLE IF NOT EXISTS `#__rsticket_integration_xref` (
 `ticket_id` int(11) NOT NULL COMMENT 'Primary key of #__rsticketspro_tickets table',
 `agency_id` int(11) NOT NULL COMMENT 'Agency Id',
 UNIQUE KEY `ticket_id` (`ticket_id`)
) DEFAULT CHARSET=utf8;

ALTER TABLE `#__jlike_content` ADD COLUMN `params` TEXT NOT NULL COMMENT 'Used for storing extra data' AFTER `dislike_cnt`;

--
-- Table structure for table `#__jlike_todos_extended`
--

CREATE TABLE IF NOT EXISTS `#__jlike_todos_extended` (
  `todo_id` int(11) NOT NULL,
  `read` tinyint(1) NOT NULL,
  `read_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `used` tinyint(1) NOT NULL,
  `used_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `used_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `consented` tinyint(1) NOT NULL,
  `consented_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `consented_modified_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `desc` text NOT NULL,
  PRIMARY KEY (`todo_id`)
)DEFAULT CHARSET=utf8;

-- --------------------------------------------------------
