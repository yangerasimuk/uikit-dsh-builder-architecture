//
//  Router.swift
//  
//
//  Created by Yan Gerasimuk on 18.06.2024.
//

import Foundation
import UIKit

struct RouterImp: Router {
	weak var view: View?
	
	init(view: View?) {
		self.view = view
	}
	
	func routeToAlert(title: String, message: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
		let action = UIAlertAction(title: "Понятно", style: .default)
		alert.addAction(action)
		view?.navController?.present(alert, animated: true)
	}
}
