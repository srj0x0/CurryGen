import Foundation

extension UserInput {
    
    static func readWithInfo (
        
        _ processInfo: ProcessInfo
        
        ) -> UserInput? {
        
        let payload = processInfo.environment
        
        let curriedInit = curry(UserInput.init)
        
        return payload.extract(InputFlag.count.rawValue, 3)
            .flatMap(curriedInit)
            .flatMap { payload.extract(InputFlag.output.rawValue).flatMap($0) }
            .flatMap { payload.extract(InputFlag.needsUncurried.rawValue, false).flatMap($0) }
        
    }
    
}
