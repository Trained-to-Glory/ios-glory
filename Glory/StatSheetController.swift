import UIKit

class StatSheetController: UIViewController {
    
    var statModel = [PursuitJSON]()
    var pursuitId = "id-2"

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Get Pursuit Stats
    
    func getPursuitStats(){
        statModel = PursuitJSON.readPursuitStepsJson(pursuitId: pursuitId)
    }
    
    // MARK: - Write Calls
}
