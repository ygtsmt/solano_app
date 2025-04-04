import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatSocketService {
  late IO.Socket socket;

  // Başlatma fonksiyonu
  void connect() {
    socket = IO.io(
      //  'ws://192.168.1.125:8080',
      'wss://chat-psikologofisim.mindmons.com',
      IO.OptionBuilder()
          .setTransports(['websocket', 'polling'])
          .enableForceNewConnection()
          .enableReconnection()
          .build(),
    );

    // Bağlantıyı başlat
    // socket
    //   ..connect()

    //   // Bağlantı başarılıysa
    //   ..onConnect((_) {
    //     print('✅ Socket.IO bağlantısı kuruldu!');
    //   })

    //   // Bağlantı kesildiğinde
    //   ..onDisconnect((_) {
    //     print('⚠️ Socket.IO bağlantısı kesildi!');
    //   })

    //   // Backend'den `filteredData` event'ini dinle
    //   ..on('filteredData', (data) {
    //     print('objectobjectobjectobjectobject :${data}');
    //   });
  }

  // **ID'ye göre veri çekme (`requestDataById`)**
  void requestDataById(String id, String token) {
    socket.emit(
      'requestDataById',
      {'id': id, 'auth': 'Bearer $token'},
    );
    print("📡 ID ile veri talebi gönderildi: $id");
  }

  // **Yeni mesaj gönderme (`newChat`)**
  // void sendChatMessage({
  //   required String chatId,
  //   required String message,
  //   required String sender,
  //   required String receiver,
  // }) {
  //   final chatMessage = {
  //     "chat_id": chatId,
  //     "message": message,
  //     "sender": sender,
  //     "receiver": receiver,
  //   };

  //   socket.emit('newChat', chatMessage);
  //   print("📤 Yeni mesaj gönderildi: $chatMessage");
  // }

  // Bağlantıyı kapatma
  // void disconnect() {
  //   socket.disconnect();
  // }
}
