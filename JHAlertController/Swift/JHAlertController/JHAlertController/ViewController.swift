//
//  ViewController.swift
//  JHAlertController
//
//  Created by HaoCold on 2023/4/26.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        btn.backgroundColor = .gray
        btn.setTitle("图片", for: .normal)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        view.addSubview(btn)
        btn.center = view.center
        
        do {
            let btn1 = UIButton(type: .custom)
            btn1.frame = btn.frame.offsetBy(dx: 0, dy: 70)
            btn1.backgroundColor = .gray
            btn1.setTitle("自定义视图", for: .normal)
            btn1.addTarget(self, action: #selector(buttonAction1), for: .touchUpInside)
            view.addSubview(btn1)
        }
    }

    @objc private func buttonAction() {
        let alert = UIAlertController.init(title: "请使用微信扫描二维码", image: "qrxgame", imageSize: CGSize(width: 120, height: 120), preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "好的", style: .default))
        present(alert, animated: true)
    }
    
    @objc private func buttonAction1() {
        let view = UIView()
        view.backgroundColor = .orange
        view.frame = CGRect(x: 0, y: 0, width: 200, height: 120)
        
        let label = UILabel()
        label.text = "文本文本"
        label.frame = view.bounds
        label.textAlignment = .center
        view.addSubview(label)
        
        let alert = UIAlertController.init(title: "请使用微信扫描二维码", contentView: view, viewSize: view.frame.size, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "好的", style: .default))
        present(alert, animated: true)
    }
}

