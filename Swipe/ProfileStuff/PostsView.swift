//
//  PostsView.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/26/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase
import FirebaseAuth


struct PostsView: View {
    @State private var selectedTabIndex = 0
     @ObservedObject var Posts = ObserverP()
    @ObservedObject var Likes = ObserverL()
    
    var body: some View {
        
        VStack{
            
            
            SlidingTabView(selection: self.$selectedTabIndex, tabs: ["Posts", "Likes"], inactiveAccentColor: Color.gray)
            (selectedTabIndex == 0 ? List(Posts.Data){i in
            
            Cards(name: i.name, image: i.image, caption: i.caption)
        } : List(Likes.Data){i in
            Cards(name: i.name, image: i.image, caption: i.caption)
    
        }).padding()
        Spacer()
            
            
            
        }
    }
}

struct Cards : View {
    
    var name = ""
    var image = ""
    var caption = ""
    
    var body : some View{
        
        VStack(alignment: .leading){
        
            HStack(){
            Image("person").resizable().frame(width: 35, height: 35)
            Text(name).font(.system(size: 25)).fontWeight(.heavy).foregroundColor(.white)
                
            }.padding(.horizontal, 10)
            
            
            AnimatedImage(url: URL(string: image)!).resizable().cornerRadius(20).padding(.horizontal, 15).frame(height: 300)
            

            HStack(alignment: .center){                              Text(caption).font(.body).foregroundColor(.white)
            }
            .padding(.horizontal, 15)
        }
    }
}

class ObserverP : ObservableObject{
    
    @Published var Data = [Datatype1]()
    
    init() {
        
        let db = Firestore.firestore()
        db.collection("posts").getDocuments { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                if Auth.auth().currentUser?.uid == i.get("uid") as? String {
                    let name = i.get("username") as! String
                    let caption = i.get("caption") as! String
                    let image = i.get("postImageUrl") as! String
                
                    self.Data.append(Datatype1(name: name, caption: caption, image: image, id: UUID().uuidString))
                }else{print("no posts")}
            }
        }
    }
}

class ObserverL : ObservableObject{
    
    @Published var Data = [Datatype1]()
    
    init() {
        
        let db = Firestore.firestore()
        db.collection("liked").getDocuments { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                
                let name = i.get("name") as! String
                let caption = i.get("age") as! String
                let image = i.get("image") as! String
                
                self.Data.append(Datatype1(name: name, caption: caption, image: image, id: UUID().uuidString))
            }
        }
    }
}

struct Datatype1 : Identifiable {
    
    var name : String
    var caption : String
    var image : String
    var id  : String
}
