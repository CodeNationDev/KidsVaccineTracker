//
import Foundation
import CoreData
import UIKit
import VaccineDataReader
import os.log

class DataManager: NSObject {
    public static let shared = DataManager()
    
    var appDelegate:AppDelegate?
    
    
    override init() {
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        SingletonData.context = self.appDelegate!.persistentContainer.viewContext
    }
    
    public func loadnitialData() -> [Kid]? {
        Kid.fetch() 
    }
    
    public func saveContext(completion: (_ success:Bool) -> Void) {
        if let context = SingletonData.context {
            do {
                try context.save()
                completion(true)
            } catch {
                print("Fail saving data...")
            }
        }
    }

    func trigger(id_kid: UUID) -> Bool {
        guard let _ = DataManager.fetch(id_kid: id_kid, entityName: CD_Kid.description(), withType: CD_Kid.self) else { return false }
        return true
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
    
    public static func fetch<T: NSManagedObject>(id_kid: UUID, entityName: String, withType type: T.Type) -> [NSManagedObject]? {
        if let context = SingletonData.context {
            let predicate = NSPredicate(format: "id_kid == %@", id_kid.uuidString)
            if let specialTreat = DataManager.shared.fetchRecordsForEntity(CD_VitaminD.description(), inManagedObjectContext: context, predicate: predicate) as? [T] {
                return specialTreat
            }
        }
        return nil
    }
}
