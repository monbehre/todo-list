//
//  LoginView.swift
//  ToDoList
//
//  Created by Monica Behrend on 6/8/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background: .pink)
                    .offset(y:-50)
                
                //Login Form
                
                
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                        // attempt login
                    }
                    
                }
                .offset(y:-100)
                
                
                // Create Account
                VStack {
                    Text("New around here?")

                    NavigationLink("Create An Account", destination: RegisterView())

                }
                .padding(.bottom, 20)
                Spacer()
                
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
