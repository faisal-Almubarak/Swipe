//
//  SignupViewModel.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage
import SwiftUI

class SignupViewModel: ObservableObject {
    var username = ""
    var email = ""
    var password = ""
    var image = UIImage()
    var errorString = ""
    
    @Published var showAlert = false
    @Published var showImagePicker = false
    
    func signup(username: String, email: String, password: String, imageData: Data, completed: @escaping (_ user: User) -> Void, onError: @escaping (_ errorMessage: String) -> Void) {
        if !username.isEmpty && !email.isEmpty && !password.isEmpty{
            AuthService.signupUser(username: username, email: email, password: password, imageData: imageData, onSuccess: completed, onError: onError)
        } else {
            showAlert = true
            errorString = "Please fill in all fields."
        }
    }
}
