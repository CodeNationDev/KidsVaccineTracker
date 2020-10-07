//
import Foundation
import UIKit
import KVTUIKit


class NewUserViewController: KVTBaseViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    
    @IBOutlet weak var bodyCard: KVTCard!
    @IBOutlet weak var txName: KVTMasterTextField!
    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var headerImage: UIImageView!
    
    var kidPhoto:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerImage.image = .kidsHeaderImage
        bodyCard.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        

    }
    @IBAction func tap_save(_ sender: Any) {
       UIView.animate(withDuration: 0.05,
            animations: {
                self.saveButton.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.05) {
                    self.saveButton.transform = CGAffineTransform.identity
                    if let name = self.txName.textField?.text, name.count > 0 {
                        Kid(name: name, photo: self.kidPhoto).save()
                    } else {
                        let action1 = KVTAlertAction(title: "OK", style: .normal, action: {
                            self.dismiss(animated: true, completion: nil)
                        })
                        
                        let alertController = KVTAlert(title: "Aviso", message: "Es necesario insertar un nombre, por favor, vuelve a intentarlo.Es necesario insertar un nombre, por favor, vuelve a intentarlo.", actions: (action1, nil))
                        
                        self.present(alertController, animated: true)
                    }
                }
            })
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
