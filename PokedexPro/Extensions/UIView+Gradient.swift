import UIKit

extension UIView {
    public func setGradient(cgColors colors: [CGColor]){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: -1.0, y: 0.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
