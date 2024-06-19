//
//  HeaderBuilder.swift
//
//
//  Created by Yan Gerasimuk on 19.06.2024.
//

import Foundation

/// Builder with static text
struct HeaderBuilder: ViewBuilder {
	func viewModels(
		useCase: any UseCase,
		viewState: any ViewState,
		handler: any UserActionHandler
	) -> [any TableItemViewModelable]? {
		let header = TextViewModel(text: "Header sample")
		return [header]
	}
}
