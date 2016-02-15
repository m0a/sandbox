import Data.Char


digits::Int -> Int
digits = length.show
sq::Int -> Int
sq x = 2 ^ x

ultimate :: Int -> String
ultimate 42 = "人生、宇宙、すべての答え"
ultimate n = show n

-- fib :: Int -> Int
-- fib 0 = 1
-- fib 1 = 1
-- fib n | n >= 0 = fib (n-1) + fib (n-2)
--       | otherwise = -1

length' :: [a] -> Int
length' [] = 0
length' (x:xs) = 1 + length' xs


each :: (a -> b) -> (c -> d) -> (a,c) -> (b,d)
each f g (x,y) = (f x,g y)

zipWidth' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWidth' _ [] _ = []
zipWidth' _ _ [] = []
zipWidth' f (a:as) (b:bs) = f a b : zipWidth' f as bs

nats :: [Integer]
nats = 0 : map (+2) nats

fibs :: [Integer]
fibs = [1,1] ++ zipWith (+) fibs (tail fibs)

mean :: [Double] -> Double
mean xs = sum xs / fromIntegral (length xs)

mean' :: [Double] -> Double
mean' xs = let (res,len) =  foldl ( \(m,n) x -> (m + x / len, n+1)) (0,0) xs in res


-- a = 1

-- f a = if a == 1 then print "1" else print "?"

-- fact :: Maybe Int ->  Maybe Int
-- fact Just 0 = Just 1
-- fact (Just n)  | n < 0 =  Just 0
--              | otherwise =   Just (n * (fact (n - 1)))

-- (1)
-- fib :: Int -> Int
-- fib 0 = 0
-- fib 1 = 1
-- fib 2 = 1
-- fib n = fib (n - 1) + fib (n - 2)


-- (2)

-- fib :: Int -> Int
-- fib n
--     | n <= 0 = 0
--     | n == 1 || n == 2 = 1
--     | n > 2 = fib (n - 1) + fib (n - 2)


--(3)

fib n = case n of
    0 -> 0
    1 -> 1
    2 -> 1
    _ | n > 2 -> fib (n - 1) + fib (n - 2)


triple :: Int -> Int
triple  = do
  m <- id
  d <- (m+)
  (d+)


--(4)
take' :: Int -> [a] -> [a]
take' _ [] = []
take' 0 _ = []
take' n (x:xs) = x:take' (n-1) xs

drop' :: Int -> [a] -> [a]
drop' _ [] = []
drop' 0 xs = xs
drop' n (_:xs) =  drop' (n-1) xs

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) =  reverse' xs ++ [x]

sum' :: [Integer] -> Integer
sum' [] = 0
sum' (x:xs) = x + sum' (xs)

product' :: [Integer] -> Integer
product' [] = 1
product' (x:xs) = x * product' xs


fact n = product [1..n]

primer ::[Integer]
primer = [2..]


perpPoint (a,b,c) (p,q) = (x,y) where
  x = (a * c + b * d)/(a * a + b * b)
  y = (b * c - a * d)/(a * a + b * b)
  d = b * p - a* q


-- rot13 (ch:str) = let rotCode = (ord ch)+13 in if ord 'z' > rotCode then chr (ord 'a' + ord 'z' -rotCode)  else chr rotCode rot13 str
rot13 [] = []
rot13 (ch:str)
  |  ord 'z' - rotNum >= 0  = chr rotNum:rot13 str
  |  otherwise = chr (ord 'a' - 1  + rotNum - ord 'z'):rot13 str
  where
    rotNum =  (ord ch)+13
