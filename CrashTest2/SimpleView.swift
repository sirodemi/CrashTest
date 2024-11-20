import SwiftUI

//@main
//struct CrashTest2App: App {
//    var body: some Scene {
//        WindowGroup {
//            SimpleView()
//                .environmentObject(SimpleModel())
//        }
//    }
//}

// シンプルなモデル
class SimpleModel: ObservableObject {
    @Published var member: String = "Alice"
}

// シンプルなビュー
struct SimpleView: View {
    @EnvironmentObject var model: SimpleModel

    let friends = ["Alice", "Bob", "Charlie"]

    var body: some View {
        Picker("Select a friend", selection: $model.member) {
            ForEach(friends, id: \.self) { friend in
                Text(friend).tag(friend)
            }
        }
    }
}

// プレビュー
struct SimpleView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleView()
            .environmentObject(SimpleModel())
    }
}

