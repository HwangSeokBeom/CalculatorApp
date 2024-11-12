//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Hwangseokbeom on 11/11/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        setupStackView()
    }
    
    private func configureLabel(){
        view.backgroundColor = .black
        
        label.text = "12345"
        label.backgroundColor = .black
        label.textColor = .white
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 60, weight: .bold)
        
        [label]
            .forEach{ view.addSubview($0) }
        
        label.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.top.equalToSuperview().offset(200)
            $0.height.equalTo(100)
        }
    }
    
    private func setupStackView(){
        
        let buttonTitles = ["7", "8", "9", "+"]
        var buttons: [UIButton] = []
        
        // 각 버튼 생성 및 배열에 추가
        for title in buttonTitles {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
            button.titleLabel?.font = .boldSystemFont(ofSize: 30)
            button.frame.size.height = 80
            button.frame.size.width = 80
            button.layer.cornerRadius = 40
            buttons.append(button)
        }
        
        // UIStackView 생성 및 속성 설정
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.backgroundColor = .black
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        // StackView를 뷰에 추가
        [stackView]
            .forEach{ view.addSubview($0) }
        
         //SnapKit으로 제약 추가
        stackView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.width.equalTo(350)
            $0.height.equalTo(80)
            //$0.width.equalTo(80)
        }
    }

}
