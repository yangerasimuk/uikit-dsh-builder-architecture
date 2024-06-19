//
//  SpaceViewModel.swift
//  
//
//  Created by Yan Gerasimuk on 18.06.2024.
//

import Foundation
import UIKit

struct SpaceViewModel: TableItemViewModelable {
	
	let cellClass: AnyClass = SpaceCell.self
	
	let height: CGFloat
}
