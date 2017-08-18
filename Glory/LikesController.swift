import UIKit

class LikesController: UIViewController, UITableViewDataSource {
    
    var likesModel = [PostJSON]()
    var postId = "id-2"
    var likeId = "id-3"
    var created = 1234
    var isLiked = true
    
    @IBOutlet weak var likeTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Get Likes
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       likesModel = PostJSON.readPostLikesJson(postId: postId)
       return likesModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        likesModel = PostJSON.readPostLikesJson(postId: postId)
        let cell = likeTableView.dequeueReusableCell(withIdentifier: "likeCell") as! LikeTableViewCell
        let arrayValues = likesModel[indexPath.row]
        cell.userName.text = arrayValues.likeUserName
        cell.userPhoto.image = UIImage(named: String(describing: arrayValues.likePhoto)) 
        return cell
    }
    
    // MARK: - Toggle Likes
    func toggleLike(){
        PostJSON.writeToPostLikesJSON(likeId: likeId, created: created, isLiked: isLiked)
    }
    
}
