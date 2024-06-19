//
//  FooterWithActionBuilder.swift
//
//
//  Created by Yan Gerasimuk on 19.06.2024.
//

import Foundation

/// Builder with tapable cell
struct FooterWithActionBuilder: ViewBuilder {
	func viewModels(
		useCase: any UseCase,
		viewState: any ViewState,
		handler: any UserActionHandler
	) -> [any TableItemViewModelable]? {
		let text =
"""
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
"""
		let footer = TextViewModel(
			text: text,
			action: {
				handler.alert(title: "Lorem ipsum", message: "dolor sit amet, consectetur")
			}
		)
		let space = SpaceViewModel(height: 10)
		return [space, footer]
	}
}
