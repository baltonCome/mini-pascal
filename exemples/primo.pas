Program prm;
Uses crt;

Var
	j,i, n: Integer;
	primo: Boolean;

Begin
	Write('Digite um numero: ');
	readln(n);
	for i:= 2 to n Do
	Begin
		primo:=true;
	    for j:=2 to i-1 do
	    	if (i MOD j)= 0 then primo:=false;
	    if primo then
			Begin
				writeln(i, ' e primo');
		  end;
	End;
End.