//
//  CollectionViewCellViewModel.swift
//  HorizontalCollectionView
//
//  Created by Mark D. Rufino on 09/20/2018.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import UIKit

struct CollectionViewCellViewModel: BaseViewModel {

	enum Theme {
		case light
		case dark

		var textColor: UIColor {
			switch self {
			case .dark:
				return UIColor.lightText
			case .light:
				return UIColor.darkText
			}
		}
	}

	let titleText: String
	let detailText: String
	let background: CollectionViewBackground
	let textColor: UIColor

	init(titleText: String, detailText: String, background: CollectionViewBackground, theme: Theme) {
		self.titleText = titleText
		self.detailText = detailText
		self.background = background
		self.textColor = theme.textColor
	}

}
