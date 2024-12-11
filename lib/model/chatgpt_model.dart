class ChatGptModel {
  List<Candidate> candidates;
  UsageMetadata usageMetadata;
  String modelVersion;

  ChatGptModel({
    required this.candidates,
    required this.usageMetadata,
    required this.modelVersion,
  });

  factory ChatGptModel.mapToModel(Map data) {
    return ChatGptModel(
      candidates: List<Candidate>.from(
          data['candidates'].map((e) => Candidate.mapToModel(e))),
      usageMetadata: UsageMetadata.mapToModel(data['usageMetadata']),
      modelVersion: data['modelVersion'],
    );
  }
}

class Candidate {
  Content content;
  String finishReason;
  double avgLogprobs;

  Candidate({
    required this.content,
    required this.finishReason,
    required this.avgLogprobs,
  });

  factory Candidate.mapToModel(Map data) {
    return Candidate(
      content: Content.mapToModel(data['content']),
      finishReason: data['finishReason'],
      avgLogprobs: data['avgLogprobs'],
    );
  }
}

class Content {
  List<Part> parts;
  String role;

  Content({
    required this.parts,
    required this.role,
  });

  factory Content.mapToModel(Map data) {
    return Content(
      parts: List<Part>.from(data['parts'].map((e) => Part.mapToModel(e))),
      role: data['role'],
    );
  }
}

class Part {
  String text;

  Part({
    required this.text,
  });
  factory Part.mapToModel(Map data) {
    return Part(
      text: data['text'],
    );
  }
}

class UsageMetadata {
  int promptTokenCount;
  int candidatesTokenCount;
  int totalTokenCount;

  UsageMetadata({
    required this.promptTokenCount,
    required this.candidatesTokenCount,
    required this.totalTokenCount,
  });

  factory UsageMetadata.mapToModel(Map data) {
    return UsageMetadata(
      promptTokenCount: data['promptTokenCount'],
      candidatesTokenCount: data['candidatesTokenCount'],
      totalTokenCount: data['totalTokenCount'],
    );
  }
}
