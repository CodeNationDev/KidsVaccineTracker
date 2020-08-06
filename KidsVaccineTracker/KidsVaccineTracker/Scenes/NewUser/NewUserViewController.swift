//
import Foundation
import UIKit

class NewUserViewController: KVTViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var txName: UITextField!
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    
    var kidPhoto:UIImage?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setup()
    }
    @IBAction func tap_save(_ sender: Any) {
        if let name = txName.text, name.count > 0 {
            Kid(name: name, photo: kidPhoto).save()
            
        } else {
            let alertController = UIAlertController(title: "Error", message: "Insert a valid name", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alertController, animated: true)
        }
    }
    
    func setup() {
        imageAvatar.image = imageAvatar.image?.withRenderingMode(.alwaysTemplate)
        imageAvatar.layer.cornerRadius = imageAvatar.bounds.size.height / 2
        imageAvatar.tintColor = UIColor.blackNwhite
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageAvatar.addGestureRecognizer(tapgesture)
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        imageAvatar.image = image
        kidPhoto = image
    }
}
