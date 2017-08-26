//
//  HomeVC.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/9/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import PageMenu

class HomeVC: BaseVC ,CAPSPageMenuDelegate , NVActivityIndicatorViewable{

    lazy var header :UIView = {
        let header = UIView()
        header.backgroundColor = UIColor.groupTableViewBackground
        return header
    }()

    lazy var logoImage :UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = #imageLiteral(resourceName: "Logo")
        return logoImage
    }()


    lazy var conitainer :UIView = {
        let conitainer = UIView()
        return conitainer
    }()
    lazy var collectionViewPagesTitles :UICollectionView = {

        let  collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewLayout())
        collectionView.backgroundColor = UIColor.yellow
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.bounces = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(TitleCell.self, forCellWithReuseIdentifier: Identifiers.titleCell)
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()

    lazy var  layout: UICollectionViewFlowLayout = {
        let layout  = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8 , bottom: 0, right: 8)
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = CGSize(width: 80, height: 33)
        return layout
    }()

    let photoCategories = Singleton.photoCategories
    var homeSectionPages:PageTabsVC!
    var showImageInFullScreen: ((Photo) -> Void)?
    var sectionPagesControllers = [PageVC]()
    var sectionPagesTitle = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutInitialization()
        configureHomeSectionPages()
    }

    func configureHomeSectionPages() {
        homeSectionPages = PageTabsVC(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        homeSectionPages.pageTabsDeleagte = self
        photoCategories.forEach { element in
            let vc = PageVC(with: element.value)
            vc.showImageInFullScreen = self.showImageInFullScreen
            sectionPagesControllers.append(vc)
            sectionPagesTitle.append(element.value)
        }
        homeSectionPages.orderedViewControllers = sectionPagesControllers
    }

    func layoutInitialization() {
        self.view.addSubviews([header,conitainer,collectionViewPagesTitles])
        self.view.backgroundColor = UIColor.groupTableViewBackground
        self.header.addSubview(logoImage)
        collectionViewPagesTitles.collectionViewLayout = layout


        header.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(view).inset(0)
            make.height.equalTo(66)
        }
        collectionViewPagesTitles.snp.makeConstraints { (make) in
            make.trailing.equalTo(view).inset(0)

            make.top.equalTo(header.snp.bottom).offset(12)
            make.leading.equalTo(view).offset(0)
            make.height.equalTo(44)

        }
        conitainer.snp.makeConstraints { (make) in
            make.trailing.equalTo(view).inset(0)
            make.bottom.equalTo(view).inset(44)
            make.leading.equalTo(view).offset(0)
            make.top.equalTo(collectionViewPagesTitles.snp.bottom).offset(8)
        }
        logoImage.snp.makeConstraints { (make) in
            make.center.equalTo(header.snp.center)
            make.size.equalTo(CGSize(width: 70, height: 30))
        }

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        add(asChildViewController: homeSectionPages)
        pageTabsVC(didFinishAnimating: 0)

    }



    private func add(asChildViewController viewController: UIViewController) {
        conitainer.addSubview(viewController.view)
        viewController.view.frame = conitainer.bounds
        self.addChildViewController(viewController)
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    
    
}

extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource{


    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeSectionPages.goToViewControllerOfIndex(indexPath.row)
        collectionViewPagesTitles.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)

        let cell = collectionView.cellForItem(at:indexPath) as! TitleCell
        cell.selectCell()
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at:indexPath) as! TitleCell
        cell.unSelectedCell()

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionPagesTitle.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Identifiers.titleCell, for: indexPath) as! TitleCell
                cell.titleLabel.text = sectionPagesTitle[indexPath.row]
        return cell
    }
    
}

extension HomeVC:PageTabsVCDelegate{

    func pageTabsVC(didFinishAnimating indexOfCurrentVC: Int) {
        if let indexpaths = collectionViewPagesTitles.indexPathsForSelectedItems ,indexpaths.count != 0{
            print(indexpaths.last!)
            let cell = collectionViewPagesTitles.cellForItem(at: indexpaths.last!) as! TitleCell
            cell.unSelectedCell()
        }
        collectionViewPagesTitles.selectItem(at: IndexPath(row: indexOfCurrentVC, section: 0), animated: true, scrollPosition: .centeredHorizontally)
        let cell = collectionViewPagesTitles.cellForItem(at: IndexPath(row: indexOfCurrentVC, section: 0)) as! TitleCell

        cell.selectCell()

    }
}


