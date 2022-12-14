//
//  Extensions.swift
//  UVMap
//
//  Created by Ty Allembert on 10/12/22.
//

import SwiftUI

extension Color {
    // Backgrounds
    static let backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color("BG1"), Color("BG2")]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let backgroundLighter = Color("BG1")
    static let backgroundDarker = Color("BG2")
    static let backgroundGreen = Color("AccentColor")
    static let uvmGreen = Color("UVM_Green")
    //Text
    static let textBlackWhite = Color("TXT1")
    static let textGreenWhite = Color("TXT2")
    static let innerShadow = LinearGradient(gradient: Gradient(stops: [.init(color: .white, location: 0), .init(color: .clear, location: 0.2)]), startPoint: .top, endPoint: .bottom)
    static let bottomSheetBackground = LinearGradient(gradient: Gradient(colors: [Color("BG1").opacity(0.4), Color("BG2").opacity(0.4)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    
    
    
    static let navBarBackground = LinearGradient(gradient: Gradient(colors: [Color("Background 1").opacity(0.1), Color("BG2").opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
    static let tabBarBackground = LinearGradient(gradient: Gradient(colors: [Color("Tab Bar Background 1").opacity(0.26), Color("Tab Bar Background 2").opacity(0.26)]), startPoint: .top, endPoint: .bottom)
    static let weatherWidgetBackground = LinearGradient(gradient: Gradient(colors: [Color("Weather Widget Background 1"), Color("Weather Widget Background 2")]), startPoint: .leading, endPoint: .trailing)
    static let bottomSheetBorderTop = LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .white.opacity(0.5), .white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
    static let underline = LinearGradient(gradient: Gradient(colors: [.white.opacity(0), .white, .white.opacity(0)]), startPoint: .leading, endPoint: .trailing)
    static let tabBarBorder = Color("Tab Bar Border").opacity(0.5)
    static let forecastCardBackground = Color("Forecast Card Background")
    static let probabilityText = Color("Probability Text")
}

extension View {
    func backgroundBlur(radius: CGFloat = 3, opaque: Bool = false) -> some View {
        self
            .background(
                Blur(radius: radius, opaque: opaque)
            )
    }
}

extension View {
    func innerShadow<S: Shape, SS: ShapeStyle>(shape: S, color: SS, lineWidth: CGFloat = 1, offsetX: CGFloat = 0, offsetY: CGFloat = 0, blur: CGFloat = 4, blendMode: BlendMode = .normal, opacity: Double = 1) -> some View {
        return self
            .overlay {
                // MARK: bottom sheet inner shadow
                shape
                    .stroke(color, lineWidth: lineWidth)
                    .blendMode(blendMode)
                    .offset(x: offsetX, y: offsetY)
                    .blur(radius: blur)
                    .mask(shape)
                    .opacity(opacity)
            }
    }
}
extension View {
    func hideKeyboard() {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
}

extension View {
    func roundedTextField(inFocus: Bool) -> some View {
        self
            .foregroundColor(Color.black)
            .padding(7)
            .background (
                RoundedRectangle(cornerRadius: 20)
                    .strokeBorder(inFocus ? Color("AccentColor"): Color.clear, lineWidth: 2)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: Color.black, radius: 3, x: 1, y: 2)
                    .scaleEffect(x: inFocus ? 1.08: 1)
            )
            .autocapitalization(.none)
    }
}

extension Date {

    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
    static func == (lhs: Date, rhs: Date) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: lhs) == formatter.string(from: rhs)
    }

}
