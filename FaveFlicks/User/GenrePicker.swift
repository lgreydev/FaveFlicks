import SwiftUI

struct GenrePicker: View {
    
  @Binding var genre: String
  
  var body: some View {
    Picker(selection: $genre, label: Spacer()) {
      ForEach(Movie.possibleGenres, id: \.self) {
        Text($0)
      }
    }
    .pickerStyle(WheelPickerStyle())
  }
}






struct GenrePicker_Previews: PreviewProvider {
    static var previews: some View {
      GenrePicker(genre: .constant("Sci-Fi"))
    }
}
