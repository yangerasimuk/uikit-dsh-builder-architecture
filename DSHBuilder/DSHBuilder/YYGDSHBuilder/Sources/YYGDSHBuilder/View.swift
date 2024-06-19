//
//  View.swift
//  
//
//  Created by Yan Gerasimuk on 18.06.2024.
//

import Foundation
import UIKit

final class ViewImp: UIViewController {
	var interactor: Interactor?
	
	private lazy var tableView: UITableView = {
		let table = UITableView(frame: .zero)
		table.translatesAutoresizingMaskIntoConstraints = false
		table.backgroundColor = .clear
		table.showsHorizontalScrollIndicator = false
		table.showsVerticalScrollIndicator = false
		table.alwaysBounceVertical = false
		table.separatorStyle = .none
		table.rowHeight = UITableView.automaticDimension
		table.sectionHeaderHeight = UITableView.automaticDimension
		table.delegate = self
		table.dataSource = self
		return table
	}()
	
//	init(interactor: Interactor) {
//		self.interactor = interactor
//		super.init(nibName: nil, bundle: nil)
//	}
	
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		interactor?.activate()
	}
	
	func setupUI() {
//		view.backgroundColor = UIColor.green.withAlphaComponent(0.1)
		view.backgroundColor = .white
		view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
			tableView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
		])
	}
	
	// MARK: - Cache
	
	private var viewModel: ViewModel?
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewImp: UITableViewDataSource, UITableViewDelegate {
	public func tableView(_ tableView: UITableView,
						  numberOfRowsInSection section: Int) -> Int {
		viewModel?.items?.count ?? .zero
	}

	public func tableView(_ tableView: UITableView,
						  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard
			let model = viewModel?.items?[indexPath.row],
			let cell = tableView.dequeueReusableCell(
				withIdentifier: model.identifier,
				for: indexPath
			) as? TableCellUpdatable
		else { return UITableViewCell() }
		cell.update(with: model)
		return cell
	}
	
	public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard
			let model = viewModel?.items?[indexPath.row],
			let tapable = model as? TableItemViewActionable
		else { return }
		tapable.action?()
	}
}

// MARK: - Public API

extension ViewImp: View {
	var navController: UINavigationController? { navigationController }
	
	func showViewModel(_ viewModel: ViewModel) {
		self.viewModel = viewModel
		title = viewModel.title
		viewModel.registrable.forEach { tableView.register($0.cellClass, forCellReuseIdentifier: $0.identifier) }
		tableView.reloadData()
	}
}
