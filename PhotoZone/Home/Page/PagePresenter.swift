//
//  PagePresenter.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/19/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation


class PagePresenter : OnPhotosResultProtocol {
    
    weak var pageView : PageViewProtocol!
    var photoRepo : PhotosRepository!
    var photoList : [Photo]!
    var pageNumber : Int!
    var getMorePhotosFlag : Bool!
    var categoryName : String!
    
    init(pageView:PageViewProtocol ,categoryName:String) {
        self.pageView = pageView
        self.categoryName = categoryName
        photoRepo = PhotosRepository()
        pageNumber = 1
        getMorePhotosFlag = false

        photoList = [Photo]()

        getPhotos(categoryName: categoryName)

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


    func getPhotoOnFailure() {
        pageNumber = photoList.count / 20
        pageView.hideLoading()
        pageView.showLoadFailure()
    }

    func getPhotoOnSuccess(_ photosModel: PhotosModel) {
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



