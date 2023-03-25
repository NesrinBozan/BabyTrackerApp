//
//  CoreDataManager.swift
//  BabyTracker
//
//  Created by Nesrin Bozan on 24.03.2023.
//

import UIKit
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    
    func saveActivityToCoreData(model: ActivityModel){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "Activity", into: context)
        
        saveData.setValue(model.time, forKey: "time")
        saveData.setValue(model.note, forKey: "note")
        saveData.setValue(convertTypeToString(model: model), forKey: "type")
        /*
         saveData.setValue(model.note, forKey: "note")
         
        */
        do {
            try context.save()
            print("Feeding saved successfully.")
        } catch {
            print("Error saving user: \(error.localizedDescription)")
        }
    }
    
    func fetchActivityData(completion: @escaping([ActivityModel]) -> Void) {
        var fetchedArray = [ActivityModel]()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Activity")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            
            let results = try context.fetch(fetchRequest)
            for result in results as![NSManagedObject] {
                guard let time = result.value(forKey: "time") as? String else { return}
                guard let note = result.value(forKey: "note") as? String else { return}
                guard let type = result.value(forKey: "type") as? String else { return}
  
                var resultType = ActivityModel().type
                switch type {
                case "Sleep":
                    resultType = .Sleep
                case "Feed":
                    resultType = .Feed
                case "Diaper":
                    resultType = .Diaper
                default:
                    break
                    
                }
                var newActivity = ActivityModel(type: resultType, time: time)
                if newActivity.type == .Sleep{
                    newActivity.note = note
                }
                fetchedArray.append(newActivity)
            }
            print("Feeding saved successfully.")
        } catch {
            print("Error saving user: \(error.localizedDescription)")
        }
        
        completion(fetchedArray)
    }
    
   private func convertTypeToString(model: ActivityModel) -> String {
        switch model.type {
        case .Sleep:
            return "Sleep"
        case .Feed:
            return "Feed"
        case .Diaper:
            return "Diaper"
        default:
            break
        }
        return ""
    }
}
