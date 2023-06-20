//
//  StartView.swift
//  iExpire
//
//  Created by Ma Zhiyu on 20/6/23.
//

import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
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
                NavigationLink{
                    AuthView()
                } label: {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                }
                .navigationBarBackButtonHidden(true)
                .background(Color.accentColor)
                .cornerRadius(10)
                .padding(20)
            }
        }
    }
}


struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
