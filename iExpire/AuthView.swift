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
    
    @State var errorUserMessage = ""
    @State var resetMessage = ""
    
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
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                        .padding(.top, 15)
                    
                    // password textfield
                    HStack{
                        VStack{
                            if self.visible {
                                TextField("Password", text: self.$pass)
                                    .autocapitalization(.none)
                            } else {
                                SecureField("Password", text: self.$pass)
                                    .autocapitalization(.none)
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
                            self.reset()
                        }) {
                            Text("Forgot Password?")
                                .fontWeight(.bold)
                                .foregroundColor(Color.accentColor)
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 15)
                    
//                    if self.alert {
//                        ErrorView(alert: self.$alert, error: self.$error)
//                    }
                    
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
            
//            if self.alert {
//                ErrorView(alert: self.$alert, error: self.$error)
//            }
//
        }
        .alert("Error", isPresented: $alert) {
            Button("OK") {}
        } message: {
            Text(errorUserMessage)
        }
        .alert("Reset", isPresented: $alert) {
            Button("OK") {}
        } message: {
            Text(resetMessage)
        }

    }
    
    func verify() {
        if (self.email != "" && self.pass != "") {
            
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res, err) in
                if err != nil {
                    self.error = err!.localizedDescription
                    print(self.error)
                    self.alert.toggle()
                    self.errorUserMessage = "Please fill in all contents correctly."
                    return
                } else {
                    print("success")
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                }
            }
        } else {
            self.error = "Please fill in all contents properly."
            self.alert.toggle()
            self.errorUserMessage = "You did not fill in contents."
        }
    }
    
    func reset(){
        if self.email != "" {
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    self.resetMessage = "Reset"
                    return
                }
                self.error = "RESET"
                self.alert.toggle()
                self.resetMessage = "Reset"
            }
        } else {
            self.error = "Email iD is empty"
            self.alert.toggle()
            self.resetMessage = "Email iD is empty"
        }
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
    @State var errorUserMessageTwo = ""
    
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
                        .autocapitalization(.none)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                        .padding(.top, 15)
                    
                    // password textfield
                    HStack{
                        VStack{
                            if self.visible {
                                TextField("Password", text: self.$pass)
                                    .autocapitalization(.none)
                            } else {
                                SecureField("Password", text: self.$pass)
                                    .autocapitalization(.none)
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
                                TextField("Re-enter", text: self.$repass)
                                    .autocapitalization(.none)
                            } else {
                                SecureField("Re-enter", text: self.$repass)
                                    .autocapitalization(.none)
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
                        self.register()
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
//            if self.alert {
//                ErrorView(alert: self.$alert, error: self.$error)
//            }
            
        }
        .navigationBarBackButtonHidden(true)
        .background(
            Image("waves")
                .resizable()
                .scaledToFill()
                .offset(y:50)
        )
        .offset(y: -150)
        .alert("Error", isPresented: $alert) {
            Button("OK") {}
        } message: {
            Text(errorUserMessageTwo)
        }
    }
    
    func register() {
        if self.email != "" {
            if self.pass == self.repass {
                Auth.auth().createUser(withEmail: self.email, password: self.pass) {
                    (res, err) in
                    
                    if err != nil {
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        return
                    }
                    print("success")
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("Status"), object: nil)
                    
                }
            } else {
                self.error = "Password mismatch"
                self.alert.toggle()
                self.errorUserMessageTwo = "Please ensure Passwords are matched."
            }
        } else {
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
            self.errorUserMessageTwo = "Please fill in all contents correctly."
        }
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
