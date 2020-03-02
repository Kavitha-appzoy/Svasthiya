import * as React from 'react';
import { TouchableOpacity } from 'react-native-gesture-handler';
import {View,Text} from 'react-native';
function ProfileScreen(){
    return(
        <View style = {{justifyContent: 'center', alignItems: 'center',flex:1}} >
        <TouchableOpacity>
          <Text>
            {
              "X-Ray"
            }
          </Text>
        </TouchableOpacity>

        <TouchableOpacity style={{marginTop:50}}>
          <Text>
            {
              "MRI"
            }
          </Text>
        </TouchableOpacity>
      </View>
    );

    
}
export default ProfileScreen;