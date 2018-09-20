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
	@IBOutlet weak var progressBar: UIProgressView!

	let mockArrayOne: [CollectionViewCellViewModel] = [
		CollectionViewCellViewModel(titleText: "Title A", detailText: "This is a one liner.", background: #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1), theme: .light),
		CollectionViewCellViewModel(titleText: "Title B", detailText: "This is a two liner.\nYes it is.", background: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), theme: .light),
		CollectionViewCellViewModel(titleText: "Title C", detailText: "Light text on dark background", background: #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1), theme: .dark),
		CollectionViewCellViewModel(titleText: "Fancy Image", detailText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam feugiat mauris non augue vestibulum pellentesque. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur in lorem vitae dolor elementum ornare. Proin ultricies metus id velit malesuada, et consectetur turpis facilisis. ", background: #imageLiteral(resourceName: "astronomy-backlit-constellation-1421903"), theme: .dark)
	]
	
	lazy var collectionViewCellViewModelArray: [CollectionViewCellViewModel] = mockArrayOne

	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

		DispatchQueue.main.async {
			self.initViews()
		}

    }

	private func initViews() {
		initCollectionView()
		initProgressBar()
	}

	private func initCollectionView() {
		collectionView.register(BCollectionViewCell.getNib(), forCellWithReuseIdentifier: BCollectionViewCell.identifier)
		collectionView.delegate = self
		collectionView.dataSource = self

		collectionView.showsHorizontalScrollIndicator = false
		collectionView.showsVerticalScrollIndicator = false

		collectionView.isPagingEnabled = true

		let flowLayout = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout)
		flowLayout.scrollDirection = .horizontal

		flowLayout.minimumLineSpacing = 0
		flowLayout.minimumInteritemSpacing = 0

		collectionView.reloadData()
	}

	private func initProgressBar() {
		progressBar.progressTintColor = UIColor.black
		progressBar.trackTintColor = UIColor.white
		scrollViewDidScroll(collectionView)
	}

}

extension BCollectionViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return collectionViewCellViewModelArray.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BCollectionViewCell.identifier, for: indexPath) as! BCollectionViewCell
		cell.applyViewModel(collectionViewCellViewModelArray[indexPath.row])
		return cell
	}

}

extension BCollectionViewController: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let baseSize = UIScreen.main.bounds
		let width = baseSize.width
		let height = collectionView.frame.height
		return CGSize(width: width + 16, height: height)
	}

}

extension BCollectionViewController: UIScrollViewDelegate {

	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let headstart = 1.0 / CGFloat(collectionViewCellViewModelArray.count)
		let progress = (scrollView.contentOffset.x / scrollView.contentSize.width) + headstart
		progressBar.progress = Float(progress)
		print(progress)
	}

}
