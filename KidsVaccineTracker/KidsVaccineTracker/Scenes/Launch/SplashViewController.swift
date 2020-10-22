//
import Foundation
import UIKit
import KVTUIKit

class SplashViewController: KVTBaseViewController {

    @IBOutlet weak var gradientView2: KVTGradientView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if let kids = DataManager.shared.loadnitialData(), kids.count > 0 {
            kids.forEach {
                print("Name: \($0.name) \n ID: \($0.id_kid) \n \n")
            }
            Thread.sleep(forTimeInterval: 3.0)
            performSegue(withIdentifier: "initial", sender: kids)
        } else {
            Thread.sleep(forTimeInterval: 3.0)
            performSegue(withIdentifier: "newuser", sender: nil)
        }
    }
    

    /// Prepare segue override for pass parameters to next ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier.elementsEqual("initial") {
            if let mainVC = segue.destination as? InitialViewController {
                if let kids = sender as? [Kid] {
                    mainVC.kids = kids
                }
            }
        }
    }
}
