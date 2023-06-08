import SwiftUI

struct VerificationCountDownTimerView: View {
    @State private var secondsRemaining = 60
    @State private var timerIsRunning = false
    @State private var isButtonDisabled = false
    let initialSeconds = 60
    
    var timeString: String {
        let minutes = secondsRemaining / 60
        let seconds = secondsRemaining % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
        
    var body: some View {

        HStack(alignment: .bottom){
            Button {
                if !timerIsRunning {
                    startTimer()
                    resetTimer()
                    isButtonDisabled = true
                } else {
                    resetTimer()
                    isButtonDisabled = false
                }
            } label: {
                Text("отправить код еще раз: ")
                    
                    .multilineTextAlignment(.leading)
            }.disableButton(timerIsRunning)
            .padding(.top, 5)
            
            Text("\(timeString)")
                .font(.system(size: 17, weight: .regular, design: .monospaced))
        }
        
    }
        
    func startTimer() {
        timerIsRunning = true
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if secondsRemaining > 0 {
                secondsRemaining -= 1
            } else {
                timer.invalidate()
                timerIsRunning = false
                resetTimer()
                isButtonDisabled = false
            }
        }
    }
    
    func resetTimer() {
        secondsRemaining = initialSeconds
    }
}

struct VerificationCountDownTimerView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationCountDownTimerView()
    }
}

// MARK: DISABLE BUTTON EXTENTION

extension View{
    func disableButton(_ condition: Bool)-> some View{
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1)
            .animation(.spring())
    }
}
