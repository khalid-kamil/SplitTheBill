//
//  SplitBillView.swift
//  littlelemon
//
//  Created by Khalid Kamil on 31/05/2023.
//

import SwiftUI

struct SplitBillView: View {
    @FocusState private var amountIsFocused: Bool

    @State private var billAmount: Double = 0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 10
    
    let tipPercentages = [10, 15, 25, 0]
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = billAmount / 100 * tipSelection
        let totalAmount = billAmount + tipValue
        return totalAmount
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $billAmount, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                        .focused($amountIsFocused)
                        .toolbar {
                            ToolbarItem(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    amountIsFocused = false
                                }
                            }
                        }
                        .keyboardType(.decimalPad)

                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much would you like to tip?")
                }
                
                Section {
                    Text(grandTotal, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                } header: {
                    Text("Total - including tip")
                }


                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "GBP"))
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("Split the bill")
        }
    }
}

struct SplitBillView_Previews: PreviewProvider {
    static var previews: some View {
        SplitBillView()
    }
}
