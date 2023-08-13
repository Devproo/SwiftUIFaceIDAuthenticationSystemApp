//
//  LoginView.swift
//  SwiftUIFaceIDAuthenticationSystemApp
//
//  Created by ipeerless on 12/08/2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager
    var body: some View {
        VStack(spacing: 40) {
            Title()
            switch authenticationManager.biometryType {
            case .faceID:
                PrimaryButton(image: "faceid" ,text: "Login with faceID")
                    .onTapGesture {
                        Task.init {
                            await
                            authenticationManager.authenticationWithBiometrics()
                        }
                        
                    }
            case .touchID:
                PrimaryButton(image: "touchid" ,text: "Login with touchID")
                    .onTapGesture {
                        Task.init {
                            await
                            authenticationManager.authenticationWithBiometrics()
                        }
                        
                    }
            default:
                NavigationLink() {
                    CredentialsLoginView()
                        .environmentObject(authenticationManager)
                } label: {
                    PrimaryButton(image: "person.fill", text: "Login with your credebtial")
                }
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthenticationManager())
    }
}
