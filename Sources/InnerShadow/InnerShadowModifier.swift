import SwiftUI

struct InnerShadowModifier: ViewModifier {
    var color: Color
    var radius: Double
    var x: Double = 0
    var y: Double = 0
    var shape: InnerShadowShape

    func body(content: Content) -> some View {
        content
            .overlay {
                InnerShadow(
                    color: color,
                    radius: radius,
                    x: x,
                    y: y,
                    shape: shape,
                )
            }
    }
}

extension View {
    public func innerShadow(
        color: Color = .black.opacity(0.15),
        radius: Double,
        x: Double = 0,
        y: Double = 0,
        shape: InnerShadowShape,
    ) -> some View {
        modifier(
            InnerShadowModifier(
                color: color,
                radius: radius,
                x: x,
                y: y,
                shape: shape,
            )
        )
    }
}

// MARK: Preview

#Preview {
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
}
