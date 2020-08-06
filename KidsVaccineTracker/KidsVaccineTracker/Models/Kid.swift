//
import Foundation
import CoreData
import UIKit

struct Kid {
    var name: String
    var photo: UIImage?
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
    
    public static func update(name: String?, id_kid: UUID, photo: UIImage?) {
        
    }
    
    public static func remove(id_kid: UUID) {
        //TODO: Delete on cascade
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
