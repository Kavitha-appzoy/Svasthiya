import * as React from 'react';
import { TouchableOpacity } from 'react-native-gesture-handler';
import {View,Text,NativeModules,Button} from 'react-native';

function HomeScreen(){
    return(
        <View style = {{justifyContent: 'center', alignItems: 'center',flex:1}} >
        <Button
         title="X-Ray"
         onPress={() => {
                 NativeModules.AppDelegate.pushVC('DICOMViewController')
  
         }}>
           
          </Button>
          <View style={{marginTop:50}}>
          <Button 
         title="MRI"
         onPress={() => {
                NativeModules.AppDelegate.pushVC('MultipleDICOMViewController')
  
   }}>
           
          </Button>
          </View>
        
      </View>
    );

    
}
export default HomeScreen;