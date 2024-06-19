//
//  SpaceCell.swift
//  
//
//  Created by Yan Gerasimuk on 18.06.2024.
//

import Foundation
import UIKit

/// Ячейка для заголовков
final class SpaceCell: UITableViewCell {}

extension SpaceCell: TableCellUpdatable {
	func update(with viewModel: TableItemViewModelable) {
		guard let viewModel = viewModel as? SpaceViewModel else { return }
		NSLayoutConstraint.activate([
			heightAnchor.constraint(equalToConstant: viewModel.height)
		])
	}
}
