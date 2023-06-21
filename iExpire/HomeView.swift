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
//    let article: Article
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    
                    HStack {
                        VStack{
                            Text("Welcome,")
                                .font(.system(size: 50))
                                .fontWeight(.bold)
                                .bold()
                                .frame(width: 300, alignment: .leading)
                            Text("User Z!")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .bold()
                                .frame(width: 300, alignment: .leading)
                                .foregroundColor(Color.accentColor)
                        }
                        NavigationLink {
                            ProfileView()
                        } label: {
                            Image(systemName: "person.crop.circle")
                                .font(.system(size: 30))
                        }

                    }
                    
                    NavigationLink {
                        TrackedItemsView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).fill(Color("Color"))
                                .frame(width: 350, height:130)
                            
                            HStack{
                                Image(systemName: "plus.circle.fill")
                                    .font(.system(size: 20))
                                Text("Track your food items")
                                    .font(.system(size: 20))
                                    .bold()
                            }
                            .foregroundColor(.black)
                            .frame(width: 310, height: 100, alignment: .leading)
                            .cornerRadius(10)
                            .offset(y: -35)
                            HStack{
                                RoundedRectangle(cornerRadius: 10).fill()
                                    .frame(width: 130, height:60)
                                    .offset(x: -25, y: 15)
                                RoundedRectangle(cornerRadius: 10).fill()
                                    .frame(width: 110, height:60)
                                    .offset(x: -10, y: 15)
                                
                            }
                            HStack{
                                Text("Expired: \n4")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundColor(.white)
                                    .offset(x: -50)
                                Text("Total: \n20")
                                    .font(.system(size: 20))
                                    .bold()
                                    .foregroundColor(.white)
                                    .offset(x: 15)
                            }
                            .offset(y: 15)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .bold()
                                .font(.system(size: 20))
                                .offset(x: 150, y: 40)
                        }
                    }
                    .navigationBarBackButtonHidden(true)
                    
                    NavigationLink {
                        ArticleView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).fill(Color("Color"))
                                .frame(width: 350, height:110)
                    
                            HStack{
                                Image(systemName: "book.fill")
                                    .font(.system(size: 20))
                                    .offset(y: -11)
                                Text(" Find out more about \n food wastage")
                                    .font(.system(size: 20))
                                    .bold()
                                    .multilineTextAlignment(.leading)
                            }
                            .foregroundColor(.black)
                            .frame(width: 310, alignment: .leading)
                            .offset(y: -12)
                            Spacer()
                            HStack {
//                                NavigationLink {
//                                    ArticleDetailView(article: article)
//                                } label: {
                                    Text("Read: How to start composting at home")
                                        .font(.caption)
                                        .offset(y: 0)
                                        .underline()
//                                }
                                Image(systemName: "chevron.right")
                                    .bold()
                                    .font(.system(size: 20))
                            }
                            .offset(x: 35, y: 30)
                            .foregroundColor(.black)
                        }
                    }
                        .navigationBarBackButtonHidden(true)
                    
                    NavigationLink {
                        LocationsView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).fill(Color("Color"))
                                .frame(width: 350, height:300)
                            VStack {
                                HStack{
                                    Image(systemName: "map.fill")
                                        .font(.system(size: 20))
                                        .offset(y:-12)
                                    Text(" Check for nearby donation \n points")
                                        .font(.system(size: 20))
                                        .bold()
                                        .multilineTextAlignment(.leading)
                                }
                                .foregroundColor(.black)
                                .frame(width: 310, alignment: .leading)
                                .offset(y: 10)
                                Image("IMG_1990")
                                    .resizable()
                                    .cornerRadius(10)
                                    .frame(width: 290, height: 200, alignment: .center)
                                    .scaledToFit()
                                    .padding(10)
                                    .offset(x: -10, y: -0)
                            }
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                                .bold()
                                .font(.system(size: 20))
                                .offset(x: 150, y: 125)
                        }
                    }
                    
                    NavigationLink {
                        FoodSearchView()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 10).fill(Color("Color"))
                                .frame(width: 350, height:80)
                            HStack {
                                Image(systemName: "magnifyingglass.circle.fill")
                                    .offset(y: -7)
                                Text(" Food Item Search")
                                    .font(.system(size: 20))
                                    .bold()
                                    .multilineTextAlignment(.leading)
                                    .offset(y: -7)
                            }
                            .foregroundColor(.black)
                            .frame(width: 310, alignment: .leading)
                            .offset(y: -3)

                            Spacer()
                            HStack {
                                Text("Search for donatable food items")
                                    .font(.caption)
                                    .offset(y: 0)
                                    .underline()

                                Image(systemName: "chevron.right")
                                    .bold()
                                    .font(.system(size: 20))
                            }
                            .foregroundColor(.black)
                            .offset(x: 55, y: 20)

                        }

                    }
                    
//                    Button(action: {
//                        try! Auth.auth().signOut()
//                        UserDefaults.standard.set(false, forKey: "status")
//                        NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
//
//                    }) {
//                        Text("Log Out")
//                            .foregroundColor(.white)
//                            .padding(.vertical)
//                            .frame(width: UIScreen.main.bounds.width - 50)
//                    }
//                    .background(Color.accentColor)
//                    .cornerRadius(10)
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .transition(.move(edge: .trailing))
        .animation(.easeInOut(duration: 0.5))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(LocationsViewModel())
    }
}
