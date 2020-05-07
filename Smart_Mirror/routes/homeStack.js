import { createStackNavigator } from "react-navigation-stack";
import { createAppContainer } from "react-navigation";
import Home from "../screens/Home";
import Review from "../screens/review";
import News from "../screens/News";
import YouTube from "../screens/YouTube";
import About from "../screens/About";
import Light from "../screens/Light";
import ToDo from "../screens/ToDo";
import Header from "../shared/header";
import React from "react";
const screens = {
  Home: {
    screen: Home,
    navigationOptions: ({ navigation }) => {
      return {
        headerTitle: () => <Header navigation={navigation} title="HOME" />,
      };
      // title: "GAmeZone", title requires string
      //headerStyle: { backgroundColor: "#eee" },
    },
  },
  Review: {
    screen: Review,
    navigationOptions: {
      title: " Review",
    },
  },
  Light: {
    screen: Light,
    navigationOptions: {
      title: "LIGHT",
    },
  },
  News: {
    screen: News,
    navigationOptions: {
      title: "NEWS",
    },
  },
  ToDo: {
    screen: ToDo,
    navigationOptions: {
      title: "TODO",
    },
  },
  YouTube: {
    screen: YouTube,
    navigationOptions: {
      title: "YOUTUBE",
    },
  },
  About: {
    screen: About,
    navigationOptions: {
      title: "ABOUT",
    },
  },
};
const HomeStack = createStackNavigator(screens, {
  defaultNavigationOptions: {
    headerTintColor: "#444",
    headerStyle: { backgroundColor: "#eee", height: 60 },
  },
});
export default createAppContainer(HomeStack);
//export default HomeStack;
