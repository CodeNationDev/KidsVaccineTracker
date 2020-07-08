//
import Foundation
import UIKit

class SplashViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let kids = DataManager.shared.loadnitialData() {
            performSegue(withIdentifier: "initial", sender: nil)
        } else {
            performSegue(withIdentifier: "initial", sender: nil)
        }
    }
}
