//
//  CounterButtonViewModel.swift
//
//
//  Created by Yan Gerasimuk on 19.06.2024.
//

import Foundation
import UIKit

struct CounterButtonViewModel: TableItemViewModelable {
	let cellClass: AnyClass = CounterButtonCell.self
	let counterText: String
	var buttonAction: (() -> Void)?
}
