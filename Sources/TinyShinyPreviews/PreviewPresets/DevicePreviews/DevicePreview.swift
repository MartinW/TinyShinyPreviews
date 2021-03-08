//
//  UIDevicePreview.swift
//  TinyShinyPreviews
//
//  Created by Martin Wright on 08/03/2021

/** [SwiftLee: SwiftUI Previews: Validating views in different states](https://www.avanderlee.com/swiftui/previews-different-states/) */

/** [Vadim Bulavin: SwiftUI Previews at Scale](https://www.vadimbulavin.com/swiftui-previews-at-scale/) */

import SwiftUI

struct DevicePreview<Preview: View>: View {
    private let preview: Preview
    private let device: String
    private let name: String

    var body: some View {
        preview
            .preferredColorScheme(.light)
            .environment(\.sizeCategory, .medium)
            .previewDevice(PreviewDevice(rawValue: "\(device)"))
            .previewLayout(.device)
            .previewDisplayName("\(name)")
    }

    init(_ device: String, name: String, @ViewBuilder builder: @escaping () -> Preview) {
        self.device = device
        self.name = name
        preview = builder()
    }
}
