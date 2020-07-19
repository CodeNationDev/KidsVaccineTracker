//
import Foundation
import CoreData

struct DiseasesConcern {
    var name: String
    var desc: String
    var id_kid: String
    
    func save(kid: UUID) {
        if let context = SingletonData.context, let entity = NSEntityDescription.entity(forEntityName: CD_Diseases_concern.description(), in: context) {
            
            let diseases = NSManagedObject(entity: entity, insertInto: context)
            diseases.setValue(desc, forKey: "desc")
            diseases.setValue(name, forKey: "name")
            diseases.setValue(kid, forKey: "id_kid")
            DataManager.shared.saveContext()
        }
    }
    func fetch() {}
    
    
    func trigger(id_kid: UUID) -> Bool {
        /*TODO: Check if:
         - Kid exists.
        */
        return true
    }
}
