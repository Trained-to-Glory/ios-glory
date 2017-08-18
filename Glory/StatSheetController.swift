import UIKit

class StatSheetController: UIViewController {
    
    var statModel = [PursuitJSON]()
    var pursuitId = "id-2"
    var stepId = "id-3"
    var isComplete = true
    var isVisible = true
    var text = "Some words"
    var position = 3

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Get Pursuit Stats
    
    func getPursuitStats(){
        statModel = PursuitJSON.readPursuitStepsJson(pursuitId: pursuitId)
    }
    
    // MARK: - Write Calls
    func updateProgress(){
       
        PursuitJSON.writeToPursuitStepsJSON(pursuitId: pursuitId, stepId: stepId, isComplete: isComplete, text: text, position: position, isVisible: isVisible)
    }
}
