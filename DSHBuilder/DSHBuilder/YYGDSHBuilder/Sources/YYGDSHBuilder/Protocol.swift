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

/// Визуальная модель для построения ячейки
protocol TableItemViewModelable {
  /// Идентификатор ячейки
  var identifier: String { get }
  
  /// Класс ячейки
  var cellClass: AnyClass { get }
}

extension TableItemViewModelable {
  /// Идентификатор по-умолчанию
  var identifier: String { String(describing: cellClass.self) }
}

/// Обработчик нажатия на элемент в общей таблице view
protocol TableItemViewActionable {
	/// Замыкание обработки нажатия
	var action: (() -> Void)? { get set }
}

/// Обновляемая моделью ячейка таблицы
protocol TableCellUpdatable: UITableViewCell {
	/// Обновить ячейку из модели
	/// - Parameter viewModel: Визуальная модель
	func update(with viewModel: TableItemViewModelable)
}


