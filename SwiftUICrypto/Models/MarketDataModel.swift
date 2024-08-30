//
//  MarketDataModel.swift
//  SwiftUICrypto
//
//  Created by Sergio Buitrago on 29/08/24.
//

import Foundation


// JSON data
/*
 URL: https://api.coingecko.com/api/v3/global
 JSON Response:
 
 {
   "data": {
     "active_cryptocurrencies": 14664,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 1180,
     "total_market_cap": {
       "btc": 36755152.62583696,
       "eth": 861823882.2464099,
       "ltc": 35030579054.76713,
       "bch": 6793305055.855134,
       "bnb": 4078001663.95332,
       "eos": 4482756560597.919,
       "xrp": 3861705739210.442,
       "xlm": 23412368450172.945,
       "link": 198489127842.91788,
       "dot": 514193630940.6458,
       "yfi": 421093873.5281978,
       "usd": 2178412671505.4614,
       "aed": 8001309742439.541,
       "ars": 2070029670177515.8,
       "aud": 3204699914067.1,
       "bdt": 261042941653119.47,
       "bhd": 820978383510.2634,
       "bmd": 2178412671505.4614,
       "brl": 12248125245539.459,
       "cad": 2936358684365.7124,
       "chf": 1843499150562.8667,
       "clp": 1992964400780201.2,
       "cny": 15461501777277.162,
       "czk": 49266181501316.87,
       "dkk": 14667703448669.277,
       "eur": 1966555503963.5403,
       "gbp": 1654027351633.3386,
       "gel": 5870822149707.217,
       "hkd": 16984310263229.684,
       "huf": 772429664400719.2,
       "idr": 33674477719610030,
       "ils": 7972663615809.258,
       "inr": 182747910377661.84,
       "jpy": 315462474198720.25,
       "krw": 2906192552866570,
       "kwd": 665339511781.8821,
       "lkr": 655505124415102.5,
       "mmk": 4570309784818453,
       "mxn": 43217173908731.55,
       "myr": 9391137026860.027,
       "ngn": 3468534007951138.5,
       "nok": 22886821782069.305,
       "nzd": 3479975031301.885,
       "php": 122436599352453.84,
       "pkr": 606851309964634.2,
       "pln": 8424875945461.749,
       "rub": 200413120554385.84,
       "sar": 8174674358075.989,
       "sek": 22290718760225.85,
       "sgd": 2837853041772.908,
       "thb": 73957110197610.39,
       "try": 74221904971482.67,
       "twd": 69466312475301.75,
       "uah": 90035823815518.03,
       "vef": 218124460797.84186,
       "vnd": 54198907267055976,
       "zar": 38705541847632.74,
       "xdr": 1618700033339.5315,
       "xag": 74071738272.38486,
       "xau": 863762408.3786311,
       "bits": 36755152625836.96,
       "sats": 3675515262583696
     },
     "total_volume": {
       "btc": 1418287.7567217655,
       "eth": 33255589.30698822,
       "ltc": 1351740853.5891988,
       "bch": 262136345.52078012,
       "bnb": 157359701.1214772,
       "eos": 172978162027.57297,
       "xrp": 149013392101.50067,
       "xlm": 903423687741.6066,
       "link": 7659190065.887566,
       "dot": 19841423018.191628,
       "yfi": 16248940.423002442,
       "usd": 84059398488.57843,
       "aed": 308750170648.54785,
       "ars": 79877174423696.48,
       "aud": 123661210126.32204,
       "bdt": 10072982471170.54,
       "bhd": 31679465508.390564,
       "bmd": 84059398488.57843,
       "brl": 472623968002.03235,
       "cad": 113306605301.7019,
       "chf": 71135938446.14734,
       "clp": 76903421895245.75,
       "cny": 596619986712.5342,
       "czk": 1901056506418.4368,
       "dkk": 565989330319.0859,
       "eur": 75884369807.3687,
       "gbp": 63824704143.806335,
       "gel": 226540078926.7188,
       "hkd": 655381288928.982,
       "huf": 29806094048923.723,
       "idr": 1299412355865172.5,
       "ils": 307644789558.4236,
       "inr": 7051776562966.244,
       "jpy": 12172893673326.504,
       "krw": 112142571093806.45,
       "kwd": 25673757723.975506,
       "lkr": 25294273755043.27,
       "mmk": 176356618029037.34,
       "mxn": 1667640704932.96,
       "myr": 362380066884.261,
       "ngn": 133841896055469.16,
       "nok": 883144179925.5148,
       "nzd": 134283376016.33116,
       "php": 4724516630470.096,
       "pkr": 23416846933955.75,
       "pln": 325094511971.8712,
       "rub": 7733432045902.6,
       "sar": 315439869758.4655,
       "sek": 860142082063.7007,
       "sgd": 109505523361.44693,
       "thb": 2853816578687.237,
       "try": 2864034334811.122,
       "twd": 2680528128703.0273,
       "uah": 3474253198832.945,
       "vef": 8416867570.661359,
       "vnd": 2091397834395835.2,
       "zar": 1493548310861.61,
       "xdr": 62461512878.516945,
       "xag": 2858239784.2356997,
       "xau": 33330392.09470626,
       "bits": 1418287756721.7654,
       "sats": 141828775672176.56
     },
     "market_cap_percentage": {
       "btc": 53.72534422738562,
       "eth": 13.954327284901616,
       "usdt": 5.4285058619431386,
       "bnb": 3.576944054711686,
       "sol": 3.010717139869529,
       "usdc": 1.597235698640419,
       "xrp": 1.4548067433408256,
       "steth": 1.134451554314462,
       "doge": 0.6637656499636241,
       "trx": 0.6398093301076732
     },
     "market_cap_change_percentage_24h_usd": -0.9488872771151902,
     "updated_at": 1724957913
   }
 }
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}


struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: {$0.key == "usd"}){
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    var volume: String {
        if let item = totalVolume.first(where: {$0.key == "usd"}) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: {$0.key == "btc"}) {
            return item.value.asPercentString()
        }
        return ""
    }
}
