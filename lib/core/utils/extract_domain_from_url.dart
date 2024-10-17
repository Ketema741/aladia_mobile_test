String extractDomain(String url) {
  Uri uri = Uri.parse(url);
  String domain = uri.host;
  if (domain.startsWith('www.')) {
    domain = domain.substring(4);
  }
  return domain;
}
