//
import Foundation
import CoreData

struct ScheduledVaccine {
    var batch: String
    var commercialName: String
    var date_adrministration: Date
    var healthcareCenter: String
    var id_kid: UUID
    var laboratory: String
    var sign: Data
    var sticker: Data
    var vaccine: String
    
    func save(kid: UUID) {
        if let context = SingletonData.context, let entity = NSEntityDescription.entity(forEntityName: CD_Scheduled_Vaccine.description(), in: context) {
            
            let scheduled = NSManagedObject(entity: entity, insertInto: context)
            scheduled.setValue(batch, forKey: "batch")
            scheduled.setValue(commercialName, forKey: "commercial_name")
            scheduled.setValue(date_adrministration, forKey: "date_administration")
            scheduled.setValue(healthcareCenter, forKey: "healthcare_center")
            scheduled.setValue(id_kid, forKey: "id_kid")
            scheduled.setValue(laboratory, forKey: "laboratory")
            scheduled.setValue(sign, forKey: "sign")
            scheduled.setValue(sticker, forKey: "sticker")
            scheduled.setValue(vaccine, forKey: "vaccine")
            DataManager.shared.saveContext()
        }
    }
    
    func trigger(id_kid: UUID) -> Bool {
        /*TODO: Check if:
         - Kid exists.
         - Vaccine don't exists.
        */
        return true
    }
}
