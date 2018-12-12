import Foundation

extension Generator {
    
    final class Curring: CurringGeneratorProtocol {
        
        class func signature (
            
            _ functionName: String,
            _ genericParams: [String],
            _ input: String,
            _ resultType: String
            
            ) -> String {
            
            return "func \(functionName)"
                + " \(genericParams.commaSeparated.wrap(String.Wrappers.genericDefinition)) "
                + "(\(input))"
                + " ->\(resultType)"
            
        }
        
        class func result (
            
            _ args: [String],
            _ resultType: String
            
            ) -> String {
            
            return args.map { " (\($0))" }.joined(separator: " ->") + " -> \(resultType)"
            
        }
        
        class func input (
            
            _ functionName: String,
            _ unnamed: Bool,
            _ args: [String],
            _ resultType: String
            
            ) -> String {
            
            return (unnamed ? "_ " : "")
                + functionName
                + ": @escaping "
                + args.commaSeparated.wrap { "(\($0))" } + " -> "
                + resultType
            
        }
        
        class func body (
            
            _ functionName: String,
            _ args: [String]
            
            ) -> String {
            
            return args
                .reversed()
                .map { arg in { "{ \(arg) in \($0) }" } }
                .reduce(String.Wrappers.functionCall(functionName)(args.commaSeparated)) { $1($0) }
                .wrap { " { \n   return \($0)\n}" }
            
        }
        
    }
    
}
