//
import Foundation
import CoreData

struct VitaminD {
    var dose: String
    var type: String
    var duration: String
    var id_kid: UUID
    
    func save(kid: UUID) {
        if let context = SingletonData.context, let entity = NSEntityDescription.entity(forEntityName: CD_VitaminD.description(), in: context), DataManager.shared.trigger(id_kid: id_kid) {
              let vitaminD = NSManagedObject(entity: entity, insertInto: context)
            vitaminD.setValue(dose, forKey: "dose")
            vitaminD.setValue(type, forKey: "type")
            vitaminD.setValue(duration, forKey: "duration")
            vitaminD.setValue(kid, forKey: "id_kid")
            DataManager.shared.saveContext()
          }
      }
    
    public static func fetch(id_kid: UUID) -> [CD_Special_Treatments]? {
        if let context = SingletonData.context {
            if let specialTreat = DataManager.shared.fetchRecordsForEntity(CD_VitaminD.description(), inManagedObjectContext: context) as? [CD_Special_Treatments] {
                return specialTreat
            }
        }
        return nil
    }
}
