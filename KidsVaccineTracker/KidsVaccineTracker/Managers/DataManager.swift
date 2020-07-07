//
import Foundation
import CoreData
import UIKit

class DataManager: NSObject {
    public static let shared = DataManager()
    
    var appDelegate:AppDelegate?
    var context:NSManagedObjectContext?
    
    override init() {
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.context = self.appDelegate!.persistentContainer.viewContext
    }
    
    public func loadnitialData() {
        
    }
    
    public func save() {
        
    }
    
    public func load() {
        
    }
    
    public func update() {
        
    }
}
