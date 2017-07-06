import Foundation
import AWSLambda

class EngagementsModel {
    
    let lambda = Lambda()
    
    
    //MARK: - Create Methods
    
    func createLike(userLikeId : String, userLikePhoto : String, userLikeName : String, isLiked : Bool, postId : String, created : Int) {
        let createLike : [String: Any] = [
            "postId" : postId,
            "userLike" : [
                userLikeId : [ "userLikePhoto" : userLikePhoto,
                               "userLikeName" : userLikeName,
                               "isLiked" : isLiked,
                               "created" : created
                ]
            ]
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createLike)
        
    }
    
    func createComment(userCommentId : String, userCommentPhoto : String, userCommentName : String, text : String, postId : String, created : Int) {
        let createComment : [String: Any] = [
            "postId" : postId,
            "userComments" : [
                userCommentId : [ "userCommentPhoto" : userCommentPhoto,
                                  "userCommentName" : userCommentName,
                                  "text" : text,
                                  "created" : created
                ]
            ]
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createComment)
        
    }
    
    //MARK: - Update Methods
    func updateLike(userLikeId : String, userLikePhoto : String, userLikeName : String, isLiked : Bool, postId : String, created : Int) {
        let updateLike : [String: Any] = [
            "postId" : postId,
            "userLike" : [
                userLikeId : [ "userLikePhoto" : userLikePhoto,
                               "userLikeName" : userLikeName,
                               "isLiked" : isLiked,
                               "created" : created
                ]
            ]
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateLike)
        
    }
    
    func updateComment(userCommentId : String, userCommentPhoto : String, userCommentName : String, text : String, postId : String, created : Int) {
        let updateComment : [String: Any] = [
            "postId" : postId,
            "userComments" : [
                userCommentId : [ "userCommentPhoto" : userCommentPhoto,
                                  "userCommentName" : userCommentName,
                                  "text" : text,
                                  "created" : created
                ]
            ]
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updateComment)
        
    }
    
    //MARK: - Delete Method
    
    func deleteComment(userCommentId : String, userCommentPhoto : String, userCommentName : String, isVisible : Bool, text : String, postId : String, created : Int) {
        let deleteComment : [String: Any] = [
            "postId" : postId,
            "userComments" : [
                userCommentId : [ "userCommentPhoto" : userCommentPhoto,
                                  "userCommentName" : userCommentName,
                                  "text" : text,
                                  "isVisible" : isVisible,
                                  "created" : created
                ]
            ]
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: deleteComment)
        
    }
    
}
