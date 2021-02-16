//
//  UsernameTextField.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import SwiftUI

struct UsernameTextField: View {
    @Binding var username: String
    var body: some View {
        HStack {
            Image(systemName: "person.fill").foregroundColor(Color(red: 0, green: 0, blue: 0, opacity: 0.3))
            TextField(TEXT_USERNAME, text: $username)
        }.modifier(TextFieldModifier())
    }
}

struct UsernameTextField_Previews: PreviewProvider {
    static var previews: some View {
        UsernameTextField(username: .constant("Test"))
    }
}
