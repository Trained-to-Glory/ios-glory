import Foundation
import AWSLambda

class FormsModel {
    
    let lambda = Lambda()
    
    //MARK: - Create Methods
    
    func createForm(formId : String, responded : Bool, recepientId : String, sentUserId : String, created : Int, isVisible : Bool, formRequests : [String], title : String) {
        let createUserForms : [String: Any] = [
            "formId" : formId,
            "recepientId" : recepientId,
            "sentUserId" : sentUserId,
            "created" : created,
            "title" : title,
            "isVisible": isVisible
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createUserForms)
        
    }
    
    func createFormDetails(formId : String, created : Int, formRequests : [String]) {
        let createFormDetails : [String: Any] = [
            "formId" : formId,
            "created" : created,
            "formRequest": formRequests
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createFormDetails)
        
    }
    
    //MARK: - Get Methods
    
    func getForm(recepientId : String, formId : String) {
        let createUserForms : [String: Any] = [
            "formId": formId,
            "recepientId" : recepientId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createUserForms)
        
    }
    
    func getFormDetails(recepientId : String, formId : String) {
        let createUserForms : [String: Any] = [
            "formId": formId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createUserForms)
        
    }
    
    func getListOfForms(recepientId : String, formId : String) {
        let createUserForms : [String: Any] = [
            "formId": formId,
            "recepientId" : recepientId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createUserForms)
        
    }
    
    //MARK: - Update Methods
    
    func updateFormTitle(formId : String, recepientId : String, title : String) {
        let updateUserForms : [String: Any] = [
            "tableName": "form",
            "formId" : formId,
            "recepientId" : recepientId,
            "title" : title
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateUserForms)
        
    }
    
    func updateFormResponded(formId : String, recepientId : String, responded : Bool) {
        let updateUserForms : [String: Any] = [
            "tableName": "form",
            "formId" : formId,
            "recepientId" : recepientId,
            "responded" : responded
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateUserForms)
        
    }
    
    func updateFormRequests(formId : String, recepientId : String, formRequests : Bool) {
        let updateUserForms : [String: Any] = [
            "tableName": "form",
            "formId" : formId,
            "recepientId" : recepientId,
            "formRequests" : formRequests
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateUserForms)
        
    }
    
    
    //MARK: - Delete Methods
    
    func deleteForm(formId : String, recepientId : String, isVisible : Bool) {
        let deleteUserForms : [String: Any] = [
            "formId" : formId,
            "recepientId" : recepientId,
            "isVisible" : isVisible
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: deleteUserForms)
        
    }
    
    //MARK: - Accept/Decline Methods
    
    func formStatus(formId : String, recepientId : String, isAccepted : Bool) {
        let acceptUserForms : [String: Any] = [
            "formId" : formId,
            "userId" : recepientId,
            "isAccepted" : isAccepted
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: acceptUserForms)
        
    }
    
}
