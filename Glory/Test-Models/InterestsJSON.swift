import Foundation

class InterestsJSON {
    
    var rawData: NSData! = nil
    var interestsId : String?
    var interestsName : String?
    var userId : String?
    var isSelected : String?
    
    init(interestsId : String, interestsName : String){
        self.interestsId = interestsId
        self.interestsName = interestsName
    }
    
    init(interestsInfo : [String: AnyObject]){
        self.interestsId = interestsInfo["interestsId"] as? String
        self.interestsName = interestsInfo["interestsName"] as? String
    }
    
    init(userInterests : [String : AnyObject]){
        self.interestsId = userInterests["interestsId"] as? String
        self.userId = userInterests["userId"] as? String
        self.interestsName = userInterests["interestsName"] as? String
        self.isSelected = userInterests["isSelected"] as? String
    }
    // MARK: - Read JSON Files
    
    static func readInterestsJson() -> [InterestsJSON] {
        var interestsModel = [InterestsJSON]()
        let file = Bundle.main.path(forResource: "interests", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        if let jsonDictionary = InterestsJSON.parseJSONFromData(jsonData: data){
            let jsonArray = jsonDictionary["interests"] as! [[String : AnyObject]]
            for values in jsonArray {
                let newAccount = InterestsJSON(interestsInfo: values)
                interestsModel.append(newAccount)
            }
        }
        return interestsModel
    }
    
    static func readUserInterestsJson(userId : String) -> [InterestsJSON] {
        var interestsModel = [InterestsJSON]()
        let file = Bundle.main.path(forResource: "userInterests", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        if let jsonDictionary = InterestsJSON.parseJSONFromData(jsonData: data){
            let jsonArray = jsonDictionary["userInterests"] as! [[String : AnyObject]]
            for values in jsonArray {
                let newAccount = InterestsJSON(interestsInfo: values)
                interestsModel.append(newAccount)
            }
        }
        return interestsModel
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

extension InterestsJSON {
    
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
