import Foundation

extension Generator {
    
    final class Uncurring: CurringGeneratorProtocol {

        class func signature (
            
            _ functionName: String,
            _ genericParams: [String],
            _ input: String,
            _ resultType: String
            
            ) -> String {
            
            return "func \(functionName)"
                + " \(genericParams.commaSeparated.wrap(String.Wrappers.genericDefinition)) "
                + "(\(input))"
                + " -> \(resultType)"
            
        }
        
        class func result (
            
            _ args: [String],
            _ resultType: String
            
            ) -> String {
            
            return args.commaSeparated.wrap { "(\($0))" } + " -> \(resultType)"
            
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
                + args.map { "(\($0))" }.joined(separator: " -> ")
                + " -> \(resultType)"
            
        }
        
        class func body (
            
            _ functionName: String,
            _ args: [String]
            
            ) -> String {
            
            return (0..<args.count)
                .map { "($\($0))" }
                .joined(separator: "")
                .wrap { " {\n  return { \(functionName)\($0) } \n}" }
            
        }
        
    }
    
}
