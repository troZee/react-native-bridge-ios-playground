/**
 * @flow
 * @format
 * */

import React, { Component } from 'react';
import { View, StyleSheet, Text } from 'react-native';
import type { NavigationScreenProp } from 'react-navigation';
type State = {};

type Props = {
  navigation: NavigationScreenProp<*>,
};

export default class DetailsView extends Component<Props, State> {
  render() {
    return (
      <View style={styles.container}>
        <Text>React Native Details View</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
  },
});
