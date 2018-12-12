import Foundation

extension String {
    
    typealias Wrapper = (String) -> String
    
    enum Wrappers {
        
        static let genericDefinition: Wrapper = { "<\($0)>" }
        static let functionCall: (String) -> Wrapper = { name in { "\(name)(\($0))" } }
        
    }
    
    func wrap(
        
        _ wrapper: @escaping Wrapper
        
        ) -> String {
        
        return wrapper(self)
    }
    
}
