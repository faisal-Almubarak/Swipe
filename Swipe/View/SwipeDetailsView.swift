//
//  SwipeDetailsView.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI


struct SwipeDetailsView : View {
    
    var name = ""
    var age = ""
    var image = ""
    var height : CGFloat = 0
    
    var body : some View{
        VStack(alignment: .leading){
        
            HStack(){
            Image("person").resizable().frame(width: 35, height: 35)
            Text(name).font(.system(size: 25)).fontWeight(.heavy).foregroundColor(.white)
                
            }.padding(.horizontal, 10)
            
            ZStack{
            
                AnimatedImage(url: URL(string: image)!).resizable().cornerRadius(20).padding(.horizontal, 15)
            
            }

            HStack(alignment: .center){                              Text(age).font(.body).foregroundColor(.white)
                
            }
            .padding(.horizontal, 15)
            
        }.background(AnimatedImage(url: URL(string: image)!).blur(radius: 50, opaque: true).frame(height: height+115).cornerRadius(30)).frame(height: height)
        
    }
}
