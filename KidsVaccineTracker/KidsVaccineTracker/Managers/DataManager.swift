//
import Foundation
import CoreData
import UIKit
import VaccineDataReader

class DataManager: NSObject {
    public static let shared = DataManager()
    
    var appDelegate:AppDelegate?
    
    
    override init() {
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        SingletonData.context = self.appDelegate!.persistentContainer.viewContext
        SingletonData.scheduledVaccines = loadScheduledVaccines()
    }
    
    public func loadnitialData() -> [CD_Kid]? {
        if let context = SingletonData.context {
            let kids = fetchRecordsForEntity("CD_Kid", inManagedObjectContext: context)
            return kids as? [CD_Kid]
        }
        return nil
    }
    
    public func save(object: Kid) {
        if let context = SingletonData.context, let entity = NSEntityDescription.entity(forEntityName: CD_Kid.description(), in: context) {
            let kid = NSManagedObject(entity: entity, insertInto: context)
            
            kid.setValue(object.name, forKey: "name")
            kid.setValue(object.id_kid, forKey: "id_kid")
            saveContext()
        }
    }
    
    public func saveContext() {
        if let context = SingletonData.context {
            do {
                try context.save()
            } catch {
                print("Fail saving data...")
            }
        }
    }
    
    public func load() {
        
    }
    
    public func update() {
        
    }
    
    public func fetchRecordsForEntity(_ entity: String, inManagedObjectContext managedObjectContext: NSManagedObjectContext, predicate: NSPredicate? = nil) -> [NSManagedObject] {
        // Create Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        if let predicate = predicate {
            fetchRequest.predicate = predicate
        }
        
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
