//
//  Address.swift
//  AddressBook3
//
//  Created by nixnoughtnothing on 6/18/15.
//  Copyright (c) 2015 Sttir Inc. All rights reserved.
//

import Foundation
import CoreData

@objc(Address) // Objective C側からもクラスを利用できるようにする
class Address: NSManagedObject {

    @NSManaged var city: String
    @NSManaged var other: String
    @NSManaged var state: String
    @NSManaged var zipCode: String
    @NSManaged var people: NSSet

}
