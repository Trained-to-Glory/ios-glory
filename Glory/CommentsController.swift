import UIKit

class CommentsController: UIViewController {

    var commentsModel = [PostJSON]()
    var postId = "id-3"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Get Comments 
    
    func getComments(){
        commentsModel = PostJSON.readPostCommentsJson(postId: postId)
    }
}
