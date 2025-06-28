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
    
    private let calculator = Calculator()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("String Calculator")
                    .font(.largeTitle)
                    .bold()
                
                TextField("Enter numbers, e.g. 1,2,3", text: $input)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                Button("Calculate Sum") {
                    calculate()
                }
                .font(.headline)
                .padding()
                .background(Color.blue.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(10)

                Text(resultText)
                    .foregroundColor(showError ? .red : .green)
                    .font(.title2)
                    .padding()
                
                Spacer()
            }
            .padding()
        }
    }
    
    private func calculate() {
        do {
            let result = try calculator.add(input)
            resultText = "Sum: \(result)"
            showError = false
        }catch let error as Calculator.Error {
            switch error {
            case .negativeNumberEncountered(let message):
                resultText = message
                showError = true
            default:
                resultText = "unknown error"
                showError = true
            }
        } catch {
            resultText = error.localizedDescription
            showError = true
        }
    }
}
