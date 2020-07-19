//
import Foundation
import CoreData

struct SpecialTreatment {
    var dose: String
    var duration: String
    var name: String
    var startDate: Date
    var id_kid: String
    
    func save(kid: UUID) {
        if let context = SingletonData.context, let entity = NSEntityDescription.entity(forEntityName: CD_Special_Treatments.description(), in: context) {
            let special = NSManagedObject(entity: entity, insertInto: context)
            
            special.setValue(dose, forKey: "dose")
            special.setValue(startDate, forKey: "start_date")
            special.setValue(duration, forKey: "duration")
            special.setValue(name, forKey: "name")
            special.setValue(kid, forKey: "id_kid")
            DataManager.shared.saveContext()
        }
    }
    
    func trigger(id_kid: UUID) -> Bool {
        /*TODO: Check if:
         - Kid exists.
        */
        return true
    }
    
    
}
