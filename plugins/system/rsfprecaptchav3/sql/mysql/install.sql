INSERT IGNORE INTO `#__rsform_config` (`SettingName`, `SettingValue`) VALUES ('recaptchav3.sitekey', '');
INSERT IGNORE INTO `#__rsform_config` (`SettingName`, `SettingValue`) VALUES ('recaptchav3.secretkey', '');
INSERT IGNORE INTO `#__rsform_config` (`SettingName`, `SettingValue`) VALUES ('recaptchav3.allpages', '1');
INSERT IGNORE INTO `#__rsform_config` (`SettingName`, `SettingValue`) VALUES ('recaptchav3.threshold', '0.5');

INSERT IGNORE INTO `#__rsform_component_types` (`ComponentTypeId`, `ComponentTypeName`) VALUES (2423, 'recaptchav3');

DELETE FROM `#__rsform_component_type_fields` WHERE ComponentTypeId = 2423;

INSERT IGNORE INTO `#__rsform_component_type_fields` (`ComponentTypeId`, `FieldName`, `FieldType`, `FieldValues`, `Properties`, `Ordering`) VALUES
(2423, 'NAME', 'textbox', '', '', 0),
(2423, 'RECAPTCHAACTION', 'textbox', 'contactform', 'alphanumeric', 1),
(2423, 'COMPONENTTYPE', 'hidden', '2423', '', 2);