import UIKit

class SystemsController: UIViewController, UITableViewDataSource {
    
    var pursuitModel = [PursuitJSON]()
    var pursuitId = "id-1"
    var userId = "id-2"

    @IBOutlet weak var pursuitTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timesTapped = 0
        self.progressBar.progress = 0
        getListOfUserPursuits()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pursuitModel = PursuitJSON.readUserPursuitJson(userId: userId)
        return pursuitModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        pursuitModel = PursuitJSON.readUserPursuitJson(userId: userId)
        let cell = pursuitTableView.dequeueReusableCell(withIdentifier: "pursuitCell") as! PursuitTableViewCell
        let arrayValues = pursuitModel[indexPath.row]
        cell.pursuitImageView.image = UIImage(named: String(describing: arrayValues.photo))
        return cell
    }

    func getListOfUserPursuits(){
        pursuitModel = PursuitJSON.readUserPursuitJson(userId: userId)
    }
    
    // MARK: - Get Tools
    
    func getTools(){
        pursuitModel = PursuitJSON.readPursuitToolsJson(pursuitId: pursuitId)
    }
    
}
