//
//  Title.swift
//  SwiftUIFaceIDAuthenticationSystemApp
//
//  Created by ipeerless on 12/08/2023.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Authenticator")
            .padding()
            .font(.title)
            .foregroundColor(.white)
            
    }
}

struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title()
            .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
           
    }
}
