//
//  User+CoreDataProperties.swift
//  CoreDataAndSwiftUI
//
//  Created by 神村亮佑 on 2020/07/07.
//  Copyright © 2020 神村亮佑. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var admin: Bool
    @NSManaged public var userId: String
    @NSManaged public var nickname: String
    @NSManaged public var password: String

}

extension User: Identifiable{
    
}
