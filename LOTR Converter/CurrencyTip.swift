//
//  CurrencyTip.swift
//  LOTR Converter
//
//  Created by Shrv B on 2025.03.20.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the left or the right currency to bring up the currency select screen.")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
}
