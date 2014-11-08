//
//  SwiftBasePartViewController.swift
//  QHSwiftDemo
//
//  Created by chen on 14-11-8.
//  Copyright (c) 2014年 chen. All rights reserved.
//

import UIKit

class SwiftBasePartViewController: QHBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.常量和变量()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func 常量和变量()
    {
        let 常量 = 10
        var 变量 = 0
        
        println(变量)
        
        变量 = 99
        
        println(变量)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
