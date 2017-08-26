//
//  PagePresenter.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/19/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation


class PagePresenter : PhotosResultProtocol {
    
    fileprivate weak var pageView : PageViewProtocol!
    fileprivate var photoRepo : PhotosRepository!
    fileprivate var photoList : [Photo]!
    fileprivate var pageNumber : Int!
    fileprivate var getMorePhotosFlag : Bool!
    fileprivate var categoryName : String!


    init(photoRepo:PhotosRepository){
        self.photoRepo = photoRepo
    }

    func attachView(_ pageView:PageViewProtocol , withCategoryName categoryName:String ){
        self.pageView = pageView
        self.categoryName = categoryName
        getPhotos(categoryName: categoryName)

    }

    func detachView() {
        pageView = nil
    }


    
    func getMorePhotos(categoryName :String) {
        getMorePhotosFlag = true
        pageNumber = pageNumber + 1
        photoRepo.getPhotesWith(categoryName: categoryName, pageNumber: pageNumber, photoResult: self)
    }

    func getPhotos(categoryName :String ) {
        pageView.showLoading()
        getMorePhotosFlag = false
        pageNumber = 1
        photoRepo.getPhotesWith(categoryName: categoryName, pageNumber: pageNumber, photoResult: self)
    }


    func getPhotoFailure() {
        pageNumber = photoList.count / 20
        pageView.hideLoading()
        pageView.showLoadFailure()
    }

    func getPhotoSuccess(_ photosModel: PhotosModel) {
        pageView.hideLoading()
        if getMorePhotosFlag {
            self.photoList = self.photoList + photosModel.photos!
            pageView.showMorePhotos(photos: photoList)
        }else{
            self.photoList = photosModel.photos!
            pageView.showPhotos(photos: photoList)
        }
    }



}



