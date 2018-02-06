//
//  MineViewController.swift
//  Menfolk
//
//  Created by zhugy on 2018/1/15.
//  Copyright © 2018年 zhugy. All rights reserved.
//

import UIKit

class MineViewController: UIViewController {

    let label = UILabel(frame: CGRect(x: 100, y: 100, width: 300, height: 90))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        label.font = UIFont.systemFont(ofSize: 34)
        label.numberOfLines = 0
        let attributed = setTitleLabelWithMainStr(str: "时刻都能看出加的是", doubleStr: "2")
        label.attributedText = attributed
        label.textAlignment = .center
        
        view.addSubview(label)
        
        // Do any additional setup after loading the view.
    }
    /*
     - (void)setTitleLabelWithMainStr:(NSString *)str doubleStr:(NSString *)doubleStr {
     NSString *lastStr = str;
     BOOL isDouble = NO;
     NSString *headStr = @"";
     if (doubleStr.length > 0 && ![doubleStr isEqualToString:@"1"]) {
     headStr = [NSString stringWithFormat:@" 奖金x%@ ",doubleStr];
     lastStr = [NSString stringWithFormat:@"%@%@",headStr, str];
     isDouble = YES;
     }
     NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:lastStr];
     if (isDouble) {
     [attributed addAttributes:@{NSBackgroundColorAttributeName: [UIColor spt_colorWithHexString:@"fd5653"]} range:NSMakeRange(0, headStr.length)];
     [attributed addAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:10]} range:NSMakeRange(0, headStr.length)];
     [attributed addAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} range:NSMakeRange(0, headStr.length)];
     }
     
     self.titleLabel.attributedText = attributed;
     
     }
     
     */
    
    func setTitleLabelWithMainStr(str: String, doubleStr: String?) -> NSMutableAttributedString {
        
        var lastStr: String = str;
        var isDouble: Bool = false;
        var headStr: String = "";
        if let d = doubleStr, d != "1" {
            headStr = " 奖金x\(d) "
            lastStr = headStr + lastStr
            isDouble = true
        }
        
        let attributed = NSMutableAttributedString(string: lastStr)
        if isDouble {
            attributed.addAttributes([NSAttributedStringKey.backgroundColor: UIColor.red], range: NSRange(location: 0, length: headStr.count))
            attributed.addAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12)], range: NSRange(location: 0, length: headStr.count))
            attributed.addAttributes([NSAttributedStringKey.foregroundColor: UIColor.white], range: NSRange(location: 0, length: headStr.count))
        }
        return attributed
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
