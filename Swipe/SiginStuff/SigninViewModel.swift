//
//  SigninViewModel.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage


class SignInViewModel: ObservableObject {
    var email = ""
    var password = ""
    var errorString = ""
    @Published var showAlert = false
    
    func signin(email: String, password: String, completed: @escaping (_ user: User) -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        if !email.isEmpty && !password.isEmpty {
            AuthService.signinUser(email: email, password: password, onSuccess: completed, onError: onError)

        } else {
            showAlert = true
            errorString = "Please fill in all fields."
        }
    }
}
