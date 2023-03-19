import 'package:flutter/material.dart';

import '../../models/poll.dart';
import '../../services/api.dart';
import '../my_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Poll>? _polls;
  var _isLoading = false;
  bool _isError = false;
  String _errMessage = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    // todo: Load list of polls here
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(Duration(seconds: 3), () {});

    try {
      var result = await ApiClient().getAllPolls();
      //print('ok');
      setState(() {
        _polls = result;
      });
      //print('ok');
    } catch (e) {
      setState(() {
        _errMessage = e.toString();
        _isError = true;
      });
      // TODO: กรณี Error
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: Column(
        children: [
          Image.network(
              'https://cpsu-test-api.herokuapp.com/images/election.jpg'),
          Expanded(
            child: Stack(
              children: [
                if (_polls != null) _buildList(),
                if (_isLoading) _buildProgress(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildList() {
    return ListView.builder(
      itemCount: _polls!.length,
      itemBuilder: (BuildContext context, int index) {
        var poll = _polls![index];
        // todo: Create your poll item by replacing this Container()
        return Container(
          decoration: BoxDecoration(color: Colors.grey[200]),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${_polls![index].id}. ${_polls![index].question}'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(_polls![index].choices[0]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(_polls![index].choices[1]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(_polls![index].choices[2]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(_polls![index].choices[3]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(_polls![index].choices[4]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(_polls![index].choices[5]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(_polls![index].choices[6]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(_polls![index].choices[7]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(_polls![index].choices[8]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(_polls![index].choices[9]),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('ดูผลโหวต')),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProgress() {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(color: Colors.white),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('รอสักครู่', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
