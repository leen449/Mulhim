//
//  Faces.swift
//  mm
//
//  Created by Almadi on 09/02/1447 AH.
//

import SwiftUI

struct Faces: View {
    
    @State var count : Int = 0
    let emotions: [String]=["Happy","Calm","Manic","Angry","Sad"]
    let pictures: [Image] = [Image(.image),Image(.image1),Image(.image2),Image(.image3),Image(.image4)]
    var body: some View {
        
        Button(action:{}){
            ZStack{
                
                VStack{
                    
                    Rectangle().fill(Color.brownie1)
                   
                        .frame(width: 59.2, height:62.06)
                        .cornerRadius(10)
                    Text(emotions[count]).font(Font.custom("Epilogue", size: 12))
                         .foregroundStyle(.BB)
                }
                     pictures[count]
                    .resizable()
                    .frame(width: 40, height:40)
                    .padding()
                    .offset(x:0, y:-10)
                    
                
                    
                    
            }
              
                
                
            
        }
    }
}

#Preview {
    Faces(count:0)
    Faces(count:1)
    Faces(count:2)
    Faces(count:3)
    Faces(count:4)
}
