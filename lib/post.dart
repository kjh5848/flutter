/**
 * 1. API 요청 -> json -> Map으로 자동으로 받아줌 -> Map -> Dart Object 변환
 * 2. API 요청 -> 통신 -> wait가 걸린다 -> block 당하지 않도록 비동기 통신을 한다.(단일스레드)
 */

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post.name(this.userId, this.id, this.title, this.body);

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
}

// Mock 데이터
Post p1 = Post(userId: 1, id: 1, title: "제목1", body: "내용1");
Post p2 = Post(userId: 2, id: 2, title: "제목2", body: "내용2");
Post p3 = Post(userId: 3, id: 3, title: "제목3", body: "내용3");
Post p4 = Post(userId: 1, id: 4, title: "제목4", body: "내용4");
Post p5 = Post(userId: 2, id: 5, title: "제목5", body: "내용5");

List<Post> postList = [p1, p2, p3, p4, p5];
