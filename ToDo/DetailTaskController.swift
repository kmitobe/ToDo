//
//  DetailTaskController.swift
//  ToDo
//
//  Created by Kou on 2021/02/23.
//  Copyright © 2021 KouMitobe. All rights reserved.
//

import UIKit

class DetailTaskController: UIViewController {
    @IBOutlet weak var todoTitle: UITextField!
    
    var todoItem: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTitle.text = todoItem!
    }
    

    
    //画面遷移する前にtoDoItemを保存する
    //saveボタン
    @IBAction func saveButtonAction(_ sender: Any) {
        print("saveボタン押下")
        if let todoItemAfter  = self.todoTitle.text{
            if todoItemAfter != self.todoItem{
                print("アラート開始")
                //アラートを出現させて、処理を
                self.alertdefault()
                print("変更された")
                
            }else{
                //変更なければ、何もせず画面を戻す
                print("変更なし")
                //Navigation Controllerで制御されている画面遷移ツリーの中で、１つ前の階層に戻る
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    func alertdefault(){
        //アラート生成
        //UIAlertControllerのスタイルがalert
        let alert: UIAlertController = UIAlertController(title: "変更します", message:  "登録されたタスクを登録してよろしいですか？", preferredStyle:  UIAlertController.Style.alert)
        // 確定ボタンの処理
        let confirmAction: UIAlertAction = UIAlertAction(title: "確定", style: UIAlertAction.Style.default, handler:{
            // 確定ボタンが押された時の処理をクロージャ実装する
            (action: UIAlertAction!) -> Void in
            //実際の処理
            print("確定")
            //Navigation Controllerで制御されている画面遷移ツリーの中で、１つ前の階層に戻る
            self.navigationController?.popViewController(animated: true)
            print("戻る")
        })
        // キャンセルボタンの処理
        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
            // キャンセルボタンが押された時の処理をクロージャ実装する
            (action: UIAlertAction!) -> Void in

            //実際の処理
            print("キャンセル")

        })

        //UIAlertControllerにキャンセルボタンと確定ボタンをActionを追加
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)

        //実際にAlertを表示する
        present(alert, animated: true, completion: nil)
    }

}
