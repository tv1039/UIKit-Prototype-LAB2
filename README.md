# 프로젝트 이름 | 맛집에서 만나
![image](https://github.com/APP-iOS4/UIKit-Prototype-LAB2/assets/145957641/f8fc2824-31ab-4cb2-bf17-3d846edffd42)

## ADS
서로의 맛집에 대한 평가를 공유하고 내부 맵뷰를 통해서 주제별 식당의 위치를 확인할 있으며, 웹뷰를 통해 해당 맛집에 대한 상세정보를 얻을 수 있다.


## 구현목표
__1. StackView와 CollectionView를 이용하여 메인 페이지를 구성한다__
######
__2. WebView를 이용하여 식당 정보 페이지를 보여주도록 한다__
######
  - 메인 페이지는 다음과 같이 구현한다.
    
    + 상단 오른쪽의 추가 버튼
      * 누르면 피드의 글을 작성하는 화면으로 넘어간다.

    + 사용자별 맛집 피드형식
       * 사용자별 입력한 피드들은 각각의 음식점 정보를 담고있는 웹뷰의 링크로 이동한다.
       * 피드 상단엔 작성자가 평가한 식당의 점수가 놓여 있고, 피드에 아래에 놓인 이모티콘으로 반응을 남길 수 있다.
       * 피드의 게시글을 누르면 상세페이지로 넘어가 글을 자세히 볼 수 있다.


<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB2/assets/53979393/1f687ebe-0ee3-43dd-a3ac-3a09e7c9ba8d" width="200px" />
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB2/assets/53979393/adf423c4-0196-416d-ad9e-1899ae68a370" width="200px" />
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB2/assets/53979393/d15fc085-ab9e-45be-b4bc-5828b8c27071" width="200px" />

## 사용자 시나리오
1. 오늘 저녁 메뉴가 고민인 A씨. 맛있는게 먹고싶지만 딱히 떠오르는게 없어 맛맛 앱을 켠다.
2. 피드를 구경하던 도중 맛있어 보이는 게시글의 사진을 보고 상세페이지로 넘어간다.
3. 상세페이지에 있는 작성자의 별점과 글을 보고 마음에 든 맛집을 발견한 A씨.
4. 지도보기를 눌러 식당의 위치를 보고 먹으러 간다.
5. 만족스러운 식사 후 A씨도 게시글과 별점을 남긴다.

## 앞으로 구현할 내용
1. 메인뷰의 주제별 맛집 정보 및 사용자별 피드 화면이 이미지로 나타내어져 있다. -> 해당 부분 내부 뷰컨트롤러로 구현예정
2. 웹뷰의 이어지는 웹사이트링크가 하나로 고정되어 있다. -> 해당 부분의 도메인은 각각의 웹링크를 클래스내부에서 받아서 처리해야함.
3. 맵뷰의 화면이 하나의 이미지로 되어있다. -> 해당 부분 내부 뷰컨트롤러로 구현예정
4. 찜하기 기능 구현예정

## 실행환경
- Xcode 15.0.1
- IOS 17.2.1

## 2조 조원이름
- [김예지](https://github.com/nxtlevYeah)
######
- [심소영](https://github.com/simsoyung)
######
- [정운관](https://github.com/UnGwan)
######
- [전유진](https://github.com/UDI94)
######
- [홍승표](https://github.com/tv1039)

## License
Licensed under the [MIT](LICENSE) license.
