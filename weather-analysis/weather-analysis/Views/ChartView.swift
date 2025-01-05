import SwiftUI

struct ChartView: View {
    let data: [VisualizationData]
    
    var body: some View {
        VStack {
            Text("Alert Chart")
                .font(.headline)
                .padding()
            GeometryReader { geometry in
                HStack(alignment: .bottom, spacing: 10) {
                    ForEach(data) { item in
                        VStack {
                            Text("\(item.count)")
                                .font(.caption)
                                .rotationEffect(.degrees(-90))
                                .offset(y: -5)
                            Rectangle()
                                .fill(Color.blue)
                                .frame(width: 20, height: CGFloat(item.count) * 10)
                            Text(item.type)
                                .font(.caption)
                                .lineLimit(1)
                        }
                    }
                }
            }
            .padding()
        }
        .frame(height: 200)
    }
}
