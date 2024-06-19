//
//  Protocol.swift
//  
//
//  Created by Yan Gerasimuk on 18.06.2024.
//

import Foundation
import UIKit

protocol Assembly {
	static func assemble() -> UIViewController
}

protocol Interactor {
	func activate()
}

protocol Router {
	func routeToAlert(title: String, message: String)
}
protocol View: AnyObject {
	var navController: UINavigationController? { get }
	func showViewModel(_ viewModel: ViewModel)
}

protocol TableItemViewModelable {
  var identifier: String { get }
  var cellClass: AnyClass { get }
}

extension TableItemViewModelable {
  var identifier: String { String(describing: cellClass.self) }
}

protocol TableItemViewActionable {
	var action: (() -> Void)? { get set }
}

protocol TableCellUpdatable: UITableViewCell {
	func update(with viewModel: TableItemViewModelable)
}

protocol ViewBuilder {
	func viewModels(
		useCase: UseCase,
		viewState: ViewState,
		handler: UserActionHandler
	) -> [TableItemViewModelable]?
}

protocol ViewFactory {
	func viewModels(useCase: UseCase, handler: UserActionHandler) -> [TableItemViewModelable]
	mutating func updateViewState(_ viewState: ViewState)
}

protocol UseCase {
	func viewModel(handler: UserActionHandler) -> ViewModel?
	mutating func viewModel(viewState: ViewState, handler: UserActionHandler) -> ViewModel?
}

protocol ViewState {
	var counter: Int { get }
}

protocol UserActionHandler {
	func alert(title: String, message: String)
	mutating func reload(viewState: ViewState)
}
