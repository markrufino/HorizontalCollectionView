//
//  BaseViewModel.swift
//  HorizontalCollectionView
//
//  Created by Mark D. Rufino on 09/20/2018.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation

protocol BaseViewModel {}

func set<T: BaseViewModel>(_ viewModel: T, handler: ((T) -> Void)) {
	handler(viewModel)
}
