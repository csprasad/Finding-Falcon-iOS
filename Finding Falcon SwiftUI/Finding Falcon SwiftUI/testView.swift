//
//  testView.swift
//  Finding Falcon SwiftUI
//
//  Created by CS Prasad on 16/02/25.
//

import SwiftUI

struct testView: View {
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            // Background Circles
            FloatingCircleView(size: 300, delay: 3.5, xOffset: -80, yOffset: -150)
            FloatingCircleView(size: 240, delay: 2.0, xOffset: 100, yOffset: 80)
            
            // Main Card
            VStack {
                Spacer()
                
                HStack {
                    Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 10)
                    
                    VStack(alignment: .leading) {
                        Text("Maniisha Gorasiya")
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Text("youremailId@gmail.com")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.7))
                        
                        Text("UI/UX Designer | Front-End Developer | Graphics Designer")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.6))
                            .padding(.top, 5)
                    }
                    .padding(.leading, 15)
                }
                .padding(20)
                .background(BlurView(style: .systemMaterialDark)
                                .cornerRadius(20)
                                .shadow(radius: 20))
                .padding([.leading, .trailing], 20)
                
                Spacer()
                
                // Links
                HStack {
                    Link(destination: URL(string: "https://www.lpktechnosoft.com")!) {
                        Text("Website")
                            .foregroundColor(.blue)
                    }
                }
                .padding([.leading, .trailing], 20)
                .padding(.bottom, 20)
            }
            .background(LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
        }
    }
}



struct FloatingCircleView: View {
    var size: CGFloat
    var delay: Double
    var xOffset: CGFloat
    var yOffset: CGFloat
    
    @State private var animationAmount: CGFloat = 1.0
    
    var body: some View {
        Circle()
            .frame(width: size, height: size)
            .overlay(
                Circle().stroke(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .top, endPoint: .bottom), lineWidth: 5)
            )
//            .background(
//                LinearGradient(gradient: Gradient(colors: [Color.pink, Color.purple]), startPoint: .top, endPoint: .bottom)
//            )
            .opacity(0.8)
            .offset(x: xOffset, y: yOffset)
            .scaleEffect(animationAmount)
            .animation(
                Animation.easeInOut(duration: 6)
                    .repeatForever(autoreverses: true)
                    .delay(delay)
                    .speed(0.5)
            )
            .onAppear {
                self.animationAmount = 1.2
            }
    }
}


// Create a custom wrapper for the blurred effect.
struct BlurView: View {
    var style: UIBlurEffect.Style
    
    var body: some View {
        UIKitBlur(style: style)
            .edgesIgnoringSafeArea(.all)
    }
}

// A wrapper for UIVisualEffectView (for blurred effect)
struct UIKitBlur: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}


struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
