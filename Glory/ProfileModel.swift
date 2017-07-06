import Foundation
import AWSLambda
import AWSCore

class ProfileModel {
    
    let lambda = Lambda()
    func createAccount(email : String, userId : String, fullName : String, userName : String, isLeader : Bool) {
//    let cognitoId = AWSCognitoCredentialsProvider().getIdentityId()
        let createPicture : [String: Any] = [
            "userId": userId,
            "fullName": fullName,
            "userName" : userName,
            "isLeader": isLeader,
        ]
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createPicture)
        
    }
    
    func createAccountDetails(userId : String, email : String, userBio : String) {
        //    let cognitoId = AWSCognitoCredentialsProvider().getIdentityId()
        let createPicture : [String: Any] = [
            "tableName": "accounts",
            "userId": userId,
            "email": email,
            "userBio" : userBio,
            "operation": "create"
        ]
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createPicture)
        
    }
    
    //MARK: - Get Methods
    
    func getAccountDetails (userId : String) {
        let getUserPost : [String : Any] = [
            "userId" : userId
        ]
        
        let functionName = "lambda-functions-dev-posts"
        lambda.sendFunction(functionName: functionName, jsonObject: getUserPost)
        
    }
    
    func getAccount (userId : String){
        let getSelectedUser : [String : Any] = [
            "userId" : userId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getSelectedUser)
    }
    
    func getAdded (userId : String){
        let getAdded : [String : Any] = [
            "userId" : userId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getAdded)
    }
    
    
    //MARK: - Update Methods
    
    func updateProfilePicture (userId : String, userName : String, userPhoto : String) {
        let updatePicture : [String: Any] = [
            "userId" : userId,
            "userName": userName,
            "userPhoto": userPhoto
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updatePicture)
    }
    
    func updateUserName (userId : String, userName : String) {
        let updatePicture : [String: Any] = [
            "userId" : userId,
            "userName": userName
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updatePicture)
    }
    
    func updateBio (userId : String, userBio : String){
        let updateBio : [String: Any] = [
            "userId" : userId,
            "userBio": userBio
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateBio)
    }
    
    func updateEmail (userId : String, email : String){
        let updateBio : [String: Any] = [
            "userId" : userId,
            "email": email
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateBio)
    }
    
    func updateLeaderStatus (userId : String, isLeader : Bool){
        let updateBio : [String: Any] = [
            "userId" : userId,
            "isLeader": isLeader
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateBio)
    }
    
    //MARK: - Remove Methods
    
    func removePost (postId : String, userId : String, isVisible : Bool){
        let removeUserPost : [String : Any] = [
            "tableName" : "posts",
            "userId" : userId,
            "postId" : postId,
            "isVisible" : isVisible,
            "operation" : "update"
        ]
        
        let functionName = "lambda-functions-dev-posts"
        lambda.sendFunction(functionName: functionName, jsonObject: removeUserPost)
    }
    
    func removeAdded (userId : String, addedId : String, addedUsername : String, addedPhoto : UIImage, isAdded : Bool) {
        let removeAddedUser : [String : Any] = [
            "tableName" : "accounts",
            "userId" : userId,
            "added" : [
                addedId: ["isAdded" : isAdded ]
            ],
            "operation" : "update"
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: removeAddedUser)
        
    }
    
    //MARK: - Added Friend
    
    func addFriend (userId : String, addedId : String, addedUsername : String, addedPhoto : UIImage, isAdded : Bool) {
        let addedUser : [String : Any] = [
            "userId" : userId,
            "added" : [
                addedId: ["addedUsername" : addedUsername,
                          "addedPhoto" : addedPhoto,
                          "isAdded" : isAdded
                ]
            ]
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: addedUser)
    }
}
