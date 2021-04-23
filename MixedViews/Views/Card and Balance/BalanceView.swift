//
//  BalanceView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct BalanceView: View {
    
    let spent: String
    let available: String
    let creditLimit: String
    
    init(model: BalanceModel) {
        self.spent = model.spent
        self.available = model.available
        self.creditLimit = model.creditLimit
    }
    
    var body: some View {
        VStack {
            HStack {
                BalanceAmountView(title: "Spent", amount: spent)
                Spacer()
                BalanceAmountView(title: "Available", amount: available)
            }
            ProgressView(value: 33, total: 100)
            Text("Credit limit: \(creditLimit)")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding()
        .listRowInsets(EdgeInsets())
        .background(Color.white)
    }
}

struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView(model: BalanceModel(spent: "£1,450.00", available: "£2,550.00", creditLimit: "£4,000.00"))
    }
}

struct BalanceModel {
    let spent: String
    let available: String
    let creditLimit: String
}
