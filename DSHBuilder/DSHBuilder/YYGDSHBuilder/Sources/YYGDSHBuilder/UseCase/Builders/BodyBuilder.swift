//
//  BodyBuilder.swift
//  
//
//  Created by Yan Gerasimuk on 19.06.2024.
//

import Foundation

/// Builder with static text
struct BodyBuilder: ViewBuilder {
	func viewModels(
		useCase: any UseCase,
		viewState: any ViewState,
		handler: any UserActionHandler
	) -> [any TableItemViewModelable]? {
		let text =
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
"""
		let body = TextViewModel(text: text)
		let space = SpaceViewModel(height: 10)
		return [space, body]
	}
}
