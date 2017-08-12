import UIKit

class LikesController: UIViewController {
    
    var likesModel = [PostJSON]()
    var postId = "id-3"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Get Likes
    
    func getLikes(){
        likesModel = PostJSON.readPostLikesJson(postId: postId)
    }
}
