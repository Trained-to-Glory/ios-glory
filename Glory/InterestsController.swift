import UIKit

class InterestsController: UIViewController {
    
    var interestsModel = [InterestsJSON]()
    var userId = "id-1"

    override func viewDidLoad() {
        super.viewDidLoad()
        getInterestsList()
    }
    
    // MARK: - Get Interests
    
    func getInterestsList(){
        interestsModel = InterestsJSON.readInterestsJson()
    }

}
