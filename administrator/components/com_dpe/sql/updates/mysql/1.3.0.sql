CREATE TABLE IF NOT EXISTS `#__tjlms_lesson_cluster_xref` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lesson_id` int(11) NOT NULL COMMENT 'Foreign Key (#__tjlms_lessons table)',
  `cluster_id` int(11) NOT NULL COMMENT 'Foreign Key (#__tj_clusters table)',
  PRIMARY KEY (`id`),
 INDEX (`lesson_id`, `cluster_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 DEFAULT COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `#__timelog_activities` ADD COLUMN `timelog` time NOT NULL AFTER `spent_time`;
