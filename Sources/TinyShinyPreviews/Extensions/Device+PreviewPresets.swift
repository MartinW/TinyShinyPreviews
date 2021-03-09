//
//  UIDevicePreview.swift
//  TinyShinyPreviews
//
//  Created by Martin Wright on 08/03/2021

/** [SwiftLee: SwiftUI Previews: Validating views in different states](https://www.avanderlee.com/swiftui/previews-different-states/) */

/** [iPhone 12 Size Comparison](https://www.macrumors.com/guide/iphone-12-size-comparison/) */

import SwiftUI

//public enum device {
//    case iPhone12, iPhone11
//}

public enum Device: String {
    case iPhoneSE = "iPhone SE (2nd generation)"
    case iPhone11Pro = "iPhone 11 Pro"
    case iPhone11ProMax = "iPhone 11 Pro Max"
    case iPhone12Mini = "iPhone 12 mini"
    case iPhone12 = "iPhone 12"
    case iPhone12ProMax = "iPhone 12 Pro Max"
}

public extension View {
    
    /// TinyShinyPreview previewDevice
    /// 
    /// - Parameter device: required iOS device
    /// - Returns: Preview view
    func previewDevice(device: Device) -> some View {
        switch device {
        case .iPhoneSE:
            return DevicePreview("iPhone SE (2nd generation)", name: "iPhone 7/8/SE 2") { self }
        case .iPhone11Pro:
            return DevicePreview("iPhone 11 Pro", name: "iPhone X/XS/11 Pro") { self }
        case .iPhone11ProMax:
            return DevicePreview("iPhone 11 Pro Max", name: "iPhone 11 Pro Max / XS Max / 7 Plus / 8 Plus") { self }
        case .iPhone12Mini:
            let device = "iPhone 12 mini"
            return DevicePreview(device, name: device) {
                self
            }
        case .iPhone12:
            let device = "iPhone 12"
            return DevicePreview(device, name: device) {
                self
            }
        case .iPhone12ProMax:
            let device = "iPhone 12 Pro Max"
            return DevicePreview(device, name: device) {
                self
            }
        }
    }
}

public extension View {
    
    func previewiPhone11Sizes() -> some View {
        let content = self.padding()
        
        return Group {
            content.previewDevice(device: .iPhoneSE)
            content.previewDevice(device: .iPhone11Pro)
            content.previewDevice(device: .iPhone11ProMax)
        }
    }
    
    func previewiPhone12Sizes() -> some View {
        let content = self.padding()
        
        return Group {
            content.previewDevice(device: .iPhone12Mini)
            content.previewDevice(device: .iPhone12)
            content.previewDevice(device: .iPhone12ProMax)
        }
    }
}
