//
import Foundation
import UIKit

class NewUserViewController: UIViewController {
    
    @IBOutlet weak var txName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func tap_save(_ sender: Any) {
        if let name = txName.text {
            Kid(name: name).save()
        }
    }
}
