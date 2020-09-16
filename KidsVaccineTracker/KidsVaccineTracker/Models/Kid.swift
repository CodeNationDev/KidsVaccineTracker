//
import Foundation
import CoreData
import UIKit

struct Kid {
    var name: String
    var photo: UIImage? = UIImage()
    var id_kid: UUID = UUID()
    
    public func save() {
        if let context = SingletonData.context, let entity = NSEntityDescription.entity(forEntityName: CD_Kid.description(), in: context) {
            let kid = NSManagedObject(entity: entity, insertInto: context)
            kid.setValue(name, forKey: "name")
            kid.setValue(id_kid, forKey: "id_kid")
            kid.setValue(photo?.pngData(), forKey: "photo")
            DataManager.shared.saveContext()
        }
    }
    
    public static func update(newName: String? = nil, id_kid: UUID, newPhoto: UIImage? = nil) {
        let predicate = NSPredicate(format: "id_kid == %@", id_kid.uuidString)
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: CD_Kid.description())
        fetchRequest.predicate = predicate
        do {
            let results = try SingletonData.context?.fetch(fetchRequest)
            
            let objectToUpdate = results?.first as! CD_Kid
            objectToUpdate.name = newName ?? objectToUpdate.name!
            objectToUpdate.photo = newPhoto?.pngData() ?? UIImage(data: objectToUpdate.photo!)?.pngData()
            try SingletonData.context?.save()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    public static func remove(id_kid: UUID) {
        let predicate = NSPredicate(format: "id_kid == %@", id_kid.uuidString)
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: CD_Kid.description())
        fetchRequest.predicate = predicate
        do {
            let results = try SingletonData.context?.fetch(fetchRequest)
            
            let objectToUpdate = results?.first as! NSManagedObject
            SingletonData.context?.delete(objectToUpdate)
            try SingletonData.context?.save()
            
            //TODO: Delete all data related with this Kid.
            /*
             VitaminD.remove
             SpecialTreatment.remove
             DiseasesConcern.remove
             Allergies.remove
             ScheduledVaccine.remove
             OtherVaccines.remove
            */
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    public static func fetch() -> [Kid] {
        var fetchedValues:[Kid] = []
        if let context = SingletonData.context {
            if let kids = DataManager.shared.fetchRecordsForEntity("CD_Kid", inManagedObjectContext: context) as? [CD_Kid] {
                kids.forEach {
                    var avatar: UIImage?
                    if let name = $0.name, let id_kid = $0.id_kid {
                        if let photo = $0.photo {
                            avatar = UIImage(data: photo)
                        } else { avatar = UIImage(named: "boyPlaceholder") }
                        let kid = Kid(name: name, photo: avatar, id_kid: id_kid)
                        fetchedValues.append(kid)
                    }
                }
            }
        }
        return fetchedValues
    }
}
