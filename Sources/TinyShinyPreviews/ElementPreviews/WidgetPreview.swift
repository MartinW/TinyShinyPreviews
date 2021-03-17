//
//  WidgetKitPreview.swift
//  TinyShinyPreviews
//
//  Created by Martin Wright on 12/03/2021

import WidgetKit
import SwiftUI

@available(iOS 14.0, *)
struct WidgetPreview<Preview: View>: View {
    private let preview: Preview
    private let widgetFamily: WidgetFamily
    private var colorScheme = ColorScheme.light

    var body: some View {
        preview
            .previewContext(WidgetPreviewContext(family: widgetFamily))
            .previewDisplayName("Widget \(widgetFamily.description)")
            .background(Color(.systemBackground))
            .environment(\.colorScheme, colorScheme)
    }

    init(_ widgetFamily: WidgetFamily, @ViewBuilder builder: @escaping () -> Preview) {
        self.widgetFamily = widgetFamily
        preview = builder()
    }
    
    init(_ widgetFamily: WidgetFamily, _ colorScheme: ColorScheme, @ViewBuilder builder: @escaping () -> Preview) {
        self.widgetFamily = widgetFamily
        self.colorScheme = colorScheme
        preview = builder()
    }
}

public extension View {
    @available(iOS 14.0, *)
    
    func previewWidgets() -> some View {
        let content = self.padding()
        
        return Group {
            content.previewWidget(.systemSmall)
            content.previewWidget(.systemMedium)
            content.previewWidget(.systemLarge)
        }
    }
}
