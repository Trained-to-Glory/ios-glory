import Foundation

class PostJSON {
    
    var postId : String?
    var userId : String?
    var photo : String?
    var created : String?
    var description : String?
    var isVisible : String?
    var totalLikes : String?
    var totalComments : String?
    var commentText : String?
    var likeUserName : String?
    var likePhoto : String?
    var likeFullName : String?
    var isLiked : String?

    init(postId: String, userId: String, photo: String, isVisible: String, created: String, description : String){
        self.postId = postId
        self.created = created
        self.userId = userId
        self.photo = photo
        self.isVisible = isVisible
        self.description = description
    }
    
    init(postData: [String: AnyObject]){
        self.postId = postData["postId"] as? String
        self.userId = postData["userId"] as? String
        self.photo = postData["photo"] as? String
        self.created = postData["created"] as? String
        self.description = postData["description"] as? String
        self.isVisible = postData["isVisible"] as? String
    }
    
    init(postEngagements: [String: AnyObject]){
       self.totalLikes = postEngagements["totalLikes"] as? String
       self.totalComments = postEngagements["totalComments"] as? String
    }
    
    init(postComments: [String: AnyObject]){
        self.commentText = postComments["commentText"] as? String
    }
    
    init(postLikes: [String: AnyObject]){
        self.likeUserName = postLikes["likeUserName"] as? String
        self.likePhoto = postLikes["likePhoto"] as? String
        self.likeFullName = postLikes["likeFullName"] as? String
        self.created = postLikes["created"] as? String
        self.isLiked = postLikes["isLiked"] as? String
    }
    
    // MARK: - Read JSON Files
    
    static func readListOfPostJson() -> [PostJSON]{
        var postModel = [PostJSON]()
        let file = Bundle.main.path(forResource: "posts", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        if let jsonDictionary = PostJSON.parseJSONFromData(jsonData: data){
            let jsonArray = jsonDictionary["posts"] as! [[String : AnyObject]]
            for values in jsonArray {
                let newPost = PostJSON(postData: values)
                postModel.append(newPost)
            }
        }
        return postModel
    }
    
    static func readPostJson(postId: String) -> [PostJSON]{
        var postModel = [PostJSON]()
        let file = Bundle.main.path(forResource: "posts", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        if let jsonDictionary = PostJSON.parseJSONFromData(jsonData: data){
            let jsonArray = jsonDictionary["posts"] as! [[String : AnyObject]]
            for values in jsonArray {
                let newPost = PostJSON(postData: values)
                postModel.append(newPost)
            }
        }
        return postModel
    }
    
    static func readUserPostJson(userId: String) -> [PostJSON]{
        var postModel = [PostJSON]()
        let file = Bundle.main.path(forResource: "posts", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        if let jsonDictionary = PostJSON.parseJSONFromData(jsonData: data){
            let jsonArray = jsonDictionary["posts"] as! [[String : AnyObject]]
            for values in jsonArray {
                let newPost = PostJSON(postData: values)
                postModel.append(newPost)
            }
        }
        return postModel
    }
    
    static func readPostEngagementsJson(postId: String) -> [PostJSON] {
        var postModel = [PostJSON]()
        let file = Bundle.main.path(forResource: "engagements", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        if let jsonDictionary = PostJSON.parseJSONFromData(jsonData: data){
            let jsonArray = jsonDictionary["engagementCount"] as! [[String : AnyObject]]
            for values in jsonArray {
                let newPost = PostJSON(postEngagements: values)
                postModel.append(newPost)
            }
        }
        return postModel
    }
    
    
    static func readPostCommentsJson(postId: String) -> [PostJSON] {
        var postModel = [PostJSON]()
        let file = Bundle.main.path(forResource: "engagements", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        if let jsonDictionary = PostJSON.parseJSONFromData(jsonData: data){
            let jsonArray = jsonDictionary["comment"] as! [[String : AnyObject]]
            for values in jsonArray {
                let newPost = PostJSON(postComments: values)
                postModel.append(newPost)
            }
        }
        return postModel
    }
    
    static func readPostLikesJson(postId: String) -> [PostJSON] {
        var postModel = [PostJSON]()
        let file = Bundle.main.path(forResource: "engagements", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        if let jsonDictionary = PostJSON.parseJSONFromData(jsonData: data){
            let jsonArray = jsonDictionary["likes"] as! [[String : AnyObject]]
            for values in jsonArray {
                let newPost = PostJSON(postLikes: values)
                postModel.append(newPost)
            }
        }
        return postModel
    }
    
    // MARK: - Write To JSON File
    
    static func writeToPostJSON (){
        let dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
            do {
                let rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
                try rawData.write(toFile: "JSON/posts.json", options: .atomic)
                let jsonData = NSData(contentsOfFile: "JSON/posts.json")
                _ = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
            } catch {
                // Handle Error
                print("Method Failed")
            }
    }
    
    static func writeToPostEngagementsJSON (){
        let dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
        
            do {
               let rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
                try rawData.write(toFile: "JSON/engagements.json", options: .atomic)
                let jsonData = NSData(contentsOfFile: "JSON/engagements.json")
                _ = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
            } catch {
                // Handle Error
                print("Method Failed")
            }
    }
    
    static func writeToPostLikesJSON (likeId : String, created : Int, isLiked: Bool){
        let dictonary : [String : Any] = [
            "likeId": likeId,
            "created": created,
            "isLiked": isLiked
        ]
        
        do {
            let rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
            try rawData.write(toFile: "JSON/engagements.json", options: .atomic)
            let jsonData = NSData(contentsOfFile: "JSON/engagements.json")
            _ = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
            
        } catch {
            // Handle Error
            print("Method Failed")
        }
    }
    
    static func writeToPostCommentsJSON (commentId: String, commentText: String, created: Int){
        let dictonary : [String : Any] = [
            "commentId": commentId,
            "commentText": commentText,
            "created": created
        ]
        
        
        do {
            let rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
            try rawData.write(toFile: "JSON/engagements.json", options: .atomic)
            let jsonData = NSData(contentsOfFile: "JSON/engagements.json")
            _ = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
            
        } catch {
            // Handle Error
            print("Method Failed")
        }
    }
}

extension PostJSON {
    
    static func parseJSONFromData(jsonData: NSData?) -> [String: AnyObject]? {
        if let data = jsonData {
            do {
                let jsonDictionary = try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers)
                return jsonDictionary as! [String : AnyObject]
                
            } catch let error as NSError {
                print("error processing: \(error.localizedDescription)")
            }
        }
        return nil
    }
}
