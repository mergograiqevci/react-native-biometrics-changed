
import { NativeModules } from 'react-native';

const { RNBiometricsDetection } = NativeModules;

export const hasFingerPrintChanged = async (): Promise<boolean>=>{
    try {
        const hasChanged = await RNBiometricsDetection.hasFingerPrintChanged()
        return hasChanged as boolean
    } catch (error) {
        throw error
    }
}