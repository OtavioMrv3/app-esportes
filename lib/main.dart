import 'dart:math' as math;
import 'package:flutter/material.dart';

void main() {
  runApp(const SportXApp());
}

class SportXApp extends StatelessWidget {
  const SportXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SPORTX',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF080808),
        useMaterial3: true,
      ),
      home: const MobilePreview(),
    );
  }
}

// =====================================================
// PREVIEW MOBILE NO NAVEGADOR
// =====================================================

class MobilePreview extends StatelessWidget {
  const MobilePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: LayoutBuilder(
        builder: (context, constraints) {
          const phoneWidth = 390.0;
          const phoneHeight = 844.0;

          final scale = math.min(
            1.0,
            math.min(
              constraints.maxWidth / phoneWidth,
              constraints.maxHeight / phoneHeight,
            ),
          );

          return Center(
            child: SizedBox(
              width: phoneWidth * scale,
              height: phoneHeight * scale,
              child: FittedBox(
                fit: BoxFit.fill,
                child: SizedBox(
                  width: phoneWidth,
                  height: phoneHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: const HomeScreen(),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// =====================================================
// TELA PRINCIPAL
// =====================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080808),

      body: SafeArea(
        child: Column(
          children: [

            // =================================================
            // TOPO
            // =================================================

            Padding(
              padding: const EdgeInsets.fromLTRB(18, 14, 18, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'SPORT',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TextSpan(
                          text: 'X',
                          style: TextStyle(
                            color: Color(0xFFE5FF00),
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: const Color(0xFF151515),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF292929),
                      ),
                    ),
                    child: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 19,
                    ),
                  ),
                ],
              ),
            ),

            // =================================================
            // IMAGEM
            // =================================================

            SizedBox(
              width: double.infinity,
              height: 205,
              child: Stack(
                fit: StackFit.expand,
                children: [

                  Image.asset(
                    'assets/stadium.webp',
                    fit: BoxFit.cover,
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Color(0xFF080808),
                        ],
                      ),
                    ),
                  ),

                  const Positioned(
                    left: 18,
                    bottom: 18,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          'PRÓXIMOS',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w900,
                            height: 0.95,
                          ),
                        ),

                        Text(
                          'JOGOS',
                          style: TextStyle(
                            color: Color(0xFFE5FF00),
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                            height: 0.95,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // =================================================
            // JOGOS
            // =================================================

            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(
                  14,
                  2,
                  14,
                  10,
                ),
                children: const [

                  GameCard(
                    league: 'NBA',
                    homeTeam: 'Clippers',
                    awayTeam: 'Warriors',
                    time: '20:00',
                    date: 'HOJE',
                  ),

                  GameCard(
                    league: 'NFL',
                    homeTeam: 'Titans',
                    awayTeam: 'Jets',
                    time: '14:00',
                    date: 'AMANHÃ',
                  ),

                  GameCard(
                    league: 'BRASILEIRÃO',
                    homeTeam: 'Santos',
                    awayTeam: 'São Paulo',
                    time: '16:00',
                    date: 'AMANHÃ',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // =================================================
      // MENU
      // =================================================

      bottomNavigationBar: const BottomMenu(),
    );
  }
}

// =====================================================
// CARD
// =====================================================

class GameCard extends StatelessWidget {
  final String league;
  final String homeTeam;
  final String awayTeam;
  final String time;
  final String date;

  const GameCard({
    super.key,
    required this.league,
    required this.homeTeam,
    required this.awayTeam,
    required this.time,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      margin: const EdgeInsets.only(bottom: 9),
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: const Color(0xFF151515),
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: const Color(0xFF292929),
        ),
      ),

      child: Row(
        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  league,
                  style: const TextStyle(
                    color: Color(0xFF777777),
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.4,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  homeTeam,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  'vs',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 8,
                  ),
                ),

                Text(
                  awayTeam,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Text(
                time,
                style: const TextStyle(
                  color: Color(0xFFE5FF00),
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                date,
                style: const TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// =====================================================
// MENU INFERIOR
// =====================================================

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Color(0xFF0C0C0C),
        border: Border(
          top: BorderSide(
            color: Color(0xFF252525),
          ),
        ),
      ),

      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          BottomItem(
            icon: Icons.home_rounded,
            label: 'HOME',
            active: true,
          ),

          BottomItem(
            icon: Icons.circle,
            label: 'AO VIVO',
            active: false,
          ),

          BottomItem(
            icon: Icons.article_outlined,
            label: 'NOTÍCIAS',
            active: false,
          ),
        ],
      ),
    );
  }
}

// =====================================================
// ITEM DO MENU
// =====================================================

class BottomItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;

  const BottomItem({
    super.key,
    required this.icon,
    required this.label,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(
          icon,
          size: 19,
          color: active
              ? const Color(0xFFE5FF00)
              : const Color(0xFF666666),
        ),

        const SizedBox(height: 3),

        Text(
          label,
          style: TextStyle(
            color: active
                ? const Color(0xFFE5FF00)
                : const Color(0xFF666666),
            fontSize: 7,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.7,
          ),
        ),
      ],
    );
  }
}