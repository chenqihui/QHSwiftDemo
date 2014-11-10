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
        self.断言()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //一、常量和变量
    func 常量和变量()
    {
        //1.声明常量和变量
        let 常量 = 10
        var 变量 = 0
        var 变量x = 0.0, 变量y = 0.0, 变量z = 0.0
        
        println(变量)
        
        变量 = 99
        
        println(变量)
        
        //2.类型标注
        var welcomeMessage: String
        welcomeMessage = "hello"
        
        //3.常量和变量的命名
        //你可以用任何你喜欢的字符作为常量和变量名,包括 Unicode 字符:
        let π = 3.14159
        let 你好 = "你好世界"
        let ？？？？ = "dogcow" //？只能是中文字符
        //常量与变量名不能包含数学符号,箭头,保留的(或者非法的)Unicode 码位,连线与制表符。也不能以数字开头,但是可以在常量与变量名的其他地方包含数字。
        var friendlyWelcome = "Hello!"
        friendlyWelcome = "Bonjour!"
        
        //4.输出常量和变量
        println(friendlyWelcome)
        println("The current value of friendlyWelcome is \(friendlyWelcome)")
    }
    
    //二、注释
    
    //三、整数
    func 整数()
    {
        /*
        Swift 􏰀供了一个特殊的整数类型 Int,长度与
        当前平台的原生字长相同:
        - 在 32 位平台上,Int 和 Int32 长度相同。
        - 在 64 位平台上,Int 和 Int64 长度相同。
        */
        let minValue = Int.min
        let maxValue = Int.max
    }
    
    //四、数值型字面量
    func 数值型字面量()
    {
        /*
        - 一个十进制数,没有前缀
        - 一个二进制数,前缀是 0b 
        - 一个八进制数,前缀是 0o
        - 一个十六进制数,前缀是 0x
        */
        let decimalInteger = 17
        let binaryInteger = 0b10001 // 二进制的 17
        let octalInteger = 0o21 // 八进制的17 
        let hexadecimalInteger = 0x11 // 十六进制的 17
        
        //下面的这些浮点字面量都等于十进制的 12.1875:
        let decimalDouble = 12.1875
        let exponentDouble = 1.21875e1
        let hexadecimalDouble = 0xC.3p0
        
        //整数和浮点数都可以添加额外的零并且包含下划线,并不会影响字面量:
        let paddedDouble = 000123.456
        let oneMillion = 1_000_000
        let justOverOneMillion = 1_000_000.000_000_1
        
        //整数和浮点数转换
        var nDouble = 1.009
        var nInt = Int(nDouble)
        println(nInt)
        nDouble = Double(nInt)
        println(nDouble)
        
    }
    
    //五、类型别名
    func 类型别名()
    {
        typealias AudioSample = UInt16
        var maxAmplitudeFound = AudioSample.min
    }
    
    func 布尔值()
    {
        let orangesAreOrange = true
        let turnipsAreDelicious = false
    }
    
    func 元组()
    {
        let http404Error = (404, "Not Found")
        let (statusCode, statusMessage) = http404Error
        println("The status code is \(statusCode)")
        // 输出 "The status code is 404"
        println("The status message is \(statusMessage)")
        // 输出 "The status message is Not Found"
        
        //如果你只需要一部分元组值,分解的时候可以把要忽略的部分用下划线(_)标记:
        let (justTheStatusCode, _) = http404Error
        println("The status code is \(justTheStatusCode)")
        
        //你还可以通过下标来访问元组中的单个元素,下标从零开始:
        println("The status message is \(http404Error.1)")
        // 输出 "The status message is Not Found"
        
        //你可以在定义元组的时候给单个元素命名:
        let http200Status = (statusCode: 200, description: "OK")
        println("The status code is \(http200Status.statusCode)")
        // 输出 "The status code is 200"
        
    }
    
    func 可选()
    {
        /*
            当你确定可选包确实含值之后,你可以在可选的名字后面加一个感叹号(!)来获取值。这个
            惊叹号表示“我知道这个可选有值,请使用它。”这被称为可选值的强制解析(forced
            unwrapping):
        */
        var l: Int? = 1
        var n = l! + 5
        /*
            注意:使用!来获取一个不存在的可选值会导致运行时错误。使用!来强制解析值之前,一 定要确定可选包含一个非 nil 的值。
        */
        //使用可选绑定(optional binding)来判断可选是否包含值,如果包含就把值赋给一个临时常量或者变量
        if let t = l
        {
            println("have")
        }else
        {
            println("not have")
        }
            
        l = nil
        if let t = l
        {
            println("have")
        }else
        {
            println("not have")
        }
        /*
            注意:Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中,nil 是一个指向 不存在对象的指针。在 Swift 中,nil 不是指针——它是一个确定的值,用来表示值缺失。
            任何类型的可选都可以被设置为 nil,不只是对象类型。
        */
            
        //隐式解析可选
        /*
            有时候在程序架构中,第一次被赋值之后,可以确定一个可选总会有值。在这种情况下,
            每次都要判断和解析可选值是非常低效的,因为可以确定它总会有值。 这种类型的可选被定义为隐式解析可选(implicitly unwrapped optionals)。把想要用作可 选的类型的后面的问号(String?)改成感叹号(String!)来声明一个隐式解析可选。
        */
        let possibleString: String? = "An optional string."
        println(possibleString!) // 需要惊叹号来获取值
        // 输出 "An optional string."
        let assumedString: String! = "An implicitly unwrapped optional string."
        println(assumedString) // 不需要感叹号
        // 输出 "An implicitly unwrapped optional string."

    }
    
    func 断言()
    {
        let age = -3
        assert(age >= 0, "A person's age cannot be less than zero")
        println("断言通过")
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
