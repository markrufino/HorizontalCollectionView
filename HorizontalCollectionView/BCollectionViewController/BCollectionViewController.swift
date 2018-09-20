//
//  BCollectionViewController.swift
//  HorizontalCollectionView
//
//  Created by Mark D. Rufino on 09/20/2018.
//  Copyright © 2018 test. All rights reserved.
//

import UIKit

class BCollectionViewController: UIViewController {

	@IBOutlet weak var collectionView: UICollectionView!

	lazy var collectionViewModels: [CollectionViewModel] = [
		CollectionViewModel(titleText: "Title A", detailText: "Detail A", backgroundColor: UIColor.blue),
		CollectionViewModel(titleText: "Title B", detailText: "Detail B", backgroundColor: UIColor.orange),
		CollectionViewModel(titleText: "Title C", detailText: "Detail C", backgroundColor: UIColor.green)
	]

	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

		DispatchQueue.main.async {
			self.initCollectionView()
		}

    }

	private func initCollectionView() {
		collectionView.register(BCollectionViewCell.getNib(), forCellWithReuseIdentifier: BCollectionViewCell.identifier)
		collectionView.reloadData()
	}

}

extension BCollectionViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return collectionViewModels.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BCollectionViewCell.identifier, for: indexPath) as! BCollectionViewCell
		set(CollectionViewModel) {
			cell.
		}

		return cell
	}

}
