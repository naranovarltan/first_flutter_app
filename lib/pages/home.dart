import 'package:flutter/material.dart';
import 'package:first_flutter_app/domain/workout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('appbar'),
        leading: Icon(Icons.home),
      ),
      body: WorkoutsList(),
    );
  }
}

class WorkoutsList extends StatelessWidget {
  final List<Workout> workouts = [
    Workout(
      title: 'title1',
      author: 'author1',
      description: 'Новичок',
      level: 'level1',
    ),
    Workout(
      title: 'title2',
      author: 'author2',
      description: 'Продвинутый',
      level: 'level2',
    ),
    Workout(
      title: 'title3',
      author: 'author3',
      description: 'Профессионал',
      level: 'level3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 2.0,
              margin: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  leading: Container(
                    padding: EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.desktop_mac,
                      color: Colors.indigo,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          width: 2,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    workouts[index].description,
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  trailing: Container(
                    child: Icon(
                      Icons.arrow_right,
                      color: Colors.indigoAccent,
                    ),
                  ),
                  subtitle: subtitle(context, workouts[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  Color color;
  double progress;

  switch (workout.level) {
    case 'level1':
      color = Colors.green;
      progress = 0.33;
      break;
    case 'level2':
      color = Colors.orange;
      progress = 0.66;
      break;
    case 'level3':
      color = Colors.red;
      progress = 1;
      break;
    default:
      color = Colors.blue;
      progress = 0;
  }

  return Row(
    children: <Widget>[
      Expanded(
        flex: 3,
        child: LinearProgressIndicator(
          value: progress,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
        flex: 1,
        child: Text(
          workout.level,
          style: TextStyle(
            color: Colors.indigoAccent,
          ),
        ),
      )
    ],
  );
}
