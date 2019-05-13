/**
 * @flow
 * @format
 * */

import React, { Component } from 'react';
import { AppRegistry } from 'react-native';
import MasterView from './MasterView';
import DetailsView from './DetailsView';

import { createStackNavigator, createAppContainer } from 'react-navigation';
import type {
  NavigationRouteConfigMap,
  StackNavigationConfig,
} from 'react-navigation';

type State = {};

type Props = {};

export default class RNHighScores extends Component<Props, State> {
  render() {
    return <AppContainer />;
  }
}

export const routes: NavigationRouteConfigMap = {
  Main: MasterView,
  Details: DetailsView,
};

export const stackNavigationConfig: StackNavigationConfig = {
  initialRouteName: 'Main',
};

export const AppNavigator = createStackNavigator(routes, stackNavigationConfig);

export const AppContainer = createAppContainer(AppNavigator);

// Module name
AppRegistry.registerComponent('RNHighScores', () => RNHighScores);
