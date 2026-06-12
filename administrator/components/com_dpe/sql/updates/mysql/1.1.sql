--
-- Column added in table `#__tjlms_lessons` and it's used to bifurcate the document creation flow
--
ALTER TABLE `#__tjlms_lessons` ADD COLUMN `in_lib` TINYINT(4) NOT NULL DEFAULT '0';
