import 'package:flutter/material.dart';

void main() => runApp(const ContextOSApp());

class AppColors {
  static const blue600 = Color(0xFF2563EB);
  static const blue500 = Color(0xFF3B82F6);
  static const blue400 = Color(0xFF60A5FA);
  static const slate950 = Color(0xFF020617);
  static const slate800 = Color(0xFF1E293B);
  static const slate400 = Color(0xFF94A3B8);
  static const cream = Color(0xFFFFFAF0);
  static const emerald500 = Color(0xFF10B981);
  static const red500 = Color(0xFFEF4444);
}

class ContextOSApp extends StatelessWidget {
  const ContextOSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ContextOS',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.slate950,
        fontFamily: 'Roboto',
        colorScheme: const ColorScheme.dark(
          primary: AppColors.blue600,
          secondary: AppColors.blue400,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool noStorageOn = true;
  int navIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.slate950,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    _buildLogo(),
                    const SizedBox(height: 24),
                    _buildHeadline(),
                    const SizedBox(height: 32),
                    _buildOptionCard(
                      icon: Icons.link_rounded,
                      title: 'Share Link',
                      subtitle: 'Share your conversation via a secure link.',
                      highlighted: true,
                    ),
                    const SizedBox(height: 14),
                    _buildOptionCard(
                      icon: Icons.assignment_outlined,
                      title: 'Paste Conversation',
                      subtitle: 'Paste your AI conversation to continue.',
                    ),
                    const SizedBox(height: 14),
                    _buildOptionCard(
                      icon: Icons.cloud_upload_outlined,
                      title: 'Upload File',
                      subtitle: 'Upload a file from your device to get started.',
                    ),
                    const SizedBox(height: 14),
                    _buildPrivacyPanel(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            _buildBottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 12, 0),
      child: Row(
        children: [
          SizedBox(
            width: 42,
            height: 42,
            child: CustomPaint(painter: _CLogoPainter(strokeColor: Colors.white)),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('ContextOS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Text('Never restart an AI project again.',
                    style: TextStyle(color: AppColors.slate400, fontSize: 12)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.slate800.withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.more_vert, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }


  Widget _buildLogo() {
    return SizedBox(
      width: 180,
      height: 180,
      child: CustomPaint(painter: _CLogoPainter(strokeColor: Colors.white)),
    );
  }
  Widget _buildHeadline() {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            children: [
              TextSpan(text: 'Import. Compile. ', style: TextStyle(color: Colors.white)),
              TextSpan(text: 'Continue.', style: TextStyle(color: AppColors.blue500)),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Never restart an AI project again.',
          style: TextStyle(color: AppColors.slate400, fontSize: 15),
        ),
      ],
    );
  }

  Widget _buildOptionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    bool highlighted = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.slate800.withOpacity(0.25),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: highlighted ? AppColors.blue500 : AppColors.slate800,
          width: highlighted ? 1.4 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.slate800.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.blue400, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(subtitle,
                    style: const TextStyle(color: AppColors.slate400, fontSize: 13)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: AppColors.slate400),
        ],
      ),
    );
  }

  Widget _buildPrivacyPanel() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.slate800.withOpacity(0.25),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.slate800),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(Icons.verified_user_outlined, color: AppColors.emerald500, size: 20),
              const SizedBox(width: 10),
              const Expanded(
                child: Text('No Conversation Storage',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
              Text('ON',
                  style: TextStyle(color: AppColors.emerald500, fontWeight: FontWeight.w600)),
              const SizedBox(width: 6),
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                    color: AppColors.emerald500, shape: BoxShape.circle),
              ),
            ],
          ),
          const Divider(color: AppColors.slate800, height: 1),
          Row(
            children: const [
              Icon(Icons.verified_user_outlined, color: AppColors.emerald500, size: 20),
              SizedBox(width: 10),
              Expanded(
                child: Text('100% Private. Always.',
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
              Icon(Icons.chevron_right, color: AppColors.slate400),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    final items = [
      (Icons.home_rounded, 'Home'),
      (Icons.bolt_rounded, 'Quick Prompt'),
      (Icons.auto_awesome, 'AIOS'),
      (Icons.folder_outlined, 'Projects'),
    ];
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.slate800.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.slate800),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final selected = i == navIndex;
          return GestureDetector(
            onTap: () => setState(() => navIndex = i),
            child: Column(
              children: [
                Icon(items[i].$1,
                    color: selected ? AppColors.blue500 : AppColors.slate400, size: 22),
                const SizedBox(height: 4),
                Text(items[i].$2,
                    style: TextStyle(
                        color: selected ? AppColors.blue500 : AppColors.slate400,
                        fontSize: 11)),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _CLogoPainter extends CustomPainter {
  final Color strokeColor;

  _CLogoPainter({required this.strokeColor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.4;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.16
      ..strokeCap = StrokeCap.round
      ..color = strokeColor;

    final rect = Rect.fromCircle(center: center, radius: radius);
    canvas.drawArc(rect, 0.45, 5.4, false, paint);

    final tabPaint = Paint()..color = AppColors.blue600;
    final tabRect = Rect.fromCenter(
      center: Offset(center.dx + radius * 0.92, center.dy),
      width: size.width * 0.11,
      height: size.height * 0.16,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(tabRect, Radius.circular(size.width * 0.05)),
      tabPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CLogoPainter oldDelegate) =>
      oldDelegate.strokeColor != strokeColor;
} 
