//
//  Assembly.swift
//  
//
//  Created by Yan Gerasimuk on 18.06.2024.
//

import Foundation
import UIKit

public struct AssemblyImp: Assembly {
	public static func assemble() -> UIViewController {
		let view = ViewImp()
		let router = RouterImp(view: view)
		let viewState = ViewStateImp(counter: 0)
		let viewFactory = ViewFactoryImp(viewState: viewState)
		let useCase = UseCaseImp(viewFactory: viewFactory)
		let interactor = InteractorImp(view: view, useCase: useCase, router: router)
		view.interactor = interactor
		return view
	}
}
