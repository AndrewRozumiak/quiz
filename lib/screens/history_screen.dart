import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/history_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  String _getAnswerText(int score) {
    if (score == 1) {
      return '1 correct answer';
    } else {
      return '$score correct answers';
    }
  }

  @override
  Widget build(BuildContext context) {
    final historyProvider = Provider.of<HistoryProvider>(context);

    final sortedHistory = List.from(historyProvider.history);
    sortedHistory.sort((a, b) => b['dateTime'].compareTo(a['dateTime']));

    return Scaffold(
      backgroundColor: const Color.fromRGBO(158, 106, 95, 1),
      appBar: AppBar(
        title: const Text(
          'Results History',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Color.fromRGBO(158, 106, 95, 1),
          ),
        ),
        backgroundColor: const Color.fromRGBO(73, 63, 61, 1),
        centerTitle: true,
      ),
      body: sortedHistory.isEmpty
          ? const Center(child: Text('History is empty.'))
          : ListView.separated(
        itemCount: sortedHistory.length,
        itemBuilder: (context, index) {
          final historyItem = sortedHistory[index];
          String formattedDate =
              '${historyItem['dateTime'].year}/${historyItem['dateTime'].month.toString().padLeft(2, '0')}/${historyItem['dateTime'].day.toString().padLeft(2, '0')} '
              '${historyItem['dateTime'].hour.toString().padLeft(2, '0')}:${historyItem['dateTime'].minute.toString().padLeft(2, '0')}';

          return ListTile(
            subtitle: Text(formattedDate),
            title: Text(
              _getAnswerText(historyItem['score']),
              style: const TextStyle(fontSize: 18),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          thickness: 1,
          color: Color.fromRGBO(73, 63, 61, 1),
        ),
      ),
    );
  }
}