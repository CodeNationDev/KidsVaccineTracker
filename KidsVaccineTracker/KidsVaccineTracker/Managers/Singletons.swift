//
import VaccineDataReader
import CoreData

// MARK: - Global
struct SingletonData {
    static var scheduledVaccines: [Vaccine]?
    static var context: NSManagedObjectContext?
    static var currentKid: Kid?
}

