import Foundation
import AWSLambda

class ConnectModel {
    
    let lambda = Lambda()
    
    //Conect By Interests Methods
    
    func getInterests (userId : String, userName : String, userPhoto : String, isLeader : Bool, isSelected : Bool, interestsId : String, interestName : String){
        let getUserSelected : [String : Any] = [
            "interestsId" : interestsId,
            "interestsName" : interestName,
            "operation" : "get",
            "users" : [
                userId : [
                    "userName" : userName,
                    "userPhoto" : userPhoto,
                    "isLeader" : isLeader,
                    "isSelected" : isSelected
                ]
            ],
            ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getUserSelected)
    }
    
}
