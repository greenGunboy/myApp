//
//  timeEditViewController.swift
//  myApp
//
//  Created by Tsubasa Takahashi on 2016/02/16.
//  Copyright © 2016年 Tsubasa Takahashi. All rights reserved.
//

import UIKit

class timeEditViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    
    @IBOutlet weak var decideBtn: UIButton!
    @IBOutlet weak var animeBtn: SpringButton!
    @IBOutlet weak var myMinTimePicker: UIPickerView!
    @IBOutlet weak var mySecTimePicker: UIPickerView!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var animaAdd: SpringButton!
    
    var userDecideMinTime = ""
    var userDecideSecTime = ""
    var min = 0
    var sec = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topColor = UIColor(red:0, green:0.5, blue:1, alpha:1)
        let midColor = UIColor(red:0, green:0.5, blue:1, alpha:1)
        let mid2Color = UIColor(red:0, green:0.5, blue:1, alpha:1)
        let mid3Color = UIColor(red:0, green:0.5, blue:1, alpha:1)
        let mid4Color = UIColor(red:0, green:0.55, blue:1, alpha:1)
        let bottomColor = UIColor(red:0, green:0.75, blue:1, alpha:1)
        
        let gradientColors: [CGColor] = [topColor.CGColor,midColor.CGColor,mid2Color.CGColor, mid3Color.CGColor, mid4Color.CGColor, bottomColor.CGColor]
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColors
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        
        animeBtn.layer.borderWidth = 9
        animeBtn.layer.borderColor = UIColor.whiteColor().CGColor
        animaAdd.layer.borderWidth = 9
        animaAdd.layer.borderColor = UIColor.whiteColor().CGColor
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        myMinTimePicker.dataSource = self
        myMinTimePicker.delegate = self
        mySecTimePicker.dataSource = self
        mySecTimePicker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            min = row
        }
        
        if pickerView.tag == 2{
            sec = row
        }
    }
  
    
    @IBAction func changeBtn(sender: AnyObject) {
        
        if min == 0 && sec == 0{
            animeBtn.animation = "squeeze"
            animeBtn.animate()
            let alertController = UIAlertController(title: "0秒以上に設定してください", message: nil, preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }else{
            animeBtn.animation = "squeeze"
            animeBtn.animate()
            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            appDelegate.startMin = min
            appDelegate.startSec = sec
            appDelegate.startFlg = true
        }
    }
    
    
    @IBAction func addActionBtn(sender: UIButton) {
        
        animaAdd.animation = "squeeze"
        animaAdd.animate()
        
        if myTextField.text != ""{
//            テキスト内のデータをString型として変数へ
            var text : String = myTextField.text!
//            ドキュメントパス。ドキュメントディレクトリ内のplistを読み込み
            let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
            let fileName = "words.plist"
            var filePath = documentsPath + "/" + fileName
            var objects = NSMutableDictionary(contentsOfFile: filePath)
//            データが無ければ
            if objects == nil {
//            アプリ内plist読み込み
                var bundleFilePath = NSBundle.mainBundle().pathForResource("wordsList", ofType: "plist")
                objects = NSMutableDictionary(contentsOfFile: bundleFilePath!)
            }
//            Dictionary内のwords内のデータを変数へ
            var addInt = objects!["words"] as! NSMutableDictionary
//            add.Intをkey、textをvalueとしてDictionaryに追加
            addInt.setValue(text, forKey: "\(addInt.count)" as! String)
//            追加したデータを上書き
            objects!["words"] = addInt
//            plistへ書き込み
            objects?.writeToFile(filePath, atomically: true)
            print(addInt)
            
            let alertController = UIAlertController(title: "\(text)を保存しました", message: nil, preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
            
        }else{
            let alertController = UIAlertController(title: "何も入力されていません", message: "追加したいワードを入力してください", preferredStyle: .Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func addText(sender: AnyObject) {
        
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
