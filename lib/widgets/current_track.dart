import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/models/current_track_model.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatefulWidget {
  @override
  State<CurrentTrack> createState() => _CurrentTrackState();
}

class _CurrentTrackState extends State<CurrentTrack> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            _TrackInfo(),
            const Spacer(),
            _PlayerControls(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatefulWidget {
  @override
  State<_TrackInfo> createState() => _TrackInfoState();
}

class _TrackInfoState extends State<_TrackInfo> {

  Icon like = Icon(Icons.favorite_border);

  int likeIconnumber = 0;

  void changeICONlike() {
    setState(() {
      if (likeIconnumber == 0) {
        like = Icon(Icons.favorite_border);
        likeIconnumber = 1;
      } else if (likeIconnumber == 1) {
        like = Icon(Icons.favorite);
        likeIconnumber = 0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'assets/spotify_logo.jpg',
          height: 60.0,
          width: 60.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 4.0),
            Text(
              selected.artist,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.grey[300], fontSize: 12.0),
            )
          ],
        ),
        const SizedBox(width: 12.0),
        IconButton(
          icon: like,
          onPressed: () {
            changeICONlike();

          },
        ),
      ],
    );
  }
}

class _PlayerControls extends StatefulWidget {
  @override
  State<_PlayerControls> createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<_PlayerControls> {
  Icon play = Icon(Icons.pause_circle_outline);

  int playIconnumber = 0;

  void changeICON() {
    setState(() {
      if (playIconnumber == 0) {
        play = Icon(Icons.play_circle_outline);
        playIconnumber = 1;
      } else if (playIconnumber == 1) {
        play = Icon(Icons.pause_circle_outline);
        playIconnumber = 0;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.shuffle),
              iconSize: 20.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_previous_outlined),
              iconSize: 20.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: play,
              iconSize: 34.0,
              onPressed: () {
                changeICON();
              },
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.skip_next_outlined),
              iconSize: 20.0,
              onPressed: () {},
            ),
            IconButton(
              padding: const EdgeInsets.only(),
              icon: const Icon(Icons.repeat),
              iconSize: 20.0,
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 4.0),
        Row(
          children: [
            Text('0:00', style: Theme.of(context).textTheme.caption),
            const SizedBox(width: 8.0),
            Container(
              height: 5.0,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              selected?.duration ?? '0:00',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.devices_outlined),
          iconSize: 20.0,
          onPressed: () {},
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.volume_up_outlined),
              onPressed: () {},
            ),
            Container(
              height: 5.0,
              width: 70.0,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.fullscreen_outlined),
          onPressed: () {},
        ),
      ],
    );
  }
}
