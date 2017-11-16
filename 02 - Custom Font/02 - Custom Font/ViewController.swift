//
//  ViewController.swift
//  02 - Custom Font
//
//  Created by Andy Tsai on 16/11/2017.
//  Copyright © 2017 Andy Tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var label: UILabel!
    
    var pickerView: UIPickerView!
    
    var fonts = ["Default", "shark party", "comic Book", "BadaBoom BB", "SF Cartoonist Hand"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        label.text = "Default"
        label.font = UIFont.preferredFont(forTextStyle: .body).withSize(70)
        label.sizeToFit()
        label.frame = CGRect(
            x: view.frame.width / 2 - label.frame.width / 2,
            y: view.frame.height / 4 - label.frame.height / 2,
            width: label.frame.width,
            height: label.frame.height
        )
        
        view.addSubview(label)
        
        pickerView = UIPickerView(frame: CGRect(
            x: 0,
            y: view.frame.height - view.frame.height / 2,
            width: view.frame.width,
            height: view.frame.height / 2
        ))
        pickerView.backgroundColor = .black
        
        view.addSubview(pickerView)
        
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return pickerView.frame.height / 5
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect.zero)
        
        if fonts[row] == "Default" {
            label.font = UIFont.systemFont(ofSize: 40)
        } else {
            label.font = UIFont(name: fonts[row], size: 40)
        }
        
        label.text = fonts[row]
        label.textColor = .white
        label.sizeToFit()
        
        return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.backgroundColor = .black
        }) { (finished) in
            
            if (finished) {
                if self.fonts[row] == "Default" {
                    self.label.font = UIFont.systemFont(ofSize: 50)
                } else {
                    self.label.font = UIFont(name: self.fonts[row], size: 50)
                }
                
                self.label.text = self.fonts[row]
                self.label.sizeToFit()
                self.label.frame = CGRect(
                    x: self.view.frame.width / 2 - self.label.frame.width / 2,
                    y: self.view.frame.height / 4 - self.label.frame.height / 2,
                    width: self.label.frame.width,
                    height: self.label.frame.height
                )
                
                UIView.animate(withDuration: 1, animations: {
                    self.view.backgroundColor = .white
                })
            }
            
        }
    }
}

