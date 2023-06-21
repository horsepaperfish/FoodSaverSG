//
//  ProfileView.swift
//  iExpire
//
//  Created by Ma Zhiyu on 21/6/23.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    
    @ObservedObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationStack {
            VStack{
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 80))
                Text("User Z")
                    .foregroundColor(Color.accentColor)
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .bold()
            }
            Form {
                Section("Details") {
                    HStack{
                        Text("Email:")
                            .fontWeight(.bold)
                        Text("\(viewModel.userEmail)")
                    }
                    HStack{
                        Text("Password:")
                            .fontWeight(.bold)
                        Text("\(viewModel.userPassword)")
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

class ProfileViewModel: ObservableObject {
    @Published var userEmail: String = ""
    @Published var userPassword: String = ""
    init() {
        fetchUserData()
    }
    
    func fetchUserData() {
        if let user = Auth.auth().currentUser {
            self.userEmail = user.email ?? ""
            self.userPassword = "********"
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
