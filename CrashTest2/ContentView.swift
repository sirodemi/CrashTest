import SwiftUI

// BreakModelクラス
class BreakModel: ObservableObject {
    @Published var member: String = ""
}

// MockUpクラス
class MockUp: BreakModel {
    override init() {
        super.init()
        self.member = "Alice" // デフォルト値
    }
}

// Breakfastビュー
struct Breakfast: View {
    @EnvironmentObject var breakfast: BreakModel

    let friends = ["Alice", "Bob", "Charlie", "David"]

    var body: some View {
        Picker("Select a friend", selection: $breakfast.member) {
            ForEach(friends, id: \.self) { friend in
                Text(friend).tag(friend)
            }
        }
        .pickerStyle(MenuPickerStyle())
    }
}

// プレビュー
struct Breakfast_Previews: PreviewProvider {
    static var previews: some View {
        Breakfast()
            .environmentObject(MockUp()) // MockUpでプレビューのオブジェクトを設定
    }
}

