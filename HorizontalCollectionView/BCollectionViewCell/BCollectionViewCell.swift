//
//  BCollectionViewCell.swift
//  HorizontalCollectionView
//
//  Created by Mark D. Rufino on 09/20/2018.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class BCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var canvasView: UIView!
	@IBOutlet weak var backgroundImageView: UIImageView!
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var detailLabel: UILabel!

	static let identifier = "BCollectionViewCell"

	static func getNib() -> UINib {
		return UINib(nibName: BCollectionViewCell.identifier, bundle: nil)
	}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		backgroundColor = UIColor.clear
    }

	public func applyViewModel(_ viewModel: CollectionViewCellViewModel) {

		set(viewModel) {

			switch $0.background.type {
			case .plain(let bgColor):
				canvasView.backgroundColor = bgColor
				backgroundImageView.image = nil
			case .image(let bgImage):
				canvasView.backgroundColor = nil
				backgroundImageView.image = bgImage
			}

			titleLabel.text = $0.titleText
			detailLabel.text = $0.detailText
			titleLabel.textColor = $0.textColor
			detailLabel.textColor = $0.textColor
		}

	}

}
