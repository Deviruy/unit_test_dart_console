# 🧪 Testes em Dart com Futures, Streams, Mocks e Stubs

Este repositório documenta minha jornada de aprendizado com testes unitários em Dart, utilizando a biblioteca oficial `test`, além de técnicas avançadas como **mocks manuais**, **stubs**, e **tratamento de erros em funções assíncronas** (`Future` e `Stream`).

---

## 🚀 O que eu aprendi

✅ Como testar funções `Future` que retornam dados ou lançam erros  
✅ Como testar `Stream` emitindo valores ou erros  
✅ Como simular erros com `throwsA` e `emitsError`  
✅ Como criar **mocks manuais** para substituir serviços como HTTP  
✅ Como usar `Equatable` para facilitar comparação de objetos  
✅ Como garantir código testável e de fácil manutenção  

---

## 📁 Estrutura dos Testes

### 1. Funções assíncronas com `Future`

```dart
Future<List<int>> fetchNumbers({int count = 3}) async {

  if (count <= 0) {

    throw ArgumentError('Count must be greater than zero');

  }

  

  await Future.delayed(Duration(milliseconds: 500));

  return List.generate(count, (i) => i + 1);

}
```

🧪 **Testes**:

- ✅ Retorna lista `[1, 2, 3]`  
- ✅ Retorna 10 elementos quando `count = 10`  
- ✅ Lança `ArgumentError` se `count <= 0`  

---

### 2. Função com `Stream`

```dart
Stream<int> countStream({int max = 3}) async* {
  if (max <= 0) throw ArgumentError('max must be > 0');
  for (var i = 1; i <= max; i++) {
    await Future.delayed(Duration(milliseconds: 10));
    yield i;
  }
}
```

🧪 **Testes**:

- ✅ Emite `1, 2, 3`  
- ✅ Lança erro se `max <= 0` (`emitsError`)  

---

### 3. Mocks e Stubs manuais (sem dependências externas)

📦 Simulei uma chamada HTTP com `UnoMock`, um mock manual que:

- ✅ Retorna dados JSON pré-definidos (stub)  
- ✅ Lança erro se `withError == true`  

```dart
class UnoMock implements Uno {

  final bool withError;

  UnoMock({this.withError = false});
  @override
  Future<Response> get(
    String url, {
    Duration? timeout,
    Map<String, String> params = const {},
    Map<String, String> headers = const {},
    ResponseType responseType = ResponseType.json,
    DownloadCallback? onDownloadProgress,
    ValidateCallback? validateStatus,
  }) async {
    if (withError) {
      throw UnoError('Error');
    }
    return Response(
      headers: headers,
      request: Request(
        uri: Uri.base,
        method: 'GET',
        headers: {},
        timeout: Duration.zero,
      ),
      status: 200,
      data: productListJson,
    );
  }
  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}
```

---

## 🧠 Aprendizados Pessoais

Nesse projeto aprendi como funcionam os testes de unidades, como testar funções, streams e Futures. Aprendi também como lidar com testes que precisam de 'await' e 'completion'.

Além disso, aprendi como funciona por trás dos panos quando não usamos um pacote de Mock, fazendo todo esse trabalho manualmente para simular a realidade com controle total.

Essa experiência reforçou minha visão de que **bons testes garantem confiança no código** e tornam o desenvolvimento mais ágil e sustentável.

---

## 🛠️ Tecnologias Utilizadas

- Dart  
- Pacote oficial [`test`](https://pub.dev/packages/test)  
- `Equatable` para comparação de objetos  
- Mock manual da biblioteca `Uno`

---

## 👨‍💻 Autor

**Yuri Oliveira Trindade**  
📫 [https://www.linkedin.com/in/deviruy/]  
🚀 Este repositório faz parte do meu portfólio de aprendizado com foco em testes e qualidade de código..
