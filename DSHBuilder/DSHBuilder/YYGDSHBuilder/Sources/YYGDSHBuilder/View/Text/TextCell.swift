//
//  File.swift
//  
//
//  Created by Yan Gerasimuk on 18.06.2024.
//

import Foundation
import UIKit

/// Ячейка для заголовков
final class TextCell: UITableViewCell {
	
	let label: UILabel = {
		let view = UILabel(frame: .zero)
		view.numberOfLines = 0
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	// MARK: - Lifecycle
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		initialSetup()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		initialSetup()
	}
	
	func initialSetup() {
		contentView.addSubview(label)
		NSLayoutConstraint.activate([
			label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
			label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
			label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
			label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0)
		])
	}
}

extension TextCell: TableCellUpdatable {
	func update(with viewModel: TableItemViewModelable) {
		guard let viewModel = viewModel as? TextViewModel else { return }
		label.text = viewModel.text
	}
}
