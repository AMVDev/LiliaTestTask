//
//  ViewController.swift
//  LiliaTestTask
//
//  Created by andreworphan on 16.01.17.
//  Copyright © 2017 andreworphan. All rights reserved.
//

import UIKit
import Alamofire//очень удобная библиотека для работы с сервером

extension UIView {
    
    var topSuperview: UIView? {
        var view = superview
        while view?.superview != nil {
            view = view!.superview
        }
        return view
    }
    
    func endTextEditing() {
        let tap = UITapGestureRecognizer()
        tap.addTarget(self, action: #selector(dissmisKeyboard))
        
        addGestureRecognizer(tap)
    }
    
    func dissmisKeyboard(){
        topSuperview?.endEditing(true)
    }
}//это сделано для того, что бы я мог из любой части проджекта закрывать клавиатуру в одну строчку


class ViewController: UIViewController {

    @IBOutlet weak var translatedTextLabel: UILabel!
    @IBOutlet weak var enTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.endTextEditing()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func getTranslatedText(_ sender: Any) {
        let key = "trnsl.1.1.20170117T033624Z.594c360e1b2b6983.0b0a8278c3947186f7332b20738b831da1812ff4" // ключ АПИ
        let cont = self.enTextField.text?.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) // нужно пробелы правильно заполнить
        Alamofire.request("https://translate.yandex.net/api/v1.5/tr.json/translate?key=" + key + "&lang=ru-en&text=" + cont! + "&format=html").responseJSON { response in // запросик и ответик

            if let jsonData = response.result.value as! NSDictionary! {
                self.translatedTextLabel.text = String(describing: jsonData["text"]!)
            }
        }
        
    }

}

