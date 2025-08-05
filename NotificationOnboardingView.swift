import SwiftUI

struct NotificationOnboardingView: View {
    var onComplete: (() -> Void)? = nil // Optional completion action
    
    var body: some View {
        VStack(spacing: 24) {
            // العنوان الرئيسي
            Text("Mulhem")
                .font(Font.custom("Ahsing", size: 20))
                .kerning(-0.67)
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.30, green: 0.16, blue: 0))
                .shadow(color: Color.black.opacity(0.25), radius: 4, x: 0, y: 4)

            // العنوان الفرعي
            Text("Before you start . . .")
                .font(Font.custom("Nunito-Bold", size: 24))
                .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                .frame(maxWidth: .infinity, alignment: .leading)

            // وصف التفعيل
            Text("Turn on notifications to get helpful tips, quick ideas, and smart reminders—only when it matters to you.")
                .font(Font.custom("Nunito-Medium", size: 16))
                .foregroundColor(Color(red: 0.45, green: 0.47, blue: 0.48))
                .frame(maxWidth: .infinity, alignment: .leading)

            // صورة توضيحية
            Image("")
                .resizable()
                .scaledToFit()
                .frame(height: 200)

            // إشعار شكلي
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.31, green: 0.24, blue: 0.19))
                    .frame(width: 298, height: 52.69)

                HStack(spacing: 12) {
                    Rectangle()
                        .fill(Color(red: 0.50, green: 0.23, blue: 0.27).opacity(0.50))
                        .frame(width: 34.61, height: 32.90)
                        .cornerRadius(8)

                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Image("Logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .cornerRadius(4)
                            
                            Text("Mulhem")
                                .font(.custom("SF Pro", size: 12.35).weight(.medium))
                                .foregroundColor(.white)

                            Text("9:41 AM")
                                .font(.custom("SF Pro", size: 12.35))
                                .foregroundColor(Color.gray)
                        }

                        Text("One kind step today? tap here ✨")
                            .font(.custom("SF Pro", size: 11.52).weight(.medium))
                            .foregroundColor(.white)
                    }

                    Spacer()
                }
                .padding(.horizontal, 12)
            }

            // أزرار التفعيل أو التأجيل
            HStack(spacing: 12) {
                // زر "Enable Notifications"
                Button(action: {
                    // تفعيل الإشعارات
                }) {
                    Text("ENABLE NOTIFICATIONS")
                        .font(Font.custom("Nunito", size: 9.22).weight(.bold))
                        .foregroundColor(Color(red: 0.51, green: 0.41, blue: 0.35))
                        .frame(width: 128, height: 29)
                        .background(Color(red: 0.965, green: 0.898, blue: 0.788))
                        .cornerRadius(18.45)
                }

                // زر "Not Now"
                Button(action: {
                    // تجاهل التفعيل الآن
                }) {
                    Text("NOT NOW")
                        .font(Font.custom("Nunito", size: 9.22).weight(.bold))
                        .foregroundColor(Color(red: 0.51, green: 0.41, blue: 0.35))
                        .frame(width: 128, height: 29)
                        .background(Color(red: 0.965, green: 0.898, blue: 0.788))
                        .cornerRadius(18.45)
                }
            }

            
            Spacer()

            // زر البدء
            Button(action: {
                onComplete?() // Call completion action when Get Started is pressed
            }) {
                HStack(spacing: 16) {
                    Text("Get Started")
                        .font(Font.custom("Nunito", size: 18).weight(.heavy))
                        .foregroundColor(.white)

                    Image(systemName: "arrow.right")
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 16)
                .background(Color(red: 0.30, green: 0.16, blue: 0))
                .cornerRadius(1000)
            }
        }
        .padding()
    }
}

#Preview {
    NotificationOnboardingView()
}
