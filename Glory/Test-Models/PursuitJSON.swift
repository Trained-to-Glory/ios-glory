import Foundation

class PursuitJSON {
    
    var rawData: NSData! = nil
    var pursuitId : String?
    var userId : String?
    var photo : String?
    var created : String?
    var title : String?
    var isVisible : String?
    var description : String?
    var isPurchased : String?
    var stepId : String?
    var isComplete : String?
    var position : String?
    var text : String?
    
    init(pursuitId: String, userId: String, photo: String, isVisible: String, created: String){
        self.pursuitId = pursuitId
        self.created = created
        self.userId = userId
        self.photo = photo
        self.isVisible = isVisible
    }
    
    init(pursuitValues: [String: AnyObject]){
        self.pursuitId = pursuitValues["pursuitId"] as? String
        self.userId = pursuitValues["userId"] as? String
        self.photo = pursuitValues["photo"] as? String
        self.created = pursuitValues["created"] as? String
        self.title = pursuitValues["title"] as? String
        self.isVisible = pursuitValues["isVisible"] as? String
    }
    
    init(pursuitDetails: [String: AnyObject]) {
        self.pursuitId = pursuitDetails["pursuitId"] as? String
        self.userId = pursuitDetails["userId"] as? String
        self.photo = pursuitDetails["photo"] as? String
        self.created = pursuitDetails["created"] as? String
        self.description = pursuitDetails["description"] as? String
        self.title = pursuitDetails["title"] as? String
        self.isVisible = pursuitDetails["isVisible"] as? String
        self.isPurchased = pursuitDetails["isPurchased"] as? String
    }
    
    init(pursuitSteps: [String: AnyObject]) {
        self.pursuitId = pursuitSteps["pursuitId"] as? String
        self.stepId = pursuitSteps["stepId"] as? String
        self.position = pursuitSteps["position"] as? String
        self.text = pursuitSteps["text"] as? String
        self.isVisible = pursuitSteps["isVisible"] as? String
        self.isComplete = pursuitSteps["isComplete"] as? String
    }
    // MARK: - Read JSON Files
    
    static func readPursuitJson() -> [PursuitJSON] {
        var pursuitModel = [PursuitJSON]()
        let file = Bundle.main.path(forResource: "pursuit", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        if let jsonDictionary = PursuitJSON.parseJSONFromData(jsonData: data){
            let jsonArray = jsonDictionary["pursuit"] as! [[String : AnyObject]]
            for pursuitVales in jsonArray {
                let newPursuit = PursuitJSON(pursuitValues: pursuitVales)
                pursuitModel.append(newPursuit)
            }
        }
        return pursuitModel
    }
    
    static func readPursuitDetailsJson() -> [PursuitJSON] {
        var pursuitModel = [PursuitJSON]()
        let file = Bundle.main.path(forResource: "pursuitDetails", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        if let jsonDictionary = PursuitJSON.parseJSONFromData(jsonData: data){
            let jsonArray = jsonDictionary["pursuitDetails"] as! [[String : AnyObject]]
            for detailValues in jsonArray {
                let newPursuit = PursuitJSON(pursuitDetails: detailValues)
                pursuitModel.append(newPursuit)
            }
        }
        return pursuitModel
    }
    
    static func readPursuitStepsJson() -> [PursuitJSON]{
        var pursuitModel = [PursuitJSON]()
        let file = Bundle.main.path(forResource: "pursuitSteps", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        if let jsonDictionary = PursuitJSON.parseJSONFromData(jsonData: data){
            let jsonArray = jsonDictionary["pursuitSteps"] as! [[String : AnyObject]]
            for pursuitSteps in jsonArray {
                let newPursuit = PursuitJSON(pursuitSteps: pursuitSteps)
                pursuitModel.append(newPursuit)
            }
        }
        return pursuitModel
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

extension PursuitJSON {
    
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
