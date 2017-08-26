//
//  TitleCell.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 8/25/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import UIKit

class TitleCell: UICollectionViewCell {
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.numberOfLines = 1
        titleLabel.textColor = UIColor.PhotoZone.red
        titleLabel.font = UIFont(name: "System", size: 19)

        return titleLabel
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layoutInitialization()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }



    func layoutInitialization() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in

            make.top.leading.equalTo(contentView).offset(8)
            make.bottom.trailing.equalTo(contentView).inset(8)

        }
    }

    func selectCell() {
        UIView.animate(withDuration: 0.4) {
            self.backgroundColor = UIColor.cyan
            self.layer.cornerRadius = 8

        }
        
    }
    func unSelectedCell() {
        UIView.animate(withDuration: 0.4) {
            self.backgroundColor = UIColor.white
        }
        
    }

}
