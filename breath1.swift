//
//  breath1.swift
//  mm
//
//  Created by Almadi on 09/02/1447 AH.
//

import SwiftUI

struct breath1: View {
    @State private var scaleUp = false
    @State private var timerRemaining = 300
    @State private var isRunning = false
    let timer = Timer.publish(every: 1, on: .main, in:.common).autoconnect()
    var body: some View {
        ZStack{
            LinearGradient(
                colors: [Color.purple.opacity(0.15), Color.pink.opacity(0.1)],
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea(.all)
            VStack {
                Circle()
                    .fill( LinearGradient(
                        colors: [Color.purple.opacity(0.8), Color.pink.opacity(0.6)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
                    .frame(width: 100, height: 100)
                    .scaleEffect(scaleUp ? 2.5 : 1.0)
                    .animation(.easeInOut(duration: 4), value: scaleUp) // 4000ms
                
                Text(scaleUp ? "Inhale" : "Exhale").font(.title)
                    .font(.title2)
                    .padding(.top,120)
                    .padding(.top, 40)
                    .padding(.bottom, 40)
            }
           
            Text( TimeString(from: timerRemaining)).font(.title)
                .onReceive(timer) { time in
                    if timerRemaining>0 && isRunning{
                        timerRemaining -= 1
                    }
                    else{
                        isRunning=false
                    }
                    
                }.padding(.top,400)
            HStack( spacing:60){
                Button("Start"){
                    startBreathing()
                    isRunning.toggle()
                  
                }
                Button("reset"){
                    timerRemaining=300
                    isRunning=false
                    
                }.foregroundStyle(.red)
                
            }.padding(.top,540)
        }}
        
        func startBreathing() {
            
            Timer.scheduledTimer(withTimeInterval: 4.001, repeats: true) { time in
                withAnimation(.easeInOut(duration: 4)) {
                    scaleUp.toggle()
                }
                if(timerRemaining<=0 || !isRunning){
                    time.invalidate()
                    
                }
            }
            
        }
    
    private func TimeString(from seconds:Int ) ->String{
        let minutes = seconds/60
        let seconds = seconds % 60
        
        
        return String(format:"%02d:%02d",minutes,seconds)
        
        
    }
    
    
    
}

#Preview {
    breath1()
}
