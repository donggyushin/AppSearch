//
//  AppRepositoryCoreData.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit
import CoreData

final class AppRepositoryCoreData {
    static let shared = AppRepositoryCoreData()
    private let appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
    private lazy var context = appDelegate?.persistentContainer.viewContext
    
    private init() { }
    
    func get() throws -> [SearchHistory] {
        guard let context else { throw CustomError.unknown }
        return try context.fetch(SearchHistory.fetchRequest())
    }
    
    func post(query: String) throws {
        guard let context else { throw CustomError.unknown }

        var searchHistories = try get()
        searchHistories = searchHistories.filter({ $0.query?.lowercased() == query.lowercased() })
        for searchHistory in searchHistories {
            try delete(object: searchHistory)
        }
        
        let searchHistory = SearchHistory(context: context)
        searchHistory.createdAt = .init()
        searchHistory.query = query
        try context.save()
    }
    
    private func delete(object: NSManagedObject) throws {
        guard let context else { throw CustomError.unknown }
        context.delete(object)
        try context.save()
    }
}
