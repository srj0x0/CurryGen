import Foundation

final class Generator {
    
    class func makeArgs (
        
        _ count: Int
        
        ) -> [String] {
        
        return (1...count).map { "A\($0)" }
        
    }
    
}

