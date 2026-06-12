ALTER TABLE `#__tj_sla_activities` ADD COLUMN `sla_activity_type_id` INT(11)NOT NULL AFTER `id`;

ALTER TABLE `#__tj_sla_services` ADD COLUMN `sla_activity_type_id` INT(11) NOT NULL AFTER `sla_id`;

ALTER TABLE `#__tj_ucm_data` ADD `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0' AFTER `id`;

CREATE TABLE IF NOT EXISTS `#__tj_sla_activity_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text NOT NULL,
  `params` text NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT '0',
  `state` tinyint(3) NOT NULL DEFAULT '0',
  `checked_out` int(11) unsigned NOT NULL DEFAULT '0',
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) unsigned NOT NULL DEFAULT '0',
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` int(11) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1;
