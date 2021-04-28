//
//  ContainedView.swift
//  MixedViews
//
//  Created by Olivier Rigault on 26/04/2021.
//

import SwiftUI

struct ContainedView: View {
    
    let state: ContentViewModel.State
    
    var body: some View {
        switch state {
        case .idle:
            Text("idle")
        case .loading:
            Text("loading")
        case .error:
            Text("error")
        case .loaded(let sections):
            ContentLoadedView(sections: sections)
        }
    }
}

struct ContainedView_Previews: PreviewProvider {
    static var previews: some View {
        ContainedView(state: .idle)
            .sizeThatFitPreview(with: ".idle")
        ContainedView(state: .loading)
            .sizeThatFitPreview(with: ".loading")
        ContainedView(state: .error)
            .sizeThatFitPreview(with: ".error")
        ContainedView(state: .loaded(RowModel.sections))
            .sizeThatFitPreview(with: ".loaded")
    }
}
