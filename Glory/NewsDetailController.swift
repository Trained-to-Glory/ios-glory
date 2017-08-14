import UIKit

class NewsDetailController: UIViewController {
    
    var postModel = [PostJSON]()
    var engagementsModel = [PostJSON]()
    var commentsModel = [PostJSON]()
    var likesModel = [PostJSON]()
    var postId = "id-1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Get Post
    
    func getSinglePost(){
        postModel = PostJSON.readPostJson(postId: postId)
        engagementsModel = PostJSON.readPostEngagementsJson(postId: postId)
        commentsModel = PostJSON.readPostCommentsJson(postId: postId)
        likesModel = PostJSON.readPostLikesJson(postId: postId)
    }
    
    // MARK: - Toggle Calls
}
