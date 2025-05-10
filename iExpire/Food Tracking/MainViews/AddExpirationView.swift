//
//  AddExpirationView.swift
//  iExpire
//
//  Created by Zhiyu Ma on 6/16/23.
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
                            Text("Name:")
                            Spacer()
                            Spacer()
                            Spacer()
                            TextField("Add Item name", text: $name)
                                .autocorrectionDisabled()
                                .frame(width: 120)
                        }
                        DatePicker("Expiration Date:", selection: $expDate, displayedComponents: [.date])
                    } header: {
                        Text("Required")
                    }
                    Section("Category") {
                        if showCustomCategory {
                            HStack {
                                Text("Category:")
                                Spacer()
                                Spacer()
                                Spacer()
                                TextField("Add Category", text: $category)
                                    .frame(width: 110)
                            }
                        } else {
                            Picker("Category:", selection: $category) {
                                ForEach(categories, id: \.self) {
                                    Text($0).tag($0)
                                }
                            }
                        }
                        HStack {
                            Spacer()
                            Button(showCustomCategory ? "Choose existing category" : "Make Custom Category") {
                                showCustomCategory.toggle()
                                if !showCustomCategory { category = categories.first! }
                            }
                            .disabled(categories.count <= 0)
                            Spacer()
                        }
                    }
                    
                    Section("More Details"){
                        HStack {
                            TextField("Add Notes", text: $notes)
                        }
                        PhotoSelectorView(selectedItem: $image, imageData: $imageData)
                    }
                    HStack {
                        Spacer()
                        Button("Submit") {
                            saveItem()
                        }
                        .disabled(!isValidItem())
                        Spacer()
                    }
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
