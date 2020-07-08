//
import Foundation
import CoreData
import UIKit
import VaccineDataReader

class DataManager: NSObject {
    public static let shared = DataManager()
    
    var appDelegate:AppDelegate?
    var context:NSManagedObjectContext?
    
    override init() {
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        self.context = self.appDelegate!.persistentContainer.viewContext
    }
    
    public func loadnitialData() -> [CD_Kid]? {
        SingletonData.scheduledVaccines = loadScheduledVaccines()
        if let context = context {
            let kids = fetchRecordsForEntity("CD_Kid", inManagedObjectContext: context)
            return kids as? [CD_Kid]
        }
        return nil
    }
    
    public func save() {
        
    }
    
    public func load() {
        
    }
    
    public func update() {
        
    }
    
    func fetchRecordsForEntity(_ entity: String, inManagedObjectContext managedObjectContext: NSManagedObjectContext) -> [NSManagedObject] {
        // Create Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        
        // Helpers
        var result = [NSManagedObject]()
        
        do {
            // Execute Fetch Request
            let records = try managedObjectContext.fetch(fetchRequest)
            
            if let records = records as? [NSManagedObject] {
                result = records
            }
            
        } catch {
            print("Unable to fetch managed objects for entity \(entity).")
        }
        
        return result
    }
}
