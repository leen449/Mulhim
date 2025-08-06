//
//  profilepic.swift
//  mm
//
//  Created by Almadi on 09/02/1447 AH.
//

import SwiftUI

struct profilepic: View {
    
   
       let count: Int
       let isSelected: Bool
       let onTap: () -> Void
    let images2: [Image] = [Image(.blue3), Image(.yellow1),Image(.white3),Image(.green3)]
    var body: some View {
        
    
        images2[count]
                    .resizable()
                    .frame(width: 80.49, height: 86.06)
                    .clipShape(Circle())
                    .onTapGesture {
                        onTap()
                    }
                    .overlay {
                        Circle()
                            .stroke(isSelected ? .black : .clear, lineWidth: 4)
                            .shadow(radius: isSelected ? 30 : 0)
                    }
                    .scaleEffect(isSelected ? 1.05 : 1.0)
                    .animation(.easeInOut(duration: 0.2), value: isSelected)
            }
     
    }


#Preview {
    HStack{
        HStack {
                profilepic(count: 0, isSelected: true, onTap: {})
                profilepic(count: 1, isSelected: false, onTap: {})
            }
    }
}


/*


//
//  profilepic.swift
//  mm
//
//  Created by Almadi on 09/02/1447 AH.
//

import SwiftUI

struct profilepic: View {
    
   
       let count: Int
       let isSelected: Bool
       let onTap: () -> Void
    let images2: [Image] = [Image("yellow1"), Image("green3"), Image("blue3"), Image("white3")]
    var body: some View {
        
        let safeIndex = min(max(count, 0), images2.count - 1)
        images2[safeIndex]
                    .resizable()
                    .frame(width: 80.49, height: 86.06)
                    .clipShape(Circle())
                    .onTapGesture {
                        onTap()
                    }
                    .overlay {
                        Circle()
                            .stroke(isSelected ? .black : .clear, lineWidth: 4)
                            .shadow(radius: isSelected ? 30 : 0)
                    }
                    .scaleEffect(isSelected ? 1.05 : 1.0)
                    .animation(.easeInOut(duration: 0.2), value: isSelected)
            }
     
    }


#Preview {
    HStack{
        HStack {
                profilepic(count: 0, isSelected: true, onTap: {})
                profilepic(count: 1, isSelected: false, onTap: {})
            }
    }
}
*/ 

