//
//  RegisterView.swift
//  ToDoList
//
//  Created by Monica Behrend on 6/8/23.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            //Header
            
            HeaderView(title: "Register", subtitle: "Start organizing tasks", angle: -15, background: .orange)
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                TLButton(title: "Create Account", background: .green) {
                    // attempt registration
                    viewModel.register()
                }
            }
            
            //.offset(y: -40)
//            .padding(.bottom, -20)
//            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
