//
//  GGStorageManager.swift
//  cv-gigigo
//
//  Created by Eduardo Miñon on 11/03/18.
//  Copyright © 2018 Eduardo Miñon. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class GGStorageManager {
    static let sharedInstance = GGStorageManager();
    let context: NSManagedObjectContext;
    
    init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    
    static func createMessage(content: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Messages", in: context);
        let newMessage = NSManagedObject(entity: entity!, insertInto: context)
        newMessage.setValue(content, forKey: "content");
        newMessage.setValue(Date(), forKey: "date");
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
    }
    
    func getMessages() -> [NSManagedObject]{
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Messages");
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            return result as! [NSManagedObject];
        } catch {
            print("Failed");
            return [NSManagedObject]();
        }
    }
}
