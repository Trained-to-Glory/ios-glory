import Foundation

class PursuitJSON {
    
    var rawData: NSData! = nil
    
    // MARK: - Read JSON Files
    
    func readPursuitJson() {
        do {
            if let file = Bundle.main.path(forResource: "pursuit", ofType: "json") {
                let data : NSData =  try NSData(contentsOfFile: file)
                let json = try JSONSerialization.jsonObject(with: data as Data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readPursuitDetailsJson() {
        do {
            if let file = Bundle.main.path(forResource: "pursuitDetails", ofType: "json") {
                let data : NSData =  try NSData(contentsOfFile: file)
                let json = try JSONSerialization.jsonObject(with: data as Data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readPursuitStepsJson() {
        do {
            if let file = Bundle.main.path(forResource: "pursuitSteps", ofType: "json") {
                let data : NSData =  try NSData(contentsOfFile: file)
                let json = try JSONSerialization.jsonObject(with: data as Data, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    print(object)
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
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
