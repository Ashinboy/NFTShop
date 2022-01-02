//
//  shoppingNFT.swift
//  NFTShop
//
//  Created by Ashin Wang on 2021/12/29.
//

import UIKit

class shoppingNFT: UITableViewController {

    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let adboredApe = ["BA01","BA02","BA03","BA04","BA05"]
    var index:Int = 0
    
    //PriceLabel
    @IBOutlet weak var ba01Price: UILabel!
    @IBOutlet weak var ba02Price: UILabel!
    @IBOutlet weak var ba03Price: UILabel!
    @IBOutlet weak var ba04Price: UILabel!
    @IBOutlet weak var ba05Price: UILabel!
    
    
    //textView
    
    @IBOutlet weak var ba1Text: UILabel!
    @IBOutlet weak var ba2Text: UILabel!
    @IBOutlet weak var ba3Text: UILabel!
    @IBOutlet weak var ba4Text: UILabel!
    @IBOutlet weak var ba5Text: UILabel!
    
    
    
    //stepper
    @IBOutlet weak var ba01Stepper: UIStepper!
    @IBOutlet weak var ba02Stepper: UIStepper!
    @IBOutlet weak var ba03Stepper: UIStepper!
    @IBOutlet weak var ba04Stepper: UIStepper!
    @IBOutlet weak var ba05Stepper: UIStepper!
    
    
    //total
    
    @IBOutlet weak var totalBtn: UILabel!
    @IBOutlet weak var cleanBtn: UIButton!
    
    
    
    
    var ba01:Int = 0
    var ba02:Int = 0
    var ba03:Int = 0
    var ba04:Int = 0
    var ba05:Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //項目價格
        
        ba01Price.text = "69"
        ba02Price.text = "15"
        ba03Price.text = "2077"
        ba04Price.text = "15.88"
        ba05Price.text = "24.31"
        
        
    }

    @IBAction func bannerPage(_ sender: UIPageControl) {
        index = sender.currentPage
        topImage.image = UIImage(named: adboredApe[index])
    }
    
    
    //action
    @IBAction func ba1Stepper(_ sender: UIStepper) {
        
        //將Stepper的數量顯示到text上
        
        ba01 = Int(ba01Stepper.value)
        ba02 = Int(ba02Stepper.value)
        ba03 = Int(ba03Stepper.value)
        ba04 = Int(ba04Stepper.value)
        ba05 = Int(ba05Stepper.value)
        
        ba1Text.text = String(ba01)
        ba2Text.text = String(ba02)
        ba3Text.text = String(ba03)
        ba4Text.text = String(ba04)
        ba5Text.text = String(ba05)
        
//        ba1Text.text = String(ba01)
//        ba2Text.text = String(ba02)
//        ba3Text.text = String(ba03)
//        ba4Text.text = String(ba04)
//        ba5Text.text = String(ba05)
        
        calculate()
        
    }
    
    @IBAction func cleanAll(_ sender: UIButton) {
        ba01Stepper.value = 0
        ba02Stepper.value = 0
        ba03Stepper.value = 0
        ba04Stepper.value = 0
        ba05Stepper.value = 0
        
        ba1Text.text = "0"
        ba2Text.text = "0"
        ba3Text.text = "0"
        ba4Text.text = "0"
        ba5Text.text = "0"
        
        totalBtn.text = "0"
    }
    
    
    //計算總額
    func calculate() {
        let ba01pic = Float(ba01Price.text!)!
        let ba02pic = Float(ba02Price.text!)!
        let ba03pic = Float(ba03Price.text!)!
        let ba04pic = Float(ba04Price.text!)!
        let ba05pic = Float(ba05Price.text!)!
        
        let sum = ba01pic * Float(ba01) + ba02pic * Float(ba02) + ba03pic * Float(ba03) + ba04pic * Float(ba04) + ba05pic * Float(ba05)
        
        //轉成特定字串格式:像是帶金錢符號的
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        //將數字轉為字串，最後顯示在Label上
        let moneyString = formatter.string(from: NSNumber(value: sum))
        
        totalBtn.text = "\(moneyString!)ETH"
        
    }
}
