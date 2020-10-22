//
import UIKit
import CoreData
import KVTUIKit

class InitialViewController: UIViewController {
    @IBOutlet weak var kidLabel: UILabel!
    @IBOutlet weak var gradientView: KVTGradientView!
    public var kids:[Kid]?
    
    @IBOutlet weak var blurView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientView.startColor = .magenta2
        gradientView.endColor = .magenta1
        
    }
}

