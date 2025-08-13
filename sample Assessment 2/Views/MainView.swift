//
//  MainView.swift
//  sample Assessment 2
//
//  Created by Netaxis on 08/08/25.
//

import SwiftUI
import CoreData

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Label("Home", systemImage: "house") }
            SearchView()
                .tabItem { Label("Search", systemImage: "magnifyingglass") }
            FavoritesView()
                .tabItem { Label("Favorites", systemImage: "star.fill") }
        }
    }
}
