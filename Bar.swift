import SwiftUI



struct Bar: View {
    @State private var selectedTabIndex: Int = 0
    @Namespace private var glassNamespace

    private let tabs: [(icon: String, title: String)] = [
        ("house.fill", "home"),
        ("lamp.floor.fill", "fine"),
        ("sparkles", "begin")
    ]

    var body: some View {
        HStack(spacing: 28) {
            ForEach(Array(tabs.enumerated()), id: \.offset) { index, tab in
                TabBarButton(
                    icon: tab.icon,
                    title: tab.title,
                    isSelected: selectedTabIndex == index,
                    namespace: glassNamespace
                ) {
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                        selectedTabIndex = index
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 14)
        .background(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .fill(Color("mulhem"))
                .overlay(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .stroke(Color.white.opacity(0.18), lineWidth: 1)
                )
                .shadow(color: .black.opacity(0.10), radius: 16, x: 0, y: 8)
        )
        .padding(.horizontal, 20)
        .padding(.bottom, 28)
    }
}

private struct TabBarButton: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let namespace: Namespace.ID
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            ZStack {
                if isSelected {
                    // Compact glass background (small pill) that covers icon + text
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.ultraThinMaterial)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12, style: .continuous)
                                .stroke(
                                    LinearGradient(
                                        colors: [
                                            Color.white.opacity(0.55),
                                            Color.white.opacity(0.15)
                                        ],
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    ),
                                    lineWidth: 1
                                )
                        )
                        .shadow(color: .black.opacity(0.10), radius: 8, x: 0, y: 4)
               
                    
                        .frame(width: 90, height: 54)
                       
                        .matchedGeometryEffect(id: "glass-pill", in: namespace)
                        .transition(.opacity.combined(with: .scale))
                }

                VStack(spacing: 6) {
                    Image(systemName: icon)
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(isSelected ? Color.black : Color("brownie1"))
                        .animation(.easeInOut(duration: 0.2), value: isSelected)

                    Text(title)
                        .font(.system(size: 12, weight: .medium, design: .rounded))
                        .foregroundColor(isSelected ? Color.black : Color.secondary)
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 4)
            }
            .frame(height: 40, alignment: .center)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .scaleEffect(isSelected ? 1.05 : 1.0)
        .animation(.spring(response: 0.35, dampingFraction: 0.8), value: isSelected)
    }
}

#Preview {
    ZStack(alignment: .bottom) {
        Color(.systemBackground).ignoresSafeArea()
        Bar()
    }
}

#Preview {
    ZStack(alignment: .bottom) {
        Color(.systemBackground).ignoresSafeArea()
        Bar()
    }
}
