# 🧮 String Calculator (iOS + SwiftUI + TDD)

A simple iOS app that calculates the sum of numbers in a formatted string — built with **SwiftUI** and **TDD** principles.

This app follows the classic [String Calculator Kata](https://osherove.com/tdd-kata-1) using:

- **Modular architecture**
- **Test-driven development**
- **Clean separation of UI and logic**

---

## 📱 Features

- Accepts input like `"1,2,3"` and returns `6`
- Supports newline-delimited input: `"1\n2,3"`
- Supports custom delimiters: `"//;\n1;2"` → `3`
- Handles errors:
  - Returns meaningful messages for negative numbers (e.g., `"negative numbers not allowed: -2, -4"`)

---

## 🧪 Test-Driven Development

All logic is written and tested using **TDD** in a separate `CalculatorLogic` module.

To run tests:

```bash
⌘ + U  # (in Xcode)
