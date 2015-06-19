//
//  Person.swift
//  AddressBook3
//
//  Created by nixnoughtnothing on 6/18/15.
//  Copyright (c) 2015 Sttir Inc. All rights reserved.
//

import Foundation
import CoreData


@objc(Person) // Objective C側からもクラスを利用できるようにする
class Person: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var address: Address
}
