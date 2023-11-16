//
//  ProfileView.swift
//  ToDoList
//
//  Created by Monica Behrend on 6/8/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    //init(){}
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                        profile(user: user)
                }
                else {
                    Text("Loading profile...")
                }
            }
            
            .padding()
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125, height: 125)
            .padding()
        
        // info
        VStack(alignment: .leading) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
//                    .padding()
        
        // sign out
        Button("Log Out") {
            viewModel.logout()
        }
        .tint(.red)
        .padding()
        Spacer()

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
