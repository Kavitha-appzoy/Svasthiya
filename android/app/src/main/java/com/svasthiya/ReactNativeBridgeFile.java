package com.svasthiya;
import com.facebook.react.ReactInstanceManager;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.CatalystInstance;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.WritableNativeArray;
class ReactNativeModule extends ReactContextBaseJavaModule {

    ReactNativeModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "NativeModuleActivity";
    }

    @ReactMethod
    void navigateToNativeModules() {
        System.out.println("navigatetoExampleCalled");
        // ReactApplicationContext context = getReactApplicationContext();
        // Intent intent = new Intent(context, ExampleActivity.class);
        // context.startActivity(intent);
    }
}