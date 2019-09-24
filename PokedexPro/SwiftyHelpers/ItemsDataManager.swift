import Foundation

final class ItemsDataManager{
    private static let filenameOne = "MyPokedex.plist"
    private static let filenameTwo = "MyPokemonParty.plist"

    static public func saveToDocumentsDirectory<T>(myModel model: T) -> (success: Bool, error: Error?){
        switch model {
        case is MyPokedex:
            let path = FileManagerHelper.filepathToDocumentsDirectory(filename: filenameOne)
            var myPokedex = fetchItemsFromDocumentsDirectory()
            myPokedex.append(model)
            do {
               let data = try PropertyListEncoder().encode(myPokedex)
                try data.write(to: path, options: Data.WritingOptions.atomic)
            } catch {
                print("property list decoding error: \(error)")
                return(false, nil)
            }
        case is MyPokemonParty:
            let path = FileManagerHelper.filepathToDocumentsDirectory(filename: filenameTwo)
            var myPokemonParty = fetchItemsFromDocumentsDirectory()
            myPokemonParty.append(model)
            do {
               let data = try PropertyListEncoder().encode(myPokemonParty)
                try data.write(to: path, options: Data.WritingOptions.atomic)
            } catch {
                print("property list decoding error: \(error)")
                return(false, nil)
            }
        default:
            print("no model chosen")
        }
         return(true, nil)
    }
    static public func fetchItemsFromDocumentsDirectory<T>() -> [T]{
    }
}
