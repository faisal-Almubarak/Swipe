//
//  AddPostView.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import SwiftUI

struct AddPostview: View {
    
   @Binding var showw : Bool
    @State var image = UIImage()
    @State var imageData: Data = Data()
    @State var Caption: String = ""
    
    var body: some View {
        VStack{
            HStack{
                
                Spacer()
                    Button(action: {
                        self.addpost()
                    }) {
                        HStack{
                            Text("Share")
                                .font(.headline)
                                .fontWeight(.bold)
                        }.frame(width: 70.0, height: 40.0).cornerRadius(40).overlay(RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.white, lineWidth: 3))
                    }
                Spacer()
            }.background(Color.black)
        VStack{
            
            HStack{
                
                    ZStack(alignment: .leading) {
                    if Caption.isEmpty { Text("Say somthing....").foregroundColor(.white) }
                    TextField("", text: $Caption).foregroundColor(.white)
                }
                
            }
                
                Spacer()
            HStack{
                
                Image(uiImage: image).resizable().aspectRatio(1, contentMode: .fit)
                
            }.frame(width: 350)
            
            Button(action: {
                self.showw.toggle()
                
            }) {
                Text("Edit")
            }
            Spacer()
            }
            
        }.background(Image(uiImage: image).blur(radius: 50, opaque: true).overlay(Color.black
            .opacity(0.7))
            ).sheet(isPresented: self.$showw, content: {
            AddImage(showImagePicker: self.$showw, pickedImage: self.$image, imageData: self.$imageData)
        })
    }
    func addpost(){
        AddPost.addPosts(image: image, imageData: imageData, Caption: Caption)
    }
}
