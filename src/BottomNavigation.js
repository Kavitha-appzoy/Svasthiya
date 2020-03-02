import * as React from 'react';
import { createBottomTabNavigator } from '@react-navigation/bottom-tabs';
import  MaterialCommunityIcons  from 'react-native-vector-icons/MaterialCommunityIcons';
import  Octicons  from 'react-native-vector-icons/Octicons';
import Reports from './Reports';
import Profile from './Profile';
import colors from './themes/colors'
const Tab = createBottomTabNavigator();
 function BottomNavigation() {
    return (
      <Tab.Navigator
        initialRouteName="Reports"
        tabBarOptions={{
          activeTintColor: colors.appTheme,
        }}
      >
      
        <Tab.Screen
          name="Reports"
          component={Reports}
          options={{
            tabBarLabel: 'Reports',
            tabBarIcon: ({ color, size }) => (
              <Octicons name="report" color={color} size={size} />
            ),
          }}
        />
        <Tab.Screen
          name="Profile"
          component={Profile}
          options={{
            tabBarLabel: 'Profile',
            tabBarIcon: ({ color, size }) => (
              <MaterialCommunityIcons name="account" color={color} size={size} />
            ),
          }}
        />
      </Tab.Navigator>
    );
  }
  export default BottomNavigation;