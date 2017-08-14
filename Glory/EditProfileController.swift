import UIKit

class EditProfileController: UIViewController {
    
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userBio: UITextField!
    
    @IBAction func saveChanges(_ sender: Any) {
        // Data Model Call
    }
    
    var profileModel = [ProfileJSON]()
    var profileDetails = [ProfileJSON]()
    var interestsModel = [InterestsJSON]()
    var userDescription : String!
    var accountUserName : String!
    var accountFullName : String!
    var userId = "id-2"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Load account info
        getAccount()
    }
    
    // Capture profile changes
    
    @IBAction func userBioChanged(_ sender: Any) {
        self.userDescription = userBio.text!
    }
    
    @IBAction func userNameChanged(_ sender: Any) {
        self.accountUserName = userName.text!
    }
    
    @IBAction func fullNameChanged(_ sender: Any) {
        self.accountFullName = fullName.text!
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
        fullName.text = profileModel[0].fullName
        userName.text = profileModel[0].userName
        userBio.text = profileModel[0].userBio
        profilePicture.image = UIImage(named: profileModel[0].userPhoto!)
    }
    
    // MARK: - Write Account Info

}
