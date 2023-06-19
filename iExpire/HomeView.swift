//
//  HomeView.swift
//  iExpire
//
//  Created by Ma Zhiyu on 17/6/23.
//

import SwiftUI
import Firebase

struct HomeView: View {
    
//    @State private var dataController = DataController()
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                
   //             Spacer(minLength: 50)
                
                Text("Welcome, User X!")
                    .font(.system(size: 40))
                    .bold()
                    .fontWeight(.bold)
                    .frame(maxWidth: 350, alignment: .leading)
             
                
                NavigationLink {
                    TrackedItemsView()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 350, height:100)
                        Text("Track your food items")
                            .foregroundColor(.white)
                            .frame(width: 1000, height: 100)
                            .cornerRadius(10)
                            .font(.system(size: 30))
                        
                        Spacer()
                    }
                }
                
                NavigationLink {
                    ArticleView()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 350, height:100)
                        Text("Find out more about \n Food Wastage")
                            .foregroundColor(.white)
                            .frame(width: 1000, height: 100)
                            .cornerRadius(10)
                            .font(.system(size: 30))
                        
                        Spacer()
                    }
                }
                
                NavigationLink {
                    LocationsView()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 350, height:100)
                        Text("Check for nearby \n donation points")
                            .foregroundColor(.white)
                            .frame(width: 1000, height: 100)
                            .cornerRadius(10)
                            .font(.system(size: 30))
                        
                        Spacer()
                    }
                }
                
                NavigationLink {
                    FoodSearchView()
                } label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 350, height:100)
                        Text("Search for donatable \n Food items")
                            .foregroundColor(.white)
                            .frame(width: 1000, height: 100)
                            .cornerRadius(10)
                            .font(.system(size: 30))
                        
                        Spacer()
                    }

                }
                
                Button(action: {
                    try! Auth.auth().signOut()
                    UserDefaults.standard.set(false, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)

                }) {
                    Text("Log Out")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                }
                .background(Color.accentColor)
                .cornerRadius(10)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LocationsViewModel())
    }
}
