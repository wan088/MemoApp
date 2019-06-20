import UIKit

class TutorialContentsVC: UIViewController{
    
    @IBOutlet var subject: UILabel!
    @IBOutlet var bgImg: UIImageView!
    
    var subject_text: String?
    var bgImg_imageName: String?
    var pageIdx: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.subject.text = self.subject_text
        self.bgImg.image = UIImage(named: bgImg_imageName!)
    }
}
