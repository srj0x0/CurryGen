import Foundation

enum InputFlag: String {
    
    case count = "C"
    case output = "O"
    case needsUncurried = "U"
    
    var flag: String { return rawValue }
    
}
