//
//  profile.swift
//  mm
//
//  Created by Almadi on 09/02/1447 AH.
//

import SwiftUI
struct Profile: View {
    
    @State var names: String = ""
    @State var mac : String = BlueButton().name
    @State var images1:Image = Image(.blue3)
    @State private var selectedProfilePic: Int = 0
    var body: some View {
        NavigationStack{
            VStack{
                
                HStack{
                    
                    
                    
                    Text("Hello").font(Font.custom("", size: 25))
                    
                    
                        .fontWeight(.bold)
                    Text(names+"!").font(Font.custom("", size: 25))
                        .fontWeight(.ultraLight)
                    
                    
                }
                .padding(.top, 190)
                    images1
                    .resizable()
                    .frame(width: 160, height:160 )
                    .offset(y: -60)
                    .padding(.top,100)
                
                Text("Change name").font(Font.custom("", size: 20))
                    .padding(.trailing, 220)
                    .padding(.top,0)
                    .padding()
                TextField("enter your name",text: $names)
                
                    .padding(10)
                    .cornerRadius(5)
                    .border(Color.gray, width: 1)
                    .frame(width: 350, height: 50)
                
            
                
                    
                
                
                   
                
                
             
                Text("Change profile picture").font(Font.custom("", size: 20))
                    .padding(.trailing, 150)
                    .padding(.bottom,0)
                    .padding(.top,60)
                
               
                ScrollView(.horizontal, showsIndicators: true){
                    
                    
                    HStack(spacing:30){
                        //                        profilepic(count:0)
                        //                        profilepic(count:1)
                        //                        profilepic(count:2)
                        //                        profilepic(count:3)
                        
                        profilepic(count: 0, isSelected: selectedProfilePic == 0) {
                            
                            print("Profile pic 0 selected")
                            selectedProfilePic = 0
                            images1=Image(.blue3)
                        }
                        profilepic(count: 1, isSelected: selectedProfilePic == 1) {
                            print("Profile pic 1 selected")
                            selectedProfilePic = 1
                           images1 = Image(.yellow1)
                        }
                        profilepic(count: 2, isSelected: selectedProfilePic == 2) {
                            print("Profile pic 2 selected")
                            selectedProfilePic = 2
                            images1 =   Image(.white3)
                        }
                        profilepic(count: 3, isSelected: selectedProfilePic == 3) {
                            print("Profile pic 3 selected")
                            selectedProfilePic = 3
                            images1 =   Image(.green3)
                        }
                        
                        
                    }
                    .padding(.bottom, 200)
                    .padding()
                        
                }.padding(.horizontal, 20)
                    .padding(.vertical, 20)
                
                
                ZStack{
                    NavigationLink(destination:BlueButton(name:names,picture1:images1).navigationBarBackButtonHidden()){
                       
                      
                            
                   
                            Rectangle()
                            
                                .frame(width: 179, height: 56)
                                .foregroundColor(Color.brownie)
                                .cornerRadius(20)
                            Text("Save Changes").fontWeight(.bold).font(Font.custom("nunito", size: 20))
                            
                                .offset(x:-100, y: 30)
                                .offset( y: -30)
                                .foregroundStyle(Color.white)
                            
                           
                                .padding(.horizontal, -59)
                        }
                    .offset( y: -190)
                  
                    }
                    
                    //            {
                    //
                    //              Rectangle()
                    //
                    //
                    //
                    //                    .frame(width: 179, height: 56)
                    //                    .foregroundStyle(Color.brownie)
                    //                    .cornerRadius(20)
                    //                    .offset(x:0, y: 0)
                    //                }
                    //            .offset( y: -40)
                    //
                    //                    .foregroundStyle(Color.white)
                    //
                }
                
            }
            
        }
    }
        
    

#Preview {
    
    Profile()
}
