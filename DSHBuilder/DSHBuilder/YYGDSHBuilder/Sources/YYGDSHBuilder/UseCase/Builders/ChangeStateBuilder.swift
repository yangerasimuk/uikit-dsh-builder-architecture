//
//  ChangeStateBuilder.swift
//  
//
//  Created by Yan Gerasimuk on 19.06.2024.
//

import Foundation

/// Builder change state
struct ChangeStateBuilder: ViewBuilder {
	func viewModels(
		useCase: any UseCase,
		viewState: any ViewState,
		handler: any UserActionHandler
	) -> [any TableItemViewModelable]? {

		let space = SpaceViewModel(height: 10)
		let button = CounterButtonViewModel(
			counterText: String(viewState.counter),
			buttonAction: {
				var interactor = handler
				interactor.reload(viewState: ViewStateImp(counter: viewState.counter + 1))
			}
		)
		
		return [space, button]
	}
}
