import Foundation

class CalendarJSON {
    
    var rawData: NSData! = nil

    // MARK: - Read JSON Files
    
    func readCalendarJson() {
        let file = Bundle.main.path(forResource: "calendar", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
            NSDictionary
            let jsonArray =  jsonResult.value(forKey: "eventId") as! NSArray
            for values in jsonArray {
                let eventId = (values as AnyObject)["eventId"] as? String
                let userId = (values as AnyObject)["userId"] as? String
                let title = (values as AnyObject)["title"] as? String
                let date = (values as AnyObject)["date"] as? String
            }
            
        } catch {
            print("error reading json")
        }
    }
    
    func readCalendarDetailsJson() {
        let file = Bundle.main.path(forResource: "calendarDetails", ofType: "json")
        let data : NSData? = NSData(contentsOfFile: file!)
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data! as Data, options: .mutableContainers) as!
            NSDictionary
            let jsonArray =  jsonResult.value(forKey: "eventDetails") as! NSArray
            for values in jsonArray {
                let eventId = (values as AnyObject)["eventId"] as? String
                let userId = (values as AnyObject)["userId"] as? String
                let reminder = (values as AnyObject)["reminder"] as? String
                let startTime = (values as AnyObject)["startTime"] as? String
                let endTime = (values as AnyObject)["endTime"] as? String
                let allDay = (values as AnyObject)["allDay"] as? String
                let isVisible = (values as AnyObject)["isVisible"] as? String
            }
            
        } catch {
            print("error reading json")
        }
    }
    
    // MARK: - Write To JSON File
    
    func writeToCalendarJSON (){
        var dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
            do {
                rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
                try rawData.write(toFile: "JSON/calendar.json", options: .atomic)
                var jsonData = NSData(contentsOfFile: "JSON/calendar.json")
                var jsonDict = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
            } catch {
                // Handle Error
                print("Method Failed")
            }
    }
    
    func writeToCalendarDetailsJSON (){
        var dictonary : [String : Any] = ["question":"If you want to create a custom class which can be displayed on the view, you can subclass UIView.",
                                          "answers":["True", "False"],
                                          "correctIndex":0,
                                          "module":3,
                                          "lesson":0,
                                          "feedback":"Subclassing UIView gives your class the methods and properties of a basic view which can be placed onto the view."
        ]
        
            do {
                rawData = try JSONSerialization.data(withJSONObject: dictonary, options: .prettyPrinted) as NSData
                try rawData.write(toFile: "JSON/calendarDetails.json", options: .atomic)
                var jsonData = NSData(contentsOfFile: "JSON/calendarDetails.json")
                var jsonDict = try JSONSerialization.jsonObject(with: jsonData! as Data, options: .mutableContainers)
                
            } catch {
                // Handle Error
                print("Method Failed")
            }
    }
    
}
