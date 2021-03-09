//
//  DarkThemePreview.swift
//  SwiftUIPreviewsAtScale
//
//  Created by Vadim Bulavin on 5/17/20.
//  Copyright © 2020 Vadim Bulavin. All rights reserved.
//

import SwiftUI

public struct DarkThemePreview<Preview: View>: View {
    private let preview: Preview

    public var body: some View {
        preview
            .previewLayout(.sizeThatFits)
            .background(Color(.systemBackground))
            .environment(\.colorScheme, .dark)
            .previewDisplayName("Dark Theme")
    }

    init(@ViewBuilder builder: @escaping () -> Preview) {
        preview = builder()
    }
}
