function V = RKV(fhandel,yi,h,A)

%berechnet die Verfahrensfunktion V für ein RKV mit Tableau A an der Stelle
%yi von der Funktion f=fhandel mit Schrittweite h
%beachte: keine explizites Auftreten der Zeit in f berücksichtigt!
yi = yi';
s = length(A(:,1))-1; %Stufe bestimmen

L(:,1) = fhandel(yi); %K1 initialisieren (K1 bezieht sich auf die Notation mit Steigungswerten)

for j = 2:s
    for i = 1:length(yi)
    z(i) = A(j,2:j)*L(i,:)';
    end
    L(:,j) = fhandel(yi+h*z'); %Iterationsschritt
end

for i = 1:length(yi)
    V(i) = A(s+1,2:s+1)*L(i,:)'; %Verfahrensfunktion
end
V=V';

