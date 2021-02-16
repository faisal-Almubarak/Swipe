//
//  SignupTextView.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import SwiftUI

struct SignupTextView: View {
    var body: some View {
        HStack {
            Text(TEXT_NEED_AN_ACCOUNT).font(.footnote).foregroundColor(.gray)
            Text(TEXT_SIGN_UP).foregroundColor(.black)
        }
    }
}

struct SignupTextView_Previews: PreviewProvider {
    static var previews: some View {
        SignupTextView()
    }
}
