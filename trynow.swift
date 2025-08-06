//
//  trynow.swift
//  mm
//
//  Created by Almadi on 10/02/1447 AH.
//

import SwiftUI

struct trynow: View {
    var body: some View {
      
        NavigationStack{
            
            breathe()
            VStack{
                
                NavigationLink(destination:breath1()){
                    
                    ZStack{
                        
                      
                        Text("Try now")
                            .font(Font.custom("Nunito", size: 14)).foregroundColor(.black).fontWeight(.bold).fontWeight(.light)
                            .offset(x:-10,y:0)
                        Image(.arrowRight).resizable()
                            .frame(width: 12, height: 12)
                            .offset(x:30)
                        
                        
                           
                            
                        
                        
                    }
                    
                   
                    
                        
                      
                }
                .frame(width: 100, height: 40)
                .background(Color.white)
                .border(Color.black, width: 1)
                .offset(x:90,y:-80)
            }
        }
    }
}

#Preview {
    trynow()
}
