import 'package:flutter/material.dart';

class SubjectView extends StatelessWidget {
  const SubjectView({Key? key, 
    required this.name, 
    required this.score, 
    required this.progress})
      : super(key: key);

  final String name;
  final int score;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset('assets/images/subjects/EVS.png')),
                const SizedBox(
                  width: 20,
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline2,
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      Text(
                        'Score $score',
                        style: Theme.of(context).textTheme.headline3,
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      LinearProgressIndicator(
                        minHeight: 5,
                        value: progress,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
