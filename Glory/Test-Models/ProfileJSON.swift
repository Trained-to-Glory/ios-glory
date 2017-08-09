import Foundation

class ProfileJSON {
    
    var rawData: NSData! = nil
    var finalArray:[Any] = []
    var userName : String?
    var fullName : String?
    var isLeader : Bool?
    var userId : Int?
    
    
    // MARK: - Read JSON Files
   func readListOfAccounts() {
        let file = Bundle.main.path(forResource: "accounts", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
            do {
                let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
                NSDictionary
                let jsonArray =  jsonResult.value(forKey: "account") as! NSArray
                for values in jsonArray {
                    let fullName = (values as AnyObject)["fullName"] as? String
                    let userName = (values as AnyObject)["userName"] as? String
                    let userId = (values as AnyObject)["userId"] as? String
                    let userPhoto = (values as AnyObject)["userPhoto"] as? String
                }
                
            } catch {
                print("error reading json")
    }
}
    
    func readSingleAccount() {
        let file = Bundle.main.path(forResource: "accounts", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
            NSDictionary
            let jsonArray =  jsonResult.value(forKey: "one-account") as! NSArray
            for values in jsonArray {
                let fullName = (values as AnyObject)["fullName"] as? String
                let userName = (values as AnyObject)["userName"] as? String
                let userId = (values as AnyObject)["userId"] as? String
                let userPhoto = (values as AnyObject)["userPhoto"] as? String
            }
            
        } catch {
            print("error reading json")
        }
    }
    
    func readAccountDetailJson() {
        let file = Bundle.main.path(forResource: "accountDetails", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
            NSDictionary
            let jsonArray =  jsonResult.value(forKey: "userDetails") as! NSArray
            for values in jsonArray {
                let email = (values as AnyObject)["email"] as? String
                let userBio = (values as AnyObject)["userBio"] as? String
            }
            
        } catch {
            print("error reading json")
        }
    }

    func readAccountAddedJson() {
        let file = Bundle.main.path(forResource: "accountAdded", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
            NSDictionary
            let jsonArray =  jsonResult.value(forKey: "accountAdded") as! NSArray
            for values in jsonArray {
                let addedId = (values as AnyObject)["addedId"] as? String
                let addedUserName = (values as AnyObject)["addedUserName"] as? String
                let addedPhoto = (values as AnyObject)["addedPhoto"] as? String
                let isAdded = (values as AnyObject)["isAdded"] as? String
            }
            
        } catch {
            print("error reading json")
        }
    }
    
    // MARK: - Write to JSON File
    
    func writeToAccountsJSON (){
        var dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
            do {
                rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
                try rawData.write(toFile: "JSON/accounts.json", options: .atomic)
                var jsonData = NSData(contentsOfFile: "JSON/accounts.json")
                var jsonDict = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
            } catch {
                // Handle Error
                print("Method Failed")
            }
    }
    
    func writeToAccountDetailsJSON (){
        var dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
        
            do {
                rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
                try rawData.write(toFile: "JSON/accountDetails.json", options: .atomic)
                var jsonData = NSData(contentsOfFile: "JSON/accountDetails.json")
                var jsonDict = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
            } catch {
                // Handle Error
                print("Method Failed")
            }
    }
    
    func writeToAccountAddedJSON (){
        var dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
        do {
            rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
            try rawData.write(toFile: "JSON/accountAdded.json", options: .atomic)
            var jsonData = NSData(contentsOfFile: "JSON/accountAdded.json")
            var jsonDict = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
        } catch {
                // Handle Error
                print("Method Failed")
            }
        }
    }

    
    func parseJSONData(jsonData: NSData?) -> [String : AnyObject] {
        if let data = jsonData {
            do {
                let jsonDictonary = try JSONSerialization.jsonObject(with: data as Data, options: .mutableContainers) as? [String : AnyObject]
                return jsonDictonary!
            } catch let error as NSError {
                print("error parsing json data: \(error.localizedDescription)")
            }
        }
        return [:]
    }

