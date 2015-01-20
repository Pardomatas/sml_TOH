(*HW4 - Merge Sort and Tower of Hanoi by Mychal Wilson*)

(*Merge Sort*)

fun merge([], ys) = ys
  |   merge(xs, []) = xs
  |   merge(x::xs, y::ys) =
          if x < y then x::merge(xs, y::ys)
          else y::merge(x::xs, ys)

  fun split []         = ([],[])
  |   split [a]        = ([a],[])
  |   split (a::b::cs) =
        let val (M,N) = split cs in
          (a::M, b::N)
        end

  fun mergesort []  = []
  |   mergesort [a] = [a]
  |   mergesort [a,b] = if a <= b then [a,b] else [b,a]
  |   mergesort L  =
        let val (M,N) = split L
        in
          merge (mergesort M, mergesort N)
        end;
        
        mergesort ([1, 7, 3, 9, 6, 2]);
        mergesort ([121, 798, 35, 90, 621, 200]);
        mergesort ([68, 91, 34, 45, 89, 23, 11, 3, 90, 76, 53, 89]);
        mergesort ([68, 91, 34, 45, 89, 23, 11, 3, 90, 76, 53, 89, 121, 798, 35, 90, 621, 200]);
        mergesort ([68, 91, 34, 45, 89, 89, 121, 798, 35, 90, 621, 200, 23, 11, 3, 90, 76, 53, 1, 7]);
		
(*--------------------------------------------------------------------------------------------------------------*)
(*Tower of Hanoi*)
		
fun comp(x,y) = 6-(x+y);

fun ttower(k,x,y) =
	if (k=0 orelse x=y) then []
	else if k=1 then [(x,y)]
	else ttower(k-1,x,comp(x,y))
		@ ((x,y)::ttower(k-1,comp(x,y),y));
		
ttower(2,2,2);
ttower(2,1,3);
ttower(4,1,3);