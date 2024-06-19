//
//  File.swift
//  
//
//  Created by Yan Gerasimuk on 18.06.2024.
//

import Foundation

// Визуальная модель, полностью описывающая интерфейс для отрисовки на view
struct ViewModel {
  /// Заголовок для навБара
  let title: String?
  
  /// Готовые для отрисовки элементы интерфейса
  let items: [TableItemViewModelable]?
  
  /// Все уникальные модели, для регистрации в таблице
  var registrable: [TableItemViewModelable] {
	  guard let items else { return [] }
	  var ids = Set<String>()
	  var result = [TableItemViewModelable]()
	  for item in items {
		if !ids.contains(item.identifier) {
		  ids.insert(item.identifier)
		  result.append(item)
		}
	  }
	  return result
	}
}
