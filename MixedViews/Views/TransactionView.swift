//
//  TransactionView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct TransactionView: View {
    
    let title: String
    let subTitle: String
    let amount: String
    
    init(model: TransactionModel) {
        self.title = model.title
        self.subTitle = model.subTitle
        self.amount = model.amount
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3)
                Text(subTitle)
                    .font(.footnote)
            }
            Spacer()
            Text(amount)
                .font(.body)
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView(model: TransactionModel(title: "Title", subTitle: "Sub title", amount: "£12.95"))
    }
}

struct TransactionModel {
    let title: String
    let subTitle: String
    let amount: String
}
