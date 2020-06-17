////
////  DownloadService.swift
////  versi-apptest123
////
////  Created by mohammed hassan on 6/14/20.
////  Copyright © 2020 mohammed hassan. All rights reserved.
////
//
//import Foundation
//import Alamofire
//import AlamofireImage
//class DownloadService{
//    static let instance = DownloadService()
//    var count = 0
//    func downloadTrendingReposDictArray(completion: @escaping (_ reposDictArray: [Dictionary<String, Any>]) -> ()) {
//        var trendingReposArray = [Dictionary<String, Any>]()
//
//        AF.request(trendingRepoUrl).responseJSON() { response in
////            print ("#@$#@%^&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
////            print(response)
////            print ("#@$#@%^&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
//            switch response.result {
//            case .success(let value):
//                guard let json = value as? Dictionary<String, Any> else { return }
//                guard let repoDictionaryArray = json["items"] as? [Dictionary<String, Any>] else { return }
//                for repoDict in repoDictionaryArray {
//                    print(self.count)
//                    print ("repo dic count \(repoDictionaryArray.count)")
//                    self.count = self.count + 1
//                    if trendingReposArray.count <= 2 {
//                        guard let name = repoDict["name"] as? String,
//                            let description = repoDict["description"] as? String,
//                            let numberOfForks = repoDict["forks_count"] as? Int,
//                            let language = repoDict["language"] as? String,
//                            let repoUrl = repoDict["html_url"] as? String,
//                            let contributorsUrl = repoDict["contributors_url"] as? String,
//
//                            let ownerDict = repoDict["owner"] as? Dictionary<String, Any>,
//                            let avatarUrl = ownerDict["avatar_url"] as? String else { continue }
//
//                        let repoDictionary: Dictionary<String, Any> = ["name": name, "description": description, "forks_count": numberOfForks, "language": language, "html_url": repoUrl, "contributors_url": contributorsUrl, "avatar_url": avatarUrl]
//
//
//                        trendingReposArray.append(repoDictionary)
//
//                    }
//
//                }
//
//                completion(trendingReposArray)
//
//            case .failure(let error): break
//                // error handling
//            }
//        }
//    }
//
//    func downloadTrendingRepos(completion: @escaping (_ reposArray: [Repo]) -> ()) {
//        var reposArray = [Repo]()
//        downloadTrendingReposDictArray { (trendingReposDictArray) in
//            for dict in trendingReposDictArray {
//
//                                self.downloadTrendingRepo(fromDictionary: dict, completion: { (returnedRepo) in
//                                    if reposArray.count < 9 {
//                                        reposArray.append(returnedRepo)
//                                    } else {
//                                        let sortedArray = reposArray.sorted(by: { (repoA, repoB) -> Bool in
//                                            if repoA.numberOfForks > repoB.numberOfForks {
//                                                return true
//                                            } else {
//                                                return false
//                                            }
//                                        })
//                                        completion(sortedArray)
//                                    }
//                                })
//            }
//
//            completion(reposArray)
//        }
//
//    }
//
//    func downloadTrendingRepo(fromDictionary dict: Dictionary<String, Any>, completion: @escaping( _ repo : Repo) ->()) {
//        let avatarUrl = dict["avatar_url"] as! String
//        let contributorsUrl = dict["contributors_url"] as! String
//        let name = dict["name"] as! String
//        let description = dict["description"] as! String
//        let numberOfForks = dict["forks_count"] as! Int
//        let language = dict["language"] as! String
//        let repoUrl = dict["html_url"] as! String
//
//
//        downloadImageFor(avatarUrl: avatarUrl) { (returnedImage) in
//
//                         self.downloadContributorsDataFor(contributorsUrl: contributorsUrl, completion: { (returnedContributions) in
//
//                             let repo = Repo(image: returnedImage, name: name, description: description, numberOfForks: numberOfForks, language: language, numberOfContributors: returnedContributions, repoUrl: repoUrl)
//
//                             completion(repo)
//                         })
//                     }
//        }
//
//    func downloadImageFor(avatarUrl: String, completion: @escaping (_ image: UIImage) -> ()) {
//        AF.request(avatarUrl).responseImage { (imageReponse) in
//
//            switch imageReponse.result {
//            case .success(let value):
//                let image = value
//
//                completion(image)
//            case .failure(_):
//                print("error")
//            }
//        }
//    }
//
//    func downloadContributorsDataFor(contributorsUrl: String, completion: @escaping (_ contributors: Int) -> ()) {
//        AF.request(contributorsUrl).responseJSON { (response) in
//            switch response.result {
//            case .success(let value):
//                guard let json = value as? [Dictionary<String, Any>] else { return }
//                if !json.isEmpty {
//                    let contributions = json.count
//
//                    completion(contributions)
//                }
//            case .failure(_):
//                print("error")
//
//            }
//        }
//    }
//
//}
//
//  DownloadService.swift
//  versi-app
//
//  Created by Caleb Stultz on 9/7/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireImage

class DownloadService {
    static let instance = DownloadService()
    
    func downloadTrendingReposDictArray(completion: @escaping (_ reposDictArray: [Dictionary<String, Any>]) -> ()) {
        var trendingReposArray = [Dictionary<String, Any>]()
        
        AF.request(trendingRepoUrl).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                guard let json = value as? Dictionary<String, Any> else { return }
                guard let repoDictionaryArray = json["items"] as? [Dictionary<String, Any>] else { return }
                for repoDict in repoDictionaryArray {
                    if trendingReposArray.count <= 9 {
                        
                        guard let name = repoDict["name"] as? String,
                            let description = repoDict["description"] as? String,
                            let numberOfForks = repoDict["forks_count"] as? Int,
                            let language = repoDict["language"] as? String,
                            let repoUrl = repoDict["html_url"] as? String,
                            let contributorsUrl = repoDict["contributors_url"] as? String,
                            let ownerDict = repoDict["owner"] as? Dictionary<String, Any>,
                            let avatarUrl = ownerDict["avatar_url"] as? String else { continue }
                        
                        let repoDictionary: Dictionary<String, Any> = ["name": name, "description": description, "forks_count": numberOfForks, "language": language, "html_url": repoUrl, "contributors_url": contributorsUrl, "avatar_url": avatarUrl]
                        
                        trendingReposArray.append(repoDictionary)
                    } else {
                        break
                    }
                }
                
                completion(trendingReposArray)
            case .failure(_):
                print ("error")
            }
        }
    }
    
    func downloadTrendingRepos(completion: @escaping (_ reposArray: [Repo]) -> ()) {
        var reposArray = [Repo]()
        
        downloadTrendingReposDictArray { (trendingReposDictArray) in
            for dict in trendingReposDictArray {
                
                self.downloadTrendingRepo(fromDictionary: dict, completion: { (returnedRepo) in
                    
                    if reposArray.count < 9 {
                        reposArray.append(returnedRepo)
                    } else {
                        let sortedArray = reposArray.sorted(by: { (repoA, repoB) -> Bool in
                            if repoA.numberOfForks > repoB.numberOfForks {
                                return true
                            } else {
                                return false
                            }
                        })
                        
                        completion(sortedArray)
                    }
                })
            }
        }
    }
    
    func downloadTrendingRepo(fromDictionary dict: Dictionary<String, Any>, completion: @escaping (_ repo: Repo) -> ()) {
        
        let avatarUrl = dict["avatar_url"] as! String
        let contributorsUrl = dict["contributors_url"] as! String
        let name = dict["name"] as! String
        let description = dict["description"] as! String
        let numberOfForks = dict["forks_count"] as! Int
        let language = dict["language"] as! String
        let repoUrl = dict["html_url"] as! String
        
        downloadImageFor(avatarUrl: avatarUrl) { (returnedImage) in
            
            self.downloadContributorsDataFor(contributorsUrl: contributorsUrl, completion: { (returnedContributions) in
                let repo = Repo(image: returnedImage, name: name, description: description, numberOfForks: numberOfForks, language: language, numberOfContributors: returnedContributions, repoUrl: repoUrl)
                
                completion(repo)
            })
        }
    }
    
    func downloadImageFor(avatarUrl: String, completion: @escaping (_ image: UIImage) -> ()) {
        AF.request(avatarUrl).responseImage { (imageReponse) in
            switch imageReponse.result {
            case .success(let value):
                let image = value
                completion(image)
            case .failure(_):
                print("error")
            }
        }
    }
    func downloadContributorsDataFor(contributorsUrl: String, completion: @escaping (_ contributors: Int) -> ()) {
        AF.request(contributorsUrl).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                guard let json = value as? [Dictionary<String, Any>] else { return }
                if !json.isEmpty {
                    let contributions = json.count
                    
                    completion(contributions)
                }
            case .failure(_):
                print("error")
                
            }
        }
    }
    
    
    
    
}








