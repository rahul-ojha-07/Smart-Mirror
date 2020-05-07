import React from "react";
import { StyleSheet, Text, View } from "react-native";
import { MaterialIcons } from "@expo/vector-icons";
export default function Header({ navigation, title }) {
  const openMenu = () => {
    navigation.openDrawer();
  };
  return (
    <View style={styles.header}>
      <View></View>
    </View>
  );
}
const styles = StyleSheet.create({
  header: {
    width: "100%",
    height: "100%",
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "center",

    backgroundColor: "pink",
  },
  headerText: {
    fontWeight: "bold",
    fontSize: 20,
    color: "red",
    letterSpacing: 7,
    alignItems: "center",
    justifyContent: "center",
  },
  icon: {
    position: "absolute",
    left: 16,
  },
});
