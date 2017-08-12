import UIKit

class NewsDetailController: UIViewController {
    
    var postModel = [PostJSON]()
    var postId = "id-3"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Get Post
    
    func getPost(){
        postModel = PostJSON.readPostJson(postId: postId)
    }
}
