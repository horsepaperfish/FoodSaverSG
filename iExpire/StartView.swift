//
//  StartView.swift
//  iExpire
//
//  Created by Ma Zhiyu on 20/6/23.
//

import SwiftUI

struct StartView: View {
    
    @State private var isActive: Bool = false
    @State var isOnStartView: Bool = true
    
    var body: some View {
        
        if isOnStartView {
            VStack {
                Image("foodsaversg logogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 418, alignment: .center)
                Text("FoodSaverSG")
                    .fontWeight(.bold)
                    .foregroundColor(Color.accentColor)
                    .font(.system(size: 50))
                Text("Reduce. Reuse. Repurpose. Food Waste")
                    .font(.system(size: 15))

                Button {
                    isOnStartView.toggle()
                } label: {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                }
                .background(Color.accentColor)
                .cornerRadius(10)
                .padding(20)

                
//                NavigationLink(destination: AuthView(), isActive: $isActive, label: {
//                    Text("Get Started")
//                        .foregroundColor(.white)
//                        .padding(.vertical)
//                        .frame(width: UIScreen.main.bounds.width - 50)
//                        .font(.system(size: 20))
//                        .fontWeight(.bold)
//                })
//                .background(Color.accentColor)
//                .cornerRadius(10)
//                .padding(20)
                
            }
        } else {
//            NavigationStack{
                AuthView()
//            }
        }
    }
}
        
//        NavigationStack{
//            VStack {
//                Image("foodsaversg logogo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 400, height: 418, alignment: .center)
//                Text("FoodSaverSG")
//                    .fontWeight(.bold)
//                    .foregroundColor(Color.accentColor)
//                    .font(.system(size: 50))
//                Text("Reduce. Reuse. Repurpose. Food Waste")
//                    .font(.system(size: 15))
//
//
//                NavigationLink(destination: AuthView(), isActive: $isActive, label: {
//                    Text("Get Started")
//                        .foregroundColor(.white)
//                        .padding(.vertical)
//                        .frame(width: UIScreen.main.bounds.width - 50)
//                        .font(.system(size: 20))
//                        .fontWeight(.bold)
//                })
//                .background(Color.accentColor)
//                .cornerRadius(10)
//                .padding(20)
//            }
//            .navigationBarTitle("")
//            .navigationBarHidden(true)
//            .navigationBarBackButtonHidden(true)
//        }
//    }
//}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
