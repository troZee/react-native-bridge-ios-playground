/**
 * @flow
 * @format
 * */

import React, { Component } from 'react';
import { AppRegistry, StyleSheet, Text } from 'react-native';
import GradientView from './GradientView';

type State = {
  emailAddress: string,
  emailTitle: string,
  emailContent: string,
};

type Props = {};
export default class App extends Component<Props, State> {
  render() {
    return (
      <GradientView style={styles.container}>
        <Text>Native Gradient View inside React Native Code</Text>
      </GradientView>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#42cef4',
  },
});

// Module name
AppRegistry.registerComponent('App', () => App);
