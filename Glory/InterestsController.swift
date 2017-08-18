import UIKit

class InterestsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var interestsModel = [InterestsJSON]()
    var interestName : String?
    var interestsId = "id-3"
    var userId = "id-3"

    @IBOutlet weak var interestsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInterests()
    }
    
    // MARK: - Get Interests
    func getInterests(){
        interestsModel = InterestsJSON.readInterestsJson()
         self.interestsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        interestsModel = InterestsJSON.readInterestsJson()
        return interestsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        interestsModel = InterestsJSON.readInterestsJson()
        let cell = interestsTableView.dequeueReusableCell(withIdentifier: "InterestsCell") as! InterestsTableViewCell
        let arrayValues = interestsModel[indexPath.row]
        cell.interestLabel.text = arrayValues.interestsName
        cell.interestLabel.tag = Int(arrayValues.interestsId!)!
        return cell
    }
    
    // MARK: - Select Interests
    
    func selectInterests(){
        InterestsJSON.writeToUserInterestsJSON(interestsId: interestsId, isSelected: true, userId: userId)
    }
}
