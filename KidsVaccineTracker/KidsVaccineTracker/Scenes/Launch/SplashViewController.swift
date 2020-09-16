//
import Foundation
import UIKit

class SplashViewController: KVTViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let kids = DataManager.shared.loadnitialData(), kids.count > 0 {
            let kids = Kid.fetch()
            kids.forEach {
                print("Name: \($0.name) \n ID: \($0.id_kid) \n \n")
            }
            performSegue(withIdentifier: "initial", sender: kids)
        } else {
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
