import Foundation

extension String {
    
    mutating func appendMark (
        _ mark: String
    
        ) {
        
        self += "\n\n" + "// MARK: " + mark + "\n\n"
        
    }
    
}
