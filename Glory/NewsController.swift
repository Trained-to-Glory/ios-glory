import UIKit

class NewsController: UIViewController {
    
    var postModel = [PostJSON]()
    var postEngagements = [PostJSON]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Get Posts
    
    func getListOfPosts(){
        postModel = PostJSON.readListOfPostJson()
        postEngagements = PostJSON.readPostEngagementsJson()

    }
    
}
