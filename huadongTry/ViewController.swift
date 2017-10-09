//
//  ViewController.swift
//  huadongTry
//
//  Created by nhl on 2017/10/9.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit
//获取屏幕的高
let IPhone_SCREEN_HEIGHT = UIScreen.main.bounds.height
//获取屏幕宽
let IPhone_SCREEN_WIDTH = UIScreen.main.bounds.width
class ViewController: UIViewController,UIScrollViewDelegate{
    let menuPageControl = UIPageControl()//小圆点
    let menuScrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        _initMenuView()
    }

    func _initMenuView(){
        let colorArr:NSArray = [UIColor.yellow,UIColor.orange,UIColor.gray,UIColor.green,UIColor.purple,UIColor.brown,UIColor.blue,UIColor.lightGray,UIColor.darkGray,UIColor.red,UIColor.cyan,UIColor.magenta]
        let dataArr:NSArray = ["美食","外卖","跑腿","果蔬","冷饮","面食","火锅","炸鸡","晚餐","午餐","早餐","茶饮","下午茶","冷食","热饮","鱼类","粉类","包子","零食","旅行","购票","住宿","飞机票","超市","宵夜","小吃","瓜果","购票","住宿","飞机票","超市","宵夜","小吃","瓜果"]

//        let dataArr:NSArray = ["","","",""]

        let bgView = UIView(frame:CGRect(x:0,y:100,width:IPhone_SCREEN_WIDTH,height:180))
        self.view.addSubview(bgView)
        
        bgView.frame = dataArr.count > 4 ? CGRect(x:0,y:100,width:IPhone_SCREEN_WIDTH,height:180):CGRect(x:0,y:100,width:IPhone_SCREEN_WIDTH,height:100)
        
        menuScrollView.frame = CGRect(x:0,y:0,width:IPhone_SCREEN_WIDTH,height:bgView.frame.height)
        menuScrollView.backgroundColor=UIColor.lightText
         menuScrollView.showsHorizontalScrollIndicator=false
        
         menuScrollView.isPagingEnabled = true
     menuScrollView.contentSize=CGSize(width:IPhone_SCREEN_WIDTH+1,height:bgView.frame.height)
        menuScrollView.delegate=self
        bgView.addSubview(menuScrollView)
        
        let bigView = UIView(frame:CGRect(x:0,y:0,width:IPhone_SCREEN_WIDTH,height:bgView.frame.height-20))
        menuScrollView.addSubview(bigView)
        menuScrollView.contentSize=CGSize(width:IPhone_SCREEN_WIDTH*2,height:bgView.frame.height-20)

       
        var temp:Int = 0
        for i in 0...dataArr.count-1 {
            let menuPage = Int(i/8)
            let itemH = Int(i % 4)
            let itemW = Int((i-(menuPage*8)) / 4)
            let colorCount = colorArr.count
            if temp != menuPage {
            temp = Int(Int(arc4random())%colorCount)
                temp = menuPage
            }
            print(temp)
//            print("除数=====\(itemW)======余数%\(itemH)")
            
                let itemView = UIView(frame:CGRect(x:CGFloat(Int(IPhone_SCREEN_WIDTH/4) * itemH) + CGFloat(Int(menuPage) * Int(IPhone_SCREEN_WIDTH)),y:0 + CGFloat( 80 * itemW),width:IPhone_SCREEN_WIDTH/4,height:80))
                itemView.tag=10+i
                bigView.addSubview(itemView)
                let itemImageView=UIImageView(image:UIImage(named:"icon_homepage_movieCategory.png"))
                itemImageView.frame=CGRect(x:itemView.frame.size.width/2-22,y:15,width:44,height:44)
                itemImageView.backgroundColor=colorArr[temp] as? UIColor
                itemView.addSubview(itemImageView)
                
                let itemTitleLabel=UILabel(frame:CGRect(x:0,y:15+44,width: itemView.frame.size.width,height:20))
                itemTitleLabel.text = dataArr[i] as? String
                itemTitleLabel.textAlignment=NSTextAlignment.center
                itemTitleLabel.font=UIFont.systemFont(ofSize: 13)
                itemView.addSubview(itemTitleLabel)
                
                let tapGes:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(ClickMenuItemAction))
                itemView.addGestureRecognizer(tapGes)
                

        }
        
         let totalPage = Int(dataArr.count/8)+1//总页数
         menuScrollView.contentSize=CGSize(width:IPhone_SCREEN_WIDTH*CGFloat(totalPage),height:bgView.frame.height-20)
         menuPageControl.frame = CGRect(x:IPhone_SCREEN_WIDTH/2-20,y:bigView.frame.height,width:0,height:20)
         menuPageControl.currentPage=0
         menuPageControl.numberOfPages=totalPage
         bgView.addSubview(menuPageControl)
         menuPageControl.currentPageIndicatorTintColor=UIColor.orange
         menuPageControl.pageIndicatorTintColor=UIColor.gray
        
    }
    
    @objc func ClickMenuItemAction(tap:UITapGestureRecognizer)  {
    
        print("点击\(tap.view?.tag ?? 9)")
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let scrollViewW:CGFloat = scrollView.frame.size.width
        let x = scrollView.contentOffset.x
        let page:Int = Int((x+scrollViewW/2)/scrollViewW)
        menuPageControl.currentPage=page
    }
    //MARK:scrollviewdelegate
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let scrollViewW:CGFloat = scrollView.frame.size.width
//        let x = scrollView.contentOffset.x
//        let page:Int = Int((x+scrollViewW/2)/scrollViewW)
//        menuPageControl.currentPage=page
//    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

