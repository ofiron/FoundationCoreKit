//
//  ContentView.swift
//  FoundationCoreKitDemo
//
//  Created by Ofir Ron on 05/02/2025.
//

import SwiftUI
import FoundationCoreKit

struct ContentView: View {
    @State private var textFromPackage = ""

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")

            Button("Some action from package") {
                let number = Number(5.3)
                textFromPackage = "\(number.underlineValue)"
            }

            Text("The number value from package")
            Text(textFromPackage)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
