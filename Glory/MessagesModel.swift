import Foundation
import AWSLambda

class MessagesModel {
    let lambda = Lambda()
    
    //MARK: - Create Methods
    
    func createMessege(messageId : String, recepientId : [String], isVisible : Bool, title : String, sentUserId : String, recieverName : String, created : Int) {
        let createMessege : [String: Any] = [
            "messageId" : messageId,
            "recepientId" : recepientId,
            "sentUserId" : sentUserId,
            "created" : created,
            "title" : title,
            "isVisible" : isVisible
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createMessege)
        
    }
    
    func createMessegeDetails(messageId : String, text : String, created : Int) {
        let createMessege : [String: Any] = [
            "messageId" : messageId,
            "created" : created,
            "text" : text
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createMessege)
        
    }
    
    //MARK: - Get Methods
    func getMessageDetails(messageId : String) {
        let getMesseges : [String: Any] = [
            "messageId" : messageId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getMesseges)
        
    }
    
    
    func getMesseges(recepientId : String, messageId : String) {
        let getMesseges : [String: Any] = [
            "messageId" : messageId,
            "recepientId" : recepientId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getMesseges)
        
    }
    
    //MARK: - Update Methods
    
    func updateMessege(messageId : String, text : String) {
        let createMessege : [String: Any] = [
            "tableName": "messages",
            "messageId" : messageId,
            "text" : text
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createMessege)
        
    }
    
    //MARK: - Add/Remove Methods
    func removeFromGroup(messageId : String, recepientId : String) {
        let deleteMessege : [String: Any] = [
            "recepientId" : recepientId,
            "messageId" : messageId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: deleteMessege)
        
    }
    
    //MARK: - Delete Methods
    
    func deleteMessege(isVisible : Bool, messageId : String, recepientId : String) {
        let deleteMessege : [String: Any] = [
            "recepientId" : recepientId,
            "messageId" : messageId,
            "isVisible" : isVisible
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: deleteMessege)
        
    }
}
