//
//  HomeView.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import Firebase
import SDWebImageSwiftUI
import SwiftUI
import FirebaseAuth


struct HomeView: View {

    @EnvironmentObject var session: SessionStore
    
    @State var showLiked = false
    @State var Postview = false
    var image = ""
    
    var body: some View {
        NavigationView{
            
        ZStack{
            
            Color("LightWhite").edgesIgnoringSafeArea(.all)

              if session.posts.isEmpty{
                
                Loader()
            }
            
            VStack{
                
                TopView()
                
                SwipeView()
                 
                BottomView(show: $showLiked)
                
            }.background(Color.black.edgesIgnoringSafeArea(.all))
            
        }.navigationBarTitle(Text("World"), displayMode: .inline).navigationBarItems(leading: NavigationLink(destination: ProfileView(image: (Auth.auth().currentUser?.photoURL!.absoluteString)!))
        {
            AnimatedImage(url: URL(string: (Auth.auth().currentUser?.photoURL!.absoluteString)!)!).resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50).clipShape(Circle())
        
            } , trailing:
            NavigationLink(destination: LikedPeople())
            {
                Image("chat").resizable().frame(width: 35, height: 35).foregroundColor(.orange)
                
            }
            )
        }

        
    }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
// you can see that seen users are not displaying in the list.....
// in general zstack will overlay one view on another view so first
//index will be shown at last as well as last index will shown will be first.....
//time to clean code....

// User request...
// Show the list of liked people in a separate view...
// its showing list of liked people in a separate view.....

