//
//  HomeVC.swift
//  PhotoZone
//
//  Created by Magdy Zamel on 6/9/17.
//  Copyright © 2017 Magdy Zamel. All rights reserved.
//

import PageMenu

class HomeVC: BaseVC ,CAPSPageMenuDelegate , NVActivityIndicatorViewable{
   
   
    var tabs : CAPSPageMenu!
    var controllersArray :[UIViewController]!
    var parameters: [CAPSPageMenuOption]!
 
    
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
        conitainer.backgroundColor = UIColor.yellow
        return conitainer
    }()


      var showImageInFullScreen: ((Photo) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        pageMenuConfigration()
        layoutInitialization()
    }



    func layoutInitialization() {
        self.view.addSubviews([header,conitainer])
        self.view.backgroundColor = UIColor.groupTableViewBackground

        self.header.addSubview(logoImage)

        header.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(view).inset(0)
            make.height.equalTo(66)
        }
        conitainer.snp.makeConstraints { (make) in
            make.trailing.equalTo(view).inset(0)
            make.bottom.equalTo(view).inset(44)
            make.leading.equalTo(view).offset(0)
            make.top.equalTo(header.snp.bottom).inset(0)
        }
        logoImage.snp.makeConstraints { (make) in
            make.center.equalTo(header.snp.center)
            make.size.equalTo(CGSize(width: 70, height: 30))
        }
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //         Initialize page menu with view controllers array, frame, and optional parameters
        if tabs == nil{
            tabs = CAPSPageMenu(viewControllers: controllersArray, frame: conitainer.bounds , pageMenuOptions: parameters)
            self.conitainer.addSubview(self.tabs.view)
            tabs.moveToPage(0)
            
        }
    }
    
    
    
    func pageMenuConfigration(){
        
        parameters = [
            .scrollMenuBackgroundColor(UIColor.init(red: 283/255, green: 283/255, blue: 283/255, alpha: 1)),
//            .viewBackgroundColor(UIColor.groupTableViewBackground),
            .selectionIndicatorColor(UIColor.init(red: 0, green: 153/255, blue: 229/255, alpha: 1)),
            .unselectedMenuItemLabelColor(UIColor.black),
            .selectedMenuItemLabelColor(UIColor.init(red: 0, green: 153/255, blue: 229/255, alpha: 1)),
            .bottomMenuHairlineColor(UIColor.darkGray),
            .menuItemFont(UIFont(name: "trebuchet ms", size: 13.0)!),
            .menuHeight(40.0),
            .menuItemWidthBasedOnTitleTextWidth (true),
            .menuMargin(20),
            .centerMenuItems(true)
        ]
        controllersArray = [UIViewController]()

        categories.forEach { element in
            let vc = PageVC(with: element.value)
            vc.showImageInFullScreen = self.showImageInFullScreen
            controllersArray.append(vc)
        }

    }
    
    
}
