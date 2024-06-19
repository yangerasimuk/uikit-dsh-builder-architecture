//
//  TextViewModel.swift
//
//
//  Created by Yan Gerasimuk on 18.06.2024.
//

import Foundation
import UIKit

struct TextViewModel: TableItemViewModelable, TableItemViewActionable {
	
	let cellClass: AnyClass = TextCell.self
	
	let text: String
	
	var action: (() -> Void)?
}
