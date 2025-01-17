:-multifile related_to/2.
:-multifile contains/2.

:-['hypothesis_new'].


check_hyp(100,TP,TN):-
   open('evaluatation.txt', write, Stream),
   write(Stream,'Number of TruePositiv = '),writeln(Stream,TP),
   write(Stream,'Number of TrueNegative = '),writeln(Stream,TN),
   Acc is (TP+TN)/100,
   write(Stream,'Accuracy = '),writeln(Stream,Acc),
   close(Stream),!.
   

   
check_hyp(Count,TP,TN):-
    multifile(related_to/2),
    multifile(contains/2),
   ['bk_final/test/bk_environment2.pl'],
   
   atom_concat('bk_final/test/bk_test-single_',Count,F),
   atom_concat(F,'.pl', LF),
   [LF],
   atom_concat('example_',Count,C),
   ((category(C,environment),write(C),writeln('->True'),(Count<50,TP1 is TP+1,TN1=TN;TP1=TP,TN1=TN));write(C),writeln('->False'),(Count>=50,TN1 is TN +1,TP1=TP;TP1=TP,TN1=TN)),
   writeln(TP1), 
   writeln(TN1),     
   unload_file('bk_final/test/bk_environment2.pl'),
   unload_file(LF),
   Count1 is Count + 1,
   check_hyp(Count1,TP1,TN1).
    
:-
   check_hyp(0,0,0).
