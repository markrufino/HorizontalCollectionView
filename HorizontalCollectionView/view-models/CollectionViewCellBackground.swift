//
//  CollectionViewCellBackground.swift
//  HorizontalCollectionView
//
//  Created by Mark D. Rufino on 09/20/2018.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation
import UIKit

protocol CollectionViewBackground {

	var type: CollectionViewBackgroundType { get }

}

extension UIColor: CollectionViewBackground {

	var type: CollectionViewBackgroundType {
		return .plain(self)
	}

}

extension UIImage: CollectionViewBackground {

	var type: CollectionViewBackgroundType {
		return .image(self)
	}

}

enum CollectionViewBackgroundType {
	case plain(UIColor)
	case image(UIImage)
}
