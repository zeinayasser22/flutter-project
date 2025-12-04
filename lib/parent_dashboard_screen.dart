import 'package:flutter/material.dart';

void main() {
  runApp(ParentDashboardApp());
}

class ParentDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Parent Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'RobotoMono', // Close to the font used
      ),
      home: ParentDashboardScreen(),
    );
  }
}

class ParentDashboardScreen extends StatefulWidget {
  @override
  _ParentDashboardScreenState createState() => _ParentDashboardScreenState();
}

class _ParentDashboardScreenState extends State<ParentDashboardScreen> {
  double _timeLimitMins = 30;

  // Checkboxes for Content Safety
  bool _educationalThemesOnly = true;
  bool _ageAppropriateVocab = true;

  // Radio buttons for Modes
  String _mode = 'Surprise Me Mode'; // or 'Offline Mode'

  // Story Theme Preferences checkboxes
  bool _animals = true;
  bool _space = true;
  bool _friendship = true;
  bool _nature = true;
  bool _magic = true;
  bool _learning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F0),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade800, Colors.pink.shade400],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          title: const Text(
            'Parent Dashboard',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              letterSpacing: 0.5,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.close, size: 20),
              onPressed: () {
                // Close action (pop)
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Reading Statistics Title
            const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: Text(
                'Reading Statistics',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  letterSpacing: 0.3,
                ),
              ),
            ),

            // Statistics cards row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StatCard(
                  icon: Icons.menu_book_outlined,
                  iconColor: Colors.white,
                  value: '12',
                  label: 'Stories Read This Week',
                  cardGradient: LinearGradient(
                    colors: [Colors.purple.shade500, Colors.pink.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                _StatCard(
                  icon: Icons.bar_chart_outlined,
                  iconColor: Colors.white,
                  value: 'Adventure',
                  label: 'Favorite Category',
                  cardGradient: LinearGradient(
                    colors: [Colors.blue.shade500, Colors.blue.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                _StatCard(
                  icon: Icons.access_time_outlined,
                  iconColor: Colors.white,
                  value: '45',
                  label: 'Reading Time (mins)',
                  cardGradient: LinearGradient(
                    colors: [Colors.green.shade600, Colors.green.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // Settings Title with Icon
            Row(
              children: const [
                Icon(Icons.settings_outlined, size: 20, color: Colors.deepPurple),
                SizedBox(width: 6),
                Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    letterSpacing: 0.3,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Content Safety Card
            _ContentSafetyCard(
              educationalThemesOnly: _educationalThemesOnly,
              ageAppropriateVocab: _ageAppropriateVocab,
              onEducationalChanged: (val) {
                setState(() {
                  _educationalThemesOnly = val!;
                });
              },
              onVocabularyChanged: (val) {
                setState(() {
                  _ageAppropriateVocab = val!;
                });
              },
            ),

            const SizedBox(height: 20),

            // Time Limits Card with slider
            _TimeLimitsCard(
              timeLimitMins: _timeLimitMins,
              onSliderChanged: (val) {
                setState(() {
                  _timeLimitMins = val;
                });
              },
            ),

            const SizedBox(height: 20),

            // Mode Selection Card with radios
            _ModeSelectionCard(
              mode: _mode,
              onModeChanged: (val) {
                setState(() {
                  _mode = val!;
                });
              },
            ),

            const SizedBox(height: 20),

            // Story Theme Preferences
            const Text(
              'Story Theme Preferences',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                letterSpacing: 0.3,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 12),

            Wrap(
              spacing: 20,
              runSpacing: 0,
              children: [
                _ThemeCheckbox(
                  label: 'Animals',
                  value: _animals,
                  onChanged: (val) {
                    setState(() {
                      _animals = val!;
                    });
                  },
                ),
                _ThemeCheckbox(
                  label: 'Space',
                  value: _space,
                  onChanged: (val) {
                    setState(() {
                      _space = val!;
                    });
                  },
                ),
                _ThemeCheckbox(
                  label: 'Friendship',
                  value: _friendship,
                  onChanged: (val) {
                    setState(() {
                      _friendship = val!;
                    });
                  },
                ),
                _ThemeCheckbox(
                  label: 'Nature',
                  value: _nature,
                  onChanged: (val) {
                    setState(() {
                      _nature = val!;
                    });
                  },
                ),
                _ThemeCheckbox(
                  label: 'Magic',
                  value: _magic,
                  onChanged: (val) {
                    setState(() {
                      _magic = val!;
                    });
                  },
                ),
                _ThemeCheckbox(
                  label: 'Learning',
                  value: _learning,
                  onChanged: (val) {
                    setState(() {
                      _learning = val!;
                    });
                    },
                ),
              ],
            ),

            const SizedBox(height: 18),

            // Bottom Warning Text
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.amber.shade300, width: 1),
                borderRadius: BorderRadius.circular(6),
                color: Colors.amber.shade50,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.warning_amber_outlined,
                      size: 20, color: Colors.amber),
                  SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      'This app is designed for entertainment and education. It should not be used to collect personal information or sensitive data.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final LinearGradient cardGradient;
  final Color iconColor;

  const _StatCard({
    Key? key,
    required this.icon,
    required this.value,
    required this.label,
    required this.cardGradient,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          gradient: cardGradient,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 22, color: iconColor),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContentSafetyCard extends StatelessWidget {
  final bool educationalThemesOnly;
  final bool ageAppropriateVocab;
  final ValueChanged<bool?> onEducationalChanged;
  final ValueChanged<bool?> onVocabularyChanged;

  const _ContentSafetyCard({
    Key? key,
    required this.educationalThemesOnly,
    required this.ageAppropriateVocab,
    required this.onEducationalChanged,
    required this.onVocabularyChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Colors.deepPurple.shade300;
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: purpleColor.withOpacity(0.25),
                child: Icon(Icons.shield_outlined,
                    size: 18, color: purpleColor),
              ),
              const SizedBox(width: 8),
              Text(
                'Content Safety',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: purpleColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 42),
            child: Text(
              'All stories are age-appropriate and safe for children. No ads or external links.',
              style: TextStyle(
                fontSize: 12,
                color: purpleColor,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 42),
            child: Column(
              children: [
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    'Educational themes only',
                    style: TextStyle(
                      color: purpleColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: educationalThemesOnly,
                  onChanged: onEducationalChanged,
                  activeColor: purpleColor,
                ),
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    'Age-appropriate vocabulary',
                    style: TextStyle(
                      color: purpleColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: ageAppropriateVocab,
                  onChanged: onVocabularyChanged,
                  activeColor: purpleColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TimeLimitsCard extends StatelessWidget {
  final double timeLimitMins;
  final ValueChanged<double> onSliderChanged;

  const _TimeLimitsCard({
    Key? key,
    required this.timeLimitMins,
    required this.onSliderChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color blueColor = Colors.blue.shade300;
    return Container(
      decoration: BoxDecoration(
        color: blueColor.withOpacity(0.25),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: blueColor.withOpacity(0.25),
                child: Icon(Icons.access_time_outlined,
                    size: 18, color: blueColor),
              ),
              const SizedBox(width: 8),
              Text(
                'Time Limits',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: blueColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.only(left: 42),
            child: Text(
              'Set daily reading time limits',
              style: TextStyle(
                fontSize: 12,
                color: blueColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 42, right: 6, top: 8),
            child: Row(
              children: [
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: blueColor,
                      inactiveTrackColor: blueColor.withOpacity(0.3),
                      thumbColor: blueColor,
                      overlayColor: blueColor.withOpacity(0.2),),
                    child: Slider(
                      min: 0,
                      max: 120,
                      divisions: 24,
                      value: timeLimitMins,
                      label: '${timeLimitMins.round()} mins',
                      onChanged: onSliderChanged,
                    ),
                  ),
                ),
                Text(
                  '${timeLimitMins.round()} mins',
                  style: TextStyle(
                    fontSize: 13,
                    color: blueColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ModeSelectionCard extends StatelessWidget {
  final String mode;
  final ValueChanged<String?> onModeChanged;

  const _ModeSelectionCard({
    Key? key,
    required this.mode,
    required this.onModeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color pinkColor = Colors.pink.shade200;
    final Color greenColor = Colors.green.shade200;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: pinkColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.pink.shade100,
                child: Icon(Icons.settings_outlined,
                    size: 18, color: Colors.pink.shade900),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Surprise Me Mode',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.pink.shade900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Let AI choose random story elements for variety',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.pink.shade900,
                      ),
                    ),
                  ],
                ),
              ),
              Radio<String>(
                value: 'Surprise Me Mode',
                groupValue: mode,
                activeColor: Colors.pink.shade900,
                onChanged: onModeChanged,
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              CircleAvatar(
                radius: 14,
                backgroundColor: Colors.green.shade100,
                child: Icon(Icons.download_outlined,
                    size: 18, color: Colors.green.shade900),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Offline Mode',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Colors.green.shade900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Download stories for reading without internet',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.green.shade900,
                      ),
                     ),
                  ],
                ),
              ),
              Radio<String>(
                value: 'Offline Mode',
                groupValue: mode,
                activeColor: Colors.green.shade900,
                onChanged: onModeChanged,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ThemeCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const _ThemeCheckbox({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color purpleColor = Colors.deepPurple.shade400;

    return SizedBox(
      width: 150,
      child: CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        dense: true,
        title: Text(
          label,
          style: TextStyle(
            color: purpleColor,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
        controlAffinity: ListTileControlAffinity.leading,
        value: value,
        onChanged: onChanged,
        activeColor: purpleColor,
      ),
    );
  }
} 