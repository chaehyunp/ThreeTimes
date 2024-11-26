import UIKit
import SnapKit
import SwiftUI

class ViewController: UIViewController {
    
    // 첫 번째 상품
    private let productLabel1: UILabel = {
        let label = UILabel()
        label.text = "피자 붕어빵" // 상품명
        label.font = .systemFont(ofSize: 17)
        label.textColor = UIColor(red: 0.503, green: 0.502, blue: 0.502, alpha: 1)
        return label
    }()
    
    private let minusButton1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("−", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = UIColor(red: 198/255, green: 178/255, blue: 165/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.tintColor = .white
        return button
    }()
    
    private let quantityLabel1: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let plusButton1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = UIColor(red: 198/255, green: 178/255, blue: 165/255, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.tintColor = .white
        return button
    }()
    
    private let priceLabel1: UILabel = {
        let label = UILabel()
        label.text = "2,400원" // 가격 표시
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(red: 0.647, green: 0.647, blue: 0.647, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    
    private let deleteButton1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("×", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23)
        button.layer.cornerRadius = 15
        button.tintColor = .black
        return button
    }()
    
    // 두 번째 상품
    private let productLabel2: UILabel = {
        let label = UILabel()
        label.text = "공갈 호떡" // 상품명
        label.font = .systemFont(ofSize: 17)
        label.textColor = UIColor(red: 0.503, green: 0.502, blue: 0.502, alpha: 1)
        return label
    }()
    
    private let minusButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("−", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = UIColor(red: 198/255, green: 178/255, blue: 165/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.tintColor = .white
        return button
    }()
    
    private let quantityLabel2: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let plusButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = UIColor(red: 198/255, green: 178/255, blue: 165/255, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.tintColor = .white
        return button
    }()
    
    private let priceLabel2: UILabel = {
        let label = UILabel()
        label.text = "1,800원" // 가격 표시
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(red: 0.647, green: 0.647, blue: 0.647, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    
    private let deleteButton2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("×", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23)
        button.layer.cornerRadius = 15
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        // 첫 번째 상품 StackView
        let quantityStackView1 = UIStackView(arrangedSubviews: [minusButton1, quantityLabel1, plusButton1])
        quantityStackView1.axis = .horizontal
        quantityStackView1.spacing = 1
        quantityStackView1.alignment = .center
        
        let mainStackView1 = UIStackView(arrangedSubviews: [productLabel1, quantityStackView1, priceLabel1, deleteButton1])
        mainStackView1.axis = .horizontal
        mainStackView1.spacing = 10
        mainStackView1.alignment = .center
        mainStackView1.distribution = .fillProportionally
        
        // 두 번째 상품 StackView
        let quantityStackView2 = UIStackView(arrangedSubviews: [minusButton2, quantityLabel2, plusButton2])
        quantityStackView2.axis = .horizontal
        quantityStackView2.spacing = 1
        quantityStackView2.alignment = .center
        
        let mainStackView2 = UIStackView(arrangedSubviews: [productLabel2, quantityStackView2, priceLabel2, deleteButton2])
        mainStackView2.axis = .horizontal
        mainStackView2.spacing = 10
        mainStackView2.alignment = .center
        mainStackView2.distribution = .fillProportionally
        
        // 두 상품을 수직으로 배치할 StackView
        let verticalStackView = UIStackView(arrangedSubviews: [mainStackView1, mainStackView2])
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 20 // 상품 간 간격
        verticalStackView.alignment = .fill
        
        // StackView를 View에 추가
        view.addSubview(verticalStackView)
        
        // AutoLayout 설정!
        verticalStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(17) // 좌우 여백
        }
        
        minusButton1.snp.makeConstraints { make in
            make.width.height.equalTo(30) // 버튼 크기
        }
        
        plusButton1.snp.makeConstraints { make in
            make.width.height.equalTo(30) // 버튼 크기
        }
        
        quantityLabel1.snp.makeConstraints { make in
            make.width.equalTo(40) // 수량 표시 크기
        }
        
        deleteButton1.snp.makeConstraints { make in
            make.width.height.equalTo(35) // 삭제 버튼 크기
        }
        
        minusButton2.snp.makeConstraints { make in
            make.width.height.equalTo(30) // 버튼 크기
        }
        
        plusButton2.snp.makeConstraints { make in
            make.width.height.equalTo(30) // 버튼 크기
        }
        
        quantityLabel2.snp.makeConstraints { make in
            make.width.equalTo(40) // 수량 표시 크기
        }
        
        deleteButton2.snp.makeConstraints { make in
            make.width.height.equalTo(35) // 삭제 버튼 크기
        }
    }
}

// UIViewControllerRepresentable
struct ViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

#Preview("ViewController") {
    ViewControllerPreview()
}
