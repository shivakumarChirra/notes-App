//
//  ContentView.swift
//  sample Assessment 2
//
//  Created by Netaxis on 08/08/25.
//
//
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = ImageViewModel()
    @State private var showImageSelect = false
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.images) { image in
                        VStack {
                            Image(image.name)
                                .resizable()
                                .scaledToFill()
                                .frame(height: 150)
                                .clipped()
                            Button(action: {
                                viewModel.toggleFavorite(for: image)
                            }) {
                                Image(systemName: image.isFavorite ? "star.fill" : "star")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Home")
            .toolbar {
                Button(action: { showImageSelect.toggle() }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showImageSelect) {
                ImageSelectView(viewModel: viewModel)
            }
        }
    }
}
