import UIKit

class TrainerCardView: UIView {
    @IBOutlet var contentView: CornerView!
    @IBOutlet weak var trainerName: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var pokedexCount: UILabel!
    @IBOutlet weak var trainerProfileImage: CircularImageView!
    @IBOutlet weak var firstBadge: UIImageView!
    @IBOutlet weak var secondBadge: UIImageView!
    @IBOutlet weak var thirdBadge: UIImageView!
    @IBOutlet weak var forthBadge: UIImageView!
    @IBOutlet weak var fifthBadge: UIImageView!
    @IBOutlet weak var sixthBadge: UIImageView!
    @IBOutlet weak var seventhBadge: UIImageView!
    @IBOutlet weak var eigthBadge: UIImageView!
    @IBOutlet weak var topBannerCard: UIView!
    @IBOutlet weak var bottomBannerCard: UIView!
    
    override init(frame: CGRect) {
      super.init(frame: UIScreen.main.bounds)
      commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      commonInit()
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("TrainerCardView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}


