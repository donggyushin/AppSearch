# AppSearch

itune search API를 이용하여 구현한 AppStore clone project

<div>
  <img src="https://github.com/donggyushin/AppSearch/assets/34573243/a15f4040-294e-4a3a-94ce-0c73aa088dc2" width=200 />
  <img src="https://github.com/donggyushin/AppSearch/assets/34573243/fe083c1a-a1e4-48c5-b393-729122730c98" width=200 />
  <img src="https://github.com/donggyushin/AppSearch/assets/34573243/b3461c6b-6463-4ef7-9349-8247f3d3d7ef" width=200 />
</div>

## Library

- [SDWebImage](https://github.com/SDWebImage/SDWebImage)
- [SnapKit](https://github.com/SnapKit/SnapKit)

## Architecture

- Coordinator
  - 네비게이션 로직을 뷰 컨트롤러로부터 분리하여 관리
- Model, Repository
  - API
  - CoreData
  - Domain
    - Data를 가져오는곳(API, CoreData)과 Data를 표현하는곳(Domain)이 강하게 결합되는 문제를 해결하기 위해서 모델을 다르게 디자인하고, Repository를 통해서 디커플링 해줍니다.
- Util
- View

### MVVM

- 비동기 이벤트를 처리하는 선언적 Swift API인 Combine을 통해 뷰와 비즈니스 로직 사이의 결합도를 낮추고 뷰를 선언적으로 구현하였습니다.
