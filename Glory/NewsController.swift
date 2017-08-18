import UIKit

class NewsController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var postModel = [PostJSON]()
    
    @IBOutlet weak var newsTableView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Get Posts

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        postModel = PostJSON.readListOfPostJson()
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "NewsCell") as! PostTableViewCell
        let arrayValues = postModel[indexPath.row]
        cell.newsImageView.image = UIImage(named: String(describing: arrayValues.photo))
        cell.tag = Int(arrayValues.postId!)!
        return cell
    }


    
}
