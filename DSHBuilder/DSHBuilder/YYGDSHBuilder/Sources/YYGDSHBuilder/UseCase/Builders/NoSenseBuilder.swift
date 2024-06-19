//
//  NoSenseBuilder.swift
//
//
//  Created by Yan Gerasimuk on 19.06.2024.
//

import Foundation

/// Builder with non passed test for show
struct NoSenseBuilder: ViewBuilder {
	func viewModels(
		useCase: any UseCase,
		viewState: any ViewState,
		handler: any UserActionHandler
	) -> [any TableItemViewModelable]? {
		// useCase hasn't any data for show
		return nil
	}
}
