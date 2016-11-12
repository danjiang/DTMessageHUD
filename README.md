## Introduction

Simple loading HUD.

![Demo](Demo.gif)

## Installation

### Requirement

iOS 8+

### [CocoaPods](http://cocoapods.org)

To install DTMessageHUD add a dependency to your Podfile:

```
pod "DTMessageHUD"
```

### [Carthage](https://github.com/Carthage/Carthage)

To install DTMessageHUD add a dependency to your Cartfile:

```
github "danjiang/DTMessageHUD"
```

```
carthage update --platform ios
```

## Usage

### Import

```swift
import DTMessageHUD
```

### Use

```swift
DTMessageHUD.show()
DTMessageHUD.dismiss()
```

### Customize

```swift
DTMessageHUD.setStyle(.light) // Light is default style
DTMessageHUD.setStyle(.dark)
```

