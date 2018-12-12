import Foundation

final class IOManager {
    
    class func processInput (
        
        _ userInput: UserInput
        
        ) {
        
        guard userInput.maxArgsCount > 2 else { exit(1) }

        let range = (2...userInput.maxArgsCount)
        
        var output = ""
        
        output.appendMark("Curring")
        
        output += range
            .map {  Generator.Curring.generate("curry", ("f", true), "R", $0) }
            .joined(separator: "\n\n")
        
        if userInput.needsUncurry {
            
            output.appendMark("Uncurring")
            
            output += range
                .map {  Generator.Uncurring.generate("uncurry", ("f", true), "R", $0) }
                .joined(separator: "\n\n")
            
        }
        
        do { try output.write(to: userInput.outputFileURL, atomically: true, encoding: .unicode) } catch { exit(1) }
        
        exit(0)
    }
    
}
