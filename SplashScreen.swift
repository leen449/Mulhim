//
//  SplashScreen.swift
//  Mulhim2
//
//  Created by leen binmueqal on 10/02/1447 AH.
//



/*
 Color(#colorLiteral(red: 1, green: 0.905, blue: 0.752, alpha: 1)) // Beige background
                 .edgesIgnoringSafeArea(.all)

 */

import SwiftUI

// MARK: - Navigation Coordinator
enum OnboardingStep {
    case splash
    case p1
    case p2
    case notification
    case mainApp
}

struct OnboardingCoordinator: View {
    @State private var currentStep: OnboardingStep = .splash
    @State private var showHole = false
    @State private var showLogo = false
    @State private var showShadow = false
    @State private var showText = false
    @State private var logoOffset: CGFloat = UIScreen.main.bounds.midY
    
    var body: some View {
        Group {
            switch currentStep {
            case .splash:
                splashView
            case .p1:
                P1View(nextAction: {
                    withAnimation {
                        currentStep = .p2
                    }
                })
            case .p2:
                P2View(nextAction: {
                    withAnimation {
                        currentStep = .notification
                    }
                })
            case .notification:
                NotificationOnboardingView(onComplete: {
                    withAnimation {
                        currentStep = .mainApp
                    }
                })
            case .mainApp:
                mainAppView
            }
        }
    }
    
    private var mainAppView: some View {
        VStack {
            BlueButton()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
    private var splashView: some View {
        ZStack {
            // Background
            Color(#colorLiteral(red: 1, green: 0.905, blue: 0.752, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            // Hole
            Ellipse()
                .fill(Color.black)
                .frame(width: 200, height: 50)
                .offset(y: 100)
                .opacity(showHole ? 0.5 : 0)
                .animation(.easeOut(duration: 0.3), value: showHole)
            
            // Shadow
            Ellipse()
                .frame(width: 150, height: 50)
                .foregroundColor(.gray.opacity(0.5))
                .offset(x: -5, y: 100)
                .opacity(showShadow ? 1 : 0)
                .animation(.easeOut(duration: 0.3), value: showShadow)
            
            // Logo
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .position(x: UIScreen.main.bounds.midX, y: logoOffset)
                .opacity(showLogo ? 1 : 0)
                .animation(.easeOut(duration: 0.3), value: showLogo)
            
            // Text
            Image("MulhimText").resizable()
                .scaledToFit()
                .frame(width: 180.0, height: 200.0)
                .opacity(showText ? 1 : 0)
                .offset(x: -10, y: showText ? 0 : -20) // slight lean to the left
                .animation(.easeIn(duration: 0.5), value: showText)
            
                .onAppear {
                    showHole = true
                    
                    // Step 1: Logo moves upward from center
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        showHole = false
                        showLogo = true
                        showShadow = true
                        withAnimation(.interpolatingSpring(stiffness: 100, damping: 10)) {
                            logoOffset = UIScreen.main.bounds.midY - 100
                        }
                    }
                    
                    // Step 2: Drop to center
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                        withAnimation(.interpolatingSpring(stiffness: 80, damping: 12)) {
                            logoOffset = UIScreen.main.bounds.midY
                        }
                    }
                    
                    // Step 3: Settle lower slightly and reveal text
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            logoOffset = UIScreen.main.bounds.midY + 30
                            showShadow = false
                            showText = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                            withAnimation {
                                currentStep = .p1
                            }
                        }
                    }
                }
        }
    }
}

// MARK: - Legacy SplashScreen (keeping for backward compatibility)
struct SplashScreen: View {
    @State private var showHole = false
    @State private var showLogo = false
    @State private var showShadow = false
    @State private var showText = false
    @State private var logoOffset: CGFloat = UIScreen.main.bounds.midY  // Start at center
    @State private var navigateToOnboarding = false // ✅ new state
    
    
    var body: some View {
        if navigateToOnboarding {
            P1View(nextAction: {
                print("تم الضغط على زر التالي")
            })// 👈 Replace with your actual onboarding screen
        } else {
            ZStack {
                // Background
                Color(#colorLiteral(red: 1, green: 0.905, blue: 0.752, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                
                // Hole
                Ellipse()
                    .fill(Color.black)
                    .frame(width: 200, height: 50)
                    .offset(y: 100)
                    .opacity(showHole ? 0.5 : 0)
                    .animation(.easeOut(duration: 0.3), value: showHole)
                
                // Shadow
                Ellipse()
                    .frame(width: 150, height: 50)
                    .foregroundColor(.gray.opacity(0.5))
                    .offset(x: -5, y: 100)
                    .opacity(showShadow ? 1 : 0)
                    .animation(.easeOut(duration: 0.3), value: showShadow)
                
                // Logo
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .position(x: UIScreen.main.bounds.midX, y: logoOffset)
                    .opacity(showLogo ? 1 : 0)
                    .animation(.easeOut(duration: 0.3), value: showLogo)
                
                // Text
                Image("MulhimText").resizable()
                    .scaledToFit()
                    .frame(width: 180.0, height: 200.0)
                    .opacity(showText ? 1 : 0)
                    .offset(x: -10, y: showText ? 0 : -20) // slight lean to the left
                    .animation(.easeIn(duration: 0.5), value: showText)
                
                    .onAppear {
                        showHole = true
                        
                        // Step 1: Logo moves upward from center
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            showHole = false
                            showLogo = true
                            showShadow = true
                            withAnimation(.interpolatingSpring(stiffness: 100, damping: 10)) {
                                logoOffset = UIScreen.main.bounds.midY - 100
                            }
                        }
                        
                        // Step 2: Drop to center
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                            withAnimation(.interpolatingSpring(stiffness: 80, damping: 12)) {
                                logoOffset = UIScreen.main.bounds.midY
                            }
                        }
                        
                        // Step 3: Settle lower slightly and reveal text
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.2) {
                            withAnimation(.easeInOut(duration: 0.4)) {
                                logoOffset = UIScreen.main.bounds.midY + 30
                                showShadow = false
                                showText = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                                withAnimation {
                                    navigateToOnboarding = true
                                }
                            }
                        }
                    }
            }
        }
    }
}

#Preview {
    OnboardingCoordinator()
}

