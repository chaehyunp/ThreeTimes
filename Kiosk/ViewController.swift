//
//  ViewController.swift
//  Kiosk
//
//  Created by CHYUN on 11/25/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let productUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 8
        return view
    }()
    
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "붕어빵"
        label.backgroundColor = .gray
        label.textColor = .black
        label.font = .systemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
    let productPriceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.text = "1000원"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureUI()
        
        setupProductUIView()
    }
    
    func configureUI() {
        
        view.addSubview(productUIView)
        
        productUIView.addSubview(productImageView)
        productUIView.addSubview(productNameLabel)
        productUIView.addSubview(productPriceLabel)
        productUIView.addSubview(addButton)
        
    }
    
    // 그리드 안에 들어갈 UI뷰 오토레이아웃
    func setupProductUIView() {
        
        productUIView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(180)
            $0.width.equalTo(150)
        }
        
        // 이미지 뷰 오토레이아웃
        productImageView.snp.makeConstraints {
            $0.top.equalTo(productUIView.snp.top).inset(10)
            $0.leading.equalTo(productUIView.snp.leading).inset(10)
            $0.trailing.equalTo(productUIView.snp.trailing).inset(10)
            $0.height.equalTo(100)
        }
        
        // 상품이름 오토레이아웃
        productNameLabel.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(10)
        }
        
        // 상품가격 오토레이아웃
        productPriceLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(10)
            // $0.top.equalTo(productNameLabel.snp.bottom).offset(10)
        }
        
        // 버튼 오토레이아웃
        addButton.snp.makeConstraints {
            $0.bottom.equalTo(productUIView.snp.bottom).inset(10)
            $0.trailing.equalTo(productUIView.snp.trailing).inset(10)
        }
        
    }
    
    @objc func addButtonTapped() {
        print("상품이 추가되었습니다.")
        
    }
    

}

