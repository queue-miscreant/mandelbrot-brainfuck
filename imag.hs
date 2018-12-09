#!/bin/env runhaskell
data Complex = Num Double Double deriving Show

--z^2 + c, the function used for the mandelbrot set
plusc :: Complex -> Complex -> Complex
plusc (Num a b) (Num c d) = Num (c^2 - d^2 + a) (2*(c*d) + b)

--magnitude of a complex number
mag :: Complex -> Double
mag (Num x y) = sqrt (x^2 + y^2)

inset :: Int -> Complex -> Int
inset numtests x = (numtests-) $ length $ (takeWhile ((<2) . mag)
	--test the numbers generated from applying the function multiple times, disregarding the initial test
	(take numtests $ iterate (plusc x) x))

square tests = [[inset tests $ Num ((x-31)/16) ((31-y)/16) | x <- [0..62]] | y <- [0..62]]

{-
main = main' 0
	where main' x = do putStrLn 
					main' x+1
-}

main = mapM_ (putStrLn . concat . map show) $ square 9
