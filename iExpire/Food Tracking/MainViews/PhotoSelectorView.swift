//
//  util.swift
//  iExpire
//
//  Created by Zhiyu Ma on 6/16/23.
//

import SwiftUI
import PhotosUI

struct PhotoSelectorView: View {
    @State private var selectedImageData: Data? = nil
    
    @Binding var selectedItem: PhotosPickerItem?
    
    // Optionally provide Binding to get Data of image for the calling View
    var imageData: Binding<Data?>? = nil
    
    var body: some View {
        PhotosPicker(selection: $selectedItem, matching: .images) {
            HStack {
                Spacer()
                Text("Select Photo")
                Spacer()
            }
            
        }
        .onChange(of: selectedItem) { newItem in
            Task {
                // Retrieve selected asset in the form of Data
                if let data = try? await newItem?.loadTransferable(type: Data.self) {
                    selectedImageData = data
                    imageData?.wrappedValue = selectedImageData
                }
            }
        }
        
        if selectedImageData != nil {
            LoadedImageView(imageData: selectedImageData)
        }
    }
}

