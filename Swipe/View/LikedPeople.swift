//
//  LikedPeople.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct LikedPeople: View {
    
    @ObservedObject var datas = observer1()
    
    var body: some View {
        
        
        VStack{
            
            
            
            if datas.data.isEmpty{
                
                Text("No Liked People")
            }
            
            else{
                
                List(datas.data){i in
                    
                    cards(name: i.name, image: i.image)
                }
            }
        }

    }
}

struct cards : View {
    
    var name = ""
    var image = ""
    var body : some View{
        
        HStack{
            
            AnimatedImage(url: URL(string: image)!).resizable().frame(width: 100, height: 100)
            
            Text(name).fontWeight(.heavy)
        }
    }
}

class observer1 : ObservableObject{
    
    @Published var data = [datatype1]()
    
    init() {
        
        let db = Firestore.firestore()
        db.collection("liked").getDocuments { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                
                let name = i.get("name") as! String
                let age = i.get("age") as! String
                let image = i.get("image") as! String
                
                self.data.append(datatype1(name: name, age: age, image: image, id: UUID().uuidString))
            }
        }
    }
}

struct datatype1 : Identifiable {
    
    var name : String
    var age : String
    var image : String
    var id  : String
}


