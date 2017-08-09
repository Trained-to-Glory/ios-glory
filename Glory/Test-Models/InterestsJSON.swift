import Foundation

class InterestsJSON {
    
    var rawData: NSData! = nil

    // MARK: - Read JSON Files
    
    func readInterestsJson() {
        let file = Bundle.main.path(forResource: "interests", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
            NSDictionary
            let jsonArray =  jsonResult.value(forKey: "interests") as! NSArray
            for values in jsonArray {
                let interestsId = (values as AnyObject)["interestsId"] as? String
                let interestsName = (values as AnyObject)["interestsName"] as? String
            }
            
        } catch {
            print("error reading json")
        }
    }
    
    func readUserInterestsJson() {
        let file = Bundle.main.path(forResource: "userInterests", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
            NSDictionary
            let jsonArray =  jsonResult.value(forKey: "userInterests") as! NSArray
            for values in jsonArray {
                let interestsId = (values as AnyObject)["interestsId"] as? String
                let userId = (values as AnyObject)["userId"] as? String
                let interestsName = (values as AnyObject)["interestsName"] as? String
                let isSelected = (values as AnyObject)["isSelected"] as? String
            }
            
        } catch {
            print("error reading json")
        }
    }
    
    // MARK: - Write To JSON File
    
    func writeToInterestsJSON (){
        var dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
        
            do {
                rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
                try rawData.write(toFile: "JSON/interests.json", options: .atomic)
                var jsonData = NSData(contentsOfFile: "JSON/interests.json")
                _ = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
            } catch {
                // Handle Error
                print("Method Failed")
            }
    }
    
    func writeToUserInterestsJSON (){
        var dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
        
            do {
                rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
                try rawData.write(toFile: "JSON/userInterests.json", options: .atomic)
                var jsonData = NSData(contentsOfFile: "JSON/userInterests.json")
                var jsonDict = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
            } catch {
                // Handle Error
                print("Method Failed")
            }
    }
    
}
