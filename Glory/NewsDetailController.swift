import UIKit

class NewsDetailController: UIViewController {
    
    var postModel = [PostJSON]()
    var engagementsModel = [PostJSON]()
    var commentsModel = [PostJSON]()
    var likesModel = [PostJSON]()
    var postId = "id-1"
    var likeId = "id-2"
    var likeUserName = "foo"
    var created = 1234
    var isLiked = true
    var commentId = "id-4"
    var commentText = "Some words"
    
    
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
    
    func toggleLike(){
        PostJSON.writeToPostLikesJSON(likeId: likeId, created: created, isLiked: isLiked)
    }
    
    func createComment(){
        PostJSON.writeToPostCommentsJSON(commentId: commentId, commentText: commentText, created: created)
    }
}
