import UIKit

class SystemsController: UIViewController {
    
    var pursuitModel = [PursuitJSON]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.timesTapped = 0
        self.progressBar.progress = 0
        getListOfPursuits()
        getTools()
    }
    
    // MARK: - Create Progress Bar
    
    var timesTapped : Float = 0.0
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func buttonTapped(_ sender: Any) {
        self.timesTapped = self.timesTapped + 0.1
        self.progressBar.progress = timesTapped
        
        if (timesTapped == 1.0) {
            self.progressBar.progress = 1.0
            return
        }
    }
    
    // Calulate Pursuit Progress
    
    func calculatePursuit(){
        
    }
    
    // MARK: - Get Pursuit/Pursuits

    func getListOfPursuits(){
        pursuitModel = PursuitJSON.readPursuitJson()
    }
    
    // MARK: - Get tools
    
    func getTools(){
        pursuitModel = PursuitJSON.readPursuitToolsJson()
    }
    
}
