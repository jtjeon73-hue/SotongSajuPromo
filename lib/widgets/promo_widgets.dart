import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/promo_content.dart';
import '../theme/promo_theme.dart';

Future<void> launchContactEmail({String subject = '소통사주 문의'}) async {
  final uri = Uri(
    scheme: 'mailto',
    path: PromoContent.contactEmail,
    queryParameters: {'subject': subject},
  );
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

Future<void> launchLaunchNotifyEmail() =>
    launchContactEmail(subject: '소통사주 출시 소식 받기');

class PromoSection extends StatelessWidget {
  const PromoSection({
    super.key,
    required this.id,
    required this.child,
    this.background = PromoColors.bgDeep,
  });

  final String id;
  final Widget child;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(id),
      width: double.infinity,
      color: background,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1080),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 56),
            child: child,
          ),
        ),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  const SectionHeading({super.key, required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: PromoTheme.sectionTitle(context)),
        if (subtitle != null) ...[
          const SizedBox(height: 12),
          Text(subtitle!, style: PromoTheme.body(context)),
        ],
        const SizedBox(height: 32),
      ],
    );
  }
}

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.status});

  final FeatureStatus status;

  String get _label => switch (status) {
        FeatureStatus.available => '이용 가능',
        FeatureStatus.preview => '미리보기',
        FeatureStatus.planned => '준비 중',
      };

  Color get _color => switch (status) {
        FeatureStatus.available => PromoColors.jadeTint,
        FeatureStatus.preview => PromoColors.purpleLight,
        FeatureStatus.planned => PromoColors.gold.withValues(alpha: 0.85),
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: _color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _color.withValues(alpha: 0.45)),
      ),
      child: Text(
        _label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: _color,
        ),
      ),
    );
  }
}


class PromoCard extends StatelessWidget {
  const PromoCard({
    super.key,
    required this.title,
    required this.body,
    this.icon,
    this.status,
    this.trailing,
  });

  final String title;
  final String body;
  final IconData? icon;
  final FeatureStatus? status;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: PromoColors.bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: PromoColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (icon != null) ...[
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: PromoColors.purple.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: PromoColors.goldLight, size: 22),
                ),
                const SizedBox(width: 14),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: PromoColors.textPrimary,
                        height: 1.35,
                      ),
                    ),
                    if (status != null) ...[
                      const SizedBox(height: 8),
                      StatusChip(status: status!),
                    ],
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
          const SizedBox(height: 14),
          Text(body, style: PromoTheme.body(context)),
        ],
      ),
    );
  }
}

class PromoButton extends StatelessWidget {
  const PromoButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.primary = true,
    this.icon,
  });

  final String label;
  final VoidCallback onPressed;
  final bool primary;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    if (primary) {
      return FilledButton.icon(
        onPressed: onPressed,
        icon: Icon(icon ?? Icons.arrow_forward, size: 18),
        label: Text(label),
        style: FilledButton.styleFrom(
          backgroundColor: PromoColors.gold,
          foregroundColor: PromoColors.bgDeep,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        ),
      );
    }

    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon ?? Icons.chevron_right, size: 18, color: PromoColors.goldLight),
      label: Text(label, style: const TextStyle(color: PromoColors.goldLight)),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        side: const BorderSide(color: PromoColors.borderGold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}

class ResponsiveGrid extends StatelessWidget {
  const ResponsiveGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.minTileWidth = 280,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final double minTileWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = (constraints.maxWidth / minTileWidth).floor().clamp(1, 3);
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: columns == 1 ? 1.55 : 0.92,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}

class FaqTile extends StatefulWidget {
  const FaqTile({super.key, required this.q, required this.a});

  final String q;
  final String a;

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<FaqTile> {
  // expanded = false;

  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: PromoColors.bgElevated,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: PromoColors.border),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => setState(() => _expanded = !_expanded),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.q,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          color: PromoColors.textPrimary,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Icon(
                      _expanded ? Icons.expand_less : Icons.expand_more,
                      color: PromoColors.gold,
                    ),
                  ],
                ),
                if (_expanded) ...[
                  const SizedBox(height: 12),
                  Text(widget.a, style: PromoTheme.body(context)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
