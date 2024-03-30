//
//  SearchHistory+CoreDataProperties.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//
//

import Foundation
import CoreData


extension SearchHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SearchHistory> {
        return NSFetchRequest<SearchHistory>(entityName: "SearchHistory")
    }

    @NSManaged public var query: String?
    @NSManaged public var createdAt: Date?

}

extension SearchHistory : Identifiable {

}
