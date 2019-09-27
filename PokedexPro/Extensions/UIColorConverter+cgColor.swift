import UIKit

extension UIColor {
    convenience init? (hexString: String) {
        let hexString = hexString.trimmingCharacters(in: CharacterSet.punctuationCharacters)
        let filteredStr = hexString.filter{"aAbBcCdDeEfF0123456789".contains($0)}

        guard hexString.count == filteredStr.count, hexString.count == 6 else {
            return nil
        }

        let positionR = hexString.index(hexString.startIndex, offsetBy: 2)
        let positionG = hexString.index(hexString.startIndex, offsetBy: 4)

        guard let r = Double("0x" + hexString[..<positionR]),
            let g = Double("0x" + hexString[positionR..<positionG]),
            let b = Double("0x" + hexString[positionG...]) else { return nil }

        self.init(red:   CGFloat(r / 255),
                  green: CGFloat(g / 255),
                  blue:  CGFloat(b / 255),
                  alpha: 1)
    }
}

extension UIColor {
    //Pokemon color type
    static let normalType = UIColor(hexString: "#A8A878")
    static let fireType = UIColor(hexString: "#F08030")
    static let grassType = UIColor(hexString: "#78C84F")
    static let waterType = UIColor(hexString: "#6790F0")
    static let groundType = UIColor(hexString: "#DFC068")
    static let electricType = UIColor(hexString: "#F7D030")
    static let bugType = UIColor(hexString: "#A9B820")
    static let fightingType = UIColor(hexString: "#C03028")
    static let psychicType = UIColor(hexString: "#F75888")
    static let rockType = UIColor(hexString: "#B8A038")
    static let poisonType = UIColor(hexString: "#A040A0")
    static let darkType = UIColor(hexString: "#6F5848")
    static let flyingType = UIColor(hexString: "#A890F0")
    static let steelType = UIColor(hexString: "#B8B8D0")
    static let ghostType = UIColor(hexString: "#705898")
    static let dragonType = UIColor(hexString: "#7038F8")
    static let iceType = UIColor(hexString: "#98D8D8")
    // Black
    static let lightBlack = UIColor(hexString: "434343")!
    // Gray
    static let stone     = UIColor(hexString: "#D7DDE8")!
    static let cloudy    = UIColor(hexString: "#757F9A")!
    static let fog       = UIColor(hexString: "ebedee")!
    // Purple
    static let indigo    = UIColor(hexString: "3f5efb")!
    static let plum      = UIColor(hexString: "5c258d")!
    static let amethyst  = UIColor(hexString: "9d50bb")!
    static let violet    = UIColor(hexString: "3B0066")!
    // Blue
    static let bluejay   = UIColor(hexString: "00d2ff")!
    static let blueberry = UIColor(hexString: "3a7bd5")!
    static let ocean     = UIColor(hexString: "219DFF")!
    static let lightBlue = UIColor(hexString: "c7eafd")!
    static let seafoam   = UIColor(hexString: "00ecbc")!
    // Green
    static let clover    = UIColor(hexString: "0f9b0f")!
    static let grass     = UIColor(hexString: "a8e063")!
    static let lime      = UIColor(hexString: "24fe41")!
    static let limerick  = UIColor(hexString: "a2c115")!
    static let spring    = UIColor(hexString: "0fd850")!
    static let kindaGreen = UIColor(hexString: "50cc7f")!
    // Yellow
    static let gold      = UIColor(hexString: "D4AF37")!
    static let lemon     = UIColor(hexString: "f9f047")!
    static let marigold  = UIColor(hexString: "F6AE2D")!
    static let mustard  = UIColor(hexString: "F5DE45")!
    // Orange
    static let tangerine = UIColor(hexString: "fe8c00")!
    static let lightOrange = UIColor(hexString: "f6d365")!
    static let sunrise = UIColor(hexString: "fc4a1a")!
    static let bloodOrange = UIColor(hexString: "f00000")!
    // Red
    static let tomato    = UIColor(hexString: "f83600")!
    static let fullRed   = UIColor(hexString: "ff0000")!
    static let lightRed  = UIColor(hexString: "eb5757")!
    static let bloodRed  = UIColor(hexString: "#870000")!
    // Pink
    static let pink      = UIColor(hexString: "ec77ab")!
    static let lightPink = UIColor(hexString: "f4c4f3")!
    static let candy     = UIColor(hexString: "e5b2ca")!
    // White
    static let sutleWhite      = UIColor(hexString: "#ECE9E6")!
    static let fullWhite = UIColor(hexString: "#FFFFFF")!
}

extension CGColor {
    static let darks  = [UIColor.darkType!.cgColor, UIColor.black.cgColor]
    static let steels   = [UIColor.steelType!.cgColor, UIColor.black.cgColor]
    static let fires    = [UIColor.fireType!.cgColor, UIColor.black.cgColor]
    static let normals = [UIColor.normalType!.cgColor, UIColor.black.cgColor]
    static let grasses   = [UIColor.grassType!.cgColor, UIColor.black.cgColor]
    static let waters  = [UIColor.waterType!.cgColor, UIColor.black.cgColor]
    static let grounds   = [UIColor.groundType!.cgColor, UIColor.black.cgColor]
    static let electrics = [UIColor.electricType!.cgColor, UIColor.black.cgColor]
    static let bugs   = [UIColor.bugType!.cgColor, UIColor.black.cgColor]
    static let fightings = [UIColor.fightingType!.cgColor, UIColor.black.cgColor]
    static let psychics = [UIColor.psychicType!.cgColor, UIColor.black.cgColor]
    static let rocks = [UIColor.rockType!.cgColor, UIColor.black.cgColor]
    static let poisons = [UIColor.poisonType!.cgColor, UIColor.black.cgColor]
    static let flyings = [UIColor.flyingType!.cgColor, UIColor.black.cgColor]
    static let ghosts = [UIColor.ghostType!.cgColor, UIColor.black.cgColor]
    static let dragons = [UIColor.dragonType!.cgColor, UIColor.black.cgColor]
    static let ices = [UIColor.blueberry.cgColor, UIColor.bluejay.cgColor]
}
