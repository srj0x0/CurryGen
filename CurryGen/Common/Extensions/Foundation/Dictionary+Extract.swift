import Foundation

extension Dictionary where Key == String, Value == String {
    
    func extract <T: StringInitable> (
        
        _ key: Key,
        _ defaultValue: T? = nil
        
        ) -> T? {
        
        return self[key].flatMap(T.init) ?? defaultValue
        
    }
    
}
