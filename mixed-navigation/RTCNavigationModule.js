/**
 * @flow
 * @format
 * */

import { NativeModules, NativeEventEmitter } from 'react-native';
export const RTCNavigationModule = NativeModules.RTCNavigationModule;
export const pushDetailsViewController = async () =>
  RTCNavigationModule.pushDetailsViewController();

export const navigationModuleEmitter = new NativeEventEmitter(
  RTCNavigationModule
);
