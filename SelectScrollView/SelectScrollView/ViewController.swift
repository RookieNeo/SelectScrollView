//
//  ViewController.swift
//  SelectScrollView
//
//  Created by Neo on 16/4/20.
//  Copyright © 2016年 apple. All rights reserved.
//

import UIKit
let ScreenX=UIScreen.mainScreen().bounds.origin.x
let screenY=UIScreen.mainScreen().bounds.origin.y
let screenW=UIScreen.mainScreen().bounds.size.width
let screenH=UIScreen.mainScreen().bounds.size.height
class ViewController: UIViewController ,UIScrollViewDelegate,ChangViewControllerDelegate{

    var scrollTitleView : ZXPersonView!
    let subScrollView = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func configUI(){
        subScrollView.frame = CGRectMake(0, 200, screenW, 300)
        subScrollView.contentSize = CGSizeMake(screenW * 4, 0)
        subScrollView.pagingEnabled = true
        subScrollView.delegate = self
        self.view.addSubview(subScrollView)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenW, height: 300))
        view.backgroundColor = UIColor.redColor()
        subScrollView.addSubview(view)
        self.showSelectView()
    }
    func showSelectView()
    {
        scrollTitleView = ZXPersonView(titles: ["观点","锦囊","互动","哈哈"], target: subScrollView)
        scrollTitleView.scrollView.backgroundColor = UIColor(colorLiteralRed: 0.00, green: 0.00, blue: 0.00, alpha: 0.3)
        scrollTitleView.frame = CGRectMake(0, 200, UIScreen.mainScreen().bounds.size.width, 36)
        scrollTitleView.delegate = self
        scrollTitleView.initViewWithArray(["1","1","1","1"])
        self.view.addSubview(scrollTitleView)
    }
    //MARK: 实现ZXPersonView的代理
    func changeOffSetDelegate(index : CGFloat) {
        let index = subScrollView.contentOffset.x/screenW
        
    }
    //MARK: 标题栏滑动代理的实现
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        scrollTitleView.changeFrame(scrollView.contentOffset.x)
        //self.scrollViewChangeIndexWithBtnAppear()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

