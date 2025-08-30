import SwiftUI

public struct InnerShadowShape: Shape {
    public var path: @Sendable (CGRect) -> Path

    public func path(in rect: CGRect) -> Path {
        path(rect)
    }
}

public extension Shape where Self == InnerShadowShape {
    static var capsule: Self {
        .init { rect in
            Path(
                UIBezierPath(
                    roundedRect: rect,
                    cornerRadius: floor(rect.height / 2.0)
                ).cgPath
            )
        }
    }

    static var circle: Self {
        .init { rect in
            Path(
                UIBezierPath(ovalIn: rect).cgPath
            )
        }
    }

    static var rect: Self {
        .init { rect in
            Path(roundedRect: rect, cornerRadius: 0)
        }
    }

    static func rect(cornerRadius: Double = 0) -> Self {
        .init { rect in
            Path(roundedRect: rect, cornerRadius: cornerRadius)
        }
    }

    static func unevenRect(corners: UIRectCorner, cornerRadius: Double) -> Self {
        .init { rect in
            Path(
                UIBezierPath(
                    roundedRect: rect,
                    byRoundingCorners: corners,
                    cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
                ).cgPath
            )
        }
    }
}
