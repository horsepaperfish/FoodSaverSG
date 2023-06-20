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
            ScrollView {
                VStack {
                    
       //             Spacer(minLength: 50)
                    
                    NavigationLink {
                        TrackedItemsView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 350, height:190)
                            HStack{
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 30))
                                Text("Track your food items")
                                    .font(.system(size: 30))
                                    .bold()
                            }
                            .foregroundColor(.white)
                            .frame(width: 1000, height: 100)
                            .cornerRadius(10)
                            .offset(y: -60)
                            HStack{
                                RoundedRectangle(cornerRadius: 10).fill(Color("Color"))
                                    .frame(width: 130, height:90)
                                    .offset(x: -25, y: 20)
                                RoundedRectangle(cornerRadius: 10).fill(Color("Color"))
                                    .frame(width: 110, height:90)
                                    .offset(x: -10, y: 20)
                                
                            }
                            HStack{
                                Text("Expired: \n4")
                                    .font(.system(size: 25))
                                    .bold()
                                    .foregroundColor(.black)
                                    .offset(x: -45)
                                Text("Total: \n20")
                                    .font(.system(size: 25))
                                    .bold()
                                    .foregroundColor(.black)
                                    .offset(x: 7)
                            }
                            .offset(y: 20)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 30))
                                .offset(x: 145, y: 45)
                        }
                    }
                    
                    NavigationLink {
                        ArticleView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 350, height:100)
                            HStack{
                                Image(systemName: "book.fill")
                                    .font(.system(size: 30))
                                Text("Find out more \nabout food wastage")
                                    .font(.system(size: 30))
                                    .bold()
                            }
                            .foregroundColor(.white)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 30))
                                .offset(x: 145, y: 20)
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
            .navigationBarTitle("Welcome, User Z!")
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LocationsViewModel())
    }
}
