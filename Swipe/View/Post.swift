//
//  Post.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import Foundation

struct Post: Encodable, Decodable {
var postId: String
var uid: String
var postImageUrl: String
var username: String
var caption: String
var status: String = ""
}
