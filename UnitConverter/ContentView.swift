//
//  ContentView.swift
//  UnitConverter
//
//  Created by Maks Winters on 13.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userInput = 0
    @State private var inputUnit = "milisecond"
    @State private var outputUnit = "milisecond"
    @FocusState private var isFocused: Bool
    
    let units = ["milisecond", "second", "minute", "hour"]
    
    var inputCalculator: Int {
        if inputUnit == "milisecond" {
            return userInput
        } else if inputUnit == "second" {
            return userInput * 1_000
        } else if inputUnit == "minute" {
            return userInput * 60_000
        } else if inputUnit == "hour" {
            return userInput * 3_600_000
        } else {
            return 0
        }
    }
    
    var resultCalculator: Double {
        let input = Double(inputCalculator)
        if outputUnit == "milisecond" {
            return input
        } else if outputUnit == "second" {
            return input / 1_000
        } else if outputUnit == "minute" {
            return input / 60_000
        } else if outputUnit == "hour" {
            return input / 3_600_000
        } else {
            return 0
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter a number"){
                    TextField("Enter a number", value: $userInput, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                    Picker("Unit:", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section("Your output") {
                    Picker("Unit:", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    Text(resultCalculator, format: .number)
                }
            }
                .navigationTitle("Convert")
                .toolbar {
                    if isFocused {
                        Button("Done") {
                            isFocused = false
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
