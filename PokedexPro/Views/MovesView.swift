import UIKit

class MovesView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var move1: CornerButton!
    @IBOutlet weak var move2: CornerButton!
    @IBOutlet weak var move3: CornerButton!
    @IBOutlet weak var move4: CornerButton!
    override init(frame: CGRect) {
         super.init(frame: UIScreen.main.bounds)
         commonInit()
       }
       required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         commonInit()
       }
       private func commonInit(){
           Bundle.main.loadNibNamed("MovesView", owner: self, options: nil)
           addSubview(contentView)
           contentView.frame = bounds
           contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       }
}
