//
import UIKit
import CoreData


class InitialViewController: UIViewController {
    @IBOutlet weak var kidLabel: UILabel!
    public var kids:[Kid]?
    @IBOutlet weak var kid_photo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kid_photo.image = kids?.first?.photo
        kidLabel.text = kids?.first?.name
    }
    @IBAction func tap_update(_ sender: Any) {
        Kid.remove(id_kid: (kids?.first?.id_kid)!)
    }
}

