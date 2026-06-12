
# 4.7.1

ALTER TABLE `#__logman_activities` CHANGE `created_on` `created_on` datetime DEFAULT NULL;

UPDATE `#__logman_activities` SET `created_on` = NULL WHERE `created_on` = 0000-00-00;