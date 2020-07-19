//
import Foundation
import UIKit

class NewUserViewController: UIViewController {
    
    @IBOutlet weak var txName: UITextField!
    
    @IBOutlet weak var imageAvatar: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    @IBAction func tap_save(_ sender: Any) {
        if let name = txName.text {
            Kid(name: name).save()
        }
    }
    
    func setup() {
        imageAvatar.image = imageAvatar.image?.withRenderingMode(.alwaysTemplate)
        imageAvatar.tintColor = .red
        imageAvatar.layer.borderColor = UIColor.gray.cgColor
        imageAvatar.layer.borderWidth = 0.3
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageAvatar.addGestureRecognizer(tapgesture)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView

        // Your action
    }
}
