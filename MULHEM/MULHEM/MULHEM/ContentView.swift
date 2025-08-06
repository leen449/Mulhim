//
//  ContentView.swift
//  MULHEM
//
//  Created by Maysam on 09/02/1447 AH.
//






import SwiftUI

struct ContentView: View {
    @State private var text = ""

    var body: some View {
        VStack(spacing: 20) {
           
            Spacer()
            .frame(height: 35)
                            
            // شعار Mulhem العلوي
            HStack {
                Spacer()
                Text("Mulhem")
                    .font(Font.custom("Ahsing", size: 20))
                    .kerning(-0.67)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.30, green: 0.16, blue: 0))
                    .frame(minWidth: 73, minHeight: 22, alignment: .top)
                    .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)
                Spacer()
            }
            .padding(.horizontal, 20)

            // العنوان والوصف
            VStack(alignment: .leading, spacing: 4) {
                Text("Take a Step")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("primaryTitle"))

                Text("Not sure where to start? Let us guide you with a simple step.")
                    .font(.subheadline)
                    .foregroundColor(Color("secondaryText"))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)

            // ZStack للكرت: خلفية + صورة + نص
            ZStack {
                Image("Group238302")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(12)

                HStack {
                    Text("Start with one easy move.")
                        .font(.system(size: 15, weight: .medium))
                        .foregroundColor(Color("cardText"))
                        .padding(.leading, 20)
                        .padding(.top, 12)

                    Spacer()

                    Image("Group")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .padding(.trailing, 20)
                        .padding(.top, 12)
                }
            }
            .padding(.horizontal, 20)

            // حقل إدخال - matching Figma specs
                           TextField("Type here...", text: .constant(""))
                               .font(.custom("Raleway-Medium", size: 15))
                               .kerning(-0.48)
                               .frame(maxWidth: .infinity, minHeight: 48)
                               .padding(.horizontal, 12)
                               .background(Color.white)
                               .cornerRadius(8)
                               .overlay(
                                   RoundedRectangle(cornerRadius: 8)
                                       .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                               )
                               .foregroundColor(.black)
                               .accentColor(.black)
                               .padding(.horizontal, 15)
            // Group238334 image - aligned to the left (smaller size to match Figma)
            HStack {
                Image("Group238334")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 88, height: 29)
                Spacer()
            }
            .padding(.horizontal, 20)

            // TextEditor with proper background (Figma height: 242)
            VStack(spacing: 8) {
                TextEditor(text: $text)
                    .scrollContentBackground(.hidden)
                    .padding(12)
                    .background(Color(red: 0.933, green: 0.913, blue: 0.898)) // #EEE9E5
                    .cornerRadius(10)
                    .frame(height: 208)
            }
            .padding(.horizontal, 20)

            // الأزرار السفلية (specific sizes from Figma)
            HStack(spacing: 12) {
                Button(action: {}) {
                    Text("Done")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 119, height: 40)
                        .background(Color("buttonPrimary"))
                        .foregroundColor(Color("cardText"))
                        .cornerRadius(10)
                }

                Button(action: {}) {
                    Text("One more time")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(width: 129, height: 40)
                        .background(Color("buttonPrimary"))
                        .foregroundColor(Color("cardText"))
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal, 20)

            
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .padding(.bottom, 20)
        }
        .padding(.vertical, 20)
    }
}

#Preview {
    ContentView()
}
