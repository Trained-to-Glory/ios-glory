import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
