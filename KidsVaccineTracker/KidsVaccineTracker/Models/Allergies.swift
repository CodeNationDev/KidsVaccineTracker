//
import Foundation
import CoreData
import SimplyLogger

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
            DataManager.shared.saveContext(completion: { (success) -> Void in
                if success {
                    SimplyLogger.log(str: "Allergy saved", category: .data)
                }
            })
        }
    }
    
    func trigger(id_kid: UUID) -> Bool {
        return true
    }
}
