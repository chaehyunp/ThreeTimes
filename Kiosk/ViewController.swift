//
//  ViewController.swift
//  Kiosk


import UIKit
import SnapKit
// <<<<<<< feat_yj

class ViewController: UIViewController {
  
   // Mark: - 영진님 구현부
    
    private let productUIView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        return view
    }()
    
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    private let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "붕어빵"
        label.backgroundColor = .white
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let productPriceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "1,000원"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let productLabelStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 4
        sv.alignment = .leading
        return sv
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        if let buttonImage = UIImage(named: "addButtonIcon") {
            button.setBackgroundImage(buttonImage, for: .normal)
        }
        button.layer.cornerRadius = 17
//        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    

    
    private func configureUI() {
        
        view.addSubview(productUIView)
        
        productUIView.addSubview(productImageView)
        
        productLabelStackView.addArrangedSubview(productNameLabel)
        productLabelStackView.addArrangedSubview(productPriceLabel)
        
        productUIView.addSubview(productLabelStackView)
        productUIView.addSubview(addButton)
        
    }
    
    // 컬렉션뷰 안에 들어갈 UI뷰 오토레이아웃
    private func setupProductUIView() {
        
        // UI뷰 오토레이아웃
        productUIView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(186)
            $0.width.equalTo(173)
        }
        
        // 이미지 뷰 오토레이아웃
        productImageView.snp.makeConstraints {
            $0.top.equalTo(productUIView.snp.top).inset(12)
            $0.leading.equalTo(productUIView.snp.leading).inset(12)
            $0.trailing.equalTo(productUIView.snp.trailing).inset(12)
            $0.height.equalTo(112)
        }
        
        // 상품 이름,가격 스택뷰 오토레이아웃
        productLabelStackView.snp.makeConstraints {
            $0.bottom.equalTo(productUIView.snp.bottom).inset(12)
            $0.leading.equalTo(productUIView.snp.leading).inset(8)
        }
        
        // 버튼 오토레이아웃
        addButton.snp.makeConstraints {
            $0.bottom.equalTo(productUIView.snp.bottom).inset(16)
            $0.trailing.equalTo(productUIView.snp.trailing).inset(8)
        }
        
    }
    
    @objc private func addButtonTapped() {
        print("상품이 추가되었습니다.")
        
    }
    
  
    // Mark: - 솔님 구현부
    
    // 상품 이름 Label
    private let productLabel: UILabel = {
        let label = UILabel()
        label.text = "피자 붕어빵" // 상품명
        label.font = .systemFont(ofSize: 17)
        // #808080 색상을 UIColor로 변환하여 적용
        label.textColor = UIColor(red: 0.503, green: 0.502, blue: 0.502, alpha: 1)
        return label
    }()
    
    // 갯수 조절(-)
    private let minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("−", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        // #C6B2A5 색상을 UIColor로 변환하여 적용
        button.backgroundColor = UIColor(red: 198/255, green: 178/255, blue: 165/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.tintColor = .white
        return button
    }()
    
    // 갯수 표시 Label
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    // 갯수 조절 (+)
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        // #C6B2A5 색상을 UIColor로 변환하여 적용
        button.backgroundColor = UIColor(red: 198/255, green: 178/255, blue: 165/255, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.tintColor = .white
        return button
    }()
    
    // 가격 표시 Label
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "2,400원" // 가격 표시
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(red: 0.647, green: 0.647, blue: 0.647, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    
    // 삭제 버튼 (×)
    private let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("×", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23)
        button.layer.cornerRadius = 15
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .white
        view.backgroundColor = .gray
        // 가독성 향상!
        setupUI()
        
        configureUI()
        setupProductUIView()
    }

    
    private func setupUI() {
        // StackView 생성
        let quantityStackView = UIStackView(arrangedSubviews: [minusButton, quantityLabel, plusButton])
        quantityStackView.axis = .horizontal
        quantityStackView.spacing = 1
        quantityStackView.alignment = .center
        
        let mainStackView = UIStackView(arrangedSubviews: [productLabel, quantityStackView, priceLabel, deleteButton])
        mainStackView.axis = .horizontal
        mainStackView.spacing = 10
        mainStackView.alignment = .center
        mainStackView.distribution = .fillProportionally
        
        // StackView를 View에 추가
        view.addSubview(mainStackView)
        
        // AutoLayout 설정!
        mainStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(17) // 좌우 여백
        }
        
        minusButton.snp.makeConstraints { make in
            make.width.height.equalTo(30) // 버튼 크기
        }
        
        plusButton.snp.makeConstraints { make in
            make.width.height.equalTo(30) // 버튼 크기
        }
        
        quantityLabel.snp.makeConstraints { make in
            make.width.equalTo(40) // 수량 표시 크기
        }
        
        deleteButton.snp.makeConstraints { make in
            make.width.height.equalTo(35) // 삭제 버튼 크기
        }
    }
}

//// UIViewControllerRepresentable
//struct ViewControllerPreview: UIViewControllerRepresentable {
//    func makeUIViewController(context: Context) -> UIViewController {
//        return ViewController()
//    }
//    
//    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
//}
//
//#Preview("ViewController") {
//    ViewControllerPreview()
//}
