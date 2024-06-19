//
//  CounterButtonCell.swift
//  
//
//  Created by Yan Gerasimuk on 19.06.2024.
//

import Foundation
import UIKit

/// Ячейка для заголовков
final class CounterButtonCell: UITableViewCell {
	private let label: UILabel = {
		let view = UILabel(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	private lazy var button: UIButton = {
		let view = UIButton(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .yellow
		view.setTitle("Нажми меня", for: .normal)
		view.setTitleColor(.black, for: .normal)
		view.layer.cornerRadius = 6
		view.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
		return view
	}()
	
	private let stack: UIStackView = {
		let view = UIStackView(frame: .zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.spacing = 12
		view.axis = .horizontal
		view.distribution = .fillEqually
		return view
	}()
	
	// MARK: - Cache
	
	private var viewModel: CounterButtonViewModel?
	
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
		stack.addArrangedSubview(label)
		stack.addArrangedSubview(button)
		
		contentView.addSubview(stack)
		NSLayoutConstraint.activate([
			stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
			stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
			stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
			stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
			
			button.widthAnchor.constraint(equalToConstant: 100)
		])
	}
	
	@objc func didTapButton() {
		viewModel?.buttonAction?()
	}
}

extension CounterButtonCell: TableCellUpdatable {
	func update(with viewModel: TableItemViewModelable) {
		guard let viewModel = viewModel as? CounterButtonViewModel else { return }
		
		self.viewModel = viewModel
		label.text = viewModel.counterText
	}
}
