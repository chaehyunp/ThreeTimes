import Foundation

struct Product {
    let img: String
    let name: String
    let price: String
}

//struct SampleData {
//    static let productCategories: [String: [Product]] = [
//        "붕어빵": [
//            Product(name: "팥 붕어빵", price: "1,000원"),
//            Product(name: "슈크림 붕어빵", price: "1,000원"),
//            Product(name: "피자 붕어빵", price: "1,500원"),
//            Product(name: "초코 붕어빵", price: "1,500원"),
//            Product(name: "딸기 붕어빵", price: "2,000원")
//        ],
//        "호떡": [
//            Product(name: "꿀 호떡", price: "1,200원"),
//            Product(name: "씨앗 호떡", price: "1,500원"),
//            Product(name: "공갈 호떡", price: "1,800원"),
//            Product(name: "초코 호떡", price: "2,000원")
//        ]
//    ]
//    // Segmented Control Titles
//    static let segmentedControlTitles = ["전체", "붕어빵", "호떡", "기타"]
//}

struct ProductData {
    static let productCategories: [String: [Product]] = [
        "붕어빵": [
            Product(img: "ImgFishBunRedBean", name: "팥 붕어빵", price: "1,000원"),
            Product(img: "ImgFishBunCustard", name: "슈크림 붕어빵", price: "1,000원"),
            Product(img: "ImgFishBunCheese", name: "치즈 붕어빵", price: "1,500원"),
            Product(img: "ImgFishBunChoco", name: "초코 붕어빵", price: "1,500원"),
            Product(img: "ImgFishBunPizza", name: "피자 붕어빵", price: "2,000원"),
            Product(img: "ImgFishBunMatcha", name: "말차 붕어빵", price: "2,000원")
        ],
        "호떡/호빵": [
            Product(img: "ImghoppangHoney", name: "꿀 호떡", price: "1,200원"),
            Product(img: "ImghoppangBubble", name: "공갈 호떡", price: "1,800원"),
            Product(img: "ImghoppangRedBean", name: "팥 호빵", price: "2,000원"),
            Product(img: "ImghoppangMatcha", name: "녹차 호빵", price: "2,000원"),
            Product(img: "ImghoppangChoco", name: "초코 호빵", price: "2,000원"),
        ],
        "닭꼬치": [
            Product(img: "ImgSkewerSoySauce", name: "간장 닭꼬치", price: "1,200원"),
            Product(img: "ImgSkewerGreenOnion", name: "파닭꼬치", price: "1,500원"),
            Product(img: "ImgSkewerHotFried", name: "핫후라이드 닭꼬치", price: "1,800원"),
            Product(img: "ImgSkewerFried", name: "후라이드 닭꼬치", price: "2,000원"),
            Product(img: "ImgSkewerHotBar", name: "핫바", price: "2,000원")
        ],
        "기타": [
            Product(img: "ImgRoastedChestnuts", name: "군밤", price: "1,200원"),
            Product(img: "ImgRoastedSweetPotatoes", name: "군고구마", price: "1,500원"),
            Product(img: "ImgTakoyaki", name: "타코야끼", price: "1,800원"),
            Product(img: "ImgtenWonBread", name: "십원빵", price: "2,000원"),
            Product(img: "ImgDeliManju", name: "델리만쥬", price: "2,000원")
        ]
    ]
    // Segmented Control Titles
    static let segmentedControlTitles = ["붕어빵", "호떡/호빵", "닭꼬치", "기타"]
}


