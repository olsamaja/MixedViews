//
//  BalanceView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct BalanceView: View {
    
    let model: BalanceModel
    
    var body: some View {
        VStack {
            HStack {
                BalanceAmountView(title: "Spent", amount: model.spent)
                Spacer()
                BalanceAmountView(title: "Available", amount: model.available)
            }
            ProgressView(value: 33, total: 100)
            Text("Credit limit: \(model.creditLimit)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView(model: BalanceModel(spent: "£1,450.00", available: "£2,550.00", creditLimit: "£4,000.00"))
            .sizeThatFitPreview(with: "Balance")
    }
}
