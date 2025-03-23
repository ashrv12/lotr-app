//
//  ContentView.swift
//  LOTR Converter
//
//  Created by Shrv B on 2025.03.16.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency = false
    // currency exchange input states of the user
    @State var leftSideAmount = ""
    @State var rightSideAmount = ""

    @FocusState var leftAmountFocusState: Bool
    @FocusState var rightAmountFocusState: Bool

    @State var leftCurrency: Currency = .goldPiece
    @State var rightCurrency: Currency = .goldPenny
    
    let currencyTip = CurrencyTip()
    
    let defaults = UserDefaults.standard
    
    func saveDefaults() {
        defaults.set(leftCurrency.rawValue, forKey: "leftCurrency")
        defaults.set(rightCurrency.rawValue, forKey: "rightCurrency")
    }
    
    func load() {
        let leftSavedCurrency = defaults.double(forKey: "leftCurrency")
        let rightSavedCurrency = defaults.double(forKey: "rightCurrency")
        
        if let leftLoadingCurrency = Currency(rawValue: leftSavedCurrency) {
            leftCurrency = leftLoadingCurrency
        }
        if let rightLoadingCurrency = Currency(rawValue: rightSavedCurrency) {
            rightCurrency = rightLoadingCurrency
        }
    }

    var body: some View {
        ZStack {
            // Background image
            Image(.background)
                .resizable()
                .ignoresSafeArea(edges: .all)
            VStack {
                // Prancing pony image view
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)

                // Currency exchange text
                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                // conversion section
                HStack {
                    // left conversion section
                    VStack {
                        // currency
                        HStack {
                            // currency image
                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)

                            // currency text
                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)

                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)
                        

                        // text field
                        TextField("Amount", text: $leftSideAmount)
                            .textFieldStyle(.roundedBorder)
                            .focused($leftAmountFocusState)
                            
                    }

                    // equals sign
                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    // right conversion section
                    VStack {
                        // currency
                        HStack {
                            // currency image
                            Image(rightCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)

                            // currency text
                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)

                        }
                        .padding(.bottom, -5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }

                        // text field
                        TextField("Amount", text: $rightSideAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                            .focused($rightAmountFocusState)
                            

                    }

                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)

                Spacer()

                // info button
                HStack {
                    Spacer()
                    Button {
                        showExchangeInfo.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)

                }

            }
        }
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
        .onAppear(perform: load)
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftSideAmount) {
            if leftAmountFocusState {
                rightSideAmount = leftCurrency.convert(
                    leftSideAmount, to: rightCurrency)
            }
            saveDefaults()
        }
        .onChange(of: rightSideAmount) {
            if rightAmountFocusState {
                leftSideAmount = rightCurrency.convert(
                    rightSideAmount, to: leftCurrency)
            }
            saveDefaults()
        }
        .onChange(of: rightCurrency) {
            rightSideAmount = leftCurrency.convert(
                leftSideAmount, to: rightCurrency)
        }
        .onChange(of: leftCurrency) {
            leftSideAmount = rightCurrency.convert(
                rightSideAmount, to: leftCurrency)
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(
                topCurrency: $leftCurrency,
                botCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
