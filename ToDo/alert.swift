////
////  alert.swift
////  ToDo
////
////  Created by Kou on 2021/02/27.
////  Copyright © 2021 KouMitobe. All rights reserved.
////
//
//import Foundation
//import UIKit
//extension UIViewController{
//    func alertdefault(){
//        //アラート生成
//        //UIAlertControllerのスタイルがalert
//        let alert: UIAlertController = UIAlertController(title: "変更します", message:  "登録されたタスクを登録してよろしいですか？", preferredStyle:  UIAlertController.Style.alert)
//        // 確定ボタンの処理
//        let confirmAction: UIAlertAction = UIAlertAction(title: "確定", style: UIAlertAction.Style.default, handler:{
//            // 確定ボタンが押された時の処理をクロージャ実装する
//            (action: UIAlertAction!) -> Void in
//            //実際の処理
//            print("確定")
//            //
//
//        })
//        // キャンセルボタンの処理
//        let cancelAction: UIAlertAction = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler:{
//            // キャンセルボタンが押された時の処理をクロージャ実装する
//            (action: UIAlertAction!) -> Void in
//            //実際の処理
//            print("キャンセル")
//
//        })
//
//        //UIAlertControllerにキャンセルボタンと確定ボタンをActionを追加
//        alert.addAction(cancelAction)
//        alert.addAction(confirmAction)
//
//        //実際にAlertを表示する
//        present(alert, animated: true, completion: nil)
//        print("アラート開始")
//    }
//}
