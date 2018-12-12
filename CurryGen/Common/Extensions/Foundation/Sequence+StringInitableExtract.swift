import Foundation

extension Array where Element == String {
    
    func converted <T: StringInitable> (
        
        _ index: Int
        
        ) -> T? {
        
        return T(self[index])
        
    }
    
}
