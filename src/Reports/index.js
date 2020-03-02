import * as React from 'react';
import {View,FlatList,Text,TouchableOpacity,NativeModules} from 'react-native';
import AppStatusBar from '../customComponents/AppStatusBar';
import {Header, Body, Title, Left} from 'native-base';
import colors from '../themes/colors';
const sampleData = [
    {
      id: 'bd7acbea-c1b1-46c2-aed5-3ad53abb28ba',
      title: 'N.S.Labs',
      scanDate: '2011 July 1, 7:00 PM',
      modality: "X-Ray",
      serialNo: 'No.201107-456'
    },
    {
      id: '3ac68afc-c605-48d3-a4f8-fbd91aa97f63',
      title: 'N.S.Labs',
      scanDate: '2011 July 9, 9:00 PM',
      modality: "MRI",
      serialNo: 'No.201197-456'
    }
  ];

function Reports(){
    return(

        <View style={{flex: 1}}>
            <AppStatusBar/>
            <Header style={{backgroundColor: colors.appTheme}}>
                <Left>
                    <Title style={{color:'#ffffff'}}>Sita</Title>
                </Left>
            </Header>
            <FlatList
                ItemSeparatorComponent = {FlatListItemSeparator}
                data={sampleData}
                renderItem={({ item,index }) => 
                           showReportList(item,index)
            }
                keyExtractor={item => item.id}
            />
        </View>
    );
}

function showReportList(item, index)
{
    console.log("the item value is ",item,index)
    return(
        <View>
         <AppStatusBar/>   
        <View style={{flexDirection:'row'}}>
        <View style={{flex:2,margin:8}}>
        <Text style={{fontSize:18,padding:2}}>{item.title}</Text>
        <Text style={{fontSize:16,padding:2}}>{item.scanDate}</Text>
        <Text style={{fontSize:16,padding:2}}>{item.modality}</Text>
        <Text style={{fontSize:16,padding:2}}>{item.serialNo}</Text>
        </View>
        <View style={{flex:1,justifyContent:'flex-end'}}>
                <TouchableOpacity style={{backgroundColor: '#404958',margin: 8,borderRadius:8}}
                     onPress={()=>
                         index == 0 ? NativeModules.AppDelegate.pushVC('DICOMViewController') : NativeModules.AppDelegate.pushVC('MultipleDICOMViewController')
                     }
                >
                        <Text style={{textAlign:'center',marginVertical:8,color:'#fff',fontSize:17}}>{"Reports"}</Text>
                    
                </TouchableOpacity> 
        </View>   
        </View> 
    </View>
    );

    
}
function FlatListItemSeparator() {
    return (
        <View style={{
            height: .7,
            width: "100%",
            backgroundColor: "rgba(0,0,0,0.5)",
          }}
          />
    );
}
export default Reports;