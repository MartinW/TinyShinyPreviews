//
//  SizeClassPreview.swift
//  TinyShinyPreviews
//
//  Created by Martin Wright on 09/03/2021

import SwiftUI

struct SizeClassPreview<Preview: View>: View {
    private let preview: Preview
    private let horizontalSizeClass: UserInterfaceSizeClass
    private let verticalSizeClass: UserInterfaceSizeClass
    private var description: String = ""

    func getPreviewWidth(horizontalSizeClass: UserInterfaceSizeClass) -> CGFloat {
        //portrait iphone
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            return UIScreen.main.bounds.width
        }
        //landscape iphone
        if horizontalSizeClass == .compact && verticalSizeClass == .compact {
            return UIScreen.main.bounds.height
        }
        //large landscape iphone
        if horizontalSizeClass == .regular && verticalSizeClass == .compact {
            return UIScreen.main.bounds.height
        }
        return UIScreen.main.bounds.width
    }
    
    func getPreviewHeight(verticalSizeClass: UserInterfaceSizeClass) -> CGFloat {
        //portrait iphone
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            return UIScreen.main.bounds.height
        }
        //landscape iphone
        if horizontalSizeClass == .compact && verticalSizeClass == .compact {
            return UIScreen.main.bounds.width
        }
        //large landscape iphone
        if horizontalSizeClass == .regular && verticalSizeClass == .compact {
            return UIScreen.main.bounds.width
        }
        // ipad - regular regular - doesn't need any handling
        return UIScreen.main.bounds.height
    }
    
    var body: some View {
        preview
            .preferredColorScheme(.light)
            .environment(\.horizontalSizeClass, horizontalSizeClass)
            .environment(\.verticalSizeClass, verticalSizeClass)
            .previewLayout(PreviewLayout.fixed(width: getPreviewWidth(horizontalSizeClass: horizontalSizeClass), height: getPreviewHeight(verticalSizeClass: verticalSizeClass)))
            .previewDisplayName("\(description) \(horizontalSizeClass) \(verticalSizeClass)")
    }

    init(_ horizontal: UserInterfaceSizeClass, _ vertical: UserInterfaceSizeClass, @ViewBuilder builder: @escaping () -> Preview) {
        self.horizontalSizeClass = horizontal
        self.verticalSizeClass = vertical
        preview = builder()
    }
    
    init(horizontal: UserInterfaceSizeClass, vertical: UserInterfaceSizeClass, description: String, @ViewBuilder builder: @escaping () -> Preview) {
        self.horizontalSizeClass = horizontal
        self.verticalSizeClass = vertical
        self.description = description
        preview = builder()
    }
}
