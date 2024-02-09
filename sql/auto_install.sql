-- +--------------------------------------------------------------------+
-- | Copyright CiviCRM LLC. All rights reserved.                        |
-- |                                                                    |
-- | This work is published under the GNU AGPLv3 license with some      |
-- | permitted exceptions and without any warranty. For full license    |
-- | and copyright information, see https://civicrm.org/licensing       |
-- +--------------------------------------------------------------------+
--
-- Generated from schema.tpl
-- DO NOT EDIT.  Generated by CRM_Core_CodeGen
--
-- /*******************************************************
-- *
-- * Clean up the existing tables - this section generated from drop.tpl
-- *
-- *******************************************************/

SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `civicrm_case_reminder_type`;

SET FOREIGN_KEY_CHECKS=1;
-- /*******************************************************
-- *
-- * Create new tables
-- *
-- *******************************************************/

-- /*******************************************************
-- *
-- * civicrm_case_reminder_type
-- *
-- * Case Reminder configurations per reminder type
-- *
-- *******************************************************/
CREATE TABLE `civicrm_case_reminder_type` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Unique CaseReminderType ID',
  `case_type_id` int unsigned COMMENT 'FK to Case Type',
  `case_status_id` varchar(256) COMMENT 'Case status ID(s), multi-value delimited. Implicit FK to civicrm_option_value where option_group = case_status.',
  `msg_template_id` int unsigned COMMENT 'FK to civicrm_msg_template',
  `recipient_relationship_type_id` varchar(256) COMMENT 'Relationship type ID(s) for recipients, multi-value delimited. Implicit FK to civicrm_relationship_type. -1 is Case Contact.',
  `from_email_address` varchar(256) COMMENT 'Email address selected from domain list of From addresses.',
  `subject` varchar(128) COMMENT 'Subject of reminder email',
  `dow` varchar(64) COMMENT 'Day of week to send reminders',
  `max_iterations` int unsigned COMMENT 'Maximum number of times to send a reminder of this type on any given case.',
  `is_active` tinyint COMMENT 'Is this reminder type active?',
  PRIMARY KEY (`id`),
  CONSTRAINT FK_civicrm_case_reminder_type_case_type_id FOREIGN KEY (`case_type_id`) REFERENCES `civicrm_case_type`(`id`) ON DELETE CASCADE,
  CONSTRAINT FK_civicrm_case_reminder_type_msg_template_id FOREIGN KEY (`msg_template_id`) REFERENCES `civicrm_msg_template`(`id`) ON DELETE SET NULL
)
ENGINE=InnoDB;
