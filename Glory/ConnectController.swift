import UIKit

class ConnectController: UIViewController, UITableViewDataSource {
    var pursuitModel = [PursuitJSON]()
    var toolModel = [PursuitJSON]()
    var peopleModel = [PursuitJSON]()
    var pursuitId = "id-2"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var pursuitTableView: UITableView!
    @IBOutlet weak var toolTableView: UITableView!
    @IBOutlet weak var peopleTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pursuitModel = PursuitJSON.readPursuitJson()
        return pursuitModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        pursuitModel = PursuitJSON.readPursuitJson()
        toolModel = PursuitJSON.readPursuitToolsJson(pursuitId: pursuitId)
        peopleModel = PursuitJSON.readPursuitPeopleJson(pursuitId: pursuitId)
        
        let cell = pursuitTableView.dequeueReusableCell(withIdentifier: "PursuitCell") as! DiscoverPursuitTableViewCell
        let toolCell = toolTableView.dequeueReusableCell(withIdentifier: "ToolCell") as! DiscoverToolTableViewCell
        let peopleCell = peopleTableView.dequeueReusableCell(withIdentifier: "PeopleCell") as! DiscoverPeopleTableViewCell
        
        let pursuitArrayValues = pursuitModel[indexPath.row]
        cell.pursuitImageView.image = UIImage(named: String(describing: pursuitArrayValues.photo))
        cell.tag = Int(pursuitArrayValues.pursuitId!)!
        
        let toolArrayValues = toolModel[indexPath.row]
        toolCell.toolImageView.image = UIImage(named: String(describing: toolArrayValues.photo))
        toolCell.toolName.text = toolArrayValues.description
        toolCell.tag = Int(toolArrayValues.toolId!)!
        
        let peopleArrayValues = peopleModel[indexPath.row]
        peopleCell.peopleImageView.image = UIImage(named: String(describing: peopleArrayValues.photo))
        peopleCell.userName.text = peopleArrayValues.userName
        peopleCell.tag = Int(peopleArrayValues.userId!)!
        
        return cell
    }
}
