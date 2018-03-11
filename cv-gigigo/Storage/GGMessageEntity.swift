//
//  GGMessageEntity.swift
//  cv-gigigo
//
//  Created by Eduardo Miñon on 11/03/18.
//  Copyright © 2018 Eduardo Miñon. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class GGMessageEntity: NSManagedObject {
    
    @NSManaged var content: String?
    @NSManaged var date: Date?
}
