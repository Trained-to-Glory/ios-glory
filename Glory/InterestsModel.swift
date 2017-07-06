import Foundation
import AWSLambda

class InterestsModel {
    
    let lambda = Lambda()
    
    //MARK: - Create Methods
    
    func createInterestsList(interestsId : String,  interestsName : String) {
        let createInterestsList : [String: Any] = [
            "interestsId" : interestsId,
            "interestsName" : interestsName
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createInterestsList)
        
    }
    
    //MARK: - Select Interests
    
    func selectInterests (userId : String, isLeader : Bool, isSelected : Bool, interestsId : String, interestName : String){
        let createUserSelected : [String : Any] = [
            "userId": userId,
            "interests" : [
                interestsId : [
                    "interestName" : interestName,
                    "isSelected" : isSelected
                ]
            ],
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createUserSelected)
        
    }
    
    //MARK: - Update Methods

    func changeSelected (userId : String, isSelected : Bool, interestsId : String){
        let updateUserSelected : [String : Any] = [
            "interests" : [
                interestsId : [
                    "isSelected" : isSelected
                ]
            ],
            "operation" : "update"
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createUserSelected)
    }
    
    
    
    //MARK: - Get Methods
    
    func getInterestsList (interestsId : String) {
        let getInterests : [String : Any] = [
            "tableName" : "interests",
            "interestsId" : interestsId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getInterests)
        
    }
    
    func getPeronsInterests (userId : String){
        let getUserInterests : [String : Any] = [
            "userId" : userId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getUserInterests)
    }
}
