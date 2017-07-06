import Foundation
import AWSLambda

class CalendarModel {
    
    let lambda = Lambda()
    
    
    //MARK: - Create Methods
    
    func createEvent(userId : String, eventId : String, date : Int, addedId : String?, addedUsername : String?, addedPhoto : UIImage?, isAdded : Bool?,  title : String) {
        let createdUserEvent : [String: Any] = [
            "eventId" : eventId,
            "userId" : userId,
            "title" : title,
            "date" : date,
            "added" : [
                addedId! : ["addedUsername" : addedUsername!,
                            "addedPhoto" : addedPhoto!,
                            "isAdded" : isAdded!
                ]
            ]
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createdUserEvent)
        
    }
    
    func createEventDetails(eventId : String, reminder : String, startTime : String, endTime : String, isVisible : Bool, allDay : Bool) {
        let createdUserEvent : [String: Any] = [
            "eventId" : eventId,
            "endTime" : endTime,
            "startTime" : startTime,
            "reminder": reminder,
            "allDay" : allDay,
            "isVisible": isVisible
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: createdUserEvent)
        
    }
    
    //MARK: - Get Methods
    
    func getEventDetails( eventId : String) {
        let getEventDetails : [String: Any] = [
            "eventId" : eventId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getEventDetails)
        
    }
    
    
    func getEvent(userId : String, eventId : String) {
        let getUserEvents : [String: Any] = [
            "userId" : userId,
            "eventId" : eventId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getUserEvents)
        
    }
    
    func getListOfUserEvents(userId : String, eventId : String) {
        let getListOfUserEvents : [String: Any] = [
            "userId" : userId,
            "eventId" : eventId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getListOfUserEvents)
        
    }
    
    func getListOfEventDetails(userId : String, eventId : String) {
        let getListOfEventDetails : [String: Any] = [
            "tableName": "form",
            "eventId" : eventId
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: getListOfEventDetails)
        
    }
    
    
    //MARK: - Update Methods
    
    func updateEventAdded(userId : String, eventId : String, addedId : String?, addedUsername : String?, addedPhoto : UIImage?, isAdded : Bool?) {
        let updatedUserEvent : [String: Any] = [
            "eventId" : eventId,
            "userId" : userId,
            "added" : [
                addedId! : ["addedUsername" : addedUsername!,
                            "addedPhoto" : addedPhoto!,
                            "isAdded" : isAdded!
                ]
            ]
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updatedUserEvent)
        
    }
    
    func updateEventTitle(userId : String, eventId : String, title : String) {
        let updatedUserEvent : [String: Any] = [
            "eventId" : eventId,
            "userId" : userId,
            "title": title
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updatedUserEvent)
        
    }
    
    func updateEventDate(userId : String, eventId : String, date : String) {
        let updatedUserEvent : [String: Any] = [
            "eventId" : eventId,
            "userId" : userId,
            "date": date
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updatedUserEvent)
        
    }
    
    
    func updateEventReminder(eventId : String, reminder : String) {
        let updatedUserEvent : [String: Any] = [
            "eventId" : eventId,
            "reminder": reminder
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updatedUserEvent)
        
    }
    
    func updateEventTimes(eventId : String, startTime : String, endTime : String) {
        let updatedUserEvent : [String: Any] = [
            "eventId" : eventId,
            "startTime": startTime,
            "endTime": endTime
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updatedUserEvent)
        
    }
    
    func updateStartTime(eventId : String, startTime : String) {
        let updatedUserEvent : [String: Any] = [
            "eventId" : eventId,
            "startTime": startTime
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updatedUserEvent)
        
    }
    
    func updateEndTime(eventId : String, endTime : String) {
        let updatedUserEvent : [String: Any] = [
            "eventId" : eventId,
            "endTime": endTime
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updatedUserEvent)
        
    }
    
    func updateAllDay(eventId : String, allDay : Bool) {
        let updatedUserEvent : [String: Any] = [
            "eventId" : eventId,
            "allDay": allDay
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: updatedUserEvent)
        
    }
    
    
    //MARK: - Hide Methods
    
    func hideEvents(eventId : String, isVisible : Bool) {
        let hideUserEvents : [String: Any] = [
            "eventId" : eventId,
            "isVisible" : isVisible
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: hideUserEvents)
        
    }
    
    //MARK: - Add Methods
    
    func addFriends(userId : String, eventId : String,  addedId : String, addedUsername : String, addedPhoto : UIImage, isAdded : Bool) {
        let addUserFriends : [String: Any] = [
            "userId" : userId,
            "eventId" : eventId,
            "added" : [
                addedId: ["addedUsername" : addedUsername,
                          "addedPhoto" : addedPhoto,
                          "isAdded" : isAdded
                ]
            ]
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: addUserFriends)
        
    }
    
    //MARK: - Remove Methods
    
    func removeFriends(userId : String, eventId : String,  addedId : String, addedUsername : String, addedPhoto : UIImage, isAdded : Bool) {
        let removeUserFriends : [String: Any] = [
            "userId" : userId,
            "eventId" : eventId,
            "added" : [addedId],
            "operation": "update"
        ]
        
        let functionName = "lambda-functions-dev-accounts"
        lambda.sendFunction(functionName: functionName, jsonObject: removeUserFriends)
        
    }
}
