//
//  File.swift
//  MixedViews
//
//  Created by Olivier Rigault on 26/04/2021.
//

import Foundation
import Combine

public final class ContentViewModel: ObservableObject {
    
    @Published var state = State.idle

    private var cancellables = Set<AnyCancellable>()
    private let action = PassthroughSubject<Event, Never>()
    
    public init(state: State = .idle) {
        setupFeedbacks()
        self.state = state
    }
    
    deinit {
        cancellables.removeAll()
    }
    
    private func setupFeedbacks() {
        
        Publishers.system(
            initial: state,
            reduce: Self.reduce,
            scheduler: RunLoop.main,
            feedbacks: [
                Self.userAction(action: action.eraseToAnyPublisher())
            ]
        )
        .assign(to: \.state, on: self)
        .store(in: &cancellables)
    }
        
    func send(event: Event) {
        action.send(event)
    }
    
}

public extension ContentViewModel {
    
    enum State {
        case idle
        case loading
        case loaded([SectionModel])
        case error
    }
    
    enum Event {
        case onAppear
        case onDataLoaded
        case onFailedToLoadData
        case onTap
    }
}

public extension ContentViewModel {
    
    static func reduce(_ state: State, _ event: Event) -> State {
        switch state {
        case .idle:
            return reduceIdle(state, event)
        case .loading:
            return reduceLoading(state, event)
        case .loaded:
            return reduceLoaded(state, event)
        case .error:
            return reduceError(state, event)
        }
    }
    
    static func reduceIdle(_ state: State, _ event: Event) -> State {
        switch event {
        case .onTap:
            return .loading
        default:
            return state
        }
    }
    
    static func reduceLoading(_ state: State, _ event: Event) -> State {
        switch event {
        case .onTap:
            return .loaded(RowModel.sections)
        default:
            return state
        }
    }

    static func reduceLoaded(_ state: State, _ event: Event) -> State {
        switch event {
        case .onTap:
            return .error
        default:
            return state
        }
    }
    
    static func reduceError(_ state: State, _ event: Event) -> State {
        switch event {
        case .onTap:
            return .idle
        default:
            return state
        }
    }
}

extension ContentViewModel {
    static func userAction(action: AnyPublisher<Event, Never>) -> Feedback<State, Event> {
        Feedback { _ in action }
    }
}
