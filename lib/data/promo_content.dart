import 'package:flutter/material.dart';

/// 홍보 페이지 정적 콘텐츠 (SotongSaju 앱 실제 구현 기준).
class PromoContent {
  PromoContent._();

  static const contactEmail = 'sotongware@naver.com';
  static const appDisplayName = '소통사주';
  static const appFullName = '소통 · 사주궁합';

  static const heroTitle = '나와 상대를 이해하는\n새로운 방법, 소통사주';
  static const heroSubtitle =
      '생년월일과 태어난 시간을 바탕으로 사주와 궁합을 보기 쉽게 정리하고, '
      '앞으로 AI 해석으로 관계의 흐름을 참고할 수 있도록 준비 중입니다.';
  static const heroNote = '소통사주는 재미와 자기이해를 위한 참고용 사주궁합 앱입니다.';

  static const values = <PromoValueItem>[
    PromoValueItem(
      title: '쉽게 보는 사주',
      body: '절기 기준 만세력으로 연·월·일·시 사주를 정리하고, 어려운 용어도 읽기 쉽게 구성합니다.',
      icon: Icons.auto_awesome_outlined,
      status: FeatureStatus.available,
    ),
    PromoValueItem(
      title: '궁합 해석',
      body: '나와 상대의 성향과 관계 흐름을 참고할 수 있도록 항목별 점수와 설명을 제공합니다.',
      icon: Icons.favorite_border,
      status: FeatureStatus.available,
    ),
    PromoValueItem(
      title: 'AI 요약',
      body: '긴 해석을 더 쉽게 이해할 수 있도록 AI가 핵심을 정리해 주는 기능을 준비 중입니다.',
      icon: Icons.psychology_outlined,
      status: FeatureStatus.planned,
    ),
    PromoValueItem(
      title: '리포트 저장·공유',
      body: '분석 결과를 다시 확인하고, 텍스트로 공유할 수 있는 기능을 앱에서 이용할 수 있습니다.',
      icon: Icons.share_outlined,
      status: FeatureStatus.available,
    ),
    PromoValueItem(
      title: '재미와 대화',
      body: '친구, 연인, 가족과 함께 가볍게 이야기 나눌 수 있는 콘텐츠를 지향합니다.',
      icon: Icons.chat_bubble_outline,
      status: FeatureStatus.available,
    ),
    PromoValueItem(
      title: '참고용 안내',
      body: '결과는 절대적 판단이 아니라 재미와 자기이해, 관계 대화를 위한 참고 자료입니다.',
      icon: Icons.info_outline,
      status: FeatureStatus.available,
    ),
  ];

  static const features = <PromoFeatureItem>[
    PromoFeatureItem(
      title: '기본 사주 분석',
      body: '생년월일·출생 시간·성별을 바탕으로 사주팔자, 십성, 격국 등 기본 정보를 정리합니다.',
      status: FeatureStatus.available,
    ),
    PromoFeatureItem(
      title: '궁합 보기',
      body: '상대 정보를 입력하면 성격·재물·오행보완 등 항목별 궁합 점수와 설명을 비교합니다.',
      status: FeatureStatus.available,
    ),
    PromoFeatureItem(
      title: '오행·용신 분석',
      body: '오행의 균형과 용신, 계절·십성 해석을 탭별로 확인할 수 있습니다.',
      status: FeatureStatus.available,
    ),
    PromoFeatureItem(
      title: '대운·세운 흐름',
      body: '대운 구간과 세운·월별 운세 흐름을 리포트 형태로 제공합니다.',
      status: FeatureStatus.available,
    ),
    PromoFeatureItem(
      title: 'AI 해석',
      body: '사주·궁합 결과를 자연스러운 문장으로 풀어주는 AI 보조 기능을 준비 중입니다.',
      status: FeatureStatus.planned,
    ),
    PromoFeatureItem(
      title: 'PDF 리포트',
      body: '결과를 문서 형태로 저장하거나 다시 볼 수 있는 PDF 기능은 향후 제공 예정입니다.',
      status: FeatureStatus.planned,
    ),
    PromoFeatureItem(
      title: '프로필 저장',
      body: '본인·상대 정보를 기기에 저장해 다시 불러올 수 있습니다. (앱 미리보기에서 확인 가능)',
      status: FeatureStatus.available,
    ),
    PromoFeatureItem(
      title: '오프라인 분석',
      body: '모바일에서는 서버 없이도 기기 내 만세력 엔진으로 분석할 수 있습니다.',
      status: FeatureStatus.available,
    ),
  ];

  static const recommendations = [
    '사주를 쉽게 보고 싶은 분',
    '연인 또는 배우자와 궁합을 가볍게 보고 싶은 분',
    '친구와 재미있는 대화 소재가 필요한 분',
    '어려운 사주 해석을 정리해서 보고 싶은 분',
    'AI가 요약해 주는 운세 해석을 경험해 보고 싶은 분',
  ];

  static const roadmap = <PromoRoadmapStep>[
    PromoRoadmapStep(
      step: 1,
      title: '앱 프로토타입 구성',
      done: true,
      note: '만세력 분석·탭형 리포트·프로필 저장 등 핵심 흐름 완료',
    ),
    PromoRoadmapStep(
      step: 2,
      title: '주요 화면과 결과 흐름 정리',
      done: true,
      note: '전체·기본사주·오행·궁합·대운·저장 탭 구성 완료',
    ),
    PromoRoadmapStep(
      step: 3,
      title: 'AI 해석 및 리포트 기능 고도화',
      done: false,
      note: 'AI 요약·PDF 리포트 등 준비 중',
    ),
    PromoRoadmapStep(
      step: 4,
      title: '사용자 의견 반영',
      done: false,
      note: '출시 전 피드백 수집 예정',
    ),
    PromoRoadmapStep(
      step: 5,
      title: '정식 출시 준비',
      done: false,
      note: 'Play Store 등록·심사 준비 단계',
    ),
  ];

  static const faqs = <PromoFaqItem>[
    PromoFaqItem(
      q: '결과는 얼마나 믿을 수 있나요?',
      a: '사주와 궁합 해석은 참고용 콘텐츠입니다. 절대적인 판단 기준이 아니라 '
          '자기이해와 대화를 돕는 자료로 봐 주세요.',
    ),
    PromoFaqItem(
      q: '태어난 시간을 몰라도 사용할 수 있나요?',
      a: '일부 기능은 사용할 수 있지만, 태어난 시간이 있으면 시주·대운 등 '
          '더 자세한 해석이 가능합니다.',
    ),
    PromoFaqItem(
      q: 'AI 해석은 어떤 역할을 하나요?',
      a: '현재 앱은 규칙 기반 만세력 해석과 참고 자료를 제공합니다. '
          'AI가 어려운 사주 내용을 쉬운 문장으로 정리해 주는 기능은 준비 중입니다.',
    ),
    PromoFaqItem(
      q: '결과를 저장할 수 있나요?',
      a: '프로필 저장과 텍스트 리포트 공유는 앱에서 이용할 수 있습니다. '
          'PDF 저장 기능은 향후 제공 예정입니다.',
    ),
    PromoFaqItem(
      q: '지금 바로 앱을 쓸 수 있나요?',
      a: '앱은 출시 준비 중이며, 이 페이지는 서비스 소개와 미리보기용입니다. '
          '출시 소식은 문의 메일로 알려 주시면 안내드리겠습니다.',
    ),
  ];

  static const disclaimer =
      '소통사주의 사주·궁합 해석은 재미와 자기이해를 위한 참고용 콘텐츠입니다. '
      '중요한 인생 결정, 건강, 법률, 투자, 결혼 여부 등은 앱 결과만으로 판단하지 마시고, '
      '필요할 경우 전문가와 상담하시기 바랍니다.';

  static const roadmapIntro =
      '소통사주는 완성된 서비스를 갑자기 공개하기보다, '
      '사용자가 보기 쉽고 이해하기 쉬운 형태로 단계적으로 다듬어가고 있습니다.';
}

enum FeatureStatus { available, preview, planned }

class PromoValueItem {
  const PromoValueItem({
    required this.title,
    required this.body,
    required this.icon,
    required this.status,
  });

  final String title;
  final String body;
  final IconData icon;
  final FeatureStatus status;
}

class PromoFeatureItem {
  const PromoFeatureItem({
    required this.title,
    required this.body,
    required this.status,
  });

  final String title;
  final String body;
  final FeatureStatus status;
}

class PromoRoadmapStep {
  const PromoRoadmapStep({
    required this.step,
    required this.title,
    required this.done,
    required this.note,
  });

  final int step;
  final String title;
  final bool done;
  final String note;
}

class PromoFaqItem {
  const PromoFaqItem({required this.q, required this.a});

  final String q;
  final String a;
}
