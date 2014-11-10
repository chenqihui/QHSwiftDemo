//
//  RootTableViewController.swift
//  QHSwiftDemo
//
//  Created by chen on 14-11-8.
//  Copyright (c) 2014年 chen. All rights reserved.
//

import UIKit

class RootTableViewController: UITableViewController {
    
    var arData : NSArray?
    var dicData : NSMutableDictionary?
    var dicShow : NSMutableDictionary?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.initData()
    }
    
    func initData()
    {
        arData = NSArray(objects: "1、欢迎使用Swift", "2、Swift教程", "3、语言附注")
        dicData = NSMutableDictionary()
        dicShow = NSMutableDictionary()
        arData?.enumerateObjectsUsingBlock({ (arD, idx, stop) -> Void in
            let key : String = arD as String
            switch idx
            {
                case 0:
                    self.dicData?.setValue(["1.1、关于Swift", "1.2、Swift初见"], forKey: key)
                    self.dicShow?.setValue(false, forKey: key)
                case 1:
                    self.dicData?.setValue(["2.1、基础部分", "2.2、基础运算符", "2.3、字符串和字符", "2.4、集合类型", "2.5、控制流", "2.6、函数", "2.7、闭包", "2.8、枚举", "2.9、类和结构体", "2.10、属性", "2.11、方法", "2.12、附属脚本", "2.13、继承", "2.14、构造过程", "2.15、反初始化", "2.16、自动引用计数", "2.17、自判断链接", "2.18、类型转换", "2.19、类型嵌套", "2.20、扩展", "2.21、协议", "2.22、泛型", "2.23、高级运算符"], forKey: key)//, "3.、"
                    self.dicShow?.setValue(false, forKey: key)
                case 2:
                    self.dicData?.setValue(["3.1、关于语言附注", "3.2、词法结构", "3.3、类型", "3.4、表达式", "3.5、语句", "3.6、声明", "3.7、特性", "3.8、模式", "3.9、泛型参数", "3.10、语法总结"], forKey: key)
                    self.dicShow?.setValue(false, forKey: key)
                default:
                    println("default")
            }
        });
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return dicData!.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return (dicData?.objectForKey(arData?.objectAtIndex(section) as String) as NSArray).count
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 44
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        if dicShow?.objectForKey(arData?.objectAtIndex(indexPath.section) as String) as Bool
        {
            return 44
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return arData?.objectAtIndex(section) as? String
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        var btn : UIButton = UIButton(frame: CGRectMake(0, 0, self.view.frame.width, 40))
        btn.setTitle(arData?.objectAtIndex(section) as? String, forState: UIControlState.Normal)
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        btn.backgroundColor = UIColor.whiteColor()
        btn.layer.borderColor = UIColor.orangeColor().CGColor
        btn.layer.borderWidth = 1
        btn.tag = section
        btn.addTarget(self, action: Selector("showSection:"), forControlEvents: UIControlEvents.TouchUpInside)
        
        return btn
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        if !(dicShow?.objectForKey(arData?.objectAtIndex(indexPath.section) as String) as Bool)
        {
            return UITableViewCell(frame: CGRectZero)
        }
        let identifier : String = "reuseIdentifier"
        var cell : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(identifier) as? UITableViewCell

        if cell == nil
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
        }
        // Configure the cell...
        cell?.textLabel.text = (dicData?.objectForKey(arData?.objectAtIndex(indexPath.section) as String) as NSArray).objectAtIndex(indexPath.row) as? String

        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let key : String = arData?.objectAtIndex(indexPath.section) as String
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        let value = cell?.textLabel.text as String!
        
        var subVC : QHBaseViewController? = nil
        switch indexPath.section
        {
            case 0:
                switch indexPath.row
                {
                    case 0:
                        subVC = AboutSwiftViewController()
                    case 1:
                        println("")
                    default:
                        println("")
                }
            case 1:
                switch indexPath.row
                {
                    case 0:
                        subVC = SwiftBasePartViewController()
                    case 1:
                        println("")
                    default:
                        println("")
                }
            case 2:
                switch indexPath.row
                {
                    case 0:
                        println("")
                    case 1:
                        println("")
                    default:
                        println("")
                }
            default:
                println("")
        }
        if subVC != nil
        {
            subVC?.navTitle(value)
            self.navigationController?.pushViewController(subVC!, animated:true)
        }
    }
    
    func showSection(sender: UIButton!)
    {
        let key : String = arData?.objectAtIndex(sender.tag) as String
        let bShow : Bool = dicShow?.objectForKey(key) as Bool
        dicShow?.setValue(!bShow, forKey: key)
        
        var indexSet = NSIndexSet(index: sender.tag)
        self.tableView.reloadSections(indexSet, withRowAnimation: UITableViewRowAnimation.Fade)
    }
}
