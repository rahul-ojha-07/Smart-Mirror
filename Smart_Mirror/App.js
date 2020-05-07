import React, { useState } from "react";
import { StyleSheet, Text, View } from "react-native";
import Home from "./screens/Home";
import * as Font from "expo-font";
import { AppLoading } from "expo";
import Navigator from "./routes/homeStack";
//import Navigator from "./routes/drawer";

const getFonts = () =>
  Font.loadAsync({
    "nunito-regular": require("./assets/Fonts/Nunito-Regular.ttf"),
    "nunito-bold": require("./assets/Fonts/Nunito-Bold.ttf"),
  });

export default function App() {
  const [fontsLoded, setFontsLoded] = useState(false);
  if (fontsLoded) {
    return <Navigator />;
  } else {
    return (
      <AppLoading startAsync={getFonts} onFinish={() => setFontsLoded(true)} />
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
    alignItems: "center",
    justifyContent: "center",
  },
});
