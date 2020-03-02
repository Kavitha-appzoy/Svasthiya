import React from 'react';
import {StatusBar} from 'react-native';
import colors from '../themes/colors';
function AppStatusBar(){
    return(
        <StatusBar backgroundColor={colors.appTheme}  barStyle='light-content' />
    );
   
}
export default AppStatusBar;