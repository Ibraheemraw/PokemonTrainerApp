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
    static public func setDetailViewBackgroundColor(viewController controller: PokemonDetailController, pocketMonsterType type: String,myView view: MovesView){
        switch controller.pokemonType1.text {
        case PocketMonsterTypes.normal.rawValue:
            controller.view.layer.backgroundColor = UIColor.normalType?.cgColor
            view.move1.setGradient(cgColors: CGColor.normals)
            view.move2.setGradient(cgColors: CGColor.normals)
            view.move3.setGradient(cgColors: CGColor.normals)
            view.move4.setGradient(cgColors: CGColor.normals)
        case PocketMonsterTypes.fire.rawValue:
             controller.view.layer.backgroundColor = UIColor.fireType?.cgColor
            view.move1.setGradient(cgColors: CGColor.fires)
            view.move2.setGradient(cgColors: CGColor.fires)
            view.move3.setGradient(cgColors: CGColor.fires)
            view.move4.setGradient(cgColors: CGColor.fires)
        case PocketMonsterTypes.fighting.rawValue:
             controller.view.layer.backgroundColor = UIColor.fightingType?.cgColor
             view.move1.setGradient(cgColors: CGColor.fightings)
            view.move2.setGradient(cgColors: CGColor.fightings)
            view.move3.setGradient(cgColors: CGColor.fightings)
            view.move4.setGradient(cgColors: CGColor.fightings)
        case PocketMonsterTypes.water.rawValue:
             controller.view.layer.backgroundColor = UIColor.waterType?.cgColor
             view.move1.setGradient(cgColors: CGColor.waters)
            view.move2.setGradient(cgColors: CGColor.waters)
            view.move3.setGradient(cgColors: CGColor.waters)
            view.move4.setGradient(cgColors: CGColor.waters)
        case PocketMonsterTypes.flying.rawValue:
             controller.view.layer.backgroundColor = UIColor.flyingType?.cgColor
             view.move1.setGradient(cgColors: CGColor.flyings)
            view.move2.setGradient(cgColors: CGColor.flyings)
            view.move3.setGradient(cgColors: CGColor.flyings)
            view.move4.setGradient(cgColors: CGColor.flyings)
        case PocketMonsterTypes.grass.rawValue:
             controller.view.layer.backgroundColor = UIColor.grassType?.cgColor
            view.move1.setGradient(cgColors: CGColor.grasses)
            view.move2.setGradient(cgColors: CGColor.grasses)
            view.move3.setGradient(cgColors: CGColor.grasses)
            view.move4.setGradient(cgColors: CGColor.grasses)
        case PocketMonsterTypes.poison.rawValue:
             controller.view.layer.backgroundColor = UIColor.poisonType?.cgColor
             view.move1.setGradient(cgColors: CGColor.poisons)
            view.move2.setGradient(cgColors: CGColor.poisons)
            view.move3.setGradient(cgColors: CGColor.poisons)
            view.move4.setGradient(cgColors: CGColor.poisons)
        case PocketMonsterTypes.electric.rawValue:
             controller.view.layer.backgroundColor = UIColor.electricType?.cgColor
             view.move1.setGradient(cgColors: CGColor.electrics)
            view.move2.setGradient(cgColors: CGColor.electrics)
            view.move3.setGradient(cgColors: CGColor.electrics)
            view.move4.setGradient(cgColors: CGColor.electrics)
        case PocketMonsterTypes.ground.rawValue:
             controller.view.layer.backgroundColor = UIColor.groundType?.cgColor
            view.move1.setGradient(cgColors: CGColor.grounds)
            view.move2.setGradient(cgColors: CGColor.grounds)
            view.move3.setGradient(cgColors: CGColor.grounds)
            view.move4.setGradient(cgColors: CGColor.grounds)
        case PocketMonsterTypes.psychic.rawValue:
             controller.view.layer.backgroundColor = UIColor.psychicType?.cgColor
             view.move1.setGradient(cgColors: CGColor.psychics)
            view.move2.setGradient(cgColors: CGColor.psychics)
            view.move3.setGradient(cgColors: CGColor.psychics)
            view.move4.setGradient(cgColors: CGColor.psychics)
        case PocketMonsterTypes.rock.rawValue:
             controller.view.layer.backgroundColor = UIColor.rockType?.cgColor
            view.move1.setGradient(cgColors: CGColor.rocks)
            view.move2.setGradient(cgColors: CGColor.rocks)
            view.move3.setGradient(cgColors: CGColor.rocks)
            view.move4.setGradient(cgColors: CGColor.rocks)
        case PocketMonsterTypes.ice.rawValue:
             controller.view.layer.backgroundColor = UIColor.iceType?.cgColor
            view.move1.setGradient(cgColors: CGColor.ices)
            view.move2.setGradient(cgColors: CGColor.ices)
            view.move3.setGradient(cgColors: CGColor.ices)
            view.move4.setGradient(cgColors: CGColor.ices)
        case PocketMonsterTypes.bug.rawValue:
             controller.view.layer.backgroundColor = UIColor.bugType?.cgColor
            view.move1.setGradient(cgColors: CGColor.bugs)
            view.move2.setGradient(cgColors: CGColor.bugs)
            view.move3.setGradient(cgColors: CGColor.bugs)
            view.move4.setGradient(cgColors: CGColor.bugs)
        case PocketMonsterTypes.dragon.rawValue:
             controller.view.layer.backgroundColor = UIColor.dragonType?.cgColor
            view.move1.setGradient(cgColors: CGColor.dragons)
            view.move2.setGradient(cgColors: CGColor.dragons)
            view.move3.setGradient(cgColors: CGColor.dragons)
            view.move4.setGradient(cgColors: CGColor.dragons)
        case PocketMonsterTypes.ghost.rawValue:
             controller.view.layer.backgroundColor = UIColor.ghostType?.cgColor
            view.move1.setGradient(cgColors: CGColor.ghosts)
            view.move2.setGradient(cgColors: CGColor.ghosts)
            view.move3.setGradient(cgColors: CGColor.ghosts)
            view.move4.setGradient(cgColors: CGColor.ghosts)
        case PocketMonsterTypes.dark.rawValue:
             controller.view.layer.backgroundColor = UIColor.darkType?.cgColor
            view.move1.setGradient(cgColors: CGColor.darks)
            view.move2.setGradient(cgColors: CGColor.darks)
            view.move3.setGradient(cgColors: CGColor.darks)
            view.move4.setGradient(cgColors: CGColor.darks)
        case PocketMonsterTypes.steel.rawValue:
             controller.view.layer.backgroundColor = UIColor.steelType?.cgColor
            view.move1.setGradient(cgColors: CGColor.steels)
            view.move2.setGradient(cgColors: CGColor.steels)
            view.move3.setGradient(cgColors: CGColor.steels)
            view.move4.setGradient(cgColors: CGColor.steels)
        default:
            break
        }
    }
}
