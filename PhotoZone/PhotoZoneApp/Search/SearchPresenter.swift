//
//  SearchPresenter.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/19/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
class SearchPresenter :PhotosResultProtocol {

    fileprivate weak var searchView: SearchViewProtocol!
    fileprivate var photorepo: PhotosRepository!
    fileprivate var pagenumber:Int!
    fileprivate var getMorePhotosFlag:Bool!
    fileprivate var photoList:[Photo]!



    init(photoRepo:PhotosRepository){
        photorepo = photoRepo
        pagenumber = 1
        photoList = [Photo]()
        getMorePhotosFlag = false
    }

    func attachView(_ searchView:SearchViewProtocol) {
        self.searchView = searchView
    }

    func detachView() {
        searchView = nil
    }

    func searchPhotosWith(key :String) {
        pagenumber = 1
        getMorePhotosFlag = false
        searchView.startLoading()
        //how hena bardo ana 3amel ratin cycle??? ma3takedsh !!
        photorepo.searchPhotesWith(key: key, pageNumber: pagenumber, photoResult: self)
    }
    func getMorePhotoWith(key :String){
        pagenumber = pagenumber+1
        getMorePhotosFlag = true
        searchView.startLoading()
        photorepo.searchPhotesWith(key: key, pageNumber: pagenumber, photoResult: self)

    }

    func getPhotoFailure() {
        searchView.stopLoading()
        searchView.showInternetError()
    }

    func getPhotoSuccess(_ photosModel: PhotosModel) {

        if getMorePhotosFlag {
            searchView.stopLoading()
            photoList = photoList + photosModel.photos!
            searchView.showMorePhotos(photos: photoList)
        }else{
            photoList = photosModel.photos!

            if photosModel.photos?.count == 0 {
                searchView.stopLoading()
                searchView.showNoResult()

                return
            }
            searchView.stopLoading()
            searchView.searchPhotos(photos: photoList)
        }

    }

}
