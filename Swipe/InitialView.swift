//
//  InitialView.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import SwiftUI

struct InitialView: View {
  @EnvironmentObject var session: SessionStore
    
    var body: some View {
        Group {
            if session.isLoggedIn {
                HomeView()
            } else {
                SigninView()
            }
        }.onAppear(perform: listen)
    }
    
   private func listen() {
    session.listenAuthenticationState()
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
