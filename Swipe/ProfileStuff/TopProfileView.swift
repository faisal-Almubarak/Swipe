//
//  TopProfileView.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/22/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import SwiftUI
import FirebaseAuth

struct TopProfileView: View {
    var user = Auth.auth().currentUser
    var body: some View {
            ScrollView {
                Text("hi")
            }

    }
}

struct TopProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TopProfileView()
    }
}
