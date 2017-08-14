import UIKit

class CommentsController: UIViewController, UITableViewDataSource {

    var commentsModel = [PostJSON]()
    var postId = "id-1"
    
    @IBOutlet weak var commentsTable: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Get Comments

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        commentsModel = PostJSON.readPostCommentsJson(postId: postId)
        return commentsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        commentsModel = PostJSON.readPostCommentsJson(postId: postId)
        let cell = commentsTable.dequeueReusableCell(withIdentifier: "commentsCell") as! CommentTableViewCell
        let arrayValues = commentsModel[indexPath.row]
        cell.userPhoto.image = UIImage(named: String(describing: arrayValues.photo))
        cell.tag = Int(arrayValues.userId!)!
        return cell
    }
    

    
    // MARK: - Write Comments
}
