import Foundation

struct WaitTimesFetcher {
    private let parkID: Int

    init(parkID: Int) {
        self.parkID = parkID
    }

    func fetchWaitTimes(completion: @escaping (Result<ParkQueueTimes, Error>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "https://queue-times.com/parks/\(parkID)/queue_times.json")!) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(FetcherError.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let dateFormatter = DateFormatter()
//                2022-07-08T07:51:05.000Z
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                decoder.dateDecodingStrategy = .formatted(dateFormatter)
                let queueTimes = try decoder.decode(ParkQueueTimes.self, from: data)
                completion(.success(queueTimes))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    enum FetcherError: Error {
        case noData
    }
}
