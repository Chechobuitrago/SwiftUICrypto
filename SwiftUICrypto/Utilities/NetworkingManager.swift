//
//  NetworkingManager.swift
//  SwiftUICrypto
//
//  Created by Sergio Buitrago on 26/08/24.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unkwon
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🔥] Bad response from URL: \(url)"
            case .unkwon: return "[⚠️] Unknown error ocurred"
            }
        }
    }
        
        static func download(url: URL) -> AnyPublisher<Data, Error> {
            
            
            /* Esto crea un publisher que realiza una
             solicitud de red a la URL dada y publica
             el resultado (datos y respuesta).
             */
            return URLSession.shared.dataTaskPublisher(for: url)
            
            /*
             Especifica que la suscripción al publisher
             se realizará en un thread de fondo (background thread).
             Esto es importante para no bloquear el
             thread principal mientras se realiza la solicitud de red.
             (Ya se ejecuta en el background thread)
             */
            //.subscribe(on: DispatchQueue.global(qos: .default))
            
            /*
             Aquí es donde se manipulan los datos recibidos del publisher.
             Se verifica que la respuesta tenga un código de estado HTTP
             entre 200 y 299 (indicando una respuesta exitosa).
             Si no es así, se lanza un error.
             */
                .tryMap({try handleURLResponse(output: $0, url: url)})
            
            /*
             Si la descarga de la informacion llega a fallar, lo que hace
             es volver a intentar la descarga un numero de veces que se le
             le pasa por parametro, en este caso (3)
             */
                .retry(3)
            
            /*
             Esto asegura que cualquier procesamiento posterior
             (en este caso, la actualización de la propiedad allCoins)
             se realice en el thread principal, que es donde
             se deben hacer las actualizaciones de UI.
             */
//                .receive(on: DispatchQueue.main)
                .eraseToAnyPublisher()
        }
        
        
        static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
            guard let response = output.response as? HTTPURLResponse,
                  response.statusCode >= 200 && response.statusCode < 300 else {
                throw NetworkingError.badURLResponse(url: url)
            }
            return output.data
        }
        static func handleCompletion(completion: Subscribers.Completion<Error>) {
            switch completion {
            case .finished:
                break
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

