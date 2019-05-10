/**
 * @flow
 * @format
 * */

import { NativeModules, NativeEventEmitter } from 'react-native';

const { EmailModule } = NativeModules;
export const emitter = new NativeEventEmitter(EmailModule);
export const sendMail = EmailModule.sendMail;
export const emailEvents = {
  RESULT_SEND: 'onResultSent',
  RESULT_SAVED: 'onResultSaved',
  RESULT_CANCELLED: 'onResultCancelled',
  RESULT_FAILED: 'onResultFailed',
  UNKNOW_ERROR: 'onUnknowError',
  ON_ERROR: 'onError',
};
