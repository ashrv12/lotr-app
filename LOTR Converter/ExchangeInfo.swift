//
//  ExchangeInfo.swift
//  LOTR Converter
//
//  Created by Shrv B on 2025.03.16.
//

import SwiftUI

struct ExchangeInfo: View {
    @Environment(\.dismiss) var dismissExchangeInfo
    var body: some View {
        ZStack{
            // background parchment image
            Image(.parchment)
                .resizable()
                .ignoresSafeArea(.all)
                .background(.brown)
            VStack{
                // title text
                Text("Exchange Rates")
                    .font(.largeTitle)
                    .tracking(3)
                // description text
                Text(
                    "Here at the Prancing Pony, we are happy to offer you a place where you can exchange all the known currencies in the entire world except one. We used to take Brandy Bucks, but after finding out that it was a person instead of a piece of paper, we realized it had no value to us. Below is a simple guide to our currency exchange rates:")
                .font(.title3)
                .padding()
                // currency exchange rates
                ExchangeRate(leftCurrencyImage: .goldpiece, rightCurrencyImage: .goldpenny, exchangeRateText: "1 Gold piece = 4 Gold pennies")
                
                ExchangeRate(leftCurrencyImage: .goldpenny, rightCurrencyImage: .silverpiece, exchangeRateText: "1 Gold penny = 4 Silver pieces")
                
                ExchangeRate(leftCurrencyImage: .silverpiece, rightCurrencyImage: .silverpenny, exchangeRateText: "1 Silver piece = 4 Silver pennies")
                
                ExchangeRate(leftCurrencyImage: .silverpenny, rightCurrencyImage: .copperpenny, exchangeRateText: "1 Silver penny = 100 Copper pennies")
                
                ExchangeRate(leftCurrencyImage: .goldpiece, rightCurrencyImage: .momoiMeme, exchangeRateText: "1 Gold piece = 100 Momois")
                
                // done button
                Button("Done"){
                    dismissExchangeInfo()
                }
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .font(.largeTitle)
                .padding(.vertical)
                .foregroundStyle(.white)
            }
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    ExchangeInfo()
}


