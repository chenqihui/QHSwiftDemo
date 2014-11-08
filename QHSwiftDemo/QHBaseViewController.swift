//
//  QHBaseViewController.swift
//  QHSwiftDemo
//
//  Created by chen on 14-11-8.
//  Copyright (c) 2014年 chen. All rights reserved.
//

import UIKit

class QHBaseViewController: UIViewController {
    
//    var navTitle : String = ""
    
//    init(title : String)
//    {
//        super.init()
//        self.navTitle = title
//    }
//
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navTitle(title : String)
    {
        self.navigationItem.title = title
    }
}
