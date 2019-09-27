import UIKit


enum PocketMonsterTypes: String, CaseIterable {
    case normal = "normal"
    case fire = "fire"
    case fighting = "fighting"
    case water = "water"
    case flying = "flying"
    case grass = "grass"
    case poison = "poison"
    case electric = "electric"
    case ground = "ground"
    case psychic = "psychic"
    case rock = "rock"
    case ice = "ice"
    case bug = "bug"
    case dragon = "dragon"
    case ghost = "ghost"
    case dark = "dark"
    case steel = "steel"
}

struct PocketMonsterCell {
    static public func setCellColor(myCell cell: PokemonCell, pocketMonsterType type: String){
        switch cell.type1.text {
        case PocketMonsterTypes.normal.rawValue:
            cell.layer.backgroundColor = UIColor.normalType?.cgColor
        case PocketMonsterTypes.fire.rawValue:
             cell.layer.backgroundColor = UIColor.fireType?.cgColor
        case PocketMonsterTypes.fighting.rawValue:
             cell.layer.backgroundColor = UIColor.fightingType?.cgColor
        case PocketMonsterTypes.water.rawValue:
             cell.layer.backgroundColor = UIColor.waterType?.cgColor
        case PocketMonsterTypes.flying.rawValue:
             cell.layer.backgroundColor = UIColor.flyingType?.cgColor
        case PocketMonsterTypes.grass.rawValue:
             cell.layer.backgroundColor = UIColor.grassType?.cgColor
        case PocketMonsterTypes.poison.rawValue:
             cell.layer.backgroundColor = UIColor.poisonType?.cgColor
        case PocketMonsterTypes.electric.rawValue:
             cell.layer.backgroundColor = UIColor.electricType?.cgColor
        case PocketMonsterTypes.ground.rawValue:
             cell.layer.backgroundColor = UIColor.groundType?.cgColor
        case PocketMonsterTypes.psychic.rawValue:
             cell.layer.backgroundColor = UIColor.psychicType?.cgColor
        case PocketMonsterTypes.rock.rawValue:
             cell.layer.backgroundColor = UIColor.rockType?.cgColor
        case PocketMonsterTypes.ice.rawValue:
             cell.layer.backgroundColor = UIColor.iceType?.cgColor
        case PocketMonsterTypes.bug.rawValue:
             cell.layer.backgroundColor = UIColor.bugType?.cgColor
        case PocketMonsterTypes.dragon.rawValue:
             cell.layer.backgroundColor = UIColor.dragonType?.cgColor
        case PocketMonsterTypes.ghost.rawValue:
             cell.layer.backgroundColor = UIColor.ghostType?.cgColor
        case PocketMonsterTypes.dark.rawValue:
             cell.layer.backgroundColor = UIColor.darkType?.cgColor
        case PocketMonsterTypes.steel.rawValue:
             cell.layer.backgroundColor = UIColor.steelType?.cgColor
        default:
            break
        }
    }
}
