//
//  UIDevicePreview.swift
//  TinyShinyPreviews
//
//  Created by Martin Wright on 08/03/2021

/** [SwiftLee: SwiftUI Previews: Validating views in different states](https://www.avanderlee.com/swiftui/previews-different-states/) */

/** [Vadim Bulavin: SwiftUI Previews at Scale](https://www.vadimbulavin.com/swiftui-previews-at-scale/) */

import SwiftUI

public extension View {
    func previewSupportedLocales() -> some View {
        LocalePreview { self }
    }
    
    func previewDarkTheme() -> some View {
        DarkThemePreview { self }
    }
    
    func previewRightToLeft() -> some View {
        RightToLeftPreview { self }
    }
    
    func previewContentSize(_ sizeCategory: ContentSizeCategory) -> some View {
        ContentSizeCategoryPreview(sizeCategory) { self }
    }
}

public extension View {
    func previewElement() -> some View {
        let content = self.padding()
        
        return Group {
            content.previewLayout(.sizeThatFits)
            content.previewDarkTheme()
            content.previewContentSize(.extraSmall)
            content.previewContentSize(.large)
            content.previewContentSize(.extraExtraExtraLarge)
        }
    }
}
