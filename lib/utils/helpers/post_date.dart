class PostDateHelper {
  String postTimeExtracter(DateTime postDate) {
    final now = DateTime.now();
    final timeDifference = now.difference(postDate);

    if (timeDifference.inDays >= 1) {
      return '${timeDifference.inDays} days ago';
    } else if (timeDifference.inHours >= 1) {
      return '${timeDifference.inHours} hours ago';
    } else {
      return 'now';
    }
  }
}
