//
//  UseCase.swift
//  
//
//  Created by Yan Gerasimuk on 19.06.2024.
//

import Foundation

struct UseCaseImp {
	private var viewFactory: ViewFactory
	
	init(viewFactory: ViewFactory) {
		self.viewFactory = viewFactory
	}
}

extension UseCaseImp: UseCase {
	func viewModel(handler: UserActionHandler) -> ViewModel? {
		let items = viewFactory.viewModels(useCase: self, handler: handler)
		
		let viewModel = ViewModel(title: "Title sample", items: items)
		return viewModel
	}
	
	mutating func viewModel(viewState: ViewState, handler: UserActionHandler) -> ViewModel? {
		viewFactory.updateViewState(viewState)
		let items = viewFactory.viewModels(useCase: self, handler: handler)
		
		let viewModel = ViewModel(title: "Title sample", items: items)
		return viewModel
	}
}
