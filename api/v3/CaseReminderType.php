<?php
use CRM_Casereminder_ExtensionUtil as E;

/**
 * CaseReminderType.create API specification (optional).
 * This is used for documentation and validation.
 *
 * @param array $spec description of fields supported by this API call
 *
 * @see https://docs.civicrm.org/dev/en/latest/framework/api-architecture/
 */
function _civicrm_api3_case_reminder_type_create_spec(&$spec) {
  $spec['case_type_id']['api.required'] = 1;
  $spec['msg_template_id']['api.required'] = 1;
  $spec['recipient_relationship_type_id']['api.required'] = 1;
  $spec['from_email_address']['api.required'] = 1;
  $spec['subject']['api.required'] = 1;
  $spec['dow']['api.required'] = 1;
}

/**
 * CaseReminderType.create API.
 *
 * @param array $params
 *
 * @return array
 *   API result descriptor
 *
 * @throws API_Exception
 */
function civicrm_api3_case_reminder_type_create($params) {
  $packedArrayStringParams = [
    'case_status_id',
    'recipient_relationship_type_id',
  ];
  foreach ($packedArrayStringParams as $packedArrayStringParam) {
    if (isset($params[$packedArrayStringParam]) && is_array($params[$packedArrayStringParam])) {
      $params[$packedArrayStringParam] = CRM_Utils_Array::implodePadded($params[$packedArrayStringParam]);
    }
  }

  return _civicrm_api3_basic_create(_civicrm_api3_get_BAO(__FUNCTION__), $params, 'CaseReminderType');
}

/**
 * CaseReminderType.delete API.
 *
 * @param array $params
 *
 * @return array
 *   API result descriptor
 *
 * @throws API_Exception
 */
function civicrm_api3_case_reminder_type_delete($params) {
  return _civicrm_api3_basic_delete(_civicrm_api3_get_BAO(__FUNCTION__), $params);
}

/**
 * CaseReminderType.get API.
 *
 * @param array $params
 *
 * @return array
 *   API result descriptor
 *
 * @throws API_Exception
 */
function civicrm_api3_case_reminder_type_get($params) {
  return _civicrm_api3_basic_get(_civicrm_api3_get_BAO(__FUNCTION__), $params, TRUE, 'CaseReminderType');
}
