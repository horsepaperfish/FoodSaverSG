//
//  AddExpirationView.swift
//  iExpire
//
//  Created by Andy Wu on 1/19/23.
//

import SwiftUI
import PhotosUI

struct AddExpirationView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var notes = ""
    @State private var expDate = Date()
    @State private var image: PhotosPickerItem? = nil
    @State private var imageData: Data? = nil
    
    @State private var category = "Other"
    @State private var showCustomCategory = true
    
    var categories: [String]
    
    func isValidItem() -> Bool {
        !(name.isTrimmedEmpty() || category.isTrimmedEmpty())
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        HStack{
                            Text("Name")
                            TextField("Item name", text: $name)
                                .autocorrectionDisabled()
                        }
                        DatePicker("Expiration Date:", selection: $expDate, displayedComponents: [.date])
                    } header: {
                        Text("Required")
                    }
                    Section {
                        if showCustomCategory {
                            HStack {
                                Text("Category:")
                                TextField("Category", text: $category)
                            }
                        } else {
                            Picker("Category:", selection: $category) {
                                ForEach(categories, id: \.self) {
                                    Text($0).tag($0)
                                }
                            }
                        }
                        Button(showCustomCategory ? "Choose existing category" : "Make Custom Category") {
                            showCustomCategory.toggle()
                            if !showCustomCategory { category = categories.first! }
                        }
                        .disabled(categories.count <= 0)
                    }
                    
                    Section {
                        HStack {
                            Text("Notes:")
                            TextEditor(text: $notes)
                        }
                        PhotoSelectorView(selectedItem: $image, imageData: $imageData)
                    } header: {
                        Text("Optional fields")
                    }
                    
                    Button("Submit") {
                        saveItem()
                    }
                    .disabled(!isValidItem())
                }
                .navigationTitle("Add Item")
            }
        }
    }
    
    func saveItem() {
        let newItem = Item(context: moc)
        newItem.name = name
        newItem.expirationDate = dateToFormatString(date: expDate)
        newItem.image = imageData
        newItem.notes = notes
        newItem.expirationDateTime = createDateAtMidnight(date: expDate)
        newItem.category = category
        dismiss()
    }
}


struct AddExpirationView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpirationView(categories: ["Fridge", "Pets"])
    }
}
