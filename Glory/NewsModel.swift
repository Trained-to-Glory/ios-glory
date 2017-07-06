import Foundation
import AWSLambda

class NewsModel {
    
    let lambda = Lambda()
    
    //MARK: - Create Methods
    
    func createPosts(userId : String, postId : String, isVisible : Bool, photo : UIImage, description : String?, created : Int) {
        let createPicture : [String: Any] = [
            "userId" : userId,
            "postId" : postId,
            "photo" : photo,
            "isVisible": isVisible,
            "description" : description!,
            "created" : created
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createPicture)
        
    }
    
    //MARK: - Update Methods
    
    func updatePostsDescription(userId : String, postId : String, description : String) {
        let getPictures : [String: Any] = [
            "tableName": "posts",
            "postId" : postId,
            "userId" : userId,
            "description": description
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getPictures)
        
    }
    
    
    //Mark: - Get Methods
    
    func getPosts(userId : String, postId : String) {
        let getPictures : [String: Any] = [
            "tableName": "posts",
            "postId" : postId,
            "userId" : userId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getPictures)
        
    }
    
    func getListOfPosts(userId : String, postId : String) {
        let getPictures : [String: Any] = [
            "tableName": "posts",
            "postId" : postId,
            "userId" : userId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getPictures)
        
    }
    
    //MARK: - Remove Methods
    
    func removePosts(userId : String, isVisible : Bool, postId : String) {
        let removePosts : [String: Any] = [
            "userId" : userId,
            "postId" : postId,
            "isVisible" : isVisible
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: removePosts)
        
    }
}
