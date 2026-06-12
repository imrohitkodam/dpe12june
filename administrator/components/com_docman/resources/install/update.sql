
# 2.1.0
ALTER TABLE `#__docman_categories` CHANGE `access_raw` `access_raw` int(11) NOT NULL default 0;

UPDATE `#__docman_categories` SET `access_raw` = 0 WHERE `access_raw` = -1;

# 3.0.0-beta.1
ALTER TABLE `#__docman_documents` ENGINE=InnoDB;
ALTER TABLE `#__docman_categories` ENGINE=InnoDB;
ALTER TABLE `#__docman_category_relations` ENGINE=InnoDB;
ALTER TABLE `#__docman_category_orderings` ENGINE=InnoDB;
ALTER TABLE `#__docman_levels` ENGINE=InnoDB;

ALTER TABLE `#__files_containers` ENGINE=InnoDB;


ALTER TABLE `#__docman_documents` CHANGE `docman_document_id` `docman_document_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `#__docman_documents` CHANGE `docman_category_id` `docman_category_id` BIGINT(20) UNSIGNED NOT NULL;
ALTER TABLE `#__docman_categories` CHANGE `docman_category_id` `docman_category_id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE `#__docman_category_relations` CHANGE `ancestor_id` `ancestor_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `#__docman_category_relations` CHANGE `descendant_id` `descendant_id` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE `#__docman_category_folders` CHANGE `docman_category_id` `docman_category_id` BIGINT(20) UNSIGNED NOT NULL;
ALTER TABLE `#__docman_category_orderings` CHANGE `docman_category_id` `docman_category_id` BIGINT(20) UNSIGNED NOT NULL;


# 3.0.0
DROP TABLE IF EXISTS `#__docman_mimetypes`;

# 3.0.5-beta.1
ALTER TABLE `#__docman_files` CHANGE `folder` `folder` varchar(2048) NOT NULL DEFAULT '';
ALTER TABLE `#__docman_files` CHANGE `name` `name` varchar(2048) NOT NULL DEFAULT '';

ALTER TABLE `#__docman_folders` CHANGE `folder` `folder` varchar(2048) NOT NULL DEFAULT '';
ALTER TABLE `#__docman_folders` CHANGE `name` `name` varchar(2048) NOT NULL DEFAULT '';

# 3.1.0-rc.2
DROP TABLE IF EXISTS `#__files_thumbnails`;

# 4.0.1

DROP VIEW IF EXISTS `#__docman_file_counts`;
DROP VIEW IF EXISTS `#__docman_nodes`;

# 4.0.2

ALTER TABLE `#__docman_categories` CHANGE `locked_on` `locked_on` datetime DEFAULT NULL;
ALTER TABLE `#__docman_categories` CHANGE `created_on` `created_on` datetime DEFAULT NULL;
ALTER TABLE `#__docman_categories` CHANGE `modified_on` `modified_on` datetime DEFAULT NULL;

UPDATE `#__docman_categories` SET `locked_on` = NULL WHERE `locked_on` = 0000-00-00;
UPDATE `#__docman_categories` SET `created_on` = NULL WHERE `created_on` = 0000-00-00;
UPDATE `#__docman_categories` SET `modified_on` = NULL WHERE `modified_on` = 0000-00-00;

ALTER TABLE `#__docman_documents` CHANGE `publish_on` `publish_on` datetime DEFAULT NULL;
ALTER TABLE `#__docman_documents` CHANGE `unpublish_on` `unpublish_on` datetime DEFAULT NULL;
ALTER TABLE `#__docman_documents` CHANGE `locked_on` `locked_on` datetime DEFAULT NULL;
ALTER TABLE `#__docman_documents` CHANGE `created_on` `created_on` datetime DEFAULT NULL;
ALTER TABLE `#__docman_documents` CHANGE `modified_on` `modified_on` datetime DEFAULT NULL;

UPDATE `#__docman_documents` SET `publish_on` = NULL WHERE `publish_on` = 0000-00-00;
UPDATE `#__docman_documents` SET `unpublish_on` = NULL WHERE `unpublish_on` = 0000-00-00;
UPDATE `#__docman_documents` SET `locked_on` = NULL WHERE `locked_on` = 0000-00-00;
UPDATE `#__docman_documents` SET `created_on` = NULL WHERE `created_on` = 0000-00-00;
UPDATE `#__docman_documents` SET `modified_on` = NULL WHERE `modified_on` = 0000-00-00;

ALTER TABLE `#__docman_files` CHANGE `created_on` `created_on` datetime DEFAULT NULL;
ALTER TABLE `#__docman_files` CHANGE `modified_on` `modified_on` datetime DEFAULT NULL;

UPDATE `#__docman_files` SET `created_on` = NULL WHERE `created_on` = 0000-00-00;
UPDATE `#__docman_files` SET `modified_on` = NULL WHERE `modified_on` = 0000-00-00;

ALTER TABLE `#__docman_folders` CHANGE `created_on` `created_on` datetime DEFAULT NULL;
ALTER TABLE `#__docman_folders` CHANGE `modified_on` `modified_on` datetime DEFAULT NULL;

UPDATE `#__docman_folders` SET `created_on` = NULL WHERE `created_on` = 0000-00-00;
UPDATE `#__docman_folders` SET `modified_on` = NULL WHERE `modified_on` = 0000-00-00;

ALTER TABLE `#__docman_scans` CHANGE `created_on` `created_on` datetime DEFAULT NULL;
ALTER TABLE `#__docman_scans` CHANGE `modified_on` `modified_on` datetime DEFAULT NULL;
ALTER TABLE `#__docman_scans` CHANGE `sent_on` `sent_on` datetime DEFAULT NULL;

UPDATE `#__docman_scans` SET `created_on` = NULL WHERE `created_on` = 0000-00-00;
UPDATE `#__docman_scans` SET `modified_on` = NULL WHERE `modified_on` = 0000-00-00;
UPDATE `#__docman_scans` SET `sent_on` = NULL WHERE `sent_on` = 0000-00-00;
