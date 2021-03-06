/**
 * @flow
 * @format
 * */

import React, { Component } from 'react';
import { AppRegistry, StyleSheet, View, Button, TextInput } from 'react-native';
import {} from 'react-native';

import { emitter, sendMail, emailEvents } from './EmailModule';

type State = {
  emailAddress: string,
  emailTitle: string,
  emailContent: string,
};

type Props = {};
export default class App extends Component<Props, State> {
  subscription = emitter.addListener(emailEvents.RESULT_CANCELLED, () => {});

  constructor(props: Props) {
    super(props);
    this.state = {
      emailAddress: 'some@mail.com',
      emailTitle: 'Awesome title',
      emailContent:
        'Very long awesome title. Just come to my home and drink beer with me',
    };
  }

  componentWillUnmount() {
    super.componentWillUnmount();
    // this.subscription.remove();
  }

  render() {
    return (
      <View style={styles.container}>
        <TextInput
          style={styles.textFields}
          onChangeText={text => this.setState({ emailAddress: text })}
          value={this.state.emailAddress}
        />
        <TextInput
          style={styles.textFields}
          onChangeText={text => this.setState({ emailTitle: text })}
          value={this.state.emailTitle}
        />
        <TextInput
          style={styles.textFields}
          onChangeText={text => this.setState({ emailContent: text })}
          value={this.state.emailContent}
        />
        <Button
          title="Send Email"
          onPress={() => {
            sendMail(
              this.state.emailAddress,
              this.state.emailTitle,
              this.state.emailContent
            );
          }}
        />
      </View>
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
  textFields: {
    height: 40,
    width: '80%',
    borderColor: 'gray',
    borderWidth: 1,
  },
});

// Module name
AppRegistry.registerComponent('App', () => App);
