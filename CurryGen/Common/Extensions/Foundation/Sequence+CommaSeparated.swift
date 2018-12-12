import Foundation

extension Sequence where Self.Element == String {
    
    var commaSeparated: String { return joined(separator: ", ") }
    
}
