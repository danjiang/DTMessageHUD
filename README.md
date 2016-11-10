## Introduction

![Demo](Demo.gif)

Simple loading HUD.

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

```
DTMessageHUD.show()
DTMessageHUD.dismiss()
```

### Customize

```
DTMessageHUD.setStyle(.light) // Light is default style
DTMessageHUD.setStyle(.dark)
```

