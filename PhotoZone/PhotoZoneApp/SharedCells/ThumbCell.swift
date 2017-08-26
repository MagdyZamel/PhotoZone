//
//  ThumbCell.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/9/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import Foundation
import UIKit
class ThumbCell: UITableViewCell {
    
    // 3awez a3raf lw el height plus el constant
    
    
    lazy var uesrImage: UIImageView = {
        let uesrImage = UIImageView()
        uesrImage.layer.cornerRadius = 20
        uesrImage.clipsToBounds = true
        uesrImage.image = #imageLiteral(resourceName: "PlaceHolder")
        return uesrImage
    }()
    
    lazy var mainview: UIView = {
        let mainview = UIView()
        mainview.backgroundColor = UIColor.white
        return mainview
    }()
    
    lazy var uesrName: UILabel = {
        let uesrName = UILabel()
        uesrName.numberOfLines = 1
        uesrName.font = UIFont(name: "System", size: 14)
        return uesrName
    }()
    
    
    lazy var photo: UIImageView = {
        var photo = UIImageView()
        photo.layer.cornerRadius = 10
        photo.clipsToBounds = true

        return photo
    }()
    
    
    lazy var namePhoto: UILabel = {
        let namePhoto = UILabel()
        namePhoto.numberOfLines = 1
        namePhoto.textColor = UIColor.PhotoZone.red
        namePhoto.font = UIFont(name: "System", size: 19)
        
        return namePhoto
    }()
    
    
    lazy var votesCount: UILabel = {
        let votesCount = UILabel()
        votesCount.numberOfLines = 1
        votesCount.textColor = UIColor.PhotoZone.darkBlue
        votesCount.font = UIFont(name: "System-Bold", size: 15)
        
        return votesCount
    }()
    
    lazy var LikedThisPhoto: UILabel = {
        let LikedThisPhoto = UILabel()
        LikedThisPhoto.numberOfLines = 1
        LikedThisPhoto.text = "liked this photo"
        LikedThisPhoto.textColor = UIColor.PhotoZone.darkBlue
        LikedThisPhoto.font = UIFont(name: "System", size: 13)
        
        
        return LikedThisPhoto
    }()
    
    lazy var photoTokenTime: UILabel = {
        
        
        let photoTokenTime = UILabel()
        photoTokenTime.numberOfLines = 1
        photoTokenTime.textColor = UIColor.white
        photoTokenTime.font = UIFont(name: "System", size: 14)
        
        
        return photoTokenTime
    }()
    
    lazy var disPhoto: UILabel = {
        let disPhoto = UILabel()
        disPhoto.numberOfLines = 1
        disPhoto.textColor = UIColor.PhotoZone.darkBlue
        disPhoto.font = UIFont(name: "System", size: 14)
        
        return disPhoto
    }()
    
    
    
    
    
    
    override func prepareForReuse() {
        
        photo.image = #imageLiteral(resourceName: "PlaceHolder")
        uesrImage.image = #imageLiteral(resourceName: "PlaceHolder")
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.layoutInitialization()


    }
    func layoutInitialization() {
        contentView.backgroundColor = UIColor.PhotoZone.lightGary
        contentView.addSubview(mainview)
        mainview.snp.makeConstraints { (make) in

            make.trailing.bottom.equalTo(contentView).inset(0)
            make.leading.equalTo(contentView).offset(0)
            make.top.equalTo(contentView).offset(5)

        }


        mainview.addSubviews([uesrImage,uesrName,  photo, namePhoto ,LikedThisPhoto,votesCount,photoTokenTime,disPhoto])

        uesrImage.snp.makeConstraints { (make) in
            make.leading.top.equalTo(mainview).offset(8)
            make.width.height.equalTo(42)
        }

        uesrName.snp.makeConstraints { (make) in
            make.centerY.equalTo(uesrImage.snp.centerY)
            make.leading.equalTo(uesrImage.snp.trailing).offset(8)
        }

        photo.snp.makeConstraints { (make) in
            make.trailing.equalTo(mainview).inset(8)
            make.leading.equalTo(mainview).offset(8)
            make.top.equalTo(uesrImage.snp.bottom).offset(8)
            make.height.equalTo(300)

        }

        namePhoto.snp.makeConstraints { (make) in
            make.trailing.equalTo(mainview).inset(8)
            make.leading.equalTo(mainview).offset(8)
            make.top.equalTo(photo.snp.bottom).offset(8)
        }
        votesCount.snp.makeConstraints { (make) in
            make.leading.equalTo(mainview).offset(8)
            make.top.equalTo(namePhoto.snp.bottom).offset(8)
        }
        LikedThisPhoto.snp.makeConstraints { (make) in
            make.leading.equalTo(votesCount.snp.trailing).offset(8)
            make.trailing.equalTo(mainview).offset(8)
            make.top.equalTo(namePhoto.snp.bottom).offset(8)

        }
        photoTokenTime.snp.makeConstraints { (make) in
            make.trailing.equalTo(mainview).inset(8)
            make.leading.equalTo(mainview).offset(8)
            make.top.equalTo(votesCount.snp.bottom).offset(8)
        }
        disPhoto.snp.makeConstraints { (make) in
            make.trailing.bottom.equalTo(mainview).inset(8)
            make.leading.equalTo(mainview).offset(8)
            make.top.equalTo(photoTokenTime.snp.bottom).offset(8)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
