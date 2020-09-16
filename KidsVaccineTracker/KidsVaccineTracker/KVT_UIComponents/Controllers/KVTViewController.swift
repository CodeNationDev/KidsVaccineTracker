//
import Foundation
import UIKit
import SimplyLogger

public class KVTViewController: UIViewController, UITextFieldDelegate {
    
    var editingFieldX:CGFloat = 0.0

    public override func viewDidLoad() {
        super.viewDidLoad()
        SimplyLogger.log(str: "\(self.restorationIdentifier ?? self.debugDescription) loaded", category: .viewcycle)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        self.view.subviewsRecursive().forEach {
            if $0 is UITextField {
                let subview = $0 as! UITextField
                subview.delegate = self
            }
        }
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 && editingFieldX > keyboardSize.height {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        editingFieldX = textField.convert(textField.bounds, to: self.view).maxY
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        editingFieldX = 0.0
    }
}

extension UIView {
    func subviewsRecursive() -> [UIView] {
        return subviews + subviews.flatMap { $0.subviewsRecursive() }
    }
}
