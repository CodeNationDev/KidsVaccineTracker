//
import Foundation
import CoreData

struct OtherVaccines {
    enum vaccineType: Int {
        case scheduled = 0, other = 1
    }
    var batch: String
    var commercialName: String
    var date: Date
    var healthcareCenter: String
    var id_kid: UUID
    var laboratory: String
    var sign: Data
    var sticker: Data
    var vaccineName: String
    var dose: String
    var v_type: vaccineType = .scheduled
    
    
    func save(kid: UUID) {
        if let context = SingletonData.context, let entity = NSEntityDescription.entity(forEntityName: CD_Scheduled_Vaccine.description(), in: context) {
            let others = NSManagedObject(entity: entity, insertInto: context)
            others.setValue(batch, forKey: "batch")
            others.setValue(date, forKey: "date")
            others.setValue(healthcareCenter, forKey: "healthcare_center")
            others.setValue(id_kid, forKey: "id_kid")
            others.setValue(laboratory, forKey: "laboratory")
            others.setValue(sign, forKey: "sign")
            others.setValue(sticker, forKey: "sticker")
            others.setValue(vaccineName, forKey: "vaccineName")
            others.setValue(dose, forKey: "dose")
            others.setValue(v_type, forKey: "v_type")
            DataManager.shared.saveContext()
        }
    }
    
    func trigger() {}
}
