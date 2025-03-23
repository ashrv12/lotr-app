//
//  IconGrid.swift
//  LOTR Converter
//
//  Created by Shrv B on 2025.03.16.
//

import SwiftUI

struct IconGrid: View {
    @Binding var selectedCurrency: Currency

    var body: some View {

        LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
            ForEach(Currency.allCases) { currency in

                if selectedCurrency == currency {
                    CurrencyIcon(
                        currencyImage: currency.image,
                        currencyName: currency.name
                    )
                    .shadow(color: .black, radius: 10)
                    .overlay {
                        RoundedRectangle(
                            cornerRadius: 25
                        )
                        .stroke(lineWidth: 3)
                        .opacity(0.5)

                    }
                } else {
                    CurrencyIcon(
                        currencyImage: currency.image,
                        currencyName: currency.name
                    )
                    .onTapGesture {
                        selectedCurrency = currency
                    }
                }

            }
        }
    }
}

#Preview {
    @Previewable @State var selectedCurrency: Currency = .goldPiece
    IconGrid(selectedCurrency: $selectedCurrency)
}
