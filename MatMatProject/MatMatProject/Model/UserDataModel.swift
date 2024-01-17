//
//  UserDataModel.swift
//  MatMatProject
//
//  Created by 정운관 on 1/17/24.
//

// 효도별 맛집 :
// 유저별 맛집
// 사진, 별점 , 이모지 , 아이디 , 게시물 작성 일자, 게시물 내용 , 태그 , 찜
// 태그 -> #효도맛집 -> 모델에 들어가는거죠 효도
// (우리 회사가 추천하는) 맛집

import Foundation

enum Tag : String , CaseIterable{
    case hyodo = "효도별 맛집"
    case dating = "데이튜 맛집"
    case alchol = "애주가 맛집"
    case something = "분위기 맛집"
}

struct User {
    var id : String
    var date : String
    var emoji : String
    var content : String
    var star : String
    var pin : Bool // 찜 여부
    var food : Food
}

struct Food {
    var name : String
    var foodTag : Tag
    var image : [String]
    var webLink : String
    var address : String
    var latitude : Double
    var longitude : Double
}

class DataManger {
    //유저 데이터를 담을 공간
    //밖에서 수정못하게 private
    private var userDataArray : [User] = []
    private var foodDataArray : [Food] = []
    
    init () {
        foodDataArray = [
            Food(name: "약수터식당", foodTag: .hyodo, image: getImageData(name: "약수터식당"), webLink: "https://m.place.naver.com/restaurant/18557324/home", address: "경기 안성시 양성면 만세로 667", latitude: 37.0600856, longitude: 127.190229),
            Food(name: "진가", foodTag: .alchol, image: getImageData(name: "진가"), webLink: "https://m.place.naver.com/restaurant/1940095324/location?subtab=location&selected_place_id=1940095324", address: "서울 마포구 동교로34길 12 2층 진가", latitude: 37.5609102, longitude: 126.9249441),
            Food(name: "한울밥상", foodTag: .hyodo, image: getImageData(name: "한울밥상"), webLink: "https://m.place.naver.com/restaurant/36668406/home", address: "전북 전주시 완산구 기린대로 104", latitude: 35.818719, longitude: 127.1548823),
            Food(name: "진미집", foodTag: .alchol, image: getImageData(name: "진미집"), webLink: "https://m.place.naver.com/restaurant/11710234/home", address: "전북 전주시 완산구 노송여울2길 106", latitude: 35.8268518, longitude: 127.1424212),
            Food(name: "당산옛날곱창", foodTag: .alchol, image: getImageData(name: "당산옛날곱창"), webLink: "https://m.place.naver.com/restaurant/36028358/home", address: "서울특별시 영등포구 당산동6가 당산로47길 14", latitude: 37.5353365, longitude: 126.9022659),
            Food(name: "밀리네 감자탕", foodTag: .alchol, image: getImageData(name: "밀리네 감자탕"), webLink: "", address: "충북 단양군 단양읍 삼봉로 272 미락", latitude: 36.9808793, longitude: 128.3688421),
            Food(name: "포유티", foodTag: .dating, image: getImageData(name: "포유티"), webLink: "https://m.place.naver.com/restaurant/37912977/home", address: "서울 송파구 위례성대로18길 28-13", latitude: 37.5100233, longitude: 127.1242478),
            Food(name: "풍류랑", foodTag: .something, image: getImageData(name: "풍류랑"), webLink: "https://m.place.naver.com/restaurant/1809480572/home", address: "서울 강남구 논현로28길 24 풍류랑", latitude: 37.4831707, longitude: 127.0444),
            Food(name: "장어독립", foodTag: .hyodo, image: getImageData(name: "장어독립"), webLink: "https://m.place.naver.com/restaurant/20713456/home", address: "경기 양주시 백석읍 양주산성로 460", latitude: 37.7852556, longitude: 127.0029126),
            Food(name: "타마", foodTag: .dating, image: getImageData(name: "타마"), webLink: "https://m.place.naver.com/restaurant/20083721/home", address: "서울 영등포구 은행로 30 1층", latitude: 37.5281888, longitude: 126.9227229),
            Food(name: "도동집", foodTag: .something, image: getImageData(name: "도동집"), webLink: "https://m.place.naver.com/restaurant/37641712/home", address: "서울 용산구 후암로48길 1", latitude: 37.5528883, longitude: 126.9768823),
            Food(name: "삼청동수제비", foodTag: .hyodo, image: getImageData(name: "삼청동수제비"), webLink: "https://m.place.naver.com/restaurant/11569605/home", address: "서울 종로구 삼청로 101-1", latitude: 37.5844951, longitude: 126.9818969),
            Food(name: "서촌뜰애우곱창타운", foodTag: .alchol, image: getImageData(name: "서촌뜰애우곱창타운"), webLink: "https://m.place.naver.com/restaurant/92055122/home", address: "서울 종로구 자하문로1나길 1", latitude: 37.5765641, longitude: 126.9716148),
            Food(name: "파파라구", foodTag: .dating, image: getImageData(name: "파파라구"), webLink: "https://m.place.naver.com/restaurant/1013295267/home", address: "경기 성남시 분당구 판교역로10번길 22-3", latitude: 37.3856782, longitude: 127.1119632),
            Food(name: "또순이네집", foodTag: .hyodo, image: getImageData(name: "또순이네집"), webLink: "https://m.place.naver.com/restaurant/1232888128/location?subtab=location&selected_place_id=1232888128", address: "서울 영등포구 선유로47길 16 오오1004빌딩", latitude: 37.5357487, longitude: 126.8952452),
            Food(name: "몽탄", foodTag: .hyodo, image: getImageData(name: "몽탄"), webLink: "https://m.place.naver.com/restaurant/1810277002/location?subtab=location&selected_place_id=1810277002" , address: "서울 용산구 백범로99길 50", latitude: 37.535959, longitude: 126.9722312
                ),
            Food(name: "운봉산장", foodTag: .hyodo, image: getImageData(name: "운봉산장"), webLink: "https://m.place.naver.com/restaurant/19867548/location?subtab=location&selected_place_id=19867548", address: "서울 동작구 장승배기로 118-1", latitude: 37.5080646, longitude: 126.9403207)
            
        ]
        userDataArray = [
            
            User(id: "udi", date: "2024-01-17", emoji: "😁", content: "가격 대비 만족도가 높은 이 음식점은 특히 반찬 다양성에서 빛을 발합니다. 테이블에 나온 반찬은 엄청나게 다양했고, 각각의 맛이 정말 훌륭했습니다. 고기와 해산물, 채소 등 다양한 식재료를 사용하여 조리한 반찬들은 정갈하면서도 맛있게 느껴졌습니다.가격은 적당한 편이었고, 이에 대한 가치를 느낄 수 있었습니다. 양도 푸짐하게 제공되어 가족끼리 함께 나누며 먹을 만큼 충분했습니다. 서비스도 친절하고 신속해서 기분 좋게 식사를 할 수 있었습니다.한식 백반을 좋아하는 분들에게 강력하게 추천하고 싶은 음식점이었습니다. 다양한 반찬과 적당한 가격, 훌륭한 서비스로 부모님과의 소중한 시간을 더욱 특별하게 만들어준 곳이었습니다. 다음에도 기회가 된다면 꼭 다시 방문하고 싶은 곳입니다", star: "4.6/5.0", pin: false, food: getFoodData(name: "운봉산장")),
            
            User(id: "Gwan", date: "2024-01-17", emoji: "🥘", content: "뼈다귀 해장국 드세요 얼큰 안먹으면 쫄보", star: "4.7/5.0", pin: false, food: getFoodData(name:"밀리네 감자탕")),
            
            User(id: "seung", date: "2024-01-17", emoji: "😆", content: """
            곱창의 풍부한 맛과 다양한 메뉴, 친절한 서비스로 손님을 맞이하는 '당산옛날곱창'은 소규모 소셜 모임이나 가족 모임에 적합한 맛집으로  가격은 조금 높지만 👍🏻, 훌륭한 맛과 분위기로 보상받을 수 있는 곳이에요~
            """, star: "4.5/5.0", pin: false, food: getFoodData(name: "당산옛날곱창")),
            
            User(id: "soYoung", date: "2024-01-17", emoji: "😁", content:"""
"서울의 쓰레기, 양고기 수육 맛없는 녀석들!"

안녕, 맛집 잡것들! 오늘은 내가 방금 다녀온 서울의 최악 맛집을 소개할게. 양고기 수육? 개념도 없는 녀석들이 운영하는 곳이야. 여긴 나만 봐도 찾기 힘들지만, 찾으면 '왜 여긴 왔지?'하는 후회만 가득할 거야.

위치: 서울에서 가장 구린 골목에 위치한 이 장소는 찾아오기가 정말 지옥 같아. 왜냐면 여긴 정말 가치 없는 공간이거든.

분위기: 숨겨진 맛집이라 했지만, 사실 여긴 그냥 음산한 공간이라고 밖에 표현 못할 거야. 내부는 산소 부족으로 숨 쉴 수 없고, 조명은 딱 그 정도로 음침하게 조성돼 있어. 먹는 동안에도 귀신같은 분위기가 계속 따라다닐 거야.

서비스: 무서움 속에서 더한 차가움, 직원들은 그냥 너를 무시하는 눈치로 응대할 거야. 이딴 곳에서 기대할 건 없다는 걸 느끼게 될 거야.

음식: 양고기 수육? 이건 뭐랄까, 너무 기대하지 마. 쓰레기 같은 양고기와 지저분한 수육이 접시에 올라오면 너의 입맛은 아무리 기대해봐도 충족시키지 못할 거야. 맛도 없고 특별한 게 없어.

이 곳은 정말 서울의 최악 중 최악 맛집이야. 뭐, 참고로 가지 말라고 하는 거야. 굳이 이딴 곳에 시간 낭비할 필요 없다구!
""", star: "2.0/5.0", pin: false, food: getFoodData(name: "운봉산장")),
            
            User(id: "e._.z", date: "2024-01-17", emoji: "💕", content: """
패티가 살살 녹고, 햄버거집인데 인테리어가 한옥스타일이어서 너무 신기했어요!
그리고 꼭 트러플 감자튀김(현재는 단종..안됌...) 세트로 드셔보세요!! 비싸지만..💸  한번쯤 맛보셔두 좋을것같아요~~ 😇
맛은 5.0이지만 가격이 넘 비싸서 3.0...ㅠㅠ
""", star: "4.6/5.0", pin: false, food: getFoodData(name: "풍류랑"))
        ]
    }
    
    func getFoodData(name : String) -> Food {
        
        //전제조건 : 식당이름 겹치면 사고
        foodDataArray.filter{
            $0.name == name
        }[0]
    }
    
    func getImageData(name : String) -> [String] {
        return ["\(name)1","\(name)2"]
    }
    
    
}

