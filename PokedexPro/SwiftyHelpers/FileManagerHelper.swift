import Foundation

final class FileManagerHelper {
  static public func documentsDirectory() -> URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
  }
  
  static public func filepathToDocumentsDirectory(filename name: String) -> URL {
    let path = documentsDirectory().appendingPathComponent(name)
    print(path)
    return path
  }
}
