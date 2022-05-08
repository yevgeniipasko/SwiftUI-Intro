import SwiftUI
import Foundation
import RxSwift
import RxCocoa
import Combine

class YummlyListViewModel: ObservableObject {
    let disposable = DisposeBag()
    @Published var feed: [YummlyListFeedElementModel] = []
    
    func refresh() {
        getFeed()
            .take(1)
            .asSingle()
            .observe(on: MainScheduler.asyncInstance)
            .subscribe(
                onSuccess: { [weak self] listFeedModels in
                    self?.feed = listFeedModels
                }
            )
            .disposed(by: disposable)
    }
}

/* Api Layer */
func getFeed() -> Observable<[YummlyListFeedElementModel]> {
    let headers = [
        "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
        "X-RapidAPI-Key": "2e6a3a19camsh8bdfd9611210592p18d74fjsn722b7f766383"
    ]

    let request = NSMutableURLRequest(
        url: NSURL(string: "https://yummly2.p.rapidapi.com/feeds/list?limit=10&start=0")! as URL,
        cachePolicy: .useProtocolCachePolicy,
        timeoutInterval: 10.0
    )
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers

    let session = URLSession.shared
    return session
        .rx
        .response(request: request as URLRequest)
        .map { (_, data: Data) -> [YummlyListFeedElementModel] in
            let decoder = JSONDecoder()
            do {
                let jsonString = String(data: data, encoding: .utf8)!
                print("JSON string: \(jsonString)")
                let yummlyList = try decoder.decode(YummlyListModel.self, from: data)
                return yummlyList.feed
            } catch {
                throw error
            }
            
        }
}


/* Models */
struct YummlyListModel: Codable {
    let feed: [YummlyListFeedElementModel]
}

struct YummlyListFeedElementModel: Codable {
    let display: YummlyListFeedElementDisplayModel
    let type: String?
    let promoted: Bool?
    let proRecipe: Bool?
    let recipeType: [String]?
}

struct YummlyListFeedElementDisplayModel: Codable {
    struct SourceModel: Codable {
        let sourceRecipeUrl: String?
        let sourceFaviconUrl: String?
        let sourceHttpsOk: Bool?
        let sourceInFrame: Bool?
        let sourceDisplayName: String?
        let sourceSiteUrl: String?
        let eyebrowText: String?
        let sourcePageUrl: String?
        let sourceHttpOk: Bool?
    }
    
    struct ProfileModel: Codable {
        let profileName: String?
        let displayName: String?
        let siteUrl: String?
        let pictureUrl: String?
        let pageUrl: String?
        let description: String?
        let type: String?
        let profileUrl: String?
    }
    
    let displayName: String?
    let images: [String]?
    let flag: String?
    let source: SourceModel?
    let profiles: [ProfileModel]?
}
