//
//  finePage.swift
//  Mulhim2
//
//  Created by leen binmueqal on 10/02/1447 AH.
//


//
//  finePage.swift
//  MulhimApplication
//
//  Created by leen binmueqal on 10/02/1447 AH.
//

import SwiftUI

struct finePage: View {
    @State private var userInput: String = ""
    @State private var AIResponse: String = ""
    @State private var AIResponse2: String = ""
    @State private var button: Bool = false
    @State private var isThinking: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Color.clear.frame(height: 3)
                
                Text("Mulhem")
                    .font(Font.custom("Ahsing", size: 25))
                    .padding(.bottom, 25.0)
                    .kerning(-0.67)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.30, green: 0.16, blue: 0))
                    .frame(minWidth: 73.00, minHeight: 22.00, alignment: .top)
                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                
                Text("Kind Mirror")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom, 4)
                
                Text("Write what happened. Fine shows you a positive way to look at it—then gently suggests a kinder next step")
                    .foregroundColor(Color.gray)
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    .frame(width: 400.0, height: 50.0)
                
                Image("inspiraional")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal)
                
                // Styled TextField with centered text and rounded corners
                HStack {
                    TextField("type here", text: $userInput, axis: .vertical)
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(20)
                        .onSubmit {
                            if !userInput.isEmpty {
                                isThinking = true
                                sendToGemini(prompt: "you're an ADHD expert and you must Reframe the sentence written in a kind, positive way , don't make it too long nor too short and most definitely don't start your response with 'okay'or 'alright' : \(userInput)") { result in
                                    DispatchQueue.main.async {
                                        AIResponse = result ?? "Could not reframe."
                                    }
                                }
                                sendToGemini(prompt: "What gentle advice can you give for a person with ADHD as an ADHD expert yourself to try to resolve the issue this person is facing , don't start your response with 'okay'or 'alright'or make your sentence too long or too short: \(userInput)") { result in
                                    DispatchQueue.main.async {
                                        AIResponse2 = result ?? "No advice found."
                                        button = true
                                        isThinking = false
                                    }
                                }
                            }
                        }
                    
                    Button(action: {
                        if !userInput.isEmpty {
                            isThinking = true
                            sendToGemini(prompt: "you're an ADHD expert and you must Reframe the sentence written in a kind, positive way , don't make it too long nor too short and most definitely don't start your response with 'okay'or 'alright' : \(userInput)") { result in
                                DispatchQueue.main.async {
                                    AIResponse = result ?? "Could not reframe."
                                }
                            }
                            sendToGemini(prompt: "What gentle advice can you give for a person with ADHD as an ADHD expert yourself to try to resolve the issue this person is facing , don't start your response with 'okay'or 'alright'or make your sentence too long or too short: \(userInput)") { result in
                                DispatchQueue.main.async {
                                    AIResponse2 = result ?? "No advice found."
                                    button = true
                                    isThinking = false
                                }
                            }
                        }
                    }) {
                        Image(systemName: "paperplane.circle.fill")
                            .font(.title2)
                            .foregroundColor(.black)
                            .opacity(userInput.isEmpty ? 0.3 : 1.0)
                    }
                    .disabled(userInput.isEmpty)
                }
                .padding()
                
                if isThinking {
                    ProgressView("Thinking...")
                    GIFView(name: "Live chatbot")
                        .frame(width: 200, height: 200)
                }
                
                Spacer()
                
                if !userInput.isEmpty && !AIResponse.isEmpty {
                    HStack(alignment: .top, spacing: 10) {
                        Image("chat")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .clipShape(Circle())
                            .padding(.top, 10)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(hue: 0.546, saturation: 0.281, brightness: 0.998))
                            Text(AIResponse)
                                .multilineTextAlignment(.center)
                                .padding()
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.5), value: AIResponse)
                }
                
                if !userInput.isEmpty && !AIResponse2.isEmpty {
                    HStack(alignment: .top, spacing: 10) {
                        Image("chat")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .clipShape(Circle())
                            .padding(.top, 10)
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(hue: 0.546, saturation: 0.281, brightness: 0.998))
                            Text(AIResponse2)
                                .multilineTextAlignment(.center)
                                .padding()
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.5), value: AIResponse2)
                }
                
                Spacer()
                
                if button {
                    Button("Try another one") {
                        userInput = ""
                        AIResponse = ""
                        AIResponse2 = ""
                        button = false
                        isThinking = false
                    }
                    .frame(width: 161, height: 44)
                    .background(
                        RoundedRectangle(cornerRadius: 17)
                            .fill(Color(hue: 0.546, saturation: 0.281, brightness: 0.998))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .foregroundColor(.black)
                }
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    finePage()
}
