module Opdracht1
    where
    -- opdracht 1 Geofig is het data type en bijv Vierkant is de Value Constructor
    data Geofig = Vierkant 
                  {
                     zijde  :: Double,
                     kleur  :: Kleur
                  }|
                  Driehoek
                  {
                     zijde  :: Double,
                     kleur  :: Kleur
                  }|
                  Circel
                  {
                     straal :: Double,
                     kleur  :: Kleur
                  }|
                  Rechthoek
                  {
                     zijdeL :: Double,
                     zijdeB :: Double,
                     kleur  :: Kleur
                  }
                  deriving (Show,Eq) --deriving geeft aan wat je met de data kan doen Eq is bijv de 'permissie' dat deze data types vergeleken kunnen worden
---------------------------------------------------------------------
    data Kleur = Rood | Blauw | Geel | Oranje deriving (Show,Eq)
---------------------------------------------------------------------
    -- geometrische objecten 
    vierkant  = Vierkant  3.0 Blauw 
    driehoek  = Driehoek  5.0 Rood 
    circel    = Circel    1.5 Geel 
    rechthoek = Rechthoek 4.65  5.21 Oranje 
---------------------------------------------------------------------
    --opdracht 3
    oppervlakte :: Geofig->Double
    oppervlakte x
                |isVierkant  x == True = 2*(zijde x)
                |isCircel    x == True = pi*((straal x)^2)
                |isDriehoek  x == True = ((zijde x)*(zijde x))/2
                |isRechthoek x == True = (zijdeB x)*(zijdeL x)
                        where pi=3.14159265359  
---------------------------------------------------------------------
    --opdracht 4
    omtrek :: Geofig->Double
    omtrek x
                |isVierkant  x == True = 4*(zijde x)
                |isCircel    x == True = 2*pi*(straal x)
                |isDriehoek  x == True = (zijde x)*3
                |isRechthoek x == True = 2*((zijdeB x)+(zijdeL x))
                        where pi=3.14159265359
---------------------------------------------------------------------
    --opdracht 5
    onlyVierkant  :: [Geofig]->[Geofig]
    onlyVierkant [] = []
    onlyVierkant  (x:xs) = if isVierkant x == True 
                         then x:onlyVierkant xs
                         else onlyVierkant xs

    onlyDriehoek  :: [Geofig]->[Geofig]
    onlyDriehoek [] = []
    onlyDriehoek  (x:xs) = if isDriehoek x == True 
                          then x:onlyDriehoek xs
                          else onlyDriehoek xs

    onlyCircel    :: [Geofig]->[Geofig]
    onlyCircel  [] = []
    onlyCircel    (x:xs) = if isCircel x == True 
                          then x:onlyCircel xs
                          else onlyCircel xs

    onlyRechthoek :: [Geofig]->[Geofig]
    onlyRechthoek [] = []
    onlyRechthoek (x:xs) = if isRechthoek x == True 
                          then x:onlyRechthoek xs
                          else onlyRechthoek xs
---------------------------------------------------------------------
    --opdracht 6
    requestGeofig :: String->[Geofig]->[Geofig]
    requestGeofig soortType lijst 
                    |convertStringtoGeofig soortType == vierkant = onlyVierkant  lijst 
                    |convertStringtoGeofig soortType == driehoek = onlyDriehoek  lijst
                    |convertStringtoGeofig soortType == circel   = onlyCircel    lijst
                    |convertStringtoGeofig soortType == rechthoek= onlyRechthoek lijst
                    |otherwise                                   =error "object niet gevonden in geheugen"

    --hulp functie opdracht 6
    convertStringtoGeofig :: String->Geofig
    convertStringtoGeofig x
                        |x=="vierkant"    =vierkant
                        |x=="driehoek"    =driehoek
                        |x=="circel"      =circel
                        |x=="rechthoek"   =rechthoek
                        |x=="Vierkant"    =vierkant
                        |x=="Driehoek"    =driehoek
                        |x=="Circel"      =circel
                        |x=="Rechthoek"   =rechthoek
                        |otherwise        = error "object niet gevonden in geheugen"
---------------------------------------------------------------------
    --opdracht 7
    requestColour :: Kleur->[Geofig]->[Geofig]
    requestColour kleur []= []
    requestColour kleur (x:xs) = if kleurtje x == kleur
                                then x:requestColour kleur xs
                                else requestColour kleur xs                    
---------------------------------------------------------------------
    --opdracht 8
    requestBiggestSize :: [Geofig]->[Geofig
    requestBiggestSize []=[]
    requestBiggestSize 
--------------------------------------------
    --hulp functies 
    isVierkant  (Vierkant  _ _)   = True
    isVierkant  (Driehoek  _ _  ) = False
    isVierkant  (Circel    _ _  ) = False
    isVierkant  (Rechthoek _ _ _) = False
--------------------------------------------
    isDriehoek  (Driehoek  _ _)   = True
    isDriehoek  (Vierkant  _ _  ) = False
    isDriehoek  (Circel    _ _  ) = False
    isDriehoek  (Rechthoek _ _ _) = False 
--------------------------------------------
    isCircel    (Circel    _ _)   = True
    isCircel    (Vierkant  _ _  ) = False
    isCircel    (Driehoek  _ _  ) = False
    isCircel    (Rechthoek _ _ _) = False
--------------------------------------------
    isRechthoek (Rechthoek _ _ _) = True
    isRechthoek (Vierkant  _ _  ) = False
    isRechthoek (Driehoek  _ _  ) = False
    isRechthoek (Circel    _ _  ) = False
-------------------------------------------    
    kleurtje  (Vierkant _ a) = a 
    kleurtje  (Rechthoek _ _ a)=a
    kleurtje  (Circel _ a)=a
    kleurtje  (Driehoek _ a)=a