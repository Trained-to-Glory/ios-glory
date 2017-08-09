import Foundation

class ProfileJSON {
    
    var rawData: NSData! = nil
    var userName : String?
    var fullName : String?
    var isLeader : String?
    var userId : String?
    var userPhoto : String?
    var email : String?
    var userBio : String?
    var addedId : String?
    var addedUserName : String?
    var addedPhoto : String?
    var isAdded : String?
    
    init(userName: String, userId: String, userPhoto: String, isLeader: String, fullName: String){
        self.userName = userName
        self.fullName = fullName
        self.userId = userId
        self.userPhoto = userPhoto
        self.isLeader = isLeader
    }
    
    init(values : [String: AnyObject]){
        
        self.userName = values["userName"] as? String
        self.userId = values["userId"] as? String
        self.fullName = values["fullName"] as? String
        self.isLeader = values["isLeader"] as? String
        self.userPhoto = values["userPhoto"] as? String
        
    }
    
    init(detailValues : [String: AnyObject]){
        self.email = detailValues["email"] as? String
        self.userBio = detailValues["userBio"] as? String
    }
    
    init(addedValues : [String: AnyObject]){
        self.addedId = addedValues["addedId"] as? String
        self.addedUserName = addedValues["addedUserName"] as? String
        self.addedPhoto = addedValues["addedPhoto"] as? String
        self.isAdded = addedValues["isAdded"] as? String
    }

    // MARK: - Read JSON Files
   static func readListOfAccounts() -> [ProfileJSON]{
    var profileModel = [ProfileJSON]()
    let file = Bundle.main.path(forResource: "accounts", ofType: "json")
    let data : NSData? = NSData(contentsOfFile: file!)
    if let jsonDictionary = ProfileJSON.parseJSONFromData(jsonData: data){
        let jsonArray = jsonDictionary["account"] as! [[String : AnyObject]]
        for values in jsonArray {
            let newAccount = ProfileJSON(values: values)
            profileModel.append(newAccount)
        }
    }
    return profileModel
}
    
    static func readAccountDetailJson() -> [ProfileJSON] {
        var profileModel = [ProfileJSON]()
        let file = Bundle.main.path(forResource: "accountDetails", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        if let jsonDictionary = ProfileJSON.parseJSONFromData(jsonData: data){
            let jsonArray = jsonDictionary["userDeatils"] as! [[String : AnyObject]]
            for detailValues in jsonArray {
                let newAccount = ProfileJSON(detailValues: detailValues)
                profileModel.append(newAccount)
            }
        }
        return profileModel
    }

    static func readAccountAddedJson() -> [ProfileJSON] {
        var profileModel = [ProfileJSON]()
        let file = Bundle.main.path(forResource: "accountAdded", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        if let jsonDictionary = ProfileJSON.parseJSONFromData(jsonData: data){
            let jsonArray = jsonDictionary["accountAdded"] as! [[String : AnyObject]]
            for detailValues in jsonArray {
                let newAccount = ProfileJSON(detailValues: detailValues)
                profileModel.append(newAccount)
            }
        }
        return profileModel
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


extension ProfileJSON {
    
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
