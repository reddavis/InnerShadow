# Inner Shadow Yo!

i saw [this](https://x.com/Barbapapapps/status/1947350892791140593) tweet.

and was like...cool...

so i threw this into a lil SwiftUI package so i could play around with it and here it is.

> [!NOTE]
> This uses a private property on `CALayer`, should be fine, might not.

## Requirements

- iOS 18.0+

## Installation

### Swift Package Manager

In Xcode:

1. click `Project`.
2. click `Package Dependencies`.
3. click `+`.
4. enter package URL: `https://github.com/reddavis/InnerShadow`.
5. add `InnerShadow` to your app target.

## Usage

```swift
VStack(spacing: 20) {
    RoundedRectangle(cornerRadius: 16)
        .fill(.white)
        .frame(width: 100, height: 100)
        .innerShadow(radius: 10, x: 0, y: 6, shape: .rect(cornerRadius: 24))
    Capsule()
        .stroke(.black.opacity(0.15), lineWidth: 1)
        .fill(.white)
        .frame(width: 100, height: 50)
        .innerShadow(radius: 10, x: 0, y: 6, shape: .capsule)
    Circle()
        .fill(.white)
        .frame(width: 100, height: 100)
        .innerShadow(radius: 10, x: 0, y: 6, shape: .circle)
}
```

there are some standard predefined shapes but if you have a weird ass shape, 
you can use `InnerShadowShape`.

which is just:

```swift
public struct InnerShadowShape: Shape {
    public var path: @Sendable (CGRect) -> Path

    public func path(in rect: CGRect) -> Path {
        path(rect)
    }
}
```
