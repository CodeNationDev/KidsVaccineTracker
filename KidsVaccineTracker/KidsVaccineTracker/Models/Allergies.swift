//
import Foundation
import CoreData

struct Allergies {
    var name: String
    var desc: String
    var id_kid: String
    
    func save(kid: UUID) {
        if let context = SingletonData.context, let entity = NSEntityDescription.entity(forEntityName: CD_Allergies.description(), in: context) {
            
            let allergies = NSManagedObject(entity: entity, insertInto: context)
            allergies.setValue(desc, forKey: "desc")
            allergies.setValue(name, forKey: "name")
            allergies.setValue(kid, forKey: "id_kid")
            DataManager.shared.saveContext()
        }
    }
    
    func trigger(id_kid: UUID) -> Bool {
        return true
    }
}
