import Foundation

class PostJSON {
    
    var rawData: NSData! = nil

    // MARK: - Read JSON Files
    
    func readPostJson() {
        let file = Bundle.main.path(forResource: "posts", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
            NSDictionary
            let jsonArray =  jsonResult.value(forKey: "posts") as! NSArray
            for values in jsonArray {
                let postId = (values as AnyObject)["postId"] as? String
                let userId = (values as AnyObject)["userId"] as? String
                let photo = (values as AnyObject)["photo"] as? String
                let created = (values as AnyObject)["created"] as? String
                let description = (values as AnyObject)["description"] as? String
                let isVisible = (values as AnyObject)["isVisible"] as? String
            }
            
        } catch {
            print("error reading json")
        }
    }
    
    func readPostEngagementsJson() {
        let file = Bundle.main.path(forResource: "engagements", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
            NSDictionary
            let jsonArray =  jsonResult.value(forKey: "engagementCount") as! NSArray
            for values in jsonArray {
                let totalLikes = (values as AnyObject)["totalLikes"] as? String
                let totalComments = (values as AnyObject)["totalComments"] as? String
            }
            
        } catch {
            print("error reading json")
        }
    }
    
    
    func readPostCommentsJson() {
        let file = Bundle.main.path(forResource: "engagements", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
            NSDictionary
            let jsonArray =  jsonResult.value(forKey: "comment") as! NSArray
            for values in jsonArray {
                let commentText = (values as AnyObject)["commentText"] as? String
            }
            
        } catch {
            print("error reading json")
        }
    }
    
    // MARK: - Write To JSON File
    
    func writeToPostJSON (){
        var dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
        
            do {
                rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
                try rawData.write(toFile: "JSON/posts.json", options: .atomic)
                var jsonData = NSData(contentsOfFile: "JSON/posts.json")
                var jsonDict = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
            } catch {
                // Handle Error
                print("Method Failed")
            }
    }
    
    func writeToPostEngagementsJSON (){
        var dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
        
            do {
                rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
                try rawData.write(toFile: "JSON/engagements.json", options: .atomic)
                var jsonData = NSData(contentsOfFile: "JSON/engagements.json")
                var jsonDict = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
            } catch {
                // Handle Error
                print("Method Failed")
            }
    }
}
