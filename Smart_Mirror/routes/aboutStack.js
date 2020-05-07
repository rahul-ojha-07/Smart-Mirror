import { createStackNavigator } from "react-navigation-stack";
import Header from "../shared/header";
import React from "react";
import About from "../screens/About";
const screens = {
  // Home: {
  //     screen: Home,
  //     navigationOptions: {
  //       title: "GAmeZone",
  //       headerStyle: { backgroundColor: "#eee" },
  //     },
  //   },
  About: {
    screen: About,
    // navigationOptions: {
    //     headerTitle : ()=> <Header/>,
    // //   title: "About  GAmeZone",
    // //   headerStyle: { backgroundColor: "#eee" },
    // },
    navigationOptions: ({ navigation }) => {
      return {
        headerTitle: () => (
          <Header navigation={navigation} title="Gameeqq ABOUT" />
        ),
      };
      // title: "GAmeZone", title requires string
      //headerStyle: { backgroundColor: "#eee" },
    },
  },
  //   Review: {
  //     screen: Review,
  //     navigationOptions: {
  //       title: "GAmeZone Review",
  //     },
  //   },
};
const AboutStack = createStackNavigator(screens);
export default AboutStack;
