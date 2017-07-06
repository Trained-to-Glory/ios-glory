import Foundation
import AWSLambda

class SystemsModel {
    
    let lambda = Lambda()
    //MARK: - Create Methods
    
    func createSystemDetails(isVisible : Bool, systemsId : String, userPhoto : String, isPurchased : Bool, created : Int, title : String, description : String) {
        let createSystem : [String: Any] = [
            "systemsId" : systemsId,
            "created" : created,
            "isVisible" : isVisible,
            "isPurchased" : isPurchased,
            "title" : title,
            "description" : description
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createSystem)
        
    }
    
    func createSystem(userId : String, systemsId : String, systemPhoto : UIImage, title : String) {
        let createSystem : [String: Any] = [
            "systemsId" : systemsId,
            "userId" : userId,
            "systemPhoto": systemPhoto,
            "title" : title
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createSystem)
        
    }
    
    
    
    //MARK: - Update methods
    
    func updateSystemPhoto(systemsId : String, userId : String, systemPhoto : String) {
        let updateSystem : [String: Any] = [
            "systemsId" : systemsId,
            "userId": userId,
            "systemPhoto": systemPhoto
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateSystem)
        
    }
    
    func updateSystemStatus(systemsId : String, isVisible : Bool, systemPhoto : String) {
        let updateSystem : [String: Any] = [
            "systemsId" : systemsId,
            "isVisible": isVisible
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateSystem)
        
    }
    
    func systemFinished(systemsId : String, isFinished : Bool, systemPhoto : String) {
        let updateSystem : [String: Any] = [
            "systemsId" : systemsId,
            "isFinished": isFinished
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateSystem)
        
    }
    
    func updateSystemPurchased(systemsId : String, isPurchased : Bool, systemPhoto : String) {
        let updateSystem : [String: Any] = [
            "systemsId" : systemsId,
            "isPurchased": isPurchased
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateSystem)
        
    }
    
    func updateSystemDescription(systemsId : String, userId : String, description : String) {
        let getUsersSystems : [String: Any] = [
            "systemsId" : systemsId,
            "userId": userId,
            "description": description
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getUsersSystems)
        
    }
    
    func updateSystemTitle(systemsId : String, userId : String, title : String) {
        let updateSystem : [String: Any] = [
            "systemsId" : systemsId,
            "userId": userId,
            "title": title
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateSystem)
        
    }
    
    func updateStepInfo(systemsId : String, stepId : String, userId : String, stepTitle : String) {
        let updateSystem : [String: Any] = [
            "systemsId" : systemsId,
            "steps" : [
                stepId : ["stepTitle" : stepTitle]
            ]
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateSystem)
        
    }
    
    func updateStepProgress(systemsId : String, stepId : String, userId : String, progress : Int) {
        let updateSystem : [String: Any] = [
            "systemsId" : systemsId,
            "steps" : [
                stepId : ["progress" : progress]
            ]
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateSystem)
        
    }
    
    //MARK: - Get Methods
    
    func getSystems() {
        let getUsersSystems : [String: Any] = [
            "tableName": "systems"
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getUsersSystems)
        
    }
    
    func getUserSystem(systemsId : String, userId : String) {
        let getUsersSystems : [String: Any] = [
            "systemsId" : systemsId,
            "userId": userId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getUsersSystems)
        
    }
    
    func getListOfUserSystems(systemsId : String, userId : String) {
        let getListOfUserSystems : [String: Any] = [
            "systemsId" : systemsId,
            "userId": userId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getListOfUserSystems)
        
    }
    
    func getUserSystemDetails(systemsId : String) {
        let getUsersSystems : [String: Any] = [
            "systemsId" : systemsId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getUsersSystems)
    }
    
    
    func getSystemSteps(systemsId : String) {
        let getSystemSteps : [String: Any] = [
            "systemsId" : systemsId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getSystemSteps)
    }
    //MARK: - Hide Methods
    
    func hideSystems(systemsId : String, userId : String, isVisible : Bool) {
        let hideUserSystems : [String: Any] = [
            "tableName": "systems",
            "systemsId" : systemsId,
            "userId": userId,
            "isVisible" : isVisible,
            "operation": "update"
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: hideUserSystems)
        
    }
    
    func purchasedSystems(systemsId : String, userId : String, isPurchased : Bool) {
        let hideUserSystems : [String: Any] = [
            "tableName": "systems",
            "systemsId" : systemsId,
            "userId": userId,
            "isPurchased" : isPurchased,
            "operation": "update"
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: hideUserSystems)
    }
    
    //MARK: - Add Methods
    
    func addFriends(systemsId :  String, addedId : String, addedUsername : String, addedPhoto : String, isAdded : Bool) {
        let addUsersFriends : [String: Any] = [
            "systemsId" : systemsId,
            "added" : [
                addedId: [ "addedUsername" : addedUsername,
                          "addedPhoto" : addedPhoto,
                          "addedId": addedId,
                          "isAdded" : isAdded
                ]
            ]
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: addUsersFriends)
        
    }
    
    func addSteps(systemsId : String, stepId : String, isComplete : Bool,  stepTitle : String?, isVisible : Bool, position : Int) {
        let addUsersSteps : [String: Any] = [
            "systemsId" : systemsId,
            "steps" : [
                stepId : [
                    "stepTitle" : stepTitle!,
                    "isComplete" : isComplete,
                    "isVisible": isVisible,
                    "position": position
                ]
            ]
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: addUsersSteps)
    }
    
    
    //MARK: - Remove Methods
    
    
    func removeFriend(systemsId : String, isAdded : Bool, addedId : String){
        let removeUsersFriends : [String: Any] = [
            "tableName": "systems",
            "systemsId" : systemsId,
            "added" : [
                addedId: [
                          "isAdded" : isAdded,
                ]
            ],
            "operation": "update"
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: removeUsersFriends)
    }
    
    func removeSteps(systemsId : String, stepId : String, isVisible : Bool) {
        let removeUsersSteps : [String: Any] = [
            "tableName": "systems",
            "systemsId" : systemsId,
            "steps" : [
                stepId : [
                    "isVisible" : isVisible
                ]
            ],
            "operation": "update"
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: removeUsersSteps)
        
    }
    
}
