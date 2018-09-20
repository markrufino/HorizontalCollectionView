//
//  BCollectionViewCell.swift
//  HorizontalCollectionView
//
//  Created by Mark D. Rufino on 09/20/2018.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class BCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var canvassView: UIView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var detailLabel: UILabel!

	static let identifier = "BCollectionViewCell"

	static func getNib() -> UINib {
		return UINib(nibName: BCollectionViewCell.identifier, bundle: nil)
	}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	public func applyViewModel(_ viewModel: CollectionViewModel) {
		canvassView.backgroundColor = viewModel.backgroundColor
		titleLabel.text = viewModel.titleText
		detailLabel.text = viewModel.detailText
	}

}
