//
//  SessionStore.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import Foundation
import Combine
import FirebaseAuth
import Firebase
import SwiftUI

class SessionStore: ObservableObject {
    @Published var isLoggedIn = false
    @Published var userSession: User?
    @Published var profileUrl = ""
    
    @Published var posts = [datatype]()
    @Published var last = -1
    
    var handle: AuthStateDidChangeListenerHandle?
    
    func listenAuthenticationState() {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
             //   print(user.email)
                 self.isLoggedIn = true
                let firestoreRoot = Firestore.firestore()
                let firestoreUsers = firestoreRoot.collection("users")
                let firestoreUserId = firestoreUsers.document(user.uid)
                
                firestoreUserId.getDocument { (document, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                        //onError(error!.localizedDescription)
                        return
                    }
                    if let dict = document?.data() {
                        guard let decodedUser = try? User(fromDictionary: dict) else { return }
                        //onSuccess(decodedUser)
                        self.userSession = decodedUser
                    }
                }
               
            } else {
                print("isLoggedIn is false")
                self.isLoggedIn = false
                self.userSession = nil
            }
        })
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
//Stop listening for auth changes
    func unbind() {
       if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    
    
    
    
    
    
    
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("posts").getDocuments { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                
                let name = i.get("username") as! String
                let age = i.get("caption") as! String
                let image = i.get("postImageUrl") as! String
                let id = i.documentID
                let status = i.get("status") as! String
                
                
                if status == ""{
                    
                self.posts.append(datatype(id: id, name: name, image: image, age: age, swipe: 0, degree: 0))
                    
                }

            }
        }
    }
    
    func update(id : datatype,value : CGFloat,degree : Double){
        
        for i in 0..<self.posts.count{
            
            if self.posts[i].id == id.id{
                
                self.posts[i].swipe = value
                self.posts[i].degree = degree
                self.last = i
            }
        }
    }

    
    func updateDB(id : datatype,status : String){
        
        let db = Firestore.firestore()
        
        db.collection("posts").document(id.id).updateData(["status":status]) { (err) in
            
            if err != nil{
                
                print(err!.localizedDescription)
                return
            }
            
            print("success")
            
            for i in 0..<self.posts.count{
                
                if self.posts[i].id == id.id{
                    
                    if status == "liked"{
                        
                        self.posts[i].swipe = 500
                    }
                    else if status == "reject"{
                        
                        self.posts[i].swipe = -500
                    }
                    else{
                        
                        self.posts[i].swipe = 0
                    }
                }
            }
            
            if status == "liked"{
                
                db.collection("liked").document(id.id).setData(["name":id.name,"age":id.age,"image":id.image]) { (err) in
                    
                    if err != nil{
                        
                        print((err?.localizedDescription)!)
                        return
                    }
                }
            }
            
            if status == ""{
                
                db.collection("liked").document(id.id).delete { (err) in
                    
                    if err != nil{
                        
                        print((err?.localizedDescription)!)
                        return
                    }
                }
            }
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    deinit {
        unbind()
    }
}
