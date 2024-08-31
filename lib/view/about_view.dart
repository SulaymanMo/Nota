import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        titleSpacing: 8,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Dear User ...',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontFamily: 'Pacifico'),
                ),
                Text(
                  'We are glad to have you join us. We offer this program specifically to you. offer this program specifically to you.',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontFamily: 'Pacifico', letterSpacing: 1),
                ),
                const SizedBox(height: 20),
                Text(
                  'Solomon King',
                  textAlign: TextAlign.end,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontFamily: 'Pacifico', color: Colors.green),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
