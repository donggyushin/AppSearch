//
//  TestViewController.swift
//  AppSearch
//
//  Created by 신동규 on 3/30/24.
//

import UIKit

class TestViewController: UIViewController {
    
    let expandableView: ExpandableTextView = {
        let view = ExpandableTextView()
        view.text = """
■ 생리, 불안하고 불편했나요?\n헤이문만의 특별 알고리즘으로 다음 월경일, 가임기, 배란일을 정확하게 예측하세요. 헤이문은 최근 기록에서 변화를 파악해 주기 계산에 반영해요. 예측과 기록이 쌓이면 내 몸에 대한 이해가 깊어지죠. 리포트 아이콘을 눌러 나의 월경 패턴을 관찰해 보세요. 병원 진료 시에도 유용하게 쓸 수 있어요.\n\n* 증상 기록: 몸 상태와 기분을 매일 기록할 수 있어요.\n* 영양제 챙겨 먹기: 영양제는 꾸준히 먹는 게 중요해요. 헤이문과 매일 영양제 챙겨 먹고 코인 선물도 챙기세요.\n* 병원 진료 기록: 방문 병원, 방문 이유, 진료 내용을 체계적으로 관리해 보세요.\n* 리포트: 나의 월경, 주기 정보, 병원 진료 기록을 한 눈에 확인할 수 있어요. 병원 진료 시 유용한 자료가 되어줄 거예요.\n\n■ 키워드로 고민 해결! 건강도 제품도 척척!\n질분비물, 피임약, 임신가능성, 부정출혈, … 여성건강 물음표가 느낌표로 바뀌는 곳! 고민해결 탭에 고민 키워드를 검색하면 쉽고 정확한 콘텐츠, 내게 딱 필요한 좋은 제품까지 빠르게 살펴볼 수 있어요. 여성건강 고민될 땐 헤이문을 켜세요. 빠르고 정확하게 고민을 확인하고 올바르게 대처할 수 있어요.\n\n* 고민 검색: 질염, 월경통, 다낭성난소증후군, 피임약, 성병 검사 등 고민되는 주제의 키워드를 검색하면 읽기 쉬운 콘텐츠와 유용한 제품을 확인할 수 있어요.\n* 퀵테스트: 질염 10초 셀프 체크, 피임약 잊었을 때, 임신 가능성, 월경통 진통제까지. 탭 몇 번으로 상황에 맞는 전문가 가이드를 받아 보세요.\n* 고민 공감: 다른 유저들은 어떤 고민을 갖고 있을까요? 콘텐츠 찾아보고 공감 버튼도 꾸욱 눌러주세요.\n\n■ 세상에 없던 여성건강 스토어, 헤이문 쇼핑\n여성건강 제품, 어디에서 무엇을 어떻게 사야 할까요? 건강 관리 제품이니 잘 골라야죠. 월경케어 제품부터 영양제, 바디, 구강, 성건강, 운동, 자세, 수면, 휴식 아이템까지, 헤이문이 먼저 알아보고 고민했어요. 정기적으로 필요한 제품은 구독해 보세요. 국내 유일 내 주기에 맞춰 문 앞에 배송되는 월경구독 서비스는 제품 변경과 일시정지가 자유자재, 가입료와 배송비는 항상 무료랍니다.\n\n* 유기농 생리대 반값: 헤이문에서는 품질 좋은 유기농 생리대 중형 16개입 한 팩이 매달 반값이에요! 좋은 생리대를 부담없이 쓰는 것으로 월경 케어를 시작해봐요.\n\n■ 연인, 배우자, 보호자, 친구와 함께하는 월경 관리\n“오늘 월경 시작했어” “지금은 가임기야” 매번 전하기 힘들다고요? 월경 달력을 동기화 해 공유하세요. 상대방이 월경 달력 공유 앱 헤이문 커넥트를 설치하면 따로 말하지 않아도 월경 주기를 알려줄 수 있어요. 월경과 주기 관련 정보도 쉽고 친절하게 알려주죠.\n\n■ 이런 것도 다 돼요!\n* 위젯: 홈 화면에서 간편하게 나의 월경정보를 확인할 수 있어요.\n* 애플 건강 앱 월경 데이터 불러오기: 초기 설정시 애플 건강 앱 월경 기록을 헤이문으로 간단하게 불러올 수 있어요.\n* 피임약 복용 알림 및 동기화: 피임약, 알림 설정 해두고 잊지 마세요! 생리주기 예측에도 자동으로 반영돼요.\n* 깔끔한 디자인: 군더더기 없는 깔끔한 디자인! 사용하기 쉽고 편리해요.\n* 성생활 기록: 꼼꼼하게 기록하고 관리해요.\n* 임신 모드: 월경 예측과 알림을 잠시 멈출 수 있어요.\n\n※ 헤이문 '고민해결' 콘텐츠는 전문의와 약사의 도움을 받아 작성된, 여성건강에 대한 일반적인 이해를 돕기 위한 건강정보입니다.\n※ 헤이문 '고민해결' 탭의 모든 정보는 참고 용도로만 활용 가능하며, 의학적 진단, 진료, 혹은 치료를 대신하지 않습니다.\n※ 의료 지원 및 의학에 근거한 전문적인 판단이 필요한 경우 의료기관에 방문해 전문가와 상담하십시오.
"""
//        view.text = "짧은 텍스트"
        return view
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [expandableView, UIView()])
        view.axis = .vertical
        view.spacing = 0
        return view
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    private lazy var contentsView: UIView = {
        let view = UIView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.addSubview(contentsView)
        contentsView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.centerX.equalTo(view)
            make.width.equalTo(view.snp.width)
        }
        
        contentsView.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
