//
//  AddPost.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import SwiftUI
import Foundation
import FirebaseAuth
import Firebase
import FirebaseStorage

class AddPost {
    
    static func addPosts(image: UIImage ,imageData: Data , Caption: String){
            let userId = Auth.auth().currentUser!.uid
            let username: String = (Auth.auth().currentUser?.displayName)!
            let storageRoot = Storage.storage().reference()
            let storagePosts = storageRoot.child("Posts")
            let storagePostsRef = storagePosts.child(userId)
            let metaData = StorageMetadata()
            metaData.contentType = "image/png"
        
        AddPostDB.PostDB(userId: userId, username: username, caption: Caption, imageData: imageData, metaData: metaData, storagePostsRef: storagePostsRef)
        }
}
