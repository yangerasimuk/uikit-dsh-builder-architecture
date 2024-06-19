//
//  Assembly.swift
//  
//
//  Created by Yan Gerasimuk on 18.06.2024.
//

import Foundation
import UIKit

public struct AssemblyImp: Assembly {
	public static func assemble() -> UIViewController {
		let view = ViewImp()
		let router = RouterImp(view: view)
		let interactor = InteractorImp(view: view, router: router)
		view.interactor = interactor
		return view
	}
}
