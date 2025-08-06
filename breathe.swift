//
//  breathe.swift
//  mm
//
//  Created by Almadi on 09/02/1447 AH.
//

import SwiftUI

struct breathe: View {
    var body: some View {
        
        ZStack{
            Rectangle()
                .frame(width:346, height: 197)
                .cornerRadius(20)
                .foregroundStyle(.greens)
            HStack{
                
                
                
                Image(.tiger)
                    .resizable()
                    .frame(width: 118, height:118 )
                    .offset(x:-10)
                
                Text("relax and take a deep breath").font(Font.custom("Nunito", size: 14)).foregroundColor(.black).fontWeight(.light).offset(x:0)
                
               
                
                
               
                
                
           
            }
            
         
        }
    }
}

#Preview {
    breathe()
}
