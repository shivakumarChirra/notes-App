//
//  SearchView.swift
//  sample Assessment 2
//
//  Created by shivakumar chirra on 11/08/25.
//

import SwiftUI
import SwiftUI

struct SearchView: View {
    @StateObject var viewModel = ImageViewModel()
    @State private var searchText = ""
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var filtered: [ImageItem] {
        if searchText.isEmpty { return viewModel.images }
        return viewModel.images.filter { $0.category.lowercased().contains(searchText.lowercased()) }
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search by category...", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(filtered) { image in
                            Image(image.name)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 150)
                                .clipped()
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Search")
        }
    }
}
