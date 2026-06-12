CREATE TABLE IF NOT EXISTS `#__rsform_rsticketspro` (
  `form_id` int(11) NOT NULL,
  `rstp_published` tinyint(1) NOT NULL,
  `rstp_debug` tinyint(1) NOT NULL,
  `rstp_mappings` text NOT NULL,
  `rstp_trigger_on_payment` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`form_id`)
) DEFAULT CHARSET=utf8;