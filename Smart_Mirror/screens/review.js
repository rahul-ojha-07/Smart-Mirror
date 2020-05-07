import React from "react";
import { globalSheets } from "../styles/global";
import { StyleSheet, Text, View, Button } from "react-native";
export default function Home({ navigation }) {
  const presshandler = () => {
    navigation.goBack();
  };
  return (
    <View>
      <Text style={globalSheets.text}>review</Text>

      <Button title="go to home" onPress={presshandler} />
    </View>
  );
}
