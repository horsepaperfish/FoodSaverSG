//
//  AuthView.swift
//  iExpire
//
//  Created by Ma Zhiyu on 19/6/23.
//

import SwiftUI
import Firebase

struct AuthView: View {
    var body: some View {
        Home()
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

struct Home: View {
    
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        NavigationView {
            VStack{
                if self.status{
                    BaseView()
                } else {
                    ZStack {
                        NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show) {
                            Text("")
                        }
                        .hidden()
                        
                        Login(show: self.$show)
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear {
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
    }
}


struct Login: View {
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        
        ZStack {
            ZStack(alignment: .topTrailing) {
                Button(action: {
                    self.show.toggle()
                }) {
                    Text("Register")
                        .fontWeight(.bold)
                        .foregroundColor(Color.accentColor)
                }
                .padding(30)
                .offset(y: -60)
                
                
                // everything
                VStack{
                    Text("Log in to your account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                        .padding(.top, 15)
                    
                    // password textfield
                    HStack{
                        VStack{
                            if self.visible {
                                TextField("Password", text: self.$pass)
                            } else {
                                SecureField("Password", text: self.$pass)
                            }
                        }
                        
                        Button(action: {
                            self.visible.toggle()
                        }) {
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(self.color)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color, lineWidth: 2))
                    .padding(.top, 15)
                    
                    // forgot password
                    HStack{
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("Forgot Password?")
                                .fontWeight(.bold)
                                .foregroundColor(Color.accentColor)
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 15)
                    
                    Button(action: {
                        self.verify()

                    }) {
                        Text("Log in")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color.accentColor)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 25)
                .padding(.top, 70)
                
            }
            .background(
                Image("waves")
                    .resizable()
                    .scaledToFill()
                    .offset(y:50)
            )
            .offset(y: -150)
            
            if self.alert {
                ErrorView(alert: self.$alert, error: self.$error)
            }
            
        }
    }
    
    func verify() {
        if self.email != "" && self.pass != "" {
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res, err) in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                }
            }
        } else {
            self.error = "Please fill in all contents properly."
            self.alert.toggle()
        }
        print("success")
        UserDefaults.standard.set(true, forKey: "status")
        NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
        
    }
    
}

struct SignUp: View {
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show : Bool
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        
        ZStack {
            ZStack(alignment: .topLeading) {
                Button(action: {
                    self.show.toggle()
                }) {
                    Image(systemName: "chevron.left")
                        .fontWeight(.bold)
                        .foregroundColor(Color.accentColor)
                }
                .padding(30)
                .offset(y: -50)
                

                // everything
                VStack{
                    Text("Register your account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                        .padding(.top, 15)
                    
                    // password textfield
                    HStack{
                        VStack{
                            if self.visible {
                                TextField("Password", text: self.$pass)
                            } else {
                                SecureField("Password", text: self.$pass)
                            }
                        }
                        
                        Button(action: {
                            self.visible.toggle()
                        }) {
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(self.color)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.pass != "" ? Color("Color") : self.color, lineWidth: 2))
                    .padding(.top, 15)
                    
                    HStack{
                        VStack{
                            if self.revisible {
                                TextField("Password", text: self.$repass)
                            } else {
                                SecureField("Password", text: self.$repass)
                            }
                        }
                        
                        Button(action: {
                            self.revisible.toggle()
                        }) {
                            Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(self.color)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(self.repass != "" ? Color("Color") : self.color, lineWidth: 2))
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    
                    Button(action: {
//                        self.register()
                    }) {
                        Text("Register")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color.accentColor)
                    .cornerRadius(10)
                }
                .padding(.horizontal, 25)
                .padding(.top, 70)

            }
            if self.alert {
                ErrorView(alert: self.$alert, error: self.$error)
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .background(
            Image("waves")
                .resizable()
                .scaledToFill()
                .offset(y:50)
        )
        .offset(y: -150)
    }
}

struct ErrorView: View {
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error : String
    
    var body: some View {
        GeometryReader {_ in
            VStack{
                HStack{
                    Text("Error")
                        .font(.title)
                        .foregroundColor(self.color)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                Button(action: {
                    self.alert.toggle()
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}
