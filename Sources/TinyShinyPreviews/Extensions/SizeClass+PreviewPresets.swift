//
//  SizeClass+PreviewPresets.swift
//  TinyShinyPreviews
//
//  Created by Martin Wright on 10/03/2021

import SwiftUI


public enum SizeClass: String {
    case iPhonePortrait
    case iPhoneLandscape
    case iPhoneLarge
}

public extension View {
    func previewSizeClass(horizontal: UserInterfaceSizeClass, vertical: UserInterfaceSizeClass) -> some View {
        SizeClassPreview(horizontal, vertical) { self }
    }
    
    func previewSizeClass(sizeClass: SizeClass) -> some View {
        switch sizeClass {
        case .iPhonePortrait:
            return SizeClassPreview(horizontal: .compact, vertical: .regular, description: sizeClass.rawValue) { self }
        case .iPhoneLandscape:
            return SizeClassPreview(horizontal: .compact, vertical: .compact, description: sizeClass.rawValue) { self }
        case .iPhoneLarge:
            return SizeClassPreview(horizontal: .regular, vertical: .compact, description: sizeClass.rawValue) { self }
        }
    }

    func previewAllSizeClasses() -> some View {
        let content = self.padding()
        
        return Group {
            content.previewSizeClass(sizeClass: .iPhonePortrait)
            content.previewSizeClass(sizeClass: .iPhoneLandscape)
            content.previewSizeClass(sizeClass: .iPhoneLarge)
        }
    }
}
