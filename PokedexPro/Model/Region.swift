import UIKit

struct Region {
    static let regions = ["Kanto", "Johto", "Hoenn", "Sinnoh", "Unova", "Kalos", "Alola", "Galar"]
    public static func setBackgrougnColor(myRegion region: String, trainerCardView: TrainerCardView, myView view: UIView){
        guard let region = trainerCardView.region.text, !region.isEmpty else {
            return
        }
        switch region {
        case "Kanto":
            view.setGradient(cgColors: CGColor.golds)
        case "Johto":
            view.setGradient(cgColors: CGColor.oranges)
        case "Hoenn":
            view.setGradient(cgColors: CGColor.greens)
        case "Sinnoh":
            view.setGradient(cgColors: CGColor.pinks)
        case "Unova":
            view.setGradient(cgColors: CGColor.blacks)
        case "Kalos":
            view.setGradient(cgColors: CGColor.reds)
        case "Alola":
            view.setGradient(cgColors: CGColor.blues)
        case "Galar":
            view.setGradient(cgColors: CGColor.ices)
        default:
            break
        }
    }
}
