//
//  CoinDataService.swift
//  SwiftUICrypto
//
//  Created by Sergio Buitrago on 26/08/24.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
     
    var coinSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins(){
        
        // Verifica que la URL proporcionada sea válida. Si no lo es, simplemente sale de la función.
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        
        coinSubscription = NetworkingManager.download(url: url)

        /*
         Esta línea decodifica los datos recibidos del formato JSON a un
         array de CoinModel. CoinModel debe ser un tipo
         que conforme al protocolo Codable.
         */
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
        
        /*
          sink es un subscriber que recibe dos closures:
             •   Closure de finalización (completion): Aquí se maneja la terminación
                de la cadena de procesamiento, ya sea completada con éxito o con un error.
         
             •   Closure de recepción de valores (receiveValue): Aquí es donde se maneja el valor recibido del publisher. En este caso, se actualiza la propiedad allCoins con los datos de las monedas recibidas. También cancela la suscripción (coinSubscription?.cancel()) para liberar recursos una vez que los datos se hayan recibido.
         */
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })        
    }
}
