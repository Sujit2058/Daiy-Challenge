import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'challenge_bloc.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  void initState() {
    super.initState();
    context.read<ChallengeBloc>().add(LoadChallenge());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F5F9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<ChallengeBloc, ChallengeState>(
            builder: (context, state) {

              if (state is ChallengeLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ChallengeLoaded) {
                final challenge = state.challenge;
                final streak = state.streak;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Title
                    const Row(
                      children: [
                        Icon(Icons.wb_sunny_outlined,
                            color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          "Daily Challenge",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    /// Streak Card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4DE8A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "🔥 Current Streak\n$streak days",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// Challenge Card
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Category: ${challenge.category.name}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            challenge.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: challenge.completed
                                  ? null
                                  : () {
                                      context.read<ChallengeBloc>().add(
                                        CompleteChallengeEvent(
                                            challenge.id),
                                      );
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: challenge.completed
                                    ? Colors.grey
                                    : const Color(0xFF21B07D),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(30),
                                ),
                              ),
                              child: Text(
                                challenge.completed
                                    ? "Completed"
                                    : "Mark as Completed",
                                style:
                                    const TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}