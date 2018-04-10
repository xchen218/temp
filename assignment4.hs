--1.union DONE
removedups [] = []
removedups (k:ks)
	|elem k ks = removedups ks
	|otherwise = [k] ++ removedups ks

union lt1 lt2 = removedups (lt1 ++ lt2)
--directly, we remove all the duplicated elements in lt1++lt2

--2.delete DONE
deletek a b [] = []
deletek 1 b (x:xs) = deletek b b xs --delele 1st then delete every bth 
deletek a b (x:xs) = [x] ++ deletek (a-1) b xs --delete ath and then bth
--b : it is needed to find the next place to delete in the remaining list

delete k [] = [] 
--delete 1 (x:xs) = []
delete k (x:xs) = deletek k k (x:xs)

--3.occurs DONE
data Tree = Leaf Int 
            | Node Tree Int Tree

--occurs :: Int->Tree->Bool
occurs x (Leaf root)
	|x == root = True
      	|otherwise = False
occurs x (Node leftsub root rightsub)
      	|x == root = True
	|x < root = occurs x leftsub
      	|otherwise = occurs x rightsub

--4.delete_last DONE
reverse_list [] = []
reverse_list (k:ks) = reverse_list ks ++ [k]

delete_first x [] = []
delete_first x (y:ys)
	|x == y  = ys
	|otherwise = [y] ++ delete_first x ys

--delete_last a [] = [] //This line is alternative
delete_last a (b:bs) = reverse_list (delete_first a (reverse_list (b:bs)))
--reverse first and delete the 1st occurrence and reverse back

--5.isort DONE
insert x [] = [x]
insert x (y:ys) = if x < y then x:y:ys else y:insert x ys
isort [x] = [x]
isort (x:xs) = insert x (isort xs)

