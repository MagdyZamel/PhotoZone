    //
    //  ViewController.swift
    //  PhotoZone
    //
    //  Created by Magdy Zamel on 6/9/17.
    //  Copyright © 2017 Magdy Zamel. All rights reserved.
    //


    import Kingfisher

    class PageVC: BaseVC  {

        var pagePersenter:PagePresenter!
        var categoryName :String!
        var photosList = [Photo]()

        lazy var loader: NVActivityIndicatorView = {
            let loader = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, w: 50, h: 50))
            loader.color = UIColor.darkGray
            return loader
        }()

        lazy var refresher : UIRefreshControl = {
            let refresher  = UIRefreshControl()
            refresher.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
            return refresher
        }()

        lazy var list: UITableView = {
            let list = UITableView()
            list.dataSource = self
            list.delegate = self
            list.isHidden = true
            list.rowHeight = UITableViewAutomaticDimension
            list.estimatedRowHeight = 470
            list.tag = 1
            list.register(ThumbCell.self, forCellReuseIdentifier: Identifiers.thumbCell)
            return list
        }()


        var showImageInFullScreen: ((Photo) -> Void)?


        init(with categoryName: String) {
            super.init(nibName: nil, bundle: nil)
            self.categoryName = categoryName
            self.title = categoryName

            pagePersenter = PagePresenter(photoRepo: PhotosRepository())

        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            pagePersenter.attachView(self, withCategoryName: categoryName)
            layoutInitialization()
        }

        func layoutInitialization() {
            self.view.addSubviews([list,loader])
            self.view.backgroundColor = UIColor.groupTableViewBackground
            self.list.backgroundColor = UIColor.groupTableViewBackground

            list.addSubview(self.refresher)

            list.snp.makeConstraints { (make) in
                make.top.leading.trailing.equalTo(view).inset(0)
                make.bottom.equalTo(view).inset(0)
            }

            loader.snp.makeConstraints { (make) in
                make.size.equalTo(CGSize(width: 50, height: 50))
                make.center.equalTo(view.snp.center)            }

        }



        func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            if scrollView.tag == 1{
                if ((scrollView.contentOffset.y + scrollView.frame.size.height)  >= scrollView.contentSize.height )
                {
                    pagePersenter.getMorePhotos(categoryName: categoryName)
                }
            }

        }



        func refresh(){
            pagePersenter.getPhotos(categoryName: categoryName)
        }

        deinit {
            pagePersenter.detachView()
        }

    }

    extension PageVC : PageViewProtocol {

        func showPhotos(photos: [Photo]) {
            self.photosList = photos
            self.list.reloadData()

        }

        func showLoading() {
            self.loader.startAnimating()
        }

        func hideLoading() {
            self.loader.stopAnimating()
            self.list.isHidden = false
            self.refresher.endRefreshing()

        }

        func showMorePhotos(photos: [Photo]) {
            self.photosList = photos
            self.list.reloadData()

        }

        func showLoadFailure() {
            debugPrint ("Failure")
        }


    }


    // MARK: - UItableViewDataSource,UITableViewDelegate protocols

    extension PageVC:UITableViewDataSource , UITableViewDelegate{

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return photosList.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.thumbCell, for: indexPath ) as! ThumbCell

            //Set cell content
            cell.uesrName.text = self.photosList[indexPath.row].owner?.fullName
            cell.disPhoto.text = self.photosList[indexPath.row].description
            cell.namePhoto.text = self.photosList[indexPath.row].name
            cell.photoTokenTime.text = self.photosList[indexPath.row].takenAt
            cell.votesCount.text = "\(self.photosList[indexPath.row].votesCount) people "
            //Set cell images
            cell.photo.kf.setImage(with: self.photosList[indexPath.row].url,placeholder: #imageLiteral(resourceName: "PlaceHolder"))
            cell.uesrImage.kf.setImage(with: self.photosList[indexPath.row].owner?.userPicUrl,placeholder: #imageLiteral(resourceName: "PlaceHolder"))
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            showImageInFullScreen?(photosList[indexPath.row])
        }
    }
    
