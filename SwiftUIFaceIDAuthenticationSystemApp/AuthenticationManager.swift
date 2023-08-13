//
//  AuthenticationManager.swift
//  SwiftUIFaceIDAuthenticationSystemApp
//
//  Created by ipeerless on 12/08/2023.
//

import Foundation
import LocalAuthentication

class AuthenticationManager: ObservableObject {
    private(set) var context = LAContext()
    @Published private(set) var biometryType: LABiometryType = .none
    private(set) var canEvaluatePolicy = false
    @Published private(set) var isAuthenticated = false
    @Published private(set) var errorDescription: String?
    @Published var showAlert = false
    
    init() {
        getBiometryType()
    }
    
    func getBiometryType() {
        context.canEvaluatePolicy(
            
            .deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
    }
    
    func authenticationWithBiometrics() async {
        context = LAContext()
        
        if canEvaluatePolicy {
            let reason = "Log into your account"
            do {
           let success =  try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason)
                if success {
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                        print("isAuthenticated", self.isAuthenticated)
                    }
                }
                
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errorDescription = error.localizedDescription
                    self.showAlert = true
                    self.biometryType = .none
                }
            }
        }
    }
    func authenticateWithCredentials(username: String, password: String) {
        if username.lowercased() == "Adam" && password == "123456" {
            isAuthenticated = true
        } else {
            errorDescription = "wrong credentials"
            showAlert = true
        }
    }
    func logout() {
        isAuthenticated = false
    }
}
