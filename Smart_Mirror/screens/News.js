import React from "react";
import { globalSheets } from "../styles/global";
import { StyleSheet, Text, View, Button } from "react-native";
import Card from "../shared/card";
export default function Home({ navigation }) {
  const pressHandler = () => {
    navigation.goBack();
  };

  return (
    <View>
      <Card>
        <Text style={globalSheets.text}>NEWS</Text>
        <Text style={globalSheets.texts}>NEWS</Text>
      </Card>
      <Button title="go to review" onPress={pressHandler} />
    </View>
  );
}
