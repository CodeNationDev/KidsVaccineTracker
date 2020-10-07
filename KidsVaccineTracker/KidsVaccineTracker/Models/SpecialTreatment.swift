//
import Foundation
import CoreData
import SimplyLogger

struct SpecialTreatment {
    var dose: String
    var duration: String
    var name: String
    var startDate: Date
    var id_kid: String
    
    func save(kid: UUID) {
        if let context = SingletonData.context, let entity = NSEntityDescription.entity(forEntityName: CD_Special_Treatments.description(), in: context), DataManager.shared.trigger(id_kid: kid) {
            let special = NSManagedObject(entity: entity, insertInto: context)
            
            special.setValue(dose, forKey: "dose")
            special.setValue(startDate, forKey: "start_date")
            special.setValue(duration, forKey: "duration")
            special.setValue(name, forKey: "name")
            special.setValue(kid, forKey: "id_kid")
            DataManager.shared.saveContext(completion: { (success) -> Void in
                if success {
                    SimplyLogger.log(str: "Special Treatment saved", category: .data)
                }
            })
        }
    }
    public static func fetch(id_kid: UUID) -> [CD_Special_Treatments]? {
        (DataManager.fetch(id_kid: id_kid, entityName: CD_Special_Treatments.description(), withType: CD_Special_Treatments.self) as! [CD_Special_Treatments])
    }
}
