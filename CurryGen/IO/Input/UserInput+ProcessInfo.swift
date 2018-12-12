import Foundation

extension UserInput {
    
    static func readWithInfo (
        
        _ processInfo: ProcessInfo
        
        ) -> UserInput? {
        
        let payload = processInfo.arguments
        
        let curriedInit = curry(UserInput.init)
        
        return payload.converted(InputFlag.count.rawValue)
            .flatMap(curriedInit)
            .flatMap { payload.converted(InputFlag.output.rawValue).flatMap($0) }
            .flatMap { payload.converted(InputFlag.needsUncurried.rawValue).flatMap($0) }
        
    }
    
}
