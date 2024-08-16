# react-native-biometrics-detection

## Getting started

1. In package.json add this package-> "react-native-biometrics-changed": "git+https://github.com/mergograiqevci/react-native-biometrics-changed.git"
2. After you add the line above execute the yarn install command
3. For ios execute pod install

## Usage

```javascript
import { hasFingerPrintChanged } from "react-native-biometrics-changed";

try {
  const res = await hasFingerPrintChanged();
  return res;
} catch (error) {
  // do something with error
}
```
