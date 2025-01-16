:-style_check(-discontiguous).
:-use_module('metagol').

body_pred(related_to/2).
body_pred(contains/2).
metarule([P,Q,B], [P,A,B], [[Q,A,B]]).
metarule([P,Q,R], [P,A,B], [[Q,A,C],[R,C,B]]).
metarule([P,Q], [P,A,B], [[Q,A,C],[P,C,B]]).
contains(s1,call).
contains(s1,mother).
related_to(mother,family).
related_to(family,house).
related_to(house,home).

contains(s2,email).
contains(s2,dany).
related_to(email,work).
related_to(dany,office).
related_to(call,phone).

contains(s3,buy).
contains(s3,toothpaste).
related_to(toothpaste,house).
related_to(house,home).
related_to(buy,shop).
related_to(buy,purchase).
related_to(buy,action).
related_to(buy,money).
related_to(buy,shopping).
related_to(buy,purchasing).
related_to(buy,transaction).
related_to(buy,trade).
related_to(buy,afford).
related_to(buy,shop).
related_to(buy,sale).
related_to(buy,getting).
related_to(buy,mail_order).
related_to(buy,bluff).
related_to(buy,mercification).
related_to(buy,art_dealer).

:-
    Pos = [category(s1,home),category(s3,home)],
    Neg = [category(s2,home)],
    learn(Pos,Neg).



