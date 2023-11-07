//
//  ContentView.swift
//  SwiftUIMiniApps
//
//  Created by Khalid Kamil on 06/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {

            Text("A collection of 20 SwiftUI projects adapted from Hacking With Swift's 100 Days of SwiftUI")
                .font(.callout)
                .foregroundStyle(.secondary)

            List {
                NavigationLink {
                    SplitBillView()
                } label: {
                    Text("Split the bill")
                }

            }

            .navigationTitle("SwiftUI Mini Apps")
        }
    }
}

#Preview {
    ContentView()
}
