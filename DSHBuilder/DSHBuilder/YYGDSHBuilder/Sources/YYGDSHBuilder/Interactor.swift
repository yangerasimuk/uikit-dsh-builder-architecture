//
//  Interactor.swift
//  
//
//  Created by Yan Gerasimuk on 18.06.2024.
//

import Foundation

struct InteractorImp {
	weak var view: View?
	private var useCase: UseCase
	private let router: Router
	
	init(view: View?, useCase: UseCase, router: Router) {
		self.view = view
		self.useCase = useCase
		self.router = router
	}
}

extension InteractorImp: Interactor {
	func activate() {
		guard let viewModel = useCase.viewModel(handler: self) else { return }
		view?.showViewModel(viewModel)
	}
}

extension InteractorImp: UserActionHandler {
	func alert(title: String, message: String) {
		router.routeToAlert(title: title, message: message)
	}
	
	mutating func reload(viewState: any ViewState) {
		guard let viewModel = useCase.viewModel(viewState: viewState, handler: self) else { return }
		view?.showViewModel(viewModel)
	}
}
