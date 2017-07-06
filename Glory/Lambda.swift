import Foundation
import AWSLambda

class Lambda {
    
    let lambdaInvoker = AWSLambdaInvoker.default()
    
    //MARK: - Create Methods
    
    func sendFunction (functionName : String, jsonObject : [String : Any]){
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            
            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
            // here "decoded" is of type `Any`, decoded from JSON data
            
            // you can now cast it with the right type
            if let dictFromJSON = decoded as? [String:String] {
                lambdaInvoker.invokeFunction(functionName, jsonObject: dictFromJSON).continueWith(block: {(task:AWSTask<AnyObject>) -> Any? in
                    if let error = task.error as NSError? {
                        if error.domain == AWSLambdaInvokerErrorDomain && AWSLambdaInvokerErrorType.functionError == AWSLambdaInvokerErrorType(rawValue: error.code) {
                            print("Function error: \(String(describing: error.userInfo[AWSLambdaInvokerFunctionErrorKey]))")
                        } else {
                            print("Error: \(error)")
                        }
                        return nil
                    }
                    
                    // Handle response in task.result
                    if let JSONDictionary = task.result as? NSDictionary {
                        print(JSONDictionary)
                        return JSONDictionary
                        
                    }
                    return nil
                })
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

