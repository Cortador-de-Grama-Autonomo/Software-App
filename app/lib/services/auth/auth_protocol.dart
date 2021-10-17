abstract class AuthProtocol {
  Future<bool> auth(
    Uri uri,
    String clientId,
    List<String> scopes,
    int port,
    String secret,
    Uri redirectUri,
  );
}
