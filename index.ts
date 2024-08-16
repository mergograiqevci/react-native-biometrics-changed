
import { NativeModules } from 'react-native';

const { AwesomeLibrary } = NativeModules;

export const hasFingerPrintChanged = async (): Promise<boolean>=>{
    try {
        const hasChanged = await AwesomeLibrary.hasFingerPrintChanged()
        return hasChanged as boolean
    } catch (error) {
        throw error
    }
}

export default AwesomeLibrary;
