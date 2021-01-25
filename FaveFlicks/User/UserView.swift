import SwiftUI

struct UserView: View {
  
  @Environment(\.presentationMode) var presentationMode
  @EnvironmentObject var userStore: UserStore
  @State private var userName = ""
  @State private var favoriteGenre = ""

  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("User")) {
          TextField("User Name", text: $userName)
          
          Section(header: Text("Favorite Genre")) {
            GenrePicker(genre: $favoriteGenre)
          }

        }
      }
    }
    .navigationTitle(Text("\(userName)"))
    .navigationBarItems(trailing: Button(action: updateUserInfo) { Text("Update") })
    .onAppear {
      userName = userStore.currentUserInfo?.userName ?? ""
      favoriteGenre = userStore.currentUserInfo?.favoriteGenre ?? ""
    }
  }
  
  func updateUserInfo() {
    let newUserInfo = UserInfo(userName: userName, favoriteGenre: favoriteGenre)
    userStore.currentUserInfo = newUserInfo
    presentationMode.wrappedValue.dismiss()
  }
}



















struct UserView_Previews: PreviewProvider {
  static var previews: some View {
    UserView()
  }
}
