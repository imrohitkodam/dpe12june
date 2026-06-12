-- --------------------------------------------------------

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

