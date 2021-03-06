//
//  ScoringCalculator.swift
//  Caddie
//
//  Created by Andres on 11/18/19.
//  Copyright © 2019 Andres. All rights reserved.
//

import Foundation
import UIKit

class ScoringCalculator{
    
    var gamesForTheHole = [Game]()
    var course : Course?
    var currentHole: Int?
    var multiplicator = 1
    init(course: Course){
        self.course = course
    }

    func calculateScoresForHole(teamsResultsForHole: [TeamPlaying],currentHole: Int) -> [Game]{
        self.currentHole = currentHole
        switchMultiplicator(currentHole: currentHole)
        //This will add games that won't be reached if the scoring calculator is not
        //initialized each single time this function is called
        initializeGamesForTheHole(teamsResultsForHole: teamsResultsForHole,teamsSize: teamsResultsForHole.count)
        
        calcPointsFromHits()
        calcPointsFromHoyEs()
        calcPointsFromSimpleBonus()
        calcPointsFromComplexBonus()
        
        //Returns gameResults and gameResults is updated by adding current + new points in play game view controller
        return gamesForTheHole
        
        
    }
    func initializeGamesForTheHole(teamsResultsForHole: [TeamPlaying],teamsSize: Int){
    gamesForTheHole.removeAll()
        for i in 0..<(teamsSize - 1){
                for j in (i + 1)..<(teamsSize){
                    gamesForTheHole.append(Game(team1: teamsResultsForHole[i], team2: teamsResultsForHole[j]))
    
                }
        }
    }
    
    func switchMultiplicator(currentHole: Int){
        if(currentHole == 9 || currentHole == 18 || currentHole == 17 || currentHole == 8){
            multiplicator = 2
        }else{
            multiplicator = 1
        }
    }
    func calcPointsFromHits(){
        //acomodar jugadores de menor a mayor en temporal
        
        let tempGame = gamesForTheHole
        for i in 0..<gamesForTheHole.count{
            tempGame[i].team1.players = tempGame[i].team1.players.sorted(by: { $0.hit < $1.hit })
            tempGame[i].team2.players = tempGame[i].team2.players.sorted(by: { $0.hit < $1.hit })
        }
        
        for k in 0..<tempGame.count{
            for i in 0..<tempGame[k].team1.players.count{
                if(tempGame[k].team1.players[i].hit<tempGame[k].team2.players[i].hit){
                    gamesForTheHole[k].scoreTeam1 = gamesForTheHole[k].scoreTeam1 + 1 * multiplicator
                }
                if(tempGame[k].team1.players[i].hit>tempGame[k].team2.players[i].hit){
                    gamesForTheHole[k].scoreTeam2 = gamesForTheHole[k].scoreTeam2 + 1 * multiplicator
                }
                //What happens when there's a tie
            }
        }
        //For each game
        //Add game counter for each hole played and then multiply it for 2 when hole 9 and 18
        //Compare lowest with lowest, the one with lowest gets one point
        //Compare medium with medium, ... so on
        
        
    }
    
    func calcPointsFromHoyEs(){
        //For each game
        //for each  team para ver si tiene hoyes1, hoyes2, hoyes3, si aplica
        //For  y adentro for each para cada equipo
        //Si tienes hoyEs1  se te da punto
        //CADA equipo puede tener un solo hoyEs 1, 2 o 3 no importa solo 1
        //De una vez guardar en la base de datos
        for k in 0..<gamesForTheHole.count{
            var finished = false
            let playerdao = PlayerDAO()
            for i in 0..<gamesForTheHole[k].team1.players[0].hoyEs.count{
                
                for player in gamesForTheHole[k].team1.players{
                    if(player.hoyEs[i]){
                        //Guardar en la base de datos
                        playerdao.addPointHoyEs(id: player.id)
                        gamesForTheHole[k].scoreTeam1 = gamesForTheHole[k].scoreTeam1 + 1 * multiplicator
                        finished = true
                        break
                    }
                }
                if(finished){
                    break//Break para ir al siguiente game
                }
                for player in gamesForTheHole[k].team2.players{
                    if(player.hoyEs[i]){
                        //Guardar en la base de datos
                        playerdao.addPointHoyEs(id: player.id)
                        gamesForTheHole[k].scoreTeam2 = gamesForTheHole[k].scoreTeam2 + 1 * multiplicator
                        finished = true
                        break
                    }
                }
                if(finished){
                    break
                }
            }
        }
    }
    func calcPointsFromSimpleBonus(){
        //Calcular sandyPar y el chip in
        //Encontraste true le das un punto al equipo y multiplicador en el 9 y en el 18
        //For each game, le asigno a tu equipo punto
        //De una vez guardar en la base de datos
        let playerdao = PlayerDAO()
        
        for k in 0..<gamesForTheHole.count{
            for player in gamesForTheHole[k].team1.players{
                if(player.chipIn){
                    //Guardar a la base de datos
                    playerdao.addPointChipIn(id: player.id)
                    gamesForTheHole[k].scoreTeam1 = gamesForTheHole[k].scoreTeam1 + 1 * multiplicator
                }
                if(player.sandyPar){
                    //Guardar a la base de datos sandypar
                    playerdao.addPointChipIn(id: player.id)
                    gamesForTheHole[k].scoreTeam1 = gamesForTheHole[k].scoreTeam1 + 1 * multiplicator
                    
                }
            }
            for player in gamesForTheHole[k].team2.players{
                if(player.chipIn){
                    //Guardar a la base de datos
                    playerdao.addPointChipIn(id: player.id)

                    gamesForTheHole[k].scoreTeam2 = gamesForTheHole[k].scoreTeam2 + 1 * multiplicator
                }
                if(player.sandyPar){
                    //Guardar a la base de datos sandypar
                    playerdao.addPointChipIn(id: player.id)

                    gamesForTheHole[k].scoreTeam2 = gamesForTheHole[k].scoreTeam2 + 1 * multiplicator
                    
                }
            }
        }
        
    }
    func calcPointsFromComplexBonus(){
        //Birdie, eagle, albatros
        //Recorrer cada jugador para cada game
        //Comparar par - (1, 2, 3) = hits te da el puntaje
        // - 1 true -> 1 punto birdie
        // - 2 true -> 2 puntos eagle
        // - 3 tue -> 3 puntos albatros
        //TOdos por el multiplicador del 9 y el 18
        //De una vez guardar en la base de datos
        let playerdao = PlayerDAO()
        
        for k in 0..<gamesForTheHole.count{
            for player in gamesForTheHole[k].team1.players{
                if(player.hit == self.course!.holes[currentHole! - 1] - 1){
                    //Guardar a la base de datos birdie
                    playerdao.addPointBirdie(id: player.id)
                    gamesForTheHole[k].scoreTeam1 = gamesForTheHole[k].scoreTeam1 + 1 * multiplicator
                }
                if(player.hit == self.course!.holes[currentHole! - 1] - 2){
                    //Guardar a la base de datos eagle
                    playerdao.addPointEagle(id: player.id)
                    gamesForTheHole[k].scoreTeam1 = gamesForTheHole[k].scoreTeam1 + 2 * multiplicator
                }
                if(player.hit == self.course!.holes[currentHole! - 1] - 3){
                    //Guardar a la base de datos albatros
                    playerdao.addPointAlbatros(id: player.id)
                    gamesForTheHole[k].scoreTeam1 = gamesForTheHole[k].scoreTeam1 + 3 * multiplicator
                }
            }
            for player in gamesForTheHole[k].team2.players{
                if(player.hit == self.course!.holes[currentHole! - 1] - 1){
                    //Guardar a la base de datos birdie
                    playerdao.addPointBirdie(id: player.id)
                    gamesForTheHole[k].scoreTeam2 = gamesForTheHole[k].scoreTeam2 + 1 * multiplicator
                }
                if(player.hit == self.course!.holes[currentHole! - 1] - 2){
                    //Guardar a la base de datos eagle
                    playerdao.addPointEagle(id: player.id)
                    gamesForTheHole[k].scoreTeam2 = gamesForTheHole[k].scoreTeam2 + 2 * multiplicator
                }
                if(player.hit == self.course!.holes[currentHole! - 1] - 3){
                    //Guardar a la base de datos albatros
                    playerdao.addPointAlbatros(id: player.id)
                    gamesForTheHole[k].scoreTeam2 = gamesForTheHole[k].scoreTeam2 + 3 * multiplicator
                }
            }
            
        }
        
        
    }
    //Nota
//    func calcPointsFromHandicap(){
//        //Se calcula y se muestra cuando ves estadisticas
//    }
}
