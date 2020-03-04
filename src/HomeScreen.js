import * as React from 'react';
import { TouchableOpacity } from 'react-native-gesture-handler';
import {View,Text,NativeModules,Button,Platform} from 'react-native';

function HomeScreen(){
    return(
        <View style = {{justifyContent: 'center', alignItems: 'center',flex:1}} >
        <Button
         title="X-Ray"
         onPress={() => {
            Platform.OS === 'ios' ? NativeModules.AppDelegate.pushVC('DICOMViewController') : NativeModules.NativeModuleActivity.navigateToNativeModules()
  
         }}>
           
          </Button>
          <View style={{marginTop:50}}>
          <Button 
         title="MRI"
         onPress={() => {
            Platform.OS === 'ios' ?  NativeModules.AppDelegate.pushVC('MultipleDICOMViewController') : NativeModules.NativeModuleActivity.navigateToNativeModules()
  
   }}>
           
          </Button>
          </View>
        
      </View>
    );

    
}
export default HomeScreen;