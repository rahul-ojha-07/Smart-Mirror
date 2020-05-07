import React from "react";
import { globalSheets } from "../styles/global";
import { StyleSheet, Text, View, Button } from "react-native";
import Card from "../shared/card";
export default function Home({ navigation }) {
  const pressHandler = () => {
    navigation.navigate("Home");
  };
  const pressHandler2 = () => {
    navigation.navigate("About");
  };

  const pressHandler3 = () => {
    navigation.navigate("News");
  };
  const pressHandler4 = () => {
    navigation.navigate("Light");
  };
  const pressHandler5 = () => {
    navigation.navigate("ToDo");
  };
  const pressHandler6 = () => {
    navigation.navigate("YouTube");
  };
  const pressHandler7 = () => {
    navigation.navigate("Review");
  };

  return (
    <View>
      <Card>
        <Text style={globalSheets.text}>HOME IS WORKING </Text>
        <Text style={globalSheets.texts}>HOME CONTENT</Text>
        <Text style={globalSheets.texts}>HOME</Text>
      </Card>
      <Button title="HOME" onPress={pressHandler} />
      <Button title="ABOUT" onPress={pressHandler2} />

      <Button title="NEWS" onPress={pressHandler3} />

      <Button title="LIGHT" onPress={pressHandler4} />

      <Button title="TODO" onPress={pressHandler5} />

      <Button title="YOUTUBE" onPress={pressHandler6} />

      <Button title="REVIEW" onPress={pressHandler7} />
    </View>
  );
}
