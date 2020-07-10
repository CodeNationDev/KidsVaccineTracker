//
import Foundation
import CoreData

struct Kid {
    var name: String
    var id_kid: UUID = UUID()
    
    public func save() {
        if let context = SingletonData.context, let entity = NSEntityDescription.entity(forEntityName: CD_Kid.description(), in: context) {
            let kid = NSManagedObject(entity: entity, insertInto: context)
            kid.setValue(name, forKey: "name")
            kid.setValue(id_kid, forKey: "id_kid")
            DataManager.shared.saveContext()
        }
    }
    
    public static func update(name: String, id_kid: UUID) {
        
    }
    
    public static func fetch() -> [Kid] {
        var fetchedValues:[Kid] = []
        if let context = SingletonData.context {
            if let kids = DataManager.shared.fetchRecordsForEntity("CD_Kid", inManagedObjectContext: context) as? [CD_Kid] {
                kids.forEach {
                    if let name = $0.name, let id_kid = $0.id_kid {
                        let kid = Kid(name: name, id_kid: id_kid)
                        fetchedValues.append(kid)
                    }
                }
            }
        }
        return fetchedValues
    }
}
