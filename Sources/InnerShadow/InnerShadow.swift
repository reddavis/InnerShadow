import Foundation
import SwiftUI

struct InnerShadow: UIViewRepresentable {
    var color: Color
    var radius: Double
    var x: Double = 0
    var y: Double = 0
    var shape: InnerShadowShape

    func makeUIView(context: Context) -> _InnerShadowView {
        let view = _InnerShadowView(color: color, shape: shape)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = radius
        view.layer.shadowOffset = CGSize(width: x, height: y)
        view.layer.setValue(true, forKey: "invertsShadow")
        return view
    }

    func updateUIView(_ uiView: _InnerShadowView, context: Context) {
        uiView.color = color
        uiView.shape = shape
        uiView.layer.shadowRadius = radius
        uiView.layer.shadowOffset = CGSize(width: x, height: y)
    }
}

// MARK: _InnerShadowView

final class _InnerShadowView: UIView {
    var color: Color {
        didSet {
            layoutSubviews()
        }
    }

    var shape: InnerShadowShape {
        didSet {
            layoutSubviews()
        }
    }

    // Private
    private var registration: (any UITraitChangeRegistration)?

    // MARK: Initialization

    init(
        color: Color,
        shape: InnerShadowShape,
    ) {
        self.color = color
        self.shape = shape
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        registration = registerForTraitChanges([UITraitUserInterfaceStyle.self])
        { (view: Self, _) in
            view.layer.shadowColor = UIColor(view.color).cgColor
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.shadowColor = UIColor(color).cgColor
        layer.shadowPath = shape.path(bounds).cgPath

        let maskLayer = CAShapeLayer()
        maskLayer.path = shape.path(bounds).cgPath
        maskLayer.frame = bounds
        layer.mask = maskLayer
    }
}
