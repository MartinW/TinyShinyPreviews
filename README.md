# TinyShinyPreviews

SwiftUI Preview helpers for checking adaptability. Element previews for light and dark mode, localizations and dynamic type sizes. Device previews for iPhone 11 class devices and iPhone 12 class devices.

## Installation

TinyShinyPreviews is available via Swift Package Manager.

From Xcode, go to File -\> Swift Packages -\> Add Package Dependency and enter [https://github.com/tinyshinyapps/TinyShinyPreviews](https://github.com/tinyshinyapps/TinyShinyPreviews)

Then

```swift

import TinyShinyPreviews

```  

## Preview Element

### Description

Helpers for preview of SwiftUI views. Allows previews of an individual component in different states for color scheme, localisations and dynamic type settings.

### Usage

```swift
import SwiftUI
import TinyShinyPreviews

struct HelloWorld: View {
  var body: some View {
    Text("Hello, World!")
  }
}

struct HelloWorld_Previews: PreviewProvider {
  static var previews: some View {
      HelloWorld().previewElement()
    }
}

```
#### Specific element previews: 

 - previewSupportedLocales() 
 - previewDarkTheme() 
 - previewRightToLeft()
 - previewContentSize(sizeCategory: ContentSizeCategory)


## Preview Device

### Description

Helpers for preview of SwiftUI screens. Allows previews of an app screen with device bezel in multiple device sizes.

For iPhone 12 size classes, the devices are iPhone 12 mini, iPhone 12, iPhone 12 Pro Max.

For iPhone 11 size classes, the devices are:

| Label | Devices |
|-------|---------|
| iPhone SE (2nd generation)  | iPhone 7/8/SE 2  |
| iPhone 11 Pro  | iPhone X/XS/11 Pro |
| iPhone 11 Pro Max  | iPhone 11 Pro Max / XS Max / 7 Plus / 8 Plus  |
  
Default device names are used. Device names need to match the names in Xcode in Devices and Simulators.

### Usage

For device preview: `ContentView().previewDevice(device: .iPhone11Pro)`

Can be repeated: ```ContentView().previewDevice(device: .iPhone12Mini)
ContentView().previewDevice(device: .iPhone11Pro)```

For size classes: `ContentView().previewiPhone12Sizes()`

```swift
import SwiftUI
import TinyShinyPreviews

struct ContentView: View {
  var body: some View {
    HStack {
      HelloWorld()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().previewDevice(device: .iPhone11Pro)
    ContentView().previewiPhone12Sizes() 
  }
}

```
Be sure to use `.previewDevice(device: )` (for TinyShinyPreviews) not `.previewDevice(value: )` (for SwiftUI)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details

## Acknowledgments

- [SwiftLee: SwiftUI Previews: Validating views in different states](https://www.avanderlee.com/swiftui/previews-different-states/)

- [Vadim Bulavin: SwiftUI Previews at Scale](https://www.vadimbulavin.com/swiftui-previews-at-scale/)
