//
//  UserView.swift
//  sample Assessment 2
//
//  Created by Netaxis on 08/08/25.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [Color("background1"),Color("background2")], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack {
                Image(systemName: "list.bullet.rectangle.portrait")
                   
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(Color.gray,Color("background3"))
                Text("Welcome to the Editor ").font(.title)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.white)
                
            }
            .padding()
        }
    }
}

#Preview {
    UserView()
}
