import UIKit

class EditProfileController: UIViewController {
    
    var profileModel = [ProfileJSON]()
    var profileDetails = [ProfileJSON]()
    var interestsModel = [InterestsJSON]()
    var interestsNameModel = [InterestsJSON]()
    var userDescription : String!
    var accountUserName : String!
    var accountFullName : String!
    var userId = "id-4"
    var interestsId = "id-4"
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userBio: UITextField!
    
    // MARK: - Write Account Info
    
    @IBAction func saveChanges(_ sender: Any) {
        accountFullName = fullName.text
        accountUserName = userName.text
        userDescription = userBio.text
        
        ProfileJSON.writeToAccountsJSON(accountUserName: accountUserName, accountFullName: accountFullName, userId: userId)
        ProfileJSON.writeToAccountDetailsJSON(userDescription: userDescription, email: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load account info
        getAccount()
    }
    
    // MARK: - Create/Update Profile Picture
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        let chosenImage = image
        profilePicture.contentMode = .scaleAspectFit
        profilePicture.image = chosenImage
        // Send image data to data model
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Get Account Details
    
    func getAccount(){
        profileDetails = ProfileJSON.readAccountDetailJson(userId: userId)
        profileModel = ProfileJSON.readAccount(userId: userId)
        interestsModel = InterestsJSON.readUserInterestsJson(userId: userId)
        interestsNameModel = InterestsJSON.readUserInterestsNameJson(interestsId: interestsId)
        fullName.text = profileModel[0].fullName
        userName.text = profileModel[0].userName
        userBio.text = profileModel[0].userBio
        profilePicture.image = UIImage(named: profileModel[0].userPhoto!)
    }
    
}
