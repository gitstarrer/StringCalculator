//
//  CalculatorView.swift
//  StringCalculator
//
//  Created by Himanshu on 28/06/25.
//

import SwiftUI
import CalculatorLogic

struct CalculatorView: View {
    @State private var input: String = ""
    @State private var resultText: String = ""
    @State private var showError: Bool = false
    @State private var colorCycle: Double = 0
    @State private var animateBounce = false
    @State private var shakeCount: CGFloat = 0
    
    private let calculator = Calculator()

    var body: some View {
        VStack(spacing: 30) {
            Text("String Calculator")
                .font(.system(size: 36, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
            
            TextField("e.g. 1,2,3", text: $input)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.ultraThinMaterial)
                        .shadow(color: .cyan.opacity(0.3), radius: 8, x: 0, y: 3)
                )
                .foregroundColor(Color.primary)
                .font(.system(size: 20, weight: .medium, design: .rounded))
                .onChange(of: input) {
                    withAnimation(.easeInOut(duration: 0.4)) {
                        colorCycle += 0.2
                    }
                }
                .modifier(ShakeEffect(animatableData: shakeCount))
                .padding(.horizontal)
            
            Button(action: calculate) {
                Text("Calculate")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
                    .padding(.vertical, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(
                                LinearGradient(colors: [.blue, .indigo], startPoint: .top, endPoint: .bottom)
                            )
                    )
                    .shadow(color: .indigo.opacity(0.4), radius: 10, x: 0, y: 5)
                    .scaleEffect(animateBounce ? 1.1 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.5), value: animateBounce)
            }
            
            Text(resultText)
                .font(.title3.bold())
                .foregroundColor(.white)
                .padding()
                .transition(.scale.combined(with: .opacity))
                .scaleEffect(animateBounce ? 1.2 : 1.0)
                .animation(.spring(response: 0.4, dampingFraction: 0.6), value: animateBounce)
                
            
            Spacer()
        }
        .padding()
        .background(
            LinearGradient(colors: [.pink, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
        )
    }

    private func calculate() {
        do {
            let result = try calculator.add(input)
            resultText = "Sum: \(result)"
            showError = false
            animateBounce.toggle()
        } catch let error as Calculator.Error {
            switch error {
            case .negativeNumberEncountered(let message):
                resultText = message
            default:
                resultText = "Unknown error"
            }
            showError = true
            triggerShake()
        } catch {
            resultText = error.localizedDescription
            showError = true
            triggerShake()
        }
    }

    private func triggerShake() {
        withAnimation(.default) {
            shakeCount += 1
        }
    }
}

struct ShakeEffect: GeometryEffect {
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        let xOffset = 10 * sin(animatableData * 2 * .pi)
        return ProjectionTransform(CGAffineTransform(translationX: xOffset, y: 0))
    }
}

extension Color {
    static var random: Color {
        Color(hue: Double.random(in: 0...1), saturation: 0.9, brightness: 1.0)
    }
}
