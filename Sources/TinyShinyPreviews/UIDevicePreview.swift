//
//  UIElementPreview.swift
//  FoodComponents
//
//  Created by Martin Wright on 15/11/2020.
//  https://www.avanderlee.com/swiftui/previews-different-states/

import SwiftUI

enum deviceGroup {
    case iPhone12, iPhone11
}

struct UIDevicePreview<Value: View>: View {
    
    private let viewToPreview: Value
    private let deviceStyle: deviceGroup
    
    init(_ viewToPreview: Value, displayStyle: deviceGroup) {
        self.viewToPreview = viewToPreview
        self.deviceStyle = displayStyle
    }

    var body: some View {
        switch deviceStyle {
        case .iPhone12:
            iPhone12View(viewToPreview: viewToPreview)
        case .iPhone11:
             iPhone11View(viewToPreview: viewToPreview)
        }
    }
}

struct iPhone12View<Value: View>: View {
    var viewToPreview: Value
    var body: some View {
        Group {
            viewToPreview
                .preferredColorScheme(.light)
                .environment(\.sizeCategory, .medium)
                .previewDevice("iPhone 12 mini")
                .previewLayout(.device)
                .previewDisplayName("iPhone 12 mini")
            viewToPreview
                .preferredColorScheme(.light)
                .environment(\.sizeCategory, .medium)
                .previewLayout(.device)
                .previewDevice("iPhone 12")
                .previewDisplayName("iPhone 12")
            viewToPreview
                .preferredColorScheme(.light)
                .environment(\.sizeCategory, .medium)
                .previewLayout(.device)
                .previewDevice("iPhone 12 Pro Max")
                .previewDisplayName("iPhone 12 Pro Max")
        }
    }
}

struct iPhone11View<Value: View>: View {
    // devices matching iPhone X and 11 sizes, including SE
    // https://www.macrumors.com/guide/iphone-12-size-comparison/
    var viewToPreview: Value
    var body: some View {
        Group {
            viewToPreview
                .preferredColorScheme(.light)
                .environment(\.sizeCategory, .medium)
                .previewDevice("iPhone SE (2nd generation)")
                .previewLayout(.device)
                .previewDisplayName("iPhone 7/8/SE 2")
            viewToPreview
                .preferredColorScheme(.light)
                .environment(\.sizeCategory, .medium)
                .previewLayout(.device)
                .previewDevice("iPhone 11 Pro")
                .previewDisplayName("iPhone X/XS/11 Pro")
            viewToPreview
                .preferredColorScheme(.light)
                .environment(\.sizeCategory, .medium)
                .previewLayout(.device)
                .previewDevice("iPhone 11 Pro Max")
                .previewDisplayName("iPhone 11 Pro Max / XS Max / 7 Plus / 8 Plus")
        }
    }
}

struct iPhoneVisionView<Value: View>: View {
    // overrides for accessibility
    // https://www.macrumors.com/guide/iphone-12-size-comparison/
    var viewToPreview: Value
    var body: some View {
        Group {
            viewToPreview
                .preferredColorScheme(.light)
                .environment(\.sizeCategory, .medium)
                .environment(\.legibilityWeight, .bold) // Bold Text
//                .environment(\.accessibilityInvertColors, .invert)
                .previewLayout(.device)
                .previewDevice("iPhone 12")
                .previewDisplayName("iPhone 12")
        }
    }
}
