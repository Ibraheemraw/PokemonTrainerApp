import UIKit

class MovesView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var move1: UIButton!
    @IBOutlet weak var move2: UIButton!
    @IBOutlet weak var move3: UIButton!
    @IBOutlet weak var move4: UIButton!
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
    private func setupButtonUI(){
        move1.setGradient(cgColors: CGColor.fire)
        move1.layer.cornerRadius = 6
        move2.setGradient(cgColors: CGColor.fire)
        move2.layer.cornerRadius = 6
        move3.setGradient(cgColors: CGColor.fire)
        move3.layer.cornerRadius = 6
        move4.setGradient(cgColors: CGColor.fire)
        move4.layer.cornerRadius = 6
    }
}
