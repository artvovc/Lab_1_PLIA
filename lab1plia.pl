femeie(ana).
femeie(maria).
femeie(lilia).
femeie(valea).
femeie(tatiana).
femeie(felicia).
femeie(alina).
femeie(anghelina).
femeie(cezarina).

barbat(ilie).
barbat(sergiu).
barbat(valeriu).
barbat(nicolai).
barbat(mihail).
barbat(vergiliu).
barbat(artiom).
barbat(stanis).

parinti(ana,ilie,valeriu).
parinti(ana,ilie,tatiana).
parinti(ana,ilie,valea).
parinti(maria,sergiu,nicolai).
parinti(maria,sergiu,felicia).
parinti(lilia,valeriu,alina).
parinti(lilia,valeriu,vergiliu).
parinti(valea,mihail,anghelina).
parinti(tatiana,nicolai,stanis).
parinti(tatiana,nicolai,artiom).

mama(X,Y):- parinti(X,_,Y),femeie(X).
tata(X,Y):- parinti(_,X,Y),barbat(X).
frati(X,Y):- parinti(M,T,X),parinti(M,T,Y),X\=Y.
sora(X,Y):- frati(X,Y),femeie(X).
frate(X,Y):- frati(X,Y),barbat(X).
verisori(X,Y):- parinti(M1,T1,X),parinti(M2,T2,Y),
	(
	  frati(M1,M2);
	  frati(M1,T2);
          frati(T1,M2);
          frati(T1,T2)
	),X\=Y,not(frati(X,Y)).
verisori(_,_).
bunici(X,Y):- parinti(X,Y,Z),(parinti(Z,_,_);parinti(_,Z,_)).
bunica(X):- bunici(X,_).
bunel(X):-bunici(_,X).
nepot(X):-parinti(M,T,X),(parinti(_,_,M);parinti(_,_,T)).
casatoriti(X,Y):- parinti(X,Y,_).
unchi(X,Y):-parinti(M,T,Y),
		((frate(X,M);frate(X,T));
		( parinti(M1,T1,M),parinti(M1,T1,C1),
		casatoriti(C1,X),not(parinti(_,X,Y)));
		( parinti(M2,T2,T),parinti(M2,T2,C2),
		casatoriti(C2,X),not(parinti(_,X,Y)))
		).
matusa(X,Y):-parinti(M,T,Y),
		((sora(X,M);sora(X,T));
		( parinti(M1,T1,M),parinti(M1,T1,C1),
		casatoriti(X,C1),not(parinti(X,_,Y)));
		( parinti(M2,T2,T),parinti(M2,T2,C2),
		casatoriti(X,C2),not(parinti(X,_,Y)))
		).








