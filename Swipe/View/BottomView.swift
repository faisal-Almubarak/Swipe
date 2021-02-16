//
//  BottomView.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import SwiftUI

struct BottomView : View {
    
    @EnvironmentObject var session: SessionStore
    
    @Binding var show : Bool
    @State var showw = true
    var body : some View{
        
        HStack{
            
/*            Button(action: {
            
            if self.obs.last != -1{
                    
                    self.obs.updateDB(id: self.obs.users[self.obs.last], status: "")
                }
                
            }) {
                
                Image("reload").resizable().frame(width: 25, height: 25).padding()
                
            }.foregroundColor(.yellow)
            .background(Color.white)
            .shadow(radius: 25)
            .clipShape(Circle()) */
            Spacer()
            Button(action: {
                
                if self.session.last == -1{
                    
                    //intial user...
                    self.session.updateDB(id: self.session.posts[self.session.posts.count - 1], status: "reject")
                }
                else{
                    
                    // if last user index is 4 means current user index will be 4-1 = 3
                self.session.updateDB(id: self.session.posts[self.session.last - 1], status: "reject")
                    
                }
                
            }) {
                
                Image("clear").resizable().frame(width: 30, height: 30).padding()
                
            }.foregroundColor(.pink)
            .background((Color.orange))
            .shadow(radius: 25)
            .clipShape(Circle())
            
            Spacer()
            
            Button(action: {
                
             self.show.toggle()
                
            }) {
                
                Image("add").resizable().frame(width: 45, height: 45).padding()
                
            }.foregroundColor(.black)
            .background(Color.orange)
            .shadow(radius: 10)
            .clipShape(Circle())
            
            Spacer()
            
            Button(action: {
                
                // same here also....
                
                if self.session.last == -1{
                    
                    //intial user...
                    self.session.updateDB(id: self.session.posts[self.session.posts.count - 1], status: "liked")
                }
                else{
                    
                    // if last user index is 4 means current user index will be 4-1 = 3
                self.session.updateDB(id: self.session.posts[self.session.last - 1], status: "liked")
                    
                }
                
            }) {
                
                Image("heart").resizable().frame(width: 35, height: 35).padding()
                
            }.foregroundColor(.blue)
            .background(Color.orange)
            .shadow(radius: 25)
            .clipShape(Circle())
            
            Spacer()
           
        }.sheet(isPresented: self.$show, content: {
            AddPostview(showw: self.$showw)
        })
    }
}
