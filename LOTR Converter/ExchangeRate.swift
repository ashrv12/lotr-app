//
//  ExchangeRate.swift
//  LOTR Converter
//
//  Created by Shrv B on 2025.03.16.
//

import SwiftUI

struct ExchangeRate: View {
    let leftCurrencyImage: ImageResource
    let rightCurrencyImage: ImageResource
    let exchangeRateText: String
    
    var body: some View {
        HStack{
            
            // left currency image
            Image(leftCurrencyImage)
                .resizable()
                .scaledToFit()
                .frame(height: 35)
            // exchange rate text
            Text(exchangeRateText)
            
            // right currency image
            Image(rightCurrencyImage)
                .resizable()
                .scaledToFit()
                .frame(height: 35)
        }
    }
}

#Preview {
    ExchangeRate(leftCurrencyImage: .goldpiece, rightCurrencyImage: .goldpenny,
    exchangeRateText: "1 Gold Piece = 4 Gold Pennies")
}
