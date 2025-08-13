//
//  FavourateView.swift
//  sample Assessment 2
//
//  Created by Netaxis on 08/08/25.
//

import SwiftUI
import CoreData
import SwiftUI

struct FavoritesView: View {
    @StateObject var viewModel = ImageViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var favorites: [ImageItem] {
        viewModel.images.filter { $0.isFavorite }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(favorites) { image in
                        Image(image.name)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 150)
                            .clipped()
                    }
                }
                .padding()
            }
            .navigationTitle("Favorites")
        }
    }
}
