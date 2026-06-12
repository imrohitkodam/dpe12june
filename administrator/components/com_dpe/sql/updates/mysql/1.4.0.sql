ALTER TABLE `#__tj_reports` ADD COLUMN `ordering` int(11) DEFAULT NULL;
ALTER TABLE `#__rsticket_integration_xref` ADD COLUMN `emails` text AFTER `agency_id`;

