//
//  Contacts+CoreDataProperties.swift
//  CoreDataXcode7
//
//  Created by Yung Dai on 2015-09-03.
//  Copyright © 2015 Yung Dai. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contacts {

    @NSManaged var address: String?
    @NSManaged var phone: String?
    @NSManaged var name: String?

}
