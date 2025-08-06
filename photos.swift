//
//  photos.swift
//  mm
//
//  Created by Almadi on 09/02/1447 AH.
//

import SwiftUI

struct photos: View {
    let images : [Image] = [Image(.image5),Image(.picture2)]
        @State var count: Int=0
    @State var x :CGFloat = 0
    @State var y :CGFloat = 0
    @State var text1: String = "gg"
    @State var text2: String = "hh"
    var body: some View {
        VStack{
            ZStack(){
                
                Rectangle()
                    .shadow(radius: 10)
                    .cornerRadius(20)
                    .frame(width: 202, height:197)
                    .foregroundStyle(.bluelight1)
                images[count]
                    .resizable()
                    .padding()
                    
                    .frame(width: x, height:y)
                    
                    .offset( y: -30)
                VStack{
                    Text(text1)
                        .offset(y:55)
                        .font(.caption).fontWeight(.bold)
                        .font(.custom("Nunito", size:12 ))
                        .padding(5)
                    Text(text2)
                        .offset(x: 0, y: 50)
                        .font(.custom("Nunito", size:11 )).fontWeight(.ultraLight)
                        .font(.caption2)
                       
                }
                
            }
           
        }}
}

#Preview {
    photos(count:0,x:187,y:118,text1:"ADHD is linked to creativity",text2: "People with ADHD often\n generate more ideas and think\n outside the box.")
    photos(count:1,x:183.99, y:139.26,text1: "Hyperfocus Mode:",text2: "They can zone in deeply on things\n they love—like a mental superpower.")
}
