import Foundation
import AWSLambda

class SearchModel {
    
    let lambda = Lambda()
    
    //MARK: - Get Methods
    
    func getUsers(userName : String?, userFullName : String?) {
        let getUsers : [String: Any] = [
            "tableName": "accounts",
            "userName" : userName!,
            "userFullName" : userFullName!,
            "operation": "list"
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getUsers)
        
    }
    
    func getUsersOfInterests(interestName : String) {
        let getUsersOfInterests : [String : Any] = [
            "tableName" : "interests",
            "interestsName" : interestName,
            "operation" : "get"
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getUsersOfInterests)
    }
}
