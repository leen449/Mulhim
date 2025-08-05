//
//  P2View.swift
//  Mulhim2
//
//  Created by leen binmueqal on 11/02/1447 AH.
//


import SwiftUI

struct P2View: View {
    @State private var selectedProfilePicture = 0
    @State private var userName = ""
    @State private var selectedAgeGroup = 0
    
    var nextAction: () -> Void  // دالة استدعاء الانتقال للصفحة التالية

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack(spacing: 0) {
                ScrollView {
                    VStack(spacing: 32) {
                        // العنوان العلوي
                        headerSection
                        
                        // العنوان الرئيسي
                        titleSection
                        
                        // قسم اختيار صورة الملف الشخصي
                        profilePictureSection
                        
                        // قسم إدخال الاسم
                        nameSection
                        
                        // قسم اختيار العمر
                        ageSection
                        
                        // زر التالي
                        nextButton
                    }
                    .padding(.horizontal, 24)
                }
            }
        }
    }
}



// MARK: - أقسام الواجهة
extension P2View {
    
    /// قسم العنوان العلوي
    private var headerSection: some View {
        HStack {
            Spacer()
            Text("Mulhem")
                .font(Font.custom("Ahsing", size: 20))
                .foregroundColor(Color(red: 0.30, green: 0.16, blue: 0))
                .shadow(color: .black.opacity(0.2), radius: 2, x: 1, y: 1)
            Spacer()
        }
        .padding(.top, 20)
    }
    
    /// قسم العنوان الرئيسي
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Start the journey!")
                .font(Font.custom("Nunito-Bold", size: 28))
                .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
            
            Text("Fill up to have a better version of yourself with Mulhem")
                .font(Font.custom("Nunito-Medium", size: 16))
                .foregroundColor(Color(red: 0.45, green: 0.47, blue: 0.48))
                .lineSpacing(4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 20)
    }
    
    /// قسم اختيار صورة الملف الشخصي
    private var profilePictureSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Choose profile picture")
                .font(Font.custom("Nunito-Medium", size: 16))
                .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
            
            HStack(spacing: 16) {
                ForEach(0..<5, id: \.self) { index in
                    Button(action: {
                        selectedProfilePicture = index
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 60, height: 60)
                                .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 2)
                            
                            if selectedProfilePicture == index {
                                Circle()
                                    .stroke(Color(red: 0.30, green: 0.16, blue: 0), lineWidth: 3)
                                    .frame(width: 60, height: 60)
                            }
                            
                            // صور الملف الشخصي
                            Image(profileImages[index])
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        }
                    }
                }
            }
        }
    }
    
    /// قسم إدخال الاسم
    private var nameSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Your name")
                .font(Font.custom("Nunito-Medium", size: 16))
                .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
            
            TextField("Type here...", text: $userName)
                .font(Font.custom("Nunito-Regular", size: 16))
                .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                .padding(.horizontal, 16)
                .padding(.vertical, 14)
                .background(Color.white)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(red: 0.90, green: 0.90, blue: 0.90), lineWidth: 1)
                )
                .textFieldStyle(PlainTextFieldStyle())
        }
    }
    
    /// قسم اختيار العمر
    private var ageSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Your age")
                .font(Font.custom("Nunito-Medium", size: 16))
                .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
            
            VStack(spacing: 8) {
                Button(action: {
                    selectedAgeGroup = 0
                }) {
                    HStack {
                        Text("18 years and older")
                            .font(Font.custom("Nunito-Regular", size: 16))
                            .foregroundColor(selectedAgeGroup == 0 ? .white : Color(red: 0.45, green: 0.47, blue: 0.48))
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
                    .background(selectedAgeGroup == 0 ? Color(red: 0.30, green: 0.16, blue: 0) : Color.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(red: 0.90, green: 0.90, blue: 0.90), lineWidth: 1)
                    )
                }
                
                Button(action: {
                    selectedAgeGroup = 1
                }) {
                    HStack {
                        Text("13-17 years old")
                            .font(Font.custom("Nunito-Regular", size: 16))
                            .foregroundColor(selectedAgeGroup == 1 ? .white : Color(red: 0.45, green: 0.47, blue: 0.48))
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 14)
                    .background(selectedAgeGroup == 1 ? Color(red: 0.30, green: 0.16, blue: 0) : Color.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(red: 0.90, green: 0.90, blue: 0.90), lineWidth: 1)
                    )
                }
            }
        }
    }
    
    /// زر التالي
    private var nextButton: some View {
        Button(action: {
            nextAction()
        }) {
            HStack(spacing: 8) {
                Text("Next")
                    .font(Font.custom("Nunito-Bold", size: 16))
                Image(systemName: "arrow.right")
                    .font(.system(size: 14, weight: .semibold))
            }
            .foregroundColor(.white)
            .padding(.horizontal, 40)
            .padding(.vertical, 16)
            .background(Color(red: 0.30, green: 0.16, blue: 0))
            .cornerRadius(25)
        }
        .padding(.top, 20)
        .padding(.bottom, 40)
    }
}

// MARK: - البيانات المساعدة
extension P2View {
    private var profileImages: [String] {
        ["Pasted Graphic 1", "Pasted Graphic 2", "Pasted Graphic 3", "Pasted Graphic 4", "Pasted Graphic 5"]
    }
}

#Preview {
    P2View(nextAction: {
        print("تم الضغط على زر التالي")
    })
}
