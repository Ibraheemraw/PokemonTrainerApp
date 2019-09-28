import UIKit

class StatsView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var speedValue: UILabel!
    @IBOutlet weak var specialDefenseValue:UILabel!
    @IBOutlet weak var specialAttackValue:UILabel!
    @IBOutlet weak var defenseValue:UILabel!
    @IBOutlet weak var attackValue:UILabel!
    @IBOutlet weak var hpValue:UILabel!
    override init(frame: CGRect) {
         super.init(frame: UIScreen.main.bounds)
         commonInit()
       }
       required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
         commonInit()
       }
       private func commonInit(){
           Bundle.main.loadNibNamed("StatsView", owner: self, options: nil)
           addSubview(contentView)
           contentView.frame = bounds
           contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       }
}
