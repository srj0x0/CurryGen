import Foundation

protocol CurringGeneratorProtocol {
    
    static func signature (
        
        _ functionName: String,
        _ genericParams: [String],
        _ input: String,
        _ resultType: String
        
        ) -> String
    
    static func result (
        
        _ args: [String],
        _ resultType: String
        
        ) -> String
    
    static func input (
        
        _ functionName: String,
        _ unnamed: Bool,
        _ args: [String],
        _ resultType: String
        
        ) -> String
    
    static func body (
        
        _ functionName: String,
        _ args: [String]
        
        ) -> String
    
    typealias InputFunctionPreferences = (name: String, unnamed: Bool)
    
    static func generate (
        
        _ functionName: String,
        _ inputFunctionPrefs: InputFunctionPreferences,
        _ resultType: String,
        _ argsCount: Int
        
        ) -> String
    
}

extension CurringGeneratorProtocol {
    
    static func generate (
        
        _ functionName: String,
        _ inputFunctionPrefs: InputFunctionPreferences,
        _ resultType: String,
        _ argsCount: Int
        
        ) -> String {
        
        let args = Generator.makeArgs(argsCount)
        let result = self.result(args, resultType)
        let input = self.input(inputFunctionPrefs.name, inputFunctionPrefs.unnamed, args, resultType)
        let signature = self.signature(functionName, args + [resultType], input, result)
        let body = self.body(inputFunctionPrefs.name, args.map { $0.lowercased() })
        
        return signature + body
        
    }
    
}
