//
//  WBBaseViewController.swift
//  Weibo
//
//  Created by Smile on 2018/3/5.
//  Copyright © 2018年 llbt. All rights reserved.
//
/*基类：1.所有主控制器的基类
 *     2.设置界面  设置新的导航条+navItem  、 重写title属性，保证外部设置title的代码不需要任何的变化
 *     3.设置表格视图
 *     4.封住刷新逻辑 上拉+下拉
 *     5.访客试图  用户没有登录的界面显示
 */

import UIKit

///所有控制器的基类
class WBBaseViewController: UIViewController {

    //设置导航条
    lazy var navigationBar = UINavigationBar.init(frame: CGRect(x: 0, y: 20, width: UIScreen.cz_screenWidth(), height: 64))
    //设置导航条目
    lazy var navItem = UINavigationItem()
    //设置tableView表格，用户登录之后才创建
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //重写title setter方法，设置标题
    override var title: String? {
        didSet {
            navItem.title = title
        }
    }
}


///设置视图
extension WBBaseViewController {
    
    //MARK： 设置界面
    //注：swift4.0 子类要重写父类的extension方法，需要加@objc，否则报错"Declarations in extensions cannot override yet"
   @objc func setupUI() {
    
        setupNavigaitonBar()
        setupTableView()

    }
    
    //MARK： 设置表格视图
   private func setupTableView() {
    tableView = UITableView.init(frame: view.bounds, style: .plain)
    view.insertSubview(tableView!, belowSubview: navigationBar)
    tableView?.delegate = self
    tableView?.dataSource = self
    }
    
    //MARK： 设置导航条视图
   private func setupNavigaitonBar() {
        //FIXME: 添加一个底层视图，矫正title显示位置
        let fixView = UIView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.cz_screenWidth(), height: 64))
        fixView.backgroundColor = UIColor.cz_color(withHex: 0xF6F6F6)
        view.addSubview(fixView)
        
        //添加navigationBar
        fixView.addSubview(navigationBar)
        //将item设置给bar
        navigationBar.items = [navItem]
        //设置navigationBar 条子渲染颜色
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        //设置navigationBar 标题颜色
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.lightGray]
    }
}


///设置协议UITableViewDelegate,UITableViewDataSource
//父类负责声明方法，子类负责实现
extension WBBaseViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
