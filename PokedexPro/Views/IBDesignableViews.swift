import UIKit

@IBDesignable
class CircularButton: UIButton {
  override func layoutSubviews() {
    super.layoutSubviews()
    imageView?.contentMode = .scaleAspectFill
    layer.cornerRadius = bounds.width / 2.0
    layer.borderColor = UIColor.lightGray.cgColor
    layer.borderWidth = 0.5
    clipsToBounds = true
  }
}

@IBDesignable
class CircularImageView: UIImageView {
  override func layoutSubviews() {
    super.layoutSubviews()
    contentMode = .scaleAspectFill
    layer.cornerRadius = bounds.width / 2.0
    layer.borderColor = UIColor.lightGray.cgColor
    layer.borderWidth = 0.5
    clipsToBounds = true
  }
}

@IBDesignable
class CircularView: UIImageView {
  override func layoutSubviews() {
    super.layoutSubviews()
    contentMode = .scaleAspectFill
    layer.cornerRadius = bounds.width / 2.0
    layer.borderColor = UIColor.lightGray.cgColor
    layer.borderWidth = 0.5
    clipsToBounds = true
  }
}

@IBDesignable
class CornerButton: UIButton {
  override func layoutSubviews() {
    super.layoutSubviews()
    imageView?.contentMode = .scaleAspectFill
    layer.cornerRadius = 6.0
    layer.borderColor = UIColor.black.cgColor
    layer.borderWidth = 0.5
    clipsToBounds = true
  }
}

class CornerView: UIView {
  override func layoutSubviews() {
    super.layoutSubviews()
    self.contentMode = .scaleAspectFill
    layer.cornerRadius = 30.0
    clipsToBounds = true
  }
}

@IBDesignable
class CornerImageView: UIImageView {
  override func layoutSubviews() {
    super.layoutSubviews()
    contentMode = .scaleAspectFill
    layer.cornerRadius = 12.0
    clipsToBounds = true
  }
}
@IBDesignable
class RightPartyPokemonView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let corners = UIRectCorner(arrayLiteral: .topRight, .bottomRight)
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: 50, height: 50))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
@IBDesignable
class LeftPartyPokemonView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let corners = UIRectCorner(arrayLiteral: .topLeft, .bottomLeft)
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: 50, height: 50))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
class PokemonIDView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let corners = UIRectCorner(arrayLiteral: .bottomRight, .bottomLeft)
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: 20, height: 20))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
