:-style_check(-discontiguous).
:-use_module('metagol').
:-multifile related_to/2.
:-multifile contains/2.

max_clauses(5).
body_pred(related_to/2).
body_pred(contains/2).

metarule([P,Q,B], [P,A,B], [[Q,A,B]]).
%metarule([P,Q,R], [P,A,B], [[Q,A,C],[R,C,B]]).%:-%metagol:type(R,1,head_pred).
%metarule([P,Q,R], [P,A,B], [[Q,A,C],[R,C,B]]).
metarule([P,Q], [P,A,B], [[Q,A,C],[P,C,B]]).

saveHype([],_).
saveHype([(H)|T],File):-
    write(File,H),writeln(File,'.'),
    saveHype(T,File).

% :-['bk_final/train/bk_train-single_0.pl'].
% :-['bk_final/train/bk_train-single_21.pl'].
% :-['bk_final/train/bk_environment2.pl'].
generatePosExample(0,Example,Example,Files,Files).
generatePosExample(Count,Example,Example1,Files,Files1):-
    random(0, 9, RP),
    atom_concat('bk_final/train/bk_train-single_',RP,F),
    atom_concat(F,'.pl', LF),
    [LF],
    atom_concat('example_',RP,C),
    Ex =..[category,C,environment],
    append([Ex],Example,Pos),
    Count1 is Count - 1,
    append([LF], Files, Files2),
    generatePosExample(Count1,Pos,Example1,Files2,Files1).

generateNegExample(0,Example,Example,Files,Files).
generateNegExample(Count,Example,Example1,Files,Files1):-
    random(20, 29, RP),
    atom_concat('bk_final/train/bk_train-single_',RP,F),
    atom_concat(F,'.pl', LF),
    [LF],
    atom_concat('example_',RP,C),
    Ex =..[category,C,environment],
    append([Ex],Example,Pos),
    Count1 is Count - 1,
    append([LF], Files, Files2),
    generateNegExample(Count1,Pos,Example1,Files2,Files1).

unload_all_files([]).
unload_all_files([H|T]):-
    unload_file(H),
    unload_all_files(T).


learn_hyp(10,_,_):-!.
learn_hyp(Count,Npos,Nneg):-
    write('---------------------------------'),write(Count), writeln('---------------------------------'),
    multifile(related_to/2),
    multifile(contains/2),
    ['bk_final/test/bk_environment2.pl'],
    generateNegExample(Nneg,[],NEx,[],NFiles),
    generatePosExample(Npos,[],PEx,[],PFiles),
 
    Pos = PEx,%category(example_1,environment),category(example_2,environment),category(example_3,environment),category(example_4,environment),category(example_5,environment),category(example_6,environment),category(example_7,environment),category(example_8,environment),category(example_9,environment)],
    Neg = NEx,
    %Neg = [category(example_10,environment),category(example_11,environment),category(example_12,environment),category(example_13,environment),category(example_14,environment),category(example_15,environment),category(example_16,environment),category(example_17,environment),category(example_18,environment),category(example_19,environment)],
    
    ((learn(Pos,Neg,Prog),
    pprint(Prog,Hyp),reverse(Hyp, Hyp1),
    
    atom_concat('hyp/hypothesis_',Count,H),
    atom_concat(H,'.pl',HF),
    
    %open('hypothesis.pl',append,OS),
    %writeln(OS,'Positive example is '),write(OS,RP),write(OS,' and negative example is '),write(OS,RN),writeln(OS,Hyp1),
    
    open(HF,write,OS1),saveHype(Hyp1,OS1),close(OS1)
    );true),
    
    unload_file('bk_final/test/bk_environment2.pl'),
    unload_all_files(NFiles),
    unload_all_files(PFiles),
    Count1 is Count + 1,
    learn_hyp(Count1,Npos,Nneg).

:-
    make_directory('hyp'),
    learn_hyp(0,6,6).











    
