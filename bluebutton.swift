//
//  bluebutton.swift
//  mm
//
//  Created by Almadi on 09/02/1447 AH.
//
import SwiftUI



struct BlueButton: View {
  
    @State var name :String = "Abdulrahman"
    @State var picture1 : Image = Image(.yellow1)
    let  percentage : Float = 0
    func changeName(names : String){
        name = names
    }
    var body: some View {

     
        NavigationStack{
            
            
            VStack{
                
                NavigationLink(destination:Profile().navigationBarBackButtonHidden()){
                    
                    
                        picture1
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    
                }
                .offset(x: -120)
                Text("Mulhem").font(Font.custom("ahsing", size:20))
                    .foregroundStyle(Color.brownie)
                    .offset( y:-115)
                
                
               
                
                
            }
//            .navigationTitle("")
//            .navigationBarTitleDisplayMode(.inline)
            
            ScrollView(.vertical, showsIndicators: true){
                
                
                Text("Good Morning,").fontWeight(.bold)
                    .font(Font.custom("", size:26))
                    .padding(.trailing,180)
                
                Text("\(name)").fontWeight(.semibold)
                    .font(.title)
                    .font(Font.custom("", size:26))
                    .padding(.trailing,180)
                    .padding(.bottom,20)
                
                
                Text("How are you feeling today ?")
                    .font(Font.custom("Epilogue", size:16)).fontWeight(.medium)
                    .padding(.trailing,150)
                    .padding(.bottom,20)
                
                
                ScrollView(.horizontal, showsIndicators: true){
                    
                    ZStack{
                        HStack(spacing:20){
                            
                            Faces(count:0)
                            Faces(count:1)
                            Faces(count:2)
                            Faces(count:3)
                            Faces(count:4)
                            
                            
                            
                            
                            
                            
                            
                            
                            
                            
                        }
                    }}.padding(.bottom,20)
                    .padding(.leading,20)
                
                
                Text("Message of the Day")
                
                    .font(Font.custom("Nunito", size: 24)).fontWeight(.bold)
                    .padding(.trailing,150)
               
                
                
                ZStack{
                    
                    Rectangle()
                        .frame(width:327.65,height:139.93)
                        .cornerRadius(20)
                        .rotationEffect(.degrees(4.98))
                        .foregroundStyle(.message)
                    Rectangle()
                        .cornerRadius(20)
                        .foregroundStyle(.paige1)
                        .frame(width:328.42,height:139.41)
                        .padding(.top,20)
                        .padding(.leading,0)
                    VStack{
                        Text("Don't spend time beating on a wall,\n hoping it will turn\n into a door.").font(Font.custom("Nunito", size: 15)).foregroundColor(.brownie1).fontWeight(.medium)
                        Text("—Coco Chanel")
                            .font(Font.custom("Nunito", size: 14)).fontWeight(.semibold)
                            .foregroundColor(.black)
                            
                            .offset(x: -80, y: 20)
                    }
                    
                }
                
                .padding(20)
                //                Studies and researchers
                Text("Studies and researches").font(Font.custom("Nunito", size: 24)).foregroundColor(.black).fontWeight(.bold)
                    .padding(.trailing,110)
                ScrollView(.horizontal, showsIndicators: true){
                    
                    
                    HStack(spacing:30){
                        photos(count:0,x:163.99,y:129.26,text1:"ADHD is linked to creativity",text2: "People with ADHD often\n generate more ideas and think\n outside the box.")
                        photos(count:1,x:163.99, y:129.26,text1: "Hyperfocus Mode:",text2: "They can zone in deeply on things\n they love—like a mental superpower.")
                        
                    }
                }.padding(.leading,20)
                
                
                Text("Take a breath").font(Font.custom("Nunito", size: 24)).foregroundColor(.black).fontWeight(.bold)
                    .offset(x: -100, y: 20)
                    
                //breathee
                                breathe()
                
                    trynow()
                    .padding(30)
                
                // dashboard
                
                Text("Statistics").font(Font.custom("Nunito", size: 24)).foregroundColor(.black).fontWeight(.bold)
                    .offset(x: -120, y: -40)
                ZStack{
                    
                    Image(.dash1)
                    
                    VStack{
                        Text(" \(percentage)%")
                            .offset(x:-110)
                            .foregroundStyle(.grey1)
                            .frame(width: 300, height: 100)
                        
                        Text("mood percentage for the week").font(Font.custom("Nunito", size: 11.75))
                            .foregroundStyle(.grey1)
                            .offset(x:-80,y:-80)
                            .frame(width: 300, height: 100)
                    }
                }
                .padding(.bottom,30)
                .offset(y:-30)
                
                
                
                
            }
            
        }
        
        
    }
      
    }


#Preview {
    

    
        BlueButton()
       

    
}
