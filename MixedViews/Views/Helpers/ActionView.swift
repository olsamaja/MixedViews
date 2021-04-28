//
//  ActionView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 23/04/2021.
//

import SwiftUI

struct ActionView: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .background(Color.defaultBackround)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        ActionView(title: "Title")
            .sizeThatFitPreview(with: "Action")
    }
}
