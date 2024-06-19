//
//  Interactor.swift
//  
//
//  Created by Yan Gerasimuk on 18.06.2024.
//

import Foundation

struct InteractorImp {
	weak var view: View?
	let router: Router
	
	init(view: View?, router: Router) {
		self.view = view
		self.router = router
	}
}

extension InteractorImp: Interactor {
	func activate() {
		
		// Собираем визуальные модели
		// В дальнейшем собирать строителями
		let textSmall = TextViewModel(text: "Text sample")
		let textBig = TextViewModel(
			text:
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"""
		)
		let textWithAction = TextViewModel(
			text:
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
""",
			action: {
				router.routeToAlert(title: "Lorem ipsum", message: "Lorem ipsum dolor sit amet")
			}
		)
		let space = SpaceViewModel(height: 30)
		
		let model = ViewModel(title: "Title", items: [textSmall, space, textBig, space, textWithAction])
		view?.showViewModel(model)
	}
}
