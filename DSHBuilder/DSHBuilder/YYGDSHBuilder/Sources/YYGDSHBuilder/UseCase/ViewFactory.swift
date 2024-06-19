//
//  ViewFactory.swift
//  
//
//  Created by Yan Gerasimuk on 19.06.2024.
//

import Foundation

struct ViewFactoryImp {
	var interactor: Interactor?
	private var viewState: ViewState
	
	// All view builder for app or feature
	// UI render from top to bottom
	private var viewBuilders: [ViewBuilder] = [
		HeaderBuilder(),
		BodyBuilder(),
		FooterWithActionBuilder(),
		NoSenseBuilder(),
		ChangeStateBuilder()
	]
	
	init(viewState: ViewState) {
		self.viewState = viewState
	}
}

extension ViewFactoryImp: ViewFactory {
	func viewModels(useCase: UseCase, handler: UserActionHandler) -> [TableItemViewModelable] {
		var items = [TableItemViewModelable]()
		for builder in viewBuilders {
			if let viewModels = builder.viewModels(
				useCase: useCase,
				viewState: viewState,
				handler: handler
			) {
				items.append(contentsOf: viewModels)
			}
		}
		return items
	}
	
	mutating func updateViewState(_ viewState: ViewState) {
		self.viewState = viewState
	}
}
