//
//  ImageFullScreenVC.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/26/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import SnapKit
import Kingfisher





class ImageFullScreenVC: BaseVC {


     var presenter:ImageFullScreenPresenter!


    lazy var photoImageView: UIImageView = {
        var photo = UIImageView()
        return photo
    }()

    lazy var loader: NVActivityIndicatorView = {
        let loader = NVActivityIndicatorView(frame: CGRect(x: 0, y: 0, w: 50, h: 50))
        loader.color = UIColor.darkGray
        loader.isHidden = true
        return loader
    }()
    lazy var closeButton:UIButton = {
        let closeButton = UIButton()
        closeButton.setImage(#imageLiteral(resourceName: "CloseIcon"), for: UIControlState.normal)
        closeButton.addTarget(self, action: #selector(ImageFullScreenVC.closeButtonTapped), for: UIControlEvents.touchUpInside)
        return closeButton
    }()




    override func viewDidLoad() {
        super.viewDidLoad()
        layoutInitialization()
    }


    func layoutInitialization()  {
        view.backgroundColor = UIColor.black
        view.addSubviews([photoImageView,loader,closeButton])
        photoImageView.snp.makeConstraints { (make) in
            make.height.equalTo(view.snp.height).multipliedBy(0.45)
            make.width.equalTo(view.snp.width)
            make.center.equalTo(view.snp.center)

        }
        loader.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 50, height: 50))
            make.center.equalTo(view.snp.center)
        }
        closeButton.snp.makeConstraints { (make) in
            make.size.equalTo(CGSize(width: 32, height: 32))
            make.trailing.equalTo(view.snp.trailing).inset(10)
            make.top.equalTo(view.snp.top).offset(10)
        }

    }

    func closeButtonTapped(){
        self.dismissVC(completion: nil)
    }

    override var prefersStatusBarHidden: Bool{

        return true
    }
}

extension ImageFullScreenVC :ImageFullScreenViewProtocol{

    func showPhotoFullScreen(_ photo:Photo){
        photoImageView.kf.setImage(with: photo.url , placeholder: nil, options: nil, progressBlock: nil) { (image, error, cacheType, url) in
            if (error != nil) {
                self.photoImageView.image = #imageLiteral(resourceName: "FrownFace")
            }
            self.hideLoading()

        }
    }

    func showLoading() {
        self.loader.startAnimating()
    }
    
    func hideLoading() {
        self.loader.stopAnimating()
    }
    
}

