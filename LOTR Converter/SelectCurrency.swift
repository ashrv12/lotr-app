//
//  SelectCurrency.swift
//  LOTR Converter
//
//  Created by Shrv B on 2025.03.16.
//

import SwiftUI

struct SelectCurrency: View {
    @Environment(\.dismiss) var dismissCurrencySelector
    @Binding var topCurrency: Currency
    @Binding var botCurrency: Currency

    var body: some View {
        ZStack {
            // Parchment background
            Image(.parchment)
                .resizable()
                .ignoresSafeArea(.all)
                .background(.brown)

            VStack {
                // text
                Text("Select the starting currency:")
                    .fontWeight(.bold)

                IconGrid(selectedCurrency: $topCurrency)

                Text("Select the currency you wish to convert to:")
                    .fontWeight(.bold)
                    .padding(.top)

                // currency icons
                IconGrid(selectedCurrency: $botCurrency)
                
                // done button
                Button("Done") {
                    dismissCurrencySelector()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)

            }
            .padding()
            .multilineTextAlignment(.center)
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var topCurrency: Currency = .goldPiece
    @Previewable @State var botCurrency: Currency = .silverPenny
    SelectCurrency(topCurrency: $topCurrency, botCurrency: $botCurrency)
}
