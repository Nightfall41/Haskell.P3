module Opdracht2
    where

    import Data.List
    import Data.Ord

    -- opdracht 1&2
    data Boek = Boek
                {
                    prijs  :: Float,
                    titel  :: String,
                    auteur :: String
                } deriving (Show,Eq,Ord)
    --opdracht 4 en 6
    data Box x = GeenInhoud | Gevuld x
                deriving Show

    data Zak x = Leeg | Vol x 
                deriving Show

    instance Functor Box where  
            fmap f (Gevuld x) = Gevuld (f x)
            fmap f GeenInhoud = GeenInhoud
    
    instance Functor Zak where
            fmap f (Vol x)    = Vol (f x)
            fmap f Leeg       = Leeg        
            
            
    -- opdracht 3
    java   = Boek 20.00 "Learn Java" "Schaum"
    scrum  = Boek 4.99  "Scrum for dummies" "Dummies"
    haskell= Boek 0.0 "Learn you a great Haskell" "Wessel Oele"
    sql    = Boek 14.99 "Databases" "Some Asian Dude"
    google = Boek 60.00 "Google, everything you need" "internet"

    list  = [java,scrum,haskell,google,sql]

    isEqual :: Boek->Boek->Bool
    isEqual a b = a==b
    
    sortBoek :: [Boek]->[Boek]
    sortBoek = sortBy (comparing titel) 

    --opdracht 5
    placeBoekInBox :: [Boek]->(Box [Boek])  
    placeBoekInBox x = Gevuld x 

    extractBoekFrombox :: (Box [Boek])->[Boek]
    extractBoekFrombox x = insideBox x 


    -- Zoek uit wat Functor is en hoe het exact werkt
    -- fmap :: (a->b)->a->b
    --http://learnyouahaskell.com/making-our-own-types-and-typeclasses
    
---------------------------------------
--Hulpfunctie
    insideBox (Gevuld x)=x

    
