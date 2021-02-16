//
//  TopView.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import SDWebImageSwiftUI

struct TopView : View {
    
    var body : some View{

        HStack{
            
            Spacer()
            
         Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
            Image("search").resizable().frame(width: 35, height: 35).foregroundColor(.orange)        }
            
            Spacer()
            
        }.padding()
    }
}

