import "package:universal_html/html.dart" as html;

class CookiesManager
{
  Future<void> write({required String key, String? value}) async {
    html.window.document.cookie = "$key=$value; path=/";
  }

  Future<bool> containsKey({required String key}) async {
    final cookies = html.window.document.cookie?.split('; ') ?? [];
    return Future(() => cookies.any((element) => element.startsWith('$key=')));
  }

  Future<void> delete({required String key}) async {
    html.window.document.cookie = "$key=; Max-Age=0; path=/";
  }

  Future<void> deleteAll() async {
    final cookies = html.window.document.cookie?.split('; ') ?? [];
    for (final cookie in cookies) {
      final cookieName = cookie.split('=')[0];
      html.window.document.cookie = "$cookieName=; Max-Age=0; path=/";
    }
  }

  Future<String?> read({required String key}) async {
    List<String> cookies = html.window.document.cookie?.split('; ') ?? [];
    return Future(() {
        cookies = cookies
          .firstWhere((element) => element.startsWith('$key='), orElse: () => "")
          .split('=')
        ;

        return cookies.length >= 2 ?
            "null" != cookies[1]
                ? cookies[1]
                : null
            : null
        ;
    });
  }

  Future<Map<String, String?>> readAll() async {
    final Map<String, String?> allCookies = {};
    final cookies = html.window.document.cookie?.split('; ') ?? [];

    for (final cookie in cookies) {
      final split = cookie.split('=');
      if (split.length >= 2) {
        allCookies[split[0].trim()] = "null" != split[1] ? split[1] : null;
      }
    }

    return Future(() => allCookies);
  }
}