//
//  SearchVC.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/9/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//


import Foundation
import UIKit


class SearchVC : BaseVC {

    var searchPresenter:SearchPresenter!
    var showImageInFullScreen: ((Photo) -> Void)?
    var photosList = [Photo]()


    lazy var searchField: UITextField = {

        let searchField = UITextField()
        searchField.delegate = self
        searchField.placeholder = Strings.searchPhotoZone
        searchField.backgroundColor = UIColor.cyan
        searchField.borderStyle = .roundedRect
        searchField.font = UIFont(name: "System", size: 14)

        return searchField
    }()
    lazy var list: UITableView = {
        let list = UITableView()
        list.dataSource = self
        list.delegate = self
        list.isHidden = true
        list.backgroundColor = UIColor.clear
        list.tag = 1
        list.rowHeight = UITableViewAutomaticDimension
        list.estimatedRowHeight = 470
        list.register(ThumbCell.self, forCellReuseIdentifier: Identifiers.thumbCell)
        return list
    }()



    init() {
        super.init(nibName: nil, bundle: nil)
        searchPresenter = SearchPresenter(searchView: self)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    override func viewDidLoad() {
        super.viewDidLoad()
        layoutInitialization()
    }


    func layoutInitialization() {
        self.view.addSubviews([list,searchField])
        view.backgroundColor = UIColor.groupTableViewBackground
        searchField.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(view).inset(8)
            make.top.equalTo(view.snp.top).offset(22)
            make.height.equalTo(30)
        }
        list.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(view).inset(0)
            make.bottom.equalTo(view).inset(48)
            make.top.equalTo(searchField.snp.bottom).inset(0)
        }
    }



    func keyboardConfiguration(){
        // Gesture to dismissKeyboard
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SearchVC.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }



}

extension SearchVC : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchPresenter.searchPhotosWith(key: searchField.text!)
        view.endEditing(true)
        return true
    }

}
extension SearchVC : SearchViewProtocol{

    func showMorePhotos(photos: [Photo]) {
        self.photosList = photos
        self.list.reloadData()

    }

    func searchPhotos(photos: [Photo]) {
        self.photosList = photos
        self.list.reloadData()
        self.list.isHidden = false

    }

    func searchLoadFailure() {
        debugPrint (" Error With Your Connection do your favourite behaviour \n  Drag to reload ")
    }

    func startLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }

    func showNoResult() {
        self.list.isHidden = true
        self.presentAlert(title:Strings.errorOppsTitle,message: Strings.networkError)

    }

    func showInternetError() {
        self.list.isHidden = true
        self.presentAlert(title:Strings.errorOppsTitle,message: Strings.networkError)
    }

    func stopLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}


// MARK: - UItableViewDataSource,UITableViewDelegate protocols

extension SearchVC : UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return photosList.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{


        let cell = tableView.dequeueReusableCell(withIdentifier: Identifiers.thumbCell, for: indexPath ) as! ThumbCell

        cell.uesrName.text = self.photosList[indexPath.row].owner?.fullName
        cell.disPhoto.text = self.photosList[indexPath.row].description
        cell.namePhoto.text = self.photosList[indexPath.row].name
        cell.photoTokenTime.text = self.photosList[indexPath.row].takenAt
        cell.votesCount.text = "\(self.photosList[indexPath.row].votesCount) people "

        cell.photo.kf.setImage(with: self.photosList[indexPath.row].url,placeholder: #imageLiteral(resourceName: "PlaceHolder"))
        cell.uesrImage.kf.setImage(with: self.photosList[indexPath.row].owner?.userPicUrl,placeholder: #imageLiteral(resourceName: "PlaceHolder"))
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showImageInFullScreen?(photosList[indexPath.row])
    }
}


extension SearchVC:UITableViewDelegate{
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {

        if scrollView.tag == 1{
            if ((scrollView.contentOffset.y + scrollView.frame.size.height)  >= scrollView.contentSize.height )
            {
                searchPresenter.getMorePhotoWith(key:  searchField.text!)
            }
        }
    }
    
}

