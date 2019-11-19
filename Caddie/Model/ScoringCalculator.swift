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
    
    var games = [Game]()
    var course : Course?
    var currentHole: Int
    
    init(teamsResultsForHole: [TeamPlaying], course: Course,currentHole: Int){
        self.currentHole = currentHole
        self.course = course
        for i in 0..<(teamsResultsForHole.count - 1){
            for j in (i + 1)..<(teamsResultsForHole.count){
                games.append(Game(team1: teamsResultsForHole[i], team2: teamsResultsForHole[j]))

            }
        }
    }
//
//    func getScores() -> [Game]{
//        return games
//    }
//
//
    func calculateScoresForHole(){
        calcPointsFromHits()
        calcPointsFromHoyEs()
        calcPointsFromSimpleBonus()
        calcPointsFromComplexBonus()
        
        //Returns gameResults and gameResults is updated by adding current + new points in play game view controller
        
    }
    
    func calcPointsFromHits(){
        //acomodar jugadores de menor a mayor en temporal
//        for game in games{
//            let temp = game.team1.pla
//
//        }
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
        for game in games{
            var finished = false
            for i in 0..<game.team1.players[0].hoyEs.count{
                
                for player in game.team1.players{
                    if(player.hoyEs[i]){
                        //Guardar en la base de datos
                        game.scoreTeam1 = game.scoreTeam1 + 1//* multiplicador del 9 y 18
                        finished = true
                        break
                    }
                }
                if(finished){
                    break//Break para ir al siguiente game
                }
                for player in game.team2.players{
                    if(player.hoyEs[i]){
                        //Guardar en la base de datos
                        game.scoreTeam2 = game.scoreTeam2 + 1//* multiplicador del 9 y 18
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
        for game in games{
            
                
                for player in game.team1.players{
                    if(player.chipIn){
                        //Guardar a la base de datos
                        game.scoreTeam1 = game.scoreTeam1 + 1//* multiplicador del 9 y 18
                    }
                    if(player.sandyPar){
                        //Guardar a la base de datos sandypar
                        game.scoreTeam1 = game.scoreTeam1 + 1//* multiplicador del 9 y 18
                        
                    }
                }
            for player in game.team2.players{
                if(player.chipIn){
                    //Guardar a la base de datos
                    game.scoreTeam2 = game.scoreTeam2 + 1//* multiplicador del 9 y 18
                }
                if(player.sandyPar){
                    //Guardar a la base de datos sandypar
                    game.scoreTeam2 = game.scoreTeam2 + 1//* multiplicador del 9 y 18
                    
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
        for game in games{
            
            
            for player in game.team1.players{
                if(player.hit == self.course!.holes[currentHole - 1] - 1){
                    //Guardar a la base de datos birdie
                    game.scoreTeam1 = game.scoreTeam1 + 1//* multiplicador del 9 y 18
                }
                if(player.hit == self.course!.holes[currentHole - 1] - 2){
                    //Guardar a la base de datos eagle
                    game.scoreTeam1 = game.scoreTeam1 + 2//* multiplicador del 9 y 18
                }
                if(player.hit == self.course!.holes[currentHole - 1] - 3){
                    //Guardar a la base de datos albatros
                    game.scoreTeam1 = game.scoreTeam1 + 3//* multiplicador del 9 y 18
                }
            }
            for player in game.team2.players{
                if(player.hit == self.course!.holes[currentHole - 1] - 1){
                    //Guardar a la base de datos birdie
                    game.scoreTeam2 = game.scoreTeam2 + 1//* multiplicador del 9 y 18
                }
                if(player.hit == self.course!.holes[currentHole - 1] - 2){
                    //Guardar a la base de datos eagle
                    game.scoreTeam2 = game.scoreTeam2 + 2//* multiplicador del 9 y 18
                }
                if(player.hit == self.course!.holes[currentHole - 1] - 3){
                    //Guardar a la base de datos albatros
                    game.scoreTeam2 = game.scoreTeam2 + 3//* multiplicador del 9 y 18
                }
            }
            
        }
        
    }
    //Nota
//    func calcPointsFromHandicap(){
//        //Se calcula y se muestra cuando ves estadisticas
//    }
}
