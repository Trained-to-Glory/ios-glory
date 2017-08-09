import Foundation

class PursuitJSON {
    
    var rawData: NSData! = nil
    
    // MARK: - Read JSON Files
    
    func readPursuitJson() {
        let file = Bundle.main.path(forResource: "pursuit", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
            NSDictionary
            let jsonArray =  jsonResult.value(forKey: "pursuit") as! NSArray
            for values in jsonArray {
                let pursuitId = (values as AnyObject)["pursuitId"] as? String
                let userId = (values as AnyObject)["userId"] as? String
                let photo = (values as AnyObject)["photo"] as? String
                let created = (values as AnyObject)["created"] as? String
                let title = (values as AnyObject)["title"] as? String
                let isVisible = (values as AnyObject)["isVisible"] as? String
            }
            
        } catch {
            print("error reading json")
        }
    }
    
    func readPursuitDetailsJson() {
        let file = Bundle.main.path(forResource: "pursuitDetails", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
            NSDictionary
            let jsonArray =  jsonResult.value(forKey: "pursuitDetails") as! NSArray
            for values in jsonArray {
                let pursuitId = (values as AnyObject)["pursuitId"] as? String
                let userId = (values as AnyObject)["userId"] as? String
                let photo = (values as AnyObject)["photo"] as? String
                let created = (values as AnyObject)["created"] as? String
                let description = (values as AnyObject)["description"] as? String
                let title = (values as AnyObject)["title"] as? String
                let isVisible = (values as AnyObject)["isVisible"] as? String
                let isPurchased = (values as AnyObject)["isPurchased"] as? String
            }
            
        } catch {
            print("error reading json")
        }
    }
    
    func readPursuitStepsJson() {
        let file = Bundle.main.path(forResource: "pursuitSteps", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
            NSDictionary
            let jsonArray =  jsonResult.value(forKey: "pursuitSteps") as! NSArray
            for values in jsonArray {
                let pursuitId = (values as AnyObject)["pursuitId"] as? String
                let stepId = (values as AnyObject)["stepId"] as? String
                let position = (values as AnyObject)["position"] as? String
                let text = (values as AnyObject)["text"] as? String
                let isVisible = (values as AnyObject)["isVisible"] as? String
                let isComplete = (values as AnyObject)["isComplete"] as? String
            }
            
        } catch {
            print("error reading json")
        }
    }
    
    // MARK: - Write To JSON File
    
    func writeToPursuitJSON (){
        var dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
        
            do {
                rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
                try rawData.write(toFile: "JSON/pursuit.json", options: .atomic)
                var jsonData = NSData(contentsOfFile: "JSON/pursuit.json")
                var jsonDict = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
            }  catch {
                // Handle Error
                print("Method Failed")
            }
    }
    
    func writeToPursuitDetailsJSON (){
        var dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: dictonary, options: .init(rawValue: 0)) {
            do {
                rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
                try rawData.write(toFile: "JSON/pursuitDetails.json", options: .atomic)
                var jsonData = NSData(contentsOfFile: "JSON/pursuitDetails.json")
                var jsonDict = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
            } catch {
                // Handle Error
                print("Method Failed")
            }
        }
    }
    
    func writeToPursuitStepsJSON (){
        let dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
        
        if let jsonData = try? JSONSerialization.data(withJSONObject: dictonary, options: .init(rawValue: 0)) as? Data
        {
            do {
                rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
                try rawData.write(toFile: "JSON/pursuitSteps.json", options: .atomic)
                var jsonData = NSData(contentsOfFile: "JSON/pursuitSteps.json")
                var jsonDict = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
            } catch {
                // Handle Error
                print("Method Failed")
            }
        }
    }
}
