import 'package:flutter/material.dart';

import '../data/promo_content.dart';
import '../theme/promo_theme.dart';
import '../widgets/promo_widgets.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scrollController = ScrollController();
  final _heroKey = GlobalKey();
  final _featuresKey = GlobalKey();
  final _roadmapKey = GlobalKey();
  final _contactKey = GlobalKey();

  Future<void> _scrollTo(GlobalKey key) async {
    final ctx = key.currentContext;
    if (ctx == null) return;
    await Scrollable.ensureVisible(
      ctx,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      alignment: 0.05,
    );
  }

  void _showPreviewDialog() {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: PromoColors.bgElevated,
        title: const Text('앱 미리보기 안내', style: TextStyle(color: PromoColors.textPrimary)),
        content: Text(
          '「${PromoContent.appFullName}」 앱은 현재 출시 준비 중입니다.\n\n'
          '사주·궁합 분석, 프로필 저장, 텍스트 공유 등 핵심 기능은 '
          '개발 버전에서 확인할 수 있으며, 정식 출시는 Play Store 등록 후 진행됩니다.\n\n'
          '출시 소식을 받고 싶으시면 「출시 소식 받기」로 문의해 주세요.',
          style: PromoTheme.body(ctx),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('확인', style: TextStyle(color: PromoColors.gold)),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [PromoColors.bgDeep, PromoColors.bgMid, PromoColors.bgDeep],
          ),
        ),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: PromoColors.bgDeep.withValues(alpha: 0.92),
              surfaceTintColor: Colors.transparent,
              title: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/app_icon.png',
                      width: 32,
                      height: 32,
                      errorBuilder: (_, __, ___) => const Icon(Icons.auto_awesome, color: PromoColors.gold),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    PromoContent.appDisplayName,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: PromoColors.goldLight,
                      fontSize: 17,
                    ),
                  ),
                ],
              ),
              actions: [
                if (MediaQuery.sizeOf(context).width >= 720) ...[
                  TextButton(
                    onPressed: () => _scrollTo(_featuresKey),
                    child: const Text('기능', style: TextStyle(color: PromoColors.textSecondary)),
                  ),
                  TextButton(
                    onPressed: () => _scrollTo(_roadmapKey),
                    child: const Text('준비 단계', style: TextStyle(color: PromoColors.textSecondary)),
                  ),
                ],
                IconButton(
                  tooltip: '문의하기',
                  onPressed: launchContactEmail,
                  icon: const Icon(Icons.mail_outline, color: PromoColors.gold),
                ),
              ],
            ),
            SliverToBoxAdapter(child: _HeroSection(key: _heroKey, onPreview: _showPreviewDialog, onFeatures: () => _scrollTo(_featuresKey), onRoadmap: () => _scrollTo(_roadmapKey), onContact: () => _scrollTo(_contactKey))),
            SliverToBoxAdapter(child: _ValuesSection()),
            SliverToBoxAdapter(child: _FeaturesSection(key: _featuresKey)),
            SliverToBoxAdapter(child: _RecommendSection()),
            SliverToBoxAdapter(child: _DisclaimerSection()),
            SliverToBoxAdapter(child: _RoadmapSection(key: _roadmapKey)),
            SliverToBoxAdapter(child: _FaqSection()),
            SliverToBoxAdapter(child: _CtaSection(key: _contactKey, onPreview: _showPreviewDialog)),
            const SliverToBoxAdapter(child: _Footer()),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    super.key,
    required this.onPreview,
    required this.onFeatures,
    required this.onRoadmap,
    required this.onContact,
  });

  final VoidCallback onPreview;
  final VoidCallback onFeatures;
  final VoidCallback onRoadmap;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    return PromoSection(
      id: 'hero',
      background: Colors.transparent,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final wide = constraints.maxWidth >= 820;
          return Flex(
            direction: wide ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: wide ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: wide ? 3 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: PromoColors.purple.withValues(alpha: 0.25),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: PromoColors.purpleLight.withValues(alpha: 0.4)),
                      ),
                      child: const Text(
                        '출시 전 프로모 · 미리보기',
                        style: TextStyle(color: PromoColors.goldLight, fontSize: 13, fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(PromoContent.heroTitle, style: PromoTheme.heroTitle(context)),
                    const SizedBox(height: 18),
                    Text(PromoContent.heroSubtitle, style: PromoTheme.body(context)),
                    const SizedBox(height: 12),
                    Text(
                      PromoContent.heroNote,
                      style: PromoTheme.caption(context).copyWith(color: PromoColors.gold.withValues(alpha: 0.9)),
                    ),
                    const SizedBox(height: 28),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        PromoButton(label: '앱 미리보기', icon: Icons.visibility_outlined, onPressed: onPreview),
                        PromoButton(label: '주요 기능 보기', primary: false, onPressed: onFeatures),
                        PromoButton(label: '출시 소식 보기', primary: false, icon: Icons.notifications_none, onPressed: launchLaunchNotifyEmail),
                        PromoButton(label: '문의하기', primary: false, icon: Icons.mail_outline, onPressed: onContact),
                      ],
                    ),
                  ],
                ),
              ),
              if (wide) const SizedBox(width: 40),
              Expanded(
                flex: wide ? 2 : 0,
                child: Padding(
                  padding: EdgeInsets.only(top: wide ? 0 : 32),
                  child: _HeroPreviewCard(onPreview: onPreview),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _HeroPreviewCard extends StatelessWidget {
  const _HeroPreviewCard({required this.onPreview});

  final VoidCallback onPreview;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            PromoColors.navy.withValues(alpha: 0.9),
            PromoColors.purple.withValues(alpha: 0.35),
          ],
        ),
        border: Border.all(color: PromoColors.borderGold),
        boxShadow: [
          BoxShadow(
            color: PromoColors.purple.withValues(alpha: 0.2),
            blurRadius: 40,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.asset('assets/images/app_icon.png', width: 56, height: 56),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(PromoContent.appFullName, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: PromoColors.ivory)),
                    const SizedBox(height: 4),
                    Text('절기 기준 만세력 · 참고용 사주궁합', style: PromoTheme.caption(context)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _MiniTag('기본 사주 · 오행 · 궁합'),
          const SizedBox(height: 8),
          _MiniTag('프로필 저장 · 텍스트 공유'),
          const SizedBox(height: 8),
          _MiniTag('AI 해석 · PDF — 준비 중', muted: true),
          const SizedBox(height: 20),
          Text(
            '친구·연인과 함께 가볍게 보며, '
            '관계 대화의 시작점으로 활용해 보세요.',
            style: PromoTheme.body(context),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onPreview,
              child: const Text('미리보기 안내 →', style: TextStyle(color: PromoColors.gold)),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniTag extends StatelessWidget {
  const _MiniTag(this.label, {this.muted = false});

  final String label;
  final bool muted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: muted ? PromoColors.bgDeep.withValues(alpha: 0.4) : PromoColors.bgCard.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: muted ? PromoColors.border : PromoColors.borderGold),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13,
          color: muted ? PromoColors.textMuted : PromoColors.textPrimary,
        ),
      ),
    );
  }
}

class _ValuesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PromoSection(
      id: 'values',
      background: PromoColors.bgMid,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            title: '소통사주가 전하는 가치',
            subtitle: '재미있게 보는 사주궁합, 나와 상대를 이해하는 참고 자료, 관계 대화의 시작점을 지향합니다.',
          ),
          ResponsiveGrid(
            itemCount: PromoContent.values.length,
            minTileWidth: 300,
            itemBuilder: (context, i) {
              final item = PromoContent.values[i];
              return PromoCard(
                title: item.title,
                body: item.body,
                icon: item.icon,
                status: item.status,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PromoSection(
      id: 'features',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            title: '주요 기능 미리보기',
            subtitle: '현재 앱에 구현된 기능과 준비 중인 기능을 구분해 안내합니다.',
          ),
          ResponsiveGrid(
            itemCount: PromoContent.features.length,
            minTileWidth: 260,
            itemBuilder: (context, i) {
              final item = PromoContent.features[i];
              return PromoCard(
                title: item.title,
                body: item.body,
                status: item.status,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _RecommendSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PromoSection(
      id: 'recommend',
      background: PromoColors.bgMid,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(title: '이런 분들께 추천합니다'),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final text in PromoContent.recommendations)
                Container(
                  width: 300,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: PromoColors.bgCard,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: PromoColors.border),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.check_circle_outline, color: PromoColors.gold, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(text, style: const TextStyle(color: PromoColors.textPrimary, height: 1.5)),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DisclaimerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PromoSection(
      id: 'disclaimer',
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: PromoColors.bgElevated,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: PromoColors.purple.withValues(alpha: 0.35)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.shield_outlined, color: PromoColors.gold.withValues(alpha: 0.9)),
                const SizedBox(width: 10),
                Text('이용 전 안내', style: PromoTheme.sectionTitle(context).copyWith(fontSize: 20)),
              ],
            ),
            const SizedBox(height: 14),
            Text(PromoContent.disclaimer, style: PromoTheme.body(context)),
          ],
        ),
      ),
    );
  }
}

class _RoadmapSection extends StatelessWidget {
  const _RoadmapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return PromoSection(
      id: 'roadmap',
      background: PromoColors.bgMid,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(title: '현재 준비 단계'),
          Text(PromoContent.roadmapIntro, style: PromoTheme.body(context)),
          const SizedBox(height: 28),
          ...PromoContent.roadmap.map((step) => _RoadmapTile(step: step)),
        ],
      ),
    );
  }
}

class _RoadmapTile extends StatelessWidget {
  const _RoadmapTile({required this.step});

  final PromoRoadmapStep step;

  @override
  Widget build(BuildContext context) {
    final color = step.done ? PromoColors.jadeTint : PromoColors.gold;
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: PromoColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: step.done ? color.withValues(alpha: 0.4) : PromoColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.15),
              border: Border.all(color: color.withValues(alpha: 0.5)),
            ),
            child: Text(
              '${step.step}',
              style: TextStyle(fontWeight: FontWeight.w700, color: color),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        step.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: PromoColors.textPrimary,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: (step.done ? PromoColors.jadeTint : PromoColors.gold).withValues(alpha: 0.12),
                      ),
                      child: Text(
                        step.done ? '완료' : '진행 예정',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: step.done ? PromoColors.jadeTint : PromoColors.gold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(step.note, style: PromoTheme.caption(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FaqSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PromoSection(
      id: 'faq',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(title: '자주 묻는 질문'),
          ...PromoContent.faqs.map((f) => FaqTile(q: f.q, a: f.a)),
        ],
      ),
    );
  }
}

class _CtaSection extends StatelessWidget {
  const _CtaSection({super.key, required this.onPreview});

  final VoidCallback onPreview;

  @override
  Widget build(BuildContext context) {
    return PromoSection(
      id: 'cta',
      background: PromoColors.bgMid,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: [
              PromoColors.navy,
              PromoColors.purple.withValues(alpha: 0.55),
            ],
          ),
          border: Border.all(color: PromoColors.borderGold),
        ),
        child: Column(
          children: [
            Text(
              '소통사주, 더 쉽고 재미있는\n사주궁합 앱으로 준비하겠습니다.',
              textAlign: TextAlign.center,
              style: PromoTheme.sectionTitle(context).copyWith(fontSize: 24),
            ),
            const SizedBox(height: 14),
            Text(
              '사용해 보고 싶은 기능이나 개선 의견이 있다면 편하게 알려주세요.',
              textAlign: TextAlign.center,
              style: PromoTheme.body(context),
            ),
            const SizedBox(height: 24),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 12,
              runSpacing: 12,
              children: [
                PromoButton(label: '문의하기', icon: Icons.mail, onPressed: launchContactEmail),
                PromoButton(label: '출시 소식 받기', primary: false, icon: Icons.notifications_active_outlined, onPressed: launchLaunchNotifyEmail),
                PromoButton(label: '앱 미리보기', primary: false, icon: Icons.phone_android, onPressed: onPreview),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      color: PromoColors.bgDeep,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1080),
          child: Column(
            children: [
              Text(PromoContent.disclaimer, textAlign: TextAlign.center, style: PromoTheme.caption(context)),
              const SizedBox(height: 16),
              Text(
                '© ${DateTime.now().year} ${PromoContent.appDisplayName} · ${PromoContent.contactEmail}',
                style: PromoTheme.caption(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
