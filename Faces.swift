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



/*//
//  Faces.swift
//  Mulhim2
//
//  Created by leen binmueqal on 12/02/1447 AH.
//


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
    let pictures: [Image] = [Image("image"),Image("imag1"),Image("image2"),Image("image3"), Image("image4")]
    var body: some View {
        
        Button(action:{}){
            ZStack{
                
                VStack{
                    
                    Rectangle().fill(Color.brown)
                   
                        .frame(width: 59.2, height:62.06)
                        .cornerRadius(10)
                    let safeEmotionIndex = min(max(count, 0), emotions.count - 1)
                    Text(emotions[safeEmotionIndex]).font(Font.custom("Epilogue", size: 12))
                        .foregroundStyle(.black)
                }
                     let safePictureIndex = min(max(count, 0), pictures.count - 1)
                     pictures[safePictureIndex]
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
*/ 
