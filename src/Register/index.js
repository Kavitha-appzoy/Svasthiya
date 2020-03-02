import * as React from 'react';
import {useState} from 'react';
import {View,Text,SafeAreaView} from 'react-native';
import AppStatusBar from '../customComponents/AppStatusBar';
import MaterialCommunityIcons from 'react-native-vector-icons/MaterialCommunityIcons';
import Entypo from 'react-native-vector-icons/Entypo';
import Kohana  from '../customComponents/CustomTextInput/Kohana';
import {widthPercentageToDP,
    heightPercentageToDP} from '../customComponents/pxDimensions';
import { TouchableOpacity } from 'react-native-gesture-handler';
 import {Content,Container} from 'native-base';
 import colors from '../themes/colors'
function Register({navigation}){
    // const [mobileNumber, setMobileNumber] = useState('');
    return(
        <Container style = {{flex:1}}>
             <SafeAreaView style={{backgroundColor: colors.appTheme}}></SafeAreaView>
          <AppStatusBar/>
                <Content>
                <View style={{backgroundColor: 'white',justifyContent:'flex-end',alignItems:'flex-start',marginBottom:50,marginTop:50}}> 
                   <Text style={{fontSize:35,marginLeft:30}}>{"Sign Up"}</Text>
                </View>
                {/* <View style={{flex:5,backgroundColor: 'white'}}>  */}
                        <View style={{height:65,marginTop:10,marginLeft:30,marginRight:30}}>
                            <Kohana
                                keyboardType={'default'}
                                maxLength={15}
                                style={{ backgroundColor: '#ffffff',borderRadius: 35, borderWidth:1 }}
                                label={'Name*'}
                                iconClass={Entypo}
                                iconName={'user'}
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
                                 keyboardType={'number-pad'}
                                 maxLength={10}
                                style={{ backgroundColor: '#ffffff',borderRadius: 35, borderWidth:1 }}
                                label={'Mobile Number*'}
                                iconClass={MaterialCommunityIcons}
                                iconName={'phone'}
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
                         <View style={{height:65,marginTop:30,marginLeft:30,marginRight:30}}>
                             <Kohana
                                 keyboardType={'email-address'}
                                 maxLength={15}
                                style={{ backgroundColor: '#ffffff',borderRadius: 35, borderWidth:1 }}
                                label={'Email*'}
                                iconClass={Entypo}
                                iconName={'email'}
                                iconColor={'#404958'}
                                inputPadding={0}
                                labelStyle={{ color: '#D3D3D3' }}
                                inputStyle={{ color: '#404958'}}
                                labelContainerStyle={{ padding: 25 }}
                                iconContainerStyle={{ padding: 15 }}
                                useNativeDriver
                                onChange={(value) => {console.log("the text value si ",value.nativeEvent.text)}}
                                />
                         </View>      
                        <View style={{height:65,marginTop:30,marginLeft:30,marginRight:30}}>
                             <Kohana
                                 keyboardType={'default'}
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
                                onPress={registerFunction}
                          >
                                <Text style={{textAlign:'center',marginVertical:20,color:'#ffffff',fontSize:20,fontWeight:'bold'}}>{"Sign Up"}</Text>
                          </TouchableOpacity>  
                          <View style={{justifyContent:'center',alignItems:'center',marginBottom:50}}>
                               <Text style={{textAlign:'center',marginVertical:5,color:'#D3D3D3',fontSize:13,marginTop:20}}>{"Already have an account?"}</Text>
                                <TouchableOpacity style={{marginTop:0,width: 100}}
                                  onPress={navToLoginPage}
                                >
                                        <Text style={{textAlign:'center',marginVertical:5,color:'#404958',fontSize:20,fontWeight:'bold',textDecorationLine: 'underline'}}>{"Sign In"}</Text>
                                       
                                </TouchableOpacity> 
                          
                          
                        
                </View>
                </Content>
            </Container>
       
    );
    function registerFunction(){
        // navigation.navigate("Login")
        console.log("register button pressed")
    }
    function navToLoginPage(){
        navigation.goBack()
        console.log("Regsiter button pressed")
    }
    
}
export default Register;