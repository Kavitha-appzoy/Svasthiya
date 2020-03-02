import * as React from 'react';
import {useState} from 'react';
import {View,Text,StatusBar,SafeAreaView} from 'react-native';
import AppStatusBar from '../customComponents/AppStatusBar';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import Entypo from 'react-native-vector-icons/Entypo';
import Kohana  from '../customComponents/CustomTextInput/Kohana';
import {widthPercentageToDP,
    heightPercentageToDP} from '../customComponents/pxDimensions';
import { TouchableOpacity } from 'react-native-gesture-handler';
 import {Content,Container} from 'native-base';
 import colors from '../themes/colors'
function Login({navigation}){
    const [mobileNumber, setMobileNumber] = useState('');
    
    return(
        <Container style = {{flex:1}}>
             <SafeAreaView style={{backgroundColor: colors.appTheme}}></SafeAreaView>
           <StatusBar translucent backgroundColor={colors.appTheme}  barStyle='light-content' />
                <Content style={{flex:1}} contentContainerStyle={{flex:1}}>
                <View style={{flex:2,backgroundColor: 'white',justifyContent:'flex-end',alignItems:'flex-start',marginBottom:50}}> 
                   <Text style={{fontSize:40,marginLeft:30}}>{"Sign In"}</Text>
                </View>
                <View style={{flex:5,backgroundColor: 'white'}}> 
                        <View style={{height:65,marginTop:10,marginLeft:30,marginRight:30}}>
                            <Kohana
                                keyboardType={'number-pad'}
                                maxLength={10}
                                style={{ backgroundColor: '#ffffff',borderRadius: 35, borderWidth:1 }}
                                label={'Mobile Number*'}
                                iconClass={MaterialCommunityIcons}
                                iconName={'phone'}
                                iconColor={'#404958'}
                                inputPadding={0}
                                labelStyle={{ color: '#D3D3D3' }}
                                inputStyle={{ color: '#404958' }}
                                labelContainerStyle={{ padding: 25 }}
                                iconContainerStyle={{ padding: 18 }}
                                useNativeDriver
                                onChange={(value) => {console.log("the text value si ",value.nativeEvent.text)}}
                                />
                        </View>     
                        <View style={{height:65,marginTop:30,marginLeft:30,marginRight:30}}>
                             <Kohana
                                 maxLength={6}
                                style={{ backgroundColor: '#ffffff',borderRadius: 35, borderWidth:1 }}
                                label={'Password*'}
                                iconClass={Entypo}
                                iconName={'lock'}
                                iconColor={'#404958'}
                                inputPadding={0}
                                labelStyle={{ color: '#D3D3D3' }}
                                inputStyle={{ color: '#404958'}}
                                labelContainerStyle={{ padding: 25 }}
                                iconContainerStyle={{ padding: 18 }}
                                useNativeDriver
                                onChange={(value) => {console.log("the text value si ",value.nativeEvent.text)}}
                                />
                         </View>     
                          <TouchableOpacity style={{marginTop:50,marginLeft:55,marginRight:55,backgroundColor:'#404958',borderRadius:50}}
                              onPress={loginFunction}
                          >
                                <Text style={{textAlign:'center',marginVertical:20,color:'#ffffff',fontSize:20,fontWeight:'bold'}}>{"Sign In"}</Text>
                          </TouchableOpacity>  
                          <View style={{justifyContent:'center',alignItems:'center'}}>
                               <Text style={{textAlign:'center',marginVertical:5,color:'#D3D3D3',fontSize:13,marginTop:20}}>{"I don't have an account?"}</Text>
                                <TouchableOpacity style={{marginTop:0,width: 100}}
                                  onPress={navToRegisterPage}
                                >
                                        <Text style={{textAlign:'center',marginVertical:5,color:'#404958',fontSize:20,fontWeight:'bold',textDecorationLine: 'underline'}}>{"Sign Up"}</Text>
                                       
                                </TouchableOpacity> 
                          </View>
                          
                        
                </View>
                </Content>
            </Container>
       
    );
    function loginFunction(){
        navigation.navigate("BottomNavigation")
        console.log("login button pressed")
    }
    function navToRegisterPage(){
        navigation.navigate("Register")
        console.log("Regsiter button pressed")
    }
    
}
export default Login;