//
//  NoteeEditView.swift
//  sample Assessment 2
//
//  Created by Netaxis on 08/08/25.
//

import SwiftUI
import CoreData
import SwiftUI

struct ImageSelectView: View {
    @ObservedObject var viewModel: ImageViewModel
    @Environment(\.dismiss) var dismiss

    let categories = ["Landscape", "Portrait", "Food", "Study", "Other"]
    @State private var selectedCategory = "Landscape"

    let allImages = ["landscape1", "landscape2", "portrait1", "food1", "study1", "other1"] // Add your asset names here

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var filteredImages: [String] {
        allImages.filter { $0.lowercased().contains(selectedCategory.lowercased()) }
    }

    var body: some View {
        VStack {
            Picker("Category", selection: $selectedCategory) {
                ForEach(categories, id: \.self) { category in
                    Text(category)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(filteredImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                            .clipped()
                            .onTapGesture {
                                viewModel.addImage(name: imageName, category: selectedCategory)
                                dismiss()
                            }
                    }
                }
                .padding()
            }
        }
    }
}
