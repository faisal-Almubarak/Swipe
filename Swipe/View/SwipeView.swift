//
//  SwipeView.swift
//  Swipe
//
//  Created by FAISAL ALMUBARAK on 2/19/20.
//  Copyright © 2020 FAISAL ALMUBARAK. All rights reserved.
//

import SwiftUI


struct SwipeView : View {
    
   @EnvironmentObject var session1: SessionStore
    var image = ""
    
    var body : some View{
        
        
        GeometryReader{geo in
            
            ZStack{
                
                ForEach(self.session1.posts){i in
                    
                    
                    SwipeDetailsView(name: i.name, age: i.age, image: i.image, height: geo.size.height - 100).gesture(DragGesture()
                        
                        .onChanged({ (value) in
                            
                            if value.translation.width > 0{
                                
                                self.session1.update(id: i, value: value.translation.width, degree: 8)
                            }
                            else{
                                
                            self.session1.update(id: i, value: value.translation.width, degree: -8)
                            }
                            
                        }).onEnded({ (value) in
                            
                            if i.swipe > 0{
                                
                                if i.swipe > geo.size.width / 2 - 80{
                                    
                                    //liked
                                self.session1.update(id: i, value: 500, degree: 0)
                                self.session1.updateDB(id: i, status: "liked")
                                    
                                }
                                else{
                                    
                                    self.session1.update(id: i, value: 0, degree: 0)
                                }
                            }
                            else{
                             
                                if -i.swipe > geo.size.width / 2 - 80{
                                    
                                    // reject
                                self.session1.update(id: i, value: -500, degree: 0)
                                self.session1.updateDB(id: i, status: "reject")
                                    
                                }
                                else{
                                    
                                    self.session1.update(id: i, value: 0, degree: 0)
                                }
                            }
                            
                        })
                    ).offset(x: i.swipe)
                    .rotationEffect(.init(degrees: i.degree))
                        .animation(.spring())
                    
                }
                
            }
        }
    }
}
