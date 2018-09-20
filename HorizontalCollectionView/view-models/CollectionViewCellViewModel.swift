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

	let titleText: String
	let detailText: String
	let backgroundColor: UIColor

	var textColor: UIColor {
		var white: CGFloat = 0
		backgroundColor.getWhite(&white, alpha: nil)
		if white > 0.5 {
			return UIColor.black
		} else {
			return UIColor.white
		}
	}

}
