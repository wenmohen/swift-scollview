//
//  menuViewController.swift
//  huadongTry
//
//  Created by nhl on 2017/10/9.
//  Copyright © 2017年 nhl. All rights reserved.
//

import UIKit

class menuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var cellHeight:CGFloat = 44.00
        if indexPath.section == 0 {
            cellHeight = 150
        }
       else if indexPath.section == 1 {
           cellHeight = dataArr.count > 4 ? 180.00:100.00
        }else
        {
          cellHeight = 100
        }
        
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell:UITableViewCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: nil)
            cell.backgroundColor=UIColor.cyan
            cell.selectionStyle=UITableViewCellSelectionStyle.none
            return cell
        }else if indexPath.section == 1 {
            let cell:MenuTableViewCell = MenuTableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell1")
             let cellHeight:CGFloat = dataArr.count > 4 ? 180.00:100.00
             cell.frame=CGRect(x:0,y:0,width:self.menuTableView.frame.width,height:cellHeight)
            cell._initMenuView(cellColorArr: colorArr,cellDataArr: dataArr)
            cell.selectionStyle=UITableViewCellSelectionStyle.none
            return cell
        }else {
        let cell:UITableViewCell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: nil)
       cell.backgroundColor=UIColor.yellow
        return cell
        }
    }
    
    @IBOutlet weak var menuTableView: UITableView!
    var colorArr = NSArray()
    var dataArr = NSArray()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        _loadData()
        
        _initTableView()
        
        // Do any additional setup after loading the view.
    }
    
    func _initTableView(){
        
        menuTableView.delegate=self
        
        menuTableView.dataSource=self
        
    }
    
    func _loadData(){
    colorArr = [UIColor.yellow,UIColor.orange,UIColor.gray,UIColor.green,UIColor.purple,UIColor.brown,UIColor.blue,UIColor.lightGray,UIColor.darkGray,UIColor.red,UIColor.cyan,UIColor.magenta]
//     dataArr = ["美食","外卖","跑腿","果蔬","冷饮","面食","火锅","炸鸡","晚餐","午餐","早餐","茶饮","下午茶","冷食","热饮","鱼类","粉类","包子","零食","旅行","购票","住宿","飞机票","超市","宵夜","小吃","瓜果","购票","住宿","飞机票","超市","宵夜","小吃","瓜果"]
        dataArr = ["美食","外卖","跑腿","果蔬","冷饮","面食","火锅","炸鸡","晚餐","午餐","早餐","茶饮","下午茶","冷食","热饮","鱼类","粉类","包子","零食","旅行","购票","住宿","飞机票","超市","宵夜","小吃","瓜果","购票","住宿","飞机票","超市","宵夜","小吃","瓜果"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
