//
//  AddPostDB.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import Foundation
import Firebase

class AddPostDB {
    
    static func PostDB(userId: String, username: String, caption : String, imageData: Data , metaData: StorageMetadata, storagePostsRef: StorageReference){

            storagePostsRef.putData(imageData, metadata: metaData)
                  
                  storagePostsRef.downloadURL { (url, error) in
                      if error != nil {
                          print(error!.localizedDescription)
                       
                          return
                      }
                      
                      if let metaImageUrl = url?.absoluteString {
                       /* let firestoreRoot0 = Firestore.firestore()
                        let firestoreUsers0 = firestoreRoot0.collection("posts")*/
            
                        let firestoreRoot = Firestore.firestore()
                        let firestoreUsers = firestoreRoot.collection("posts")
                        let Id = firestoreUsers.document().documentID
                        let firestoreUserId = firestoreUsers.document(Id)
                          //   let userInfo = ["username": self.username, "email": self.email, "profileImageUrl": metaImageUrl]
                          
                        let post = Post(postId : Id, uid: userId, postImageUrl: metaImageUrl, username: username, caption: caption)
                          
                          // let dict = user.dict //Old way without encodable extension
                          guard let dict = try? post.toDictionary() else { return }
    //                      guard let decodedUser = try? User(fromDictionary: dict) else { return }
    //                      print(decodedUser.username)
    //                      firestoreUserId.setData(dict)
                        firestoreUserId.setData(dict)
                        }
                    }
                }
       
    
    }
