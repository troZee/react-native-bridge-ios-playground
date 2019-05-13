/**
 * @flow
 * @format
 * */

import React, { Component } from 'react';
import { StyleSheet, Text, Button, View } from 'react-native';
import EventEmitter from 'react-native/Libraries/vendor/emitter/EventEmitter';

import {
  pushDetailsViewController,
  navigationModuleEmitter,
} from './RTCNavigationModule';

import type { NavigationScreenProp } from 'react-navigation';

type State = {};

type Props = {
  navigation: NavigationScreenProp<*>,
};

export default class MasterView extends Component<Props, State> {
  subscription = navigationModuleEmitter.addListener('pushDetailsView', () =>
    this.props.navigation.push('Details')
  );

  constructor(props: Props) {
    super(props);
  }

  componentWillUnmount() {
    this.subscription.remove();
  }

  render() {
    return (
      <View style={styles.container}>
        <Text>React Native Master View </Text>
        <Button
          title="Push Details from react native"
          onPress={this.handlePressButton}
        />
      </View>
    );
  }

  handlePressButton = async () => {
    try {
      await pushDetailsViewController();
    } catch (e) {
      console.log(e);
    }
  };
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});
