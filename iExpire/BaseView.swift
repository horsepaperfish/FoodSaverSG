//
//  BaseView.swift
//  iExpire
//
//  Created by Ma Zhiyu on 18/6/23.
//

import SwiftUI

struct BaseView: View {
    var body: some View {
        TabView {
           HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
           TrackedItemsView()
                .tabItem {
                    Label("Tracker", systemImage: "plus.circle.fill")
                }
            ArticleView()
                 .tabItem {
                     Label("Articles", systemImage: "book.fill")
                 }
            LocationsView()
                 .tabItem {
                     Label("Locations", systemImage: "map.fill")
                 }
            FoodSearchView()
                 .tabItem {
                     Label("Search", systemImage: "magnifyingglass.circle.fill")
                 }
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
