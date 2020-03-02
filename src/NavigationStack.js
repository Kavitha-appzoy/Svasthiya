import * as React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createStackNavigator } from '@react-navigation/stack';

import BottomNavigation from './BottomNavigation';
import HomeScreen from './HomeScreen.js';
import ProfileScreen from './ProfileScreen';
import Login from './Login';
import Register from './Register';


const Stack = createStackNavigator();

function NavigationStack() {
 return(
    <NavigationContainer>
      <Stack.Navigator initialRouteName="Login" headerMode="none">
        
        <Stack.Screen name="Login" component={Login} />
         <Stack.Screen name="Register" component={Register} />
         <Stack.Screen name="BottomNavigation" component={BottomNavigation}/>
        <Stack.Screen name="HomeScreen" component={HomeScreen} />
        <Stack.Screen name="ProfileScreen" component={ProfileScreen} />
      </Stack.Navigator>
    </NavigationContainer>
 );

}

export {NavigationStack};