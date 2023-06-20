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
                         Label {
                             Text("Home")
                         } icon: {
                             Image(systemName: "house.fill")
                         }
                         .frame(width: nil, height: 60)
                         .background(.regularMaterial)
                         .cornerRadius(10)
                         .padding()
                     }
            TrackedItemsView()
                     .tabItem {
                         Label("Tracker", systemImage: "plus.circle.fill")
                             .frame(width: nil, height: 60)
                             .background(.regularMaterial)
                             .cornerRadius(10)
                             .padding()
                     }
            ArticleView()
                      .tabItem {
                          Label("Articles", systemImage: "book.fill")
                              .frame(width: nil, height: 60)
                              .background(.regularMaterial)
                              .cornerRadius(10)
                              .padding()
                      }
            LocationsView()
                      .tabItem {
                          Label("Locations", systemImage: "map.fill")
                              .frame(width: nil, height: 60)
                              .background(.regularMaterial)
                              .cornerRadius(10)
                              .padding()
                      }
            FoodSearchView()
                      .tabItem {
                          Label("Search", systemImage: "magnifyingglass.circle.fill")
                              .frame(width: nil, height: 60)
                              .background(.regularMaterial)
                              .cornerRadius(10)
                              .padding()
                      }
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
