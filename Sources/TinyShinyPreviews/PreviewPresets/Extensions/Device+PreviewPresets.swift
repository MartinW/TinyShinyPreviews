//
//  UIDevicePreview.swift
//  TinyShinyPreviews
//
//  Created by Martin Wright on 08/03/2021

/** [SwiftLee: SwiftUI Previews: Validating views in different states](https://www.avanderlee.com/swiftui/previews-different-states/) */

/** [iPhone 12 Size Comparison](https://www.macrumors.com/guide/iphone-12-size-comparison/) */

import SwiftUI

public enum deviceGroup {
    case iPhone12, iPhone11
}

public extension View {
    
    func previewiPhoneSE() -> some View {
        DevicePreview("iPhone SE (2nd generation)", name: "iPhone 7/8/SE 2") { self }
    }
    
    func previewiPhone11Pro() -> some View {
        DevicePreview("iPhone 11 Pro", name: "iPhone X/XS/11 Pro") { self }
    }
    
    func previewiPhone11ProMax() -> some View {
        DevicePreview("iPhone 11 Pro Max", name: "iPhone 11 Pro Max / XS Max / 7 Plus / 8 Plus") { self }
    }
    
    func previewiPhone12Mini() -> some View {
        let device = "iPhone 12 mini"
        return DevicePreview(device, name: device) {
            self
        }
    }
    
    func previewiPhone12() -> some View {
        let device = "iPhone 12"
        return DevicePreview(device, name: device) {
            self
        }
    }
    
    func previewiPhone12ProMax() -> some View {
        let device = "iPhone 12 Pro Max"
        return DevicePreview(device, name: device) {
            self
        }
    }
}

public extension View {
    
    func previewiPhone11Sizes() -> some View {
        let content = self.padding()
        
        return Group {
            content.previewiPhoneSE()
            content.previewiPhone11Pro()
            content.previewiPhone11ProMax()
        }
    }
    
    func previewiPhone12Sizes() -> some View {
        let content = self.padding()
        
        return Group {
            content.previewiPhone12Mini()
            content.previewiPhone12()
            content.previewiPhone12ProMax()
        }
    }
}
