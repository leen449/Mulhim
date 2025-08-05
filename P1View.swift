import SwiftUI

// MARK: - شكل الخلفية المقصوصة
/// شكل مخصص لإنشاء خلفية مستطيلة مقصوصة من الأعلى والأسفل
struct RoundedRectangleShape: Shape {
    /// إنشاء مسار الخلفية المقصوصة
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let cornerRadius: CGFloat = 40
        
        // بداية الرسم من الزاوية العلوية اليسرى
        path.move(to: CGPoint(x: cornerRadius, y: 0))
        
        // الخط العلوي
        path.addLine(to: CGPoint(x: rect.width - cornerRadius, y: 0))
        
        // المنحنى العلوي الأيمن
        path.addQuadCurve(
            to: CGPoint(x: rect.width, y: cornerRadius),
            control: CGPoint(x: rect.width, y: 0)
        )
        
        // الخط الأيمن
        path.addLine(to: CGPoint(x: rect.width, y: rect.height - cornerRadius))
        
        // المنحنى السفلي الأيمن
        path.addQuadCurve(
            to: CGPoint(x: rect.width - cornerRadius, y: rect.height),
            control: CGPoint(x: rect.width, y: rect.height)
        )
        
        // الخط السفلي
        path.addLine(to: CGPoint(x: cornerRadius, y: rect.height))
        
        // المنحنى السفلي الأيسر
        path.addQuadCurve(
            to: CGPoint(x: 0, y: rect.height - cornerRadius),
            control: CGPoint(x: 0, y: rect.height)
        )
        
        // الخط الأيسر
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))
        
        // المنحنى العلوي الأيسر
        path.addQuadCurve(
            to: CGPoint(x: cornerRadius, y: 0),
            control: CGPoint(x: 0, y: 0)
        )
        
        // إغلاق الشكل
        path.closeSubpath()

        return path
    }
}



// MARK: - الصفحة الأولى من التطبيق
/// صفحة الترحيب الأولى التي تعرض شعار التطبيق ورسالة الترحيب
struct P1View: View {
    // MARK: - المتغيرات
    /// دالة يتم استدعاؤها عند الضغط على زر "التالي"
    var nextAction: () -> Void

    // MARK: - تخطيط الواجهة
    var body: some View {
        ZStack {
            // خلفية بيضاء تغطي كامل الشاشة
            Color.white
                .ignoresSafeArea()

            VStack(spacing: 0) {
                // MARK: - منطقة العنوان العلوية
                headerSection
                
                // MARK: - منطقة الشعار والموجة
                logoSection
                
                // مساحة فارغة قابلة للتمدد
                Spacer()
                
                // MARK: - منطقة النص الترحيبي
                welcomeTextSection
                
                // MARK: - زر التالي
                nextButton
                
                // مساحة فارغة قابلة للتمدد
                Spacer()
            }
        }
    }
}

// MARK: - أقسام الواجهة
extension P1View {
    
    /// قسم العنوان في أعلى الصفحة
    private var headerSection: some View {
        HStack {
            Spacer()
            Text("Mulhem")
                .font(Font.custom("Ahsing", size: 20))
                .foregroundColor(Color(red: 0.302, green: 0.157, blue: 0))
                .shadow(color: .black.opacity(0.2), radius: 2, x: 1, y: 1)
            Spacer()
        }
        .padding(.top, 80) // مساحة أكبر للـ Dynamic Island
    }
    
    /// قسم الشعار مع خلفية مقصوصة
    private var logoSection: some View {
        ZStack(alignment: .center) {
            // خلفية مقصوصة
            RoundedRectangleShape()
                .fill(Color(red: 0.96, green: 0.90, blue: 0.79))
                .frame(height: 280)
                .padding(.horizontal, 0) // تغطية كاملة للجانبين

            // شعار التطبيق
            Image("MulhemLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 180)
        }
        .padding(.top, 40)
    }
    
    /// قسم النصوص الترحيبية
    private var welcomeTextSection: some View {
        VStack(spacing: 12) {
            // عنوان الترحيب
            VStack(spacing: 4) {
                Text("Welcome to")
                    .font(Font.custom("Nunito-Bold", size: 28))
                    .foregroundColor(Color(red: 0.04, green: 0.04, blue: 0.04))
                
                Text("Mulhem!")
                    .font(Font.custom("Ahsing", size: 28))
                    .foregroundColor(Color(red: 0.302, green: 0.157, blue: 0))
            }
            .multilineTextAlignment(.center)

            // الوصف التوضيحي
            Text("Here to help you clear your mind, reframe your thoughts, and start with one doable step.")
                .font(Font.custom("Nunito-Medium", size: 16))
                .foregroundColor(Color(red: 0.45, green: 0.47, blue: 0.48))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
                .lineLimit(2)
        }
        .padding(.top, 20) // تقليل المسافة
    }

    /// زر الانتقال للصفحة التالية
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
        .padding(.top, 40)
    }
}

// MARK: - معاينة التصميم
#Preview {
    P1View(nextAction: {
        print("تم الضغط على زر التالي")
    })
}
