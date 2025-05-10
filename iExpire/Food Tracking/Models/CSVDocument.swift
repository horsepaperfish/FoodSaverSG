//
//  CSVDocument.swift
//  iExpire
//
//  Created by Zhiyu Ma on 6/16/23.
//

import SwiftUI
import UniformTypeIdentifiers
import CoreData
import OrderedCollections

struct CSVDocument: FileDocument {
    static var readableContentTypes = [UTType.commaSeparatedText]
    
    var text = ""
    
    // a simple initializer that creates new, empty documents
    init(initialText: String = "") {
        text = initialText
    }

    // this initializer loads data that has been saved previously
    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        }
    }

    // this will be called when the system wants to write our data to disk
    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
}

extension String {
    func isTrimmedEmpty() -> Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

}


func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    return paths[0]
}

func documentExists(at filename: String) -> Bool {
    return FileManager.default.fileExists(atPath: getDocumentsDirectory().appendingPathComponent(filename).path())
}

func clearEntityRecords(managedObjectContext moc: NSManagedObjectContext, entityName: String, predicate: NSPredicate? = nil) {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
    fetchRequest.predicate = predicate
    
    let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    batchDeleteRequest.resultType = NSBatchDeleteRequestResultType.resultTypeObjectIDs
    
    do {
        let result = try moc.execute(batchDeleteRequest) as? NSBatchDeleteResult
        let objectIDArray = result?.result as? [NSManagedObjectID]
        
        let changes = [NSDeletedObjectsKey : objectIDArray]
        
        NSManagedObjectContext.mergeChanges(fromRemoteContextSave: changes as [AnyHashable : Any], into: [moc])
    } catch {
        // Handle errors
        fatalError("Failed to perform batch delete: \(error)")
    }
}

func groupElementsByProperty<T, V: CustomStringConvertible>(_ items: any Sequence<T>, property: KeyPath<T, V>) -> OrderedDictionary<V, [T]> {
    OrderedDictionary(grouping: items, by: { $0[keyPath: property] })
}

func dateToFormatString(date: Date) -> String {
    return date.formatted(.dateTime.day().month().year())
}

func createDateAtMidnight(month: Int, day: Int, year: Int) -> Date {
    var components = DateComponents()
    components.month = month
    components.day = day
    components.year = year
    components.hour = 0
    components.minute = 0
    components.second = 0
    
    return Calendar.current.date(from: components)!
}

func createDateAtMidnight(date: Date) -> Date {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year, .month, .day], from: date)
    
    return Calendar.current.date(from: components)!
}

extension Date {
    func comesBefore(_ date: Date) -> Bool {
        let result = self.compare(createDateAtMidnight(date: date))
        switch result {
        case(.orderedSame):
            return false
        case(.orderedAscending):
            return true
        case(.orderedDescending):
            return false
        }
    }
}

let monthIntDict = [
    "Jan" : 1,
    "Feb" : 2,
    "Mar" : 3,
    "Apr" : 4,
    "May" : 5,
    "Jun" : 6,
    "Jul" : 7,
    "Aug" : 8,
    "Sep" : 9,
    "Oct" : 10,
    "Nov" : 11,
    "Dec" : 12
]
