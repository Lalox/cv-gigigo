//
//  Messages+CoreDataProperties.swift
//  
//
//  Created by Eduardo Miñon on 11/03/18.
//
//

import Foundation
import CoreData


extension Messages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Messages> {
        return NSFetchRequest<Messages>(entityName: "Messages")
    }

    @NSManaged public var content: String?

}
