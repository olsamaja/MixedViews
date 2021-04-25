//
//  BalanceAmountView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct BalanceAmountView: View {
    
    let title: String
    let amount: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.subheadline)
            Text(amount)
                .font(.title2)
                .bold()
        }
    }
}

struct BalanceAmountView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceAmountView(title: "Title", amount: "£1,2345.00")
            .sizeThatFitPreview(with: "Balance Amount")
    }
}
