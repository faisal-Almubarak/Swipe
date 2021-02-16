//
//  ProfileView.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import Firebase
import FirebaseAuth
import SwiftUI
import SDWebImageSwiftUI


struct ProfileView: View {
    
    var image: String
    let user = Auth.auth().currentUser?.displayName as! String
    
    
    
    
    var body: some View {
        VStack{
            ZStack{
        VStack {
            Spacer().frame(height: 80)
            AnimatedImage(url: URL(string: self.image)!).resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).clipShape(Circle()).shadow(radius: 15)

                Text(self.user)
                    .font(.title)
                HStack{
                    Spacer()
                    Text("''bio''")
                        .font(.subheadline)
                    Spacer()
                }
        }.padding()
            }.background(AnimatedImage(url: URL(string: image)!).blur(radius: 50, opaque: true).cornerRadius(30))
        VStack{
                            
            PostsView()
                    
                    
        }
        }.background(Color.black).edgesIgnoringSafeArea(.all)
        }
    }

