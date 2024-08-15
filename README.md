
# react-native-biometrics-detection

## Getting started

`$ npm install react-native-biometrics-detection --save`

### Mostly automatic installation

`$ react-native link react-native-biometrics-detection`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-biometrics-detection` and add `RNBiometricsDetection.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNBiometricsDetection.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNBiometricsDetectionPackage;` to the imports at the top of the file
  - Add `new RNBiometricsDetectionPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-biometrics-detection'
  	project(':react-native-biometrics-detection').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-biometrics-detection/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-biometrics-detection')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNBiometricsDetection.sln` in `node_modules/react-native-biometrics-detection/windows/RNBiometricsDetection.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Biometrics.Detection.RNBiometricsDetection;` to the usings at the top of the file
  - Add `new RNBiometricsDetectionPackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNBiometricsDetection from 'react-native-biometrics-detection';

// TODO: What to do with the module?
RNBiometricsDetection;
```
  