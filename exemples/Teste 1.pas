Program Crud;
uses crt, dos;

Label
	inicio, login, menu, stock;

Const
	SEMANAS: Array [0..6] of String = ('Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sab');
	MESES: Array [1..12] of String = ('Janeiro', 'Fevereiro', 'Marco', 'Abril', 'Maio', 'Junho',
	'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro');

Type
	Administrador = Record
		username, password: String[15];
		nome, genero, perfil: String;
		nascimento: String[10];
		bi: String[13];
		id: Real;
	End;
	arquivo1 = file of Administrador;
	Produto = Record
		nome_prod, categoria: String;
		id_prod, quantidade, quant,
		cont: Integer;
		preco, cash, cashtotal: Real
	End;
	arquivo2 = file of Produto;
	Vendas_caixa = Record
		preco_, preco_tot, capital,
		capital_total: Real;
	End;
	arquivo3 = file of Vendas_caixa;

Var
	arq1: arquivo1;
	admin: Administrador;
	arq2: arquivo2;
	prod: Produto;
	arq3: arquivo3;
	vend: Vendas_caixa;
	dia, semana, mes, ano, hora, minuto, segundo, msegundo: Word;
	user, senha, nome_admin, nome_: String;
	i, j, n, opcao, quant_: Integer;
	id_admin, _preco, valor: Real;
	encontrei, autentica_user, remover_user, alterei_prod: Boolean;
	tecla: Char;

Function Existe_Administrador(Var fich: arquivo1): Boolean;
	Begin
		{$I-}
		Reset(fich);
		If IOResult = 0 Then
			Existe_Administrador := True
		Else
			Existe_Administrador := False;
		{$I+}
	End;

Procedure Progress_Bar;
	Begin
		j:=0;
		ClrScr;
		textcolor(white);
		gotoxy(32,12);writeln('Aguarde Por favor...');
		Textbackground(lightblue);
		for i := 30 to 54 do
			Begin
		    j:=j+4;
		    Gotoxy(41,14);
		    textcolor(white);
		    Writeln(j,'%');
		    Gotoxy(i,13);
		    textcolor(Black);
		    Write(#62);
		    delay(35);
			end;
			textcolor(white);
	End;

Procedure Registar_Administrador(Var fich: arquivo1);
	Begin
		ClrScr;
		Assign(fich,'Administrador.dat');
		ReWrite(fich);
		getdate(ano, mes, dia, semana);
		admin.id :=  ano + 0000.0001;
		admin.perfil := 'ADMINISTRADOR';
		textcolor(blue);
		textbackground(black);
	  gotoxy(30,2);Writeln('_REGISTO DO ADMINISTRADOR_');
	  textcolor(white);
		textbackground(blue);
		gotoxy(18,7);writeln('ID: ', admin.id:0:4);
		GotoXY(18,8);writeln('Perfil: ', admin.perfil);
		gotoxy(18,9);write('Nome completo: ');
		textcolor(yellow);readln(admin.nome);
		for j := 1 to Length(admin.nome)Do
			admin.nome[j]:= Upcase(admin.nome[j]);
		gotoxy(18,10);textcolor(white);
		write('Data de nascimento(dd/mm/aaaa): ');
		textcolor(yellow);readln(admin.nascimento);
		gotoxy(18,11);textcolor(white);
		write('Bilhete de identidade: ');
		textcolor(yellow);readln(admin.bi);
		for j := 1 to Length(admin.bi)Do
			admin.bi[j]:= Upcase(admin.bi[j]);
		gotoxy(18,12);textcolor(white);
		write('Género: ');
		textcolor(yellow);readln(admin.genero);
		gotoxy(18,13);textcolor(white);
		for j := 1 to Length(admin.genero)do
			admin.genero[j]:= Upcase(admin.genero[j]);
		writeln('==================================================');
		gotoxy(18,14);Write('Username: ');
		textcolor(yellow);readln(admin.username);
		for j := 1 to Length(admin.username)Do
			admin.username[j]:= Upcase(admin.username[j]);
		gotoxy(18,15);textcolor(white);
		write('Password: ');
		textcolor(yellow);readln(admin.password);
		for j:= 1 to Length(admin.password)Do
			admin.password[j]:= Upcase(admin.password[j]);
		write(arq1, admin);
		admin.id := admin.id + 0000.0001;
		close(arq1);
	End;

Procedure Incluir_Administrador(Var fich: arquivo1);
	Begin
		ClrScr;
		Assign(fich,'Administrador.dat');
		Reset(fich);
		Seek(fich, FileSize(fich));
		getdate(ano, mes, dia, semana);
		admin.id := admin.id + 0000.0001;
		admin.perfil := 'ADMINISTRADOR';
		textcolor(blue);
		textbackground(black);
	  gotoxy(30,2);Writeln('_REGISTO DO ADMINISTRADOR_');
	  textcolor(white);
		textbackground(blue);
		gotoxy(18,7);writeln('ID: ', admin.id:0:4);
		GotoXY(18,8);writeln('Perfil: ', admin.perfil);
		gotoxy(18,9);write('Nome completo: ');
		textcolor(yellow);readln(admin.nome);
		for j := 1 to Length(admin.nome)Do
			admin.nome[j]:= Upcase(admin.nome[j]);
		gotoxy(18,10);textcolor(white);
		write('Data de nascimento(dd/mm/aaaa): ');
		textcolor(yellow);readln(admin.nascimento);
		gotoxy(18,11);textcolor(white);
		write('Bilhete de identidade: ');
		textcolor(yellow);readln(admin.bi);
		for j := 1 to Length(admin.bi)Do
			admin.bi[j]:= Upcase(admin.bi[j]);
		gotoxy(18,12);textcolor(white);
		write('Género: ');
		textcolor(yellow);readln(admin.genero);
		gotoxy(18,13);textcolor(white);
		for j := 1 to Length(admin.genero)do
			admin.genero[j]:= Upcase(admin.genero[j]);
		writeln('==================================================');
		gotoxy(18,14);Write('Username: ');
		textcolor(yellow);readln(admin.username);
		for j := 1 to Length(admin.username)Do
			admin.username[j]:= Upcase(admin.username[j]);
		gotoxy(18,15);textcolor(white);
		write('Password: ');
		textcolor(yellow);readln(admin.password);
		for j:= 1 to Length(admin.password)Do
			admin.password[j]:= Upcase(admin.password[j]);
		write(arq1, admin);
		admin.id := admin.id + 0000.0001;
		close(arq1);
	End;

Procedure Dados_Administrador(Var fich: arquivo1);
	Begin
		ClrScr;
		textcolor(blue);
		textbackground(black);
		gotoxy(26,2);writeln('_CONSULTAR DADOS DO ADMINISTRADOR_');
		textcolor(white);
		textbackground(blue);
		gotoxy(13,8);write('Nome completo: ');
		textcolor(yellow);readln(nome_admin);
		for j:= 1 to Length(nome_admin)do
			nome_admin[j]:= Upcase(nome_admin[j]);
		gotoxy(13,9);textcolor(white);
		write('Password: ');
		textcolor(yellow);readln(senha);
		for j:= 1 to Length(senha)Do
			senha[j]:= Upcase(senha[j]);
		Assign(fich, 'Administrador.dat');
		Reset(fich);
		for i:= 0 to FileSize(fich)-1 Do
			Begin
				Seek(fich, i);
				Read(fich, admin);
				if(nome_admin = admin.nome)and(senha = admin.password)Then
					Begin
						with admin Do
							Begin
								ClrScr;
								Progress_Bar;
								ClrScr;
								textcolor(blue);
								textbackground(black);
								gotoxy(34,3);writeln('_DADOS PESSOAIS_');
								textcolor(white);
								textbackground(blue);
								gotoxy(10,7);writeln('ID: ', id:0:4);
								gotoxy(10,8);writeln('PERFIL: ', perfil);
								gotoxy(10,9);writeln('NOME: ', nome);
								gotoxy(10,10);writeln('DATA DE NASCIMENTO: ', nascimento);
								gotoxy(10,11);writeln('BILHETE DE IDENTIDADE: ', bi);
								gotoxy(10,12);writeln('GENERO: ', genero);
								textcolor(blue);
								textbackground(black);
								gotoxy(29,14);writeln('_DADOS DE ACESSO AO SISTEMA_');
								TEXTCOLOR(white);
								textbackground(blue);
								gotoxy(10,17);writeln('Username: ', username);
								gotoxy(10,18);writeln('Password: ', password);
								encontrei:= True;
								gotoxy(10,19);writeln('-------------------------------');
								gotoxy(10,20);writeln('Clique enter para voltar ');
								readln;
								break;
							End;
					End
				Else encontrei := False;
			End;
		Close(fich);
		if (encontrei = False) Then
			Begin
			End;
	End;

Procedure Remover_Administrador(Var fich: arquivo1);
	Begin
		ClrScr;
		textcolor(blue);
		textbackground(black);
		gotoxy(26,2);writeln('_REMOVER DADOS DO ADMINISTRADOR_');
		textcolor(white);
		textbackground(blue);
		gotoxy(13,8);write('Nome completo: ');
		textcolor(yellow);readln(nome_admin);
		for j:= 1 to Length(nome_admin)do
			nome_admin[j]:= Upcase(nome_admin[j]);
		gotoxy(13,9);textcolor(white);
		write('Password: ');
		textcolor(yellow);readln(senha);
		for j:= 1 to Length(senha)Do
			senha[j]:= Upcase(senha[j]);
		Assign(fich, 'Administrador.dat');
		Reset(fich);
		for i:=0 to FileSize(fich)-1 Do
			Begin
				Seek(fich, i);
				Read(fich, admin);
				if(nome_admin = admin.nome)and(senha = admin.password)Then
					Begin
						Close(fich);
						gotoxy(13,11);writeln('Tem certeza de que deseja remover administrador?[S/N]');
						tecla:= ReadKey;
						tecla:= Upcase(tecla);
						if (tecla = 'S')Then
							Begin
								Reset(fich);
								Seek(fich, i+1);
								While not Eof(fich) Do
									Begin
										Read(fich, admin);
										Seek(fich, FilePos(fich)-2);
										Write(fich, admin);
										Seek(fich, FilePos(fich)+1);
									End;
								Seek(fich, FilePos(fich)-1);
								Truncate(fich);
								Close(fich);
								remover_user := True;
								ClrScr;
								Progress_Bar;
								ClrScr;
								gotoxy(22,8);textcolor(lightgreen);writeln('Administrador(a) foi removido(a) com sucesso.');
								gotoxy(22,9);textcolor(white);writeln('Clique enter para voltar.');
								readln;
							End
						Else
							Begin
								if (tecla = 'N')Then
									Begin
										ClrScr;
										remover_user := true;
									End
								Else RunError;
							End;
						ClrScr;
					End
				Else remover_user := False;
			End;
		if (remover_user = False) Then
			Begin
				ClrScr;
				Progress_Bar;
				ClrScr;
				textcolor(lightred);gotoxy(22,8);writeln('Administrador(a) nao registrado(a).');
				textcolor(white);gotoxy(22,9);writeln('Clique enter para voltar ao menu do administrador.');
				readln;
			End;
	End;

Procedure Alterar_Dados_AS(var fich: arquivo1);
	Begin
		ClrScr;
		textcolor(blue);
		textbackground(black);
		gotoxy(30,2);writeln('_ALTERAR DADOS DE ACESSO AO SISTEMA_');
		textcolor(white);
		textbackground(blue);
		GotoXY(18,8);Write('Username: ');
		textcolor(yellow);Readln(user);
		for j:= 1 to Length(senha)Do
			user[j]:=Upcase(user[j]);
		GotoXY(18,9);textcolor(white);
		write('Password: ');
		textcolor(lightgreen);Readln(senha);
		for j:= 1 to Length(senha)Do
			senha[j]:= Upcase(senha[j]);
		Assign(fich, 'Administrador.dat');
		Reset(fich);
		for i := 0 to FileSize(fich)-1 Do
			Begin
				Seek(fich, i);
				Read(fich, admin);
				if(user = admin.username)and(senha = admin.password)Then
					Begin
						ClrScr;
						textcolor(blue);
						textbackground(black);
						gotoxy(30,2);writeln('_INFORME NOVOS DADOS DE ACESSO AO SISTEMA_');
						textcolor(white);
						textbackground(blue);
						gotoxy(18,10);Write('Username: ');
						textcolor(yellow);readln(admin.username);
						for j:= 1 to Length(admin.username)Do
							admin.username[j]:= Upcase(admin.username[j]);
						gotoxy(18,11);textcolor(white);
						write('Password: ');
						textcolor(yellow);readln(admin.password);
						for j:= 1 to Length(admin.password)do
							admin.password[j]:= Upcase(admin.password[j]);
						Assign(fich, 'Administrador.dat');
						Reset(fich);
						write(fich, admin);
						encontrei := True;
						Close(fich);
						ClrScr;
						Progress_Bar;
						ClrScr;
						gotoxy(22,8);textcolor(lightgreen);writeln('Dados alterados com sucesso.');
						gotoxy(22,9);textcolor(white);writeln('Clique enter para voltar ao menu anterior.');
						readln;
					End
				Else encontrei := False;
			End;
		if (encontrei = False)Then
			Begin
				ClrScr;
				Progress_Bar;
				ClrScr;
				textcolor(lightred);gotoxy(22,8);writeln('Administrador(a) nao registado(a).');
				textcolor(white);gotoxy(22,9);writeln('Clique enter para voltar ao menu anterior.');
				readln;
			End;
	End;

Procedure Menu_Administrador(Var fich: arquivo1);
	Label
		menu_admin;
	Begin
		menu_admin:
		ClrScr;
		TEXTCOLOR(BLUE);
		TEXTBACKGROUND(black);
		gotoxy(30,2);writeln('_MENU DO ADMINITRADOR_');
		TEXTCOLOR(WHITE);
		TEXTBACKGROUND(BLUE);
		gotoxy(20,10);writeln('  [1] Consultar dados do administrador   ');
		gotoxy(20,11);WriteLn('  [2] Remover dados do administrador     ');
		gotoxy(20,12);writeln('  [3] Alterar dados de acesso ao sistema ');
		gotoxy(20,13);writeln('  [4] Voltar ao menu incial              ');
		gotoxy(20,14);writeln('=========================================');
		gotoxy(20,15);write('>>> ');
		readln(opcao);
		Case(opcao)Of
			1: Begin
						ClrScr;
						Assign(arq1, 'Administrador.dat');
						Dados_Administrador(arq1);
						goto menu_admin;
				 End;
			2: Begin
						ClrScr;
						Assign(arq1, 'Administrador.dat');
						Remover_Administrador(arq1);
						goto menu_admin;
				 End;
			3: Begin
						ClrScr;
						Assign(arq1, 'Administrador.dat');
						Alterar_Dados_As(arq1);
						goto menu_admin;
				 End;
			4: Read;
		End;
	End;

{-----Subprogramas dos produtos-----}

Function Existe_Produto(Var fich: arquivo2): Boolean;
	Begin
		{$I-}
		Reset(fich);
		if IOResult = 0 Then
			Existe_Produto := True
		Else
			Existe_Produto := False
		{$I+}
	End;

Procedure Registar_Produto(var fich: arquivo2);
	Begin
		Assign(fich, 'Produtos.dat');
		ReWrite(fich);
		prod.id_prod:= 1;
		ClrScr;
		TEXTCOLOR(BLUE);
		TEXTBACKGROUND(black);
		gotoxy(30,2);writeln('_REGISTAR PRODUTOS_');
		TEXTCOLOR(WHITE);
		TEXTBACKGROUND(BLUE);
		gotoxy(22,7);write('Quantos produtos vai registar?');
		Readln(n);
		for i:= 1 to n Do
			Begin
				ClrScr;
				gotoxy(22,6);writeln('Produto nr.: ',prod.id_prod);
				gotoxy(22,7);write('Nome do produto: ');
				Readln(prod.nome_prod);
				for j:= 1 to Length(prod.nome_prod)Do
					prod.nome_prod[j]:= Upcase(prod.nome_prod[j]);
				gotoxy(22,8);write('Categoria: ');
				readln(prod.categoria);
				for j:= 1 to Length(prod.categoria)Do
					prod.categoria[j]:= Upcase(prod.categoria[j]);
				gotoxy(22,9);write('Quantidade: ');
				Readln(prod.quantidade);
				gotoxy(22,10);write('Preco: ');
				Readln(prod.preco);
				prod.cont := prod.cont + 1;
				prod.quant:= prod.quant + prod.quantidade;
				prod.cashtotal:= prod.cashtotal + (prod.preco * prod.quantidade);
				write(fich, prod);
				prod.id_prod:= prod.id_prod + 1;
			End;
		Close(fich);
	End;

Procedure Incluir_Produtos(var fich: arquivo2);
	Begin
		Assign(fich, 'Produtos.dat');
		Reset(fich);
		Seek(fich, FileSize(fich));
		prod.id_prod:= prod.id_prod + 1;
		ClrScr;
		TEXTCOLOR(BLUE);
		TEXTBACKGROUND(black);
		gotoxy(30,2);writeln('_REGISTAR PRODUTOS_');
		TEXTCOLOR(WHITE);
		TEXTBACKGROUND(BLUE);
		gotoxy(22,7);write('Quantos produtos vai registar?');
		Readln(n);
		for i:= 1 to n Do
			Begin
				ClrScr;
				gotoxy(22,6);writeln('Produto nr.: ',prod.id_prod);
				gotoxy(22,7);write('Nome do produto: ');
				Readln(prod.nome_prod);
				for j:= 1 to Length(prod.nome_prod)Do
					prod.nome_prod[j]:= Upcase(prod.nome_prod[j]);
				gotoxy(22,8);write('Categoria: ');
				readln(prod.categoria);
				for j:= 1 to Length(prod.categoria)Do
					prod.categoria[j]:= Upcase(prod.categoria[j]);
				gotoxy(22,9);write('Quantidade: ');
				readln(prod.quantidade);
				gotoxy(22,10);write('Preco: ');
				Readln(prod.preco);
				prod.cont := prod.cont + 1;
				prod.quant:= prod.quant + prod.quantidade;
				prod.cashtotal:= prod.cashtotal + (prod.preco * prod.quantidade);
				write(fich, prod);
				prod.id_prod:= prod.id_prod + 1;
			End;
		Close(fich);
	End;

Procedure Alterar_Produto(var fich: arquivo2);
	Begin
		ClrScr;
		TEXTCOLOR(BLUE);
		TEXTBACKGROUND(black);
		gotoxy(30,2);writeln('_ALTERAR PRODUTOS_');
		TEXTCOLOR(WHITE);
		TEXTBACKGROUND(BLUE);
		write('Nome do produto: ');
		readln(nome_);
		for j:= 1 to Length(nome_)Do
			nome_[j]:= Upcase(nome_[j]);
		Assign(fich, 'Produtos.dat');
		Reset(fich);
		for i:= 0 to  FileSize(fich)-1 Do
			Begin
				Seek(fich, i);
				Read(fich, prod);
				if(nome_ = prod.nome_prod)Then
					Begin
						ClrScr;
						TEXTCOLOR(BLUE);
						TEXTBACKGROUND(black);
						gotoxy(30,2);writeln('_INFORME NOVOS DADOS DO PRODUTOS_');
						TEXTCOLOR(WHITE);
						TEXTBACKGROUND(BLUE);
						gotoxy(22,6);writeln('Produto nr.: ',prod.id_prod);
						gotoxy(22,7);write('Nome do produto: ');
						Readln(prod.nome_prod);
						for j:= 1 to Length(prod.nome_prod)Do
							prod.nome_prod[j]:= Upcase(prod.nome_prod[j]);
						gotoxy(22,8);write('Categoria: ');
						readln(prod.categoria);
						for j:= 1 to Length(prod.categoria)Do
							prod.categoria[j]:= Upcase(prod.categoria[j]);
						gotoxy(22,9);write('Quantidade: ');
						readln(prod.quantidade);
						gotoxy(22,10);write('Preco: ');
						Readln(prod.preco);
						Assign(fich, 'Produtos.dat');
						Reset(fich);
						write(fich, prod);
						alterei_prod := True;
						close(fich);
						ClrScr;
						Progress_Bar;
						ClrScr;
						gotoxy(22,8);textcolor(lightgreen);writeln('Dados alterados com sucesso.');
						gotoxy(22,9);textcolor(white);writeln('Clique enter para voltar ao menu anterior.');
						readln;
					End
				Else alterei_prod := False;
			End;
		if alterei_prod = False Then
			Begin
				ClrScr;
				Progress_Bar;
				ClrScr;
				gotoxy(22,8);textcolor(lightred);writeln('Produto nao registado.');
				gotoxy(22,9);textcolor(white);writeln('Clique enter para voltar ao menu anterior.');
				readln;
			End;
	End;

Procedure Listar_Produtos(var fich: arquivo2);
	Begin
		ClrScr;
		Assign(fich, 'Produtos.dat');
		Reset(fich);
		writeln('LISTA DOS PRODUTOS');
		WriteLn;
		while not Eof(fich) Do
			Begin
				Read(fich, prod);
				WriteLn(prod.id_prod);
				writeln('NOME DO PRODUTO: ', prod.nome_prod);
				writeln('CATEGORIA: ', prod.categoria);
				writeln('QUANTIDADE: ', prod.quantidade);
				WriteLn('PRECO: ', prod.preco:0:2);
				writeln('------------------------------------------------');
			End;
		Close(fich);
	End;

Procedure Remover_Produto(var fich: arquivo2);
	Begin
		ClrScr;
		TEXTCOLOR(BLUE);
		TEXTBACKGROUND(black);
		gotoxy(30,2);writeln('_REMOVER PRODUTO_');
		TEXTCOLOR(WHITE);
		TEXTBACKGROUND(BLUE);
		GotoXY(22,8);WRITEln('Nome do produto: ');
		readln(nome_);
		for j:= 1 to Length(nome_)Do
			nome_[j] := Upcase(nome_[j]);
		Assign(fich, 'Produtos.dat');
		Reset(fich);
		for i:= 0 to FileSize(fich)Do
			Begin
				Seek(fich, i);
				read(fich, prod);
				if(nome_ = prod.nome_prod)Then
					Begin
						Close(fich);
						gotoxy(22,9);writeln('Tem certeza de que deseja remover produto?[S/N]');
						tecla := ReadKey;
						tecla := Upcase(tecla);
						if(tecla = 'S')Then
							Begin
								Reset(fich);
								Seek(fich, i+1);
								While not Eof(fich) Do
									Begin
										Read(fich, prod);
										Seek(fich, FilePos(fich)-2);
										Write(fich, prod);
										Seek(fich, FilePos(fich)+1);
									End;
								Seek(fich, FilePos(fich)-1);
								Truncate(fich);
								Close(fich);
								encontrei := True;
								ClrScr;
								Progress_Bar;
								ClrScr;
								gotoxy(22,8);textcolor(lightgreen);writeln('Produto foi removido com sucesso.');
								gotoxy(22,9);textcolor(white);writeln('Clique enter para voltar.');
								readln;
							End
						Else
							Begin
								if(tecla = 'N')Then
									Begin
										ClrScr;
										Progress_Bar;
										ClrScr;
										textcolor(white);gotoxy(22,8);writeln('Operacao cancelada.');
										textcolor(white);gotoxy(22,9);writeln('Clique enter para voltar ao menu anterior.');
										readln;
									End
								Else RunError;
							End;
					End
				Else encontrei := False;
			End;
			if(encontrei = False)Then
				Begin
					ClrScr;
					Progress_Bar;
					ClrScr;
					textcolor(lightred);gotoxy(22,8);writeln('Produto nao registado.');
					textcolor(white);gotoxy(22,9);writeln('Clique enter para voltar ao menu anterior.');
					readln;
				End;
	End;

{-----Subprogrmas de vendas-----}

Function Existem_Vendas_feitas(var fich: arquivo3):Boolean;
	Begin
		{$I-}
		Reset(fich);
		if IOResult = 0 Then
			Existem_Vendas_feitas := True
		Else
			Existem_Vendas_feitas := False;
		{$I+}
	End;

Procedure Vender_Produtos(var fich: arquivo3);
	Label
		vendas;
	Begin
		vendas:
		ClrScr;
		Assign(arq2, 'Produtos.dat');
		Reset(arq2);
		gotoxy(24,6);write('Numero de produtos que serao vendidos: ');
		Readln(n);
		for j:= 1 to n do
			Begin
				ClrScr;
				TEXTCOLOR(BLUE);
				TEXTBACKGROUND(black);
				gotoxy(30,2);writeln('_PLATAFORMA DE VENDAS_');
				TEXTCOLOR(WHITE);
				TEXTBACKGROUND(BLUE);
				gotoxy(23,8);write('Nome do produto: ');
				Readln(nome_);
				for i:= 0 to FileSize(arq2)Do
					Begin
						Seek(arq2, i);
						Read(arq2, prod);
						if(nome_ = prod.nome_prod)Then
							Begin
								gotoxy(23,9);write('Quantidade');
								Readln(quant_);
								if(quant_ <= prod.quantidade)Then
									Begin
										valor := quant_ * prod.preco;
										gotoxy(23,10);write('Valor a pagar: ', valor);
										prod.quantidade := prod.quantidade - quant_;
										prod.quant := prod.quant - quant_;
										prod.cashtotal := prod.cashtotal - valor;
									End
								Else
									Begin
										ClrScr;
										gotoxy(24,8);textcolor(lightred);writeln('A quantidade solicitada e supeior em relacao a quantidade existente.');
										gotoxy(24,9);textcolor(white);writeln('Pressione [1] para tentar novamente ou [enter] para voltar ao menu');
										if(tecla = '1')then goto vendas Else Readln;
									End;
								encontrei := True;
							End
						Else encontrei := False;
					End;
				write(arq2, prod);
			end;
		Close(arq2);
		if(encontrei = False)Then
			Begin
				ClrScr;
				GotoXY(24,8);textcolor(lightred);writeln('Produto nao regitado');
				GotoXY(24,9);textcolor(white);writeln('Clique enter para voltar');
				Readln;
			End;
		Assign(fich, 'Caixa.dat');
		ReWrite(fich);
		vend.capital := vend.capital + valor;
		vend.capital_total := prod.cashtotal + vend.capital;
		write(fich, vend);
		close(fich);
	End;

{------Programa principal------}

Begin
	inicio:
	textbackground(blue);
	ClrScr;
	Textcolor(blue);
  Textbackground(black);
  gotoxy(26,3);Writeln('_BEM VINDO AO MENU INICIAL_');
  Textcolor(white);
  Textbackground(blue);
	gotoxy(25,10);writeln('  [1] Iniciar sessao              ');
	gotoxy(25,11);writeln('  [2] Criar usuário               ');
	gotoxy(25,12);writeln('  [3] Opções                      ');
	gotoxy(25,13);writeln('  [4] Sair                        ');
	gotoxy(25,14);writeln('==================================');
	gotoxy(25,15);write('>>> ');
	readln(opcao);
	case(opcao)Of
		1: Begin
					login:
					Assign(arq1, 'Administrador.dat');
					Existe_Administrador(arq1);
					if(Existe_Administrador(arq1) = True)Then
						Begin
							ClrScr;
							Textcolor(blue);
		          Textbackground(black);
		          gotoxy(34,3);Writeln('_LOGIN DO ADMIN_');
		          Textcolor(white);
		          Textbackground(blue);
							gotoxy(25,12);write('Username: ');
							textcolor(lightgreen);readln(user);
							for j :=1 to Length(user)do
								user[j]:= Upcase(user[j]);
							gotoxy(25,13);textcolor(white);
							write('Password: ');
							textcolor(lightgreen);readln(senha);
							for j := 1 to Length(senha)do
								senha[j]:= upcase(senha[j]);
							Assign(arq1, 'Administrador.dat');
							Reset(arq1);
							for i:=0 to FileSize(arq1)-1 Do
								Begin
									Seek(arq1, i);
									Read(arq1, admin);
									if(user = admin.username)and(senha = admin.password)Then
										Begin
											ClrScr;
											Progress_Bar;
											menu:
											ClrScr;
											Textcolor(blue);
				 							Textbackground(black);
										  Gotoxy(33,2);Writeln ('_MENU PRINCIPAL_');
											Textcolor(white);
				 							Textbackground(blue);
											getdate(ano, mes, dia, semana);
											gettime(hora, minuto, segundo, msegundo);
											gotoxy(3,5);writeln('ID: ',admin.id:0:4);
											gotoxy(3,6);writeln('PERFIL: ',admin.perfil);
											gotoxy(38,5);Writeln(hora,':',minuto);
											gotoxy(60,5);Writeln(SEMANAS[semana],',',dia,'/',MESES[mes],'/',ano);
											gotoxy(30,12);writeln('[1] Caixa');
											gotoxy(30,13);writeln('[2] Gestao de Stock');
											gotoxy(30,14);writeln('[3] voltar');
											gotoxy(30,15);writeln('---------------------');
											gotoxy(30,16);write('>>> ');
											readln(opcao);
											Case(opcao)Of
												1: Begin
															ClrScr;
															Assign(arq2, 'Produtos.dat');
															Existe_Produto(arq2);
															if(Existe_Produto(arq2) = true)Then
																Begin
																	Assign(arq3, 'Caixa.dat');
																	Vender_Produtos(arq3);
																	goto menu;
																End
															Else
																Begin
																	ClrScr;
																	textcolor(lightred);gotoxy(22,8);writeln('Sem produto(s) registado(s).');
																	textcolor(white);gotoxy(22,9);writeln('Clique enter para voltar ao menu de stock.');
																	readln; goto menu;
																End;
													 End;
												2: Begin
															stock:
															ClrScr;
															Textcolor(blue);
								 							Textbackground(black);
														  Gotoxy(33,2);Writeln ('_GESTAO DE STOCK_');
															Textcolor(white);
								 							Textbackground(blue);
															GotoXY(29,8);writeln('[1] Registar produto');
															GotoXY(29,9);writeln('[2] Lista de produtos');
															gotoxy(29,10);writeln('[3] Alterar dados do produto');
															GotoXY(29,11);writeln('[4] Remover produto');
															GotoXY(29,12);writeln('[5] Voltar');
															GotoXY(29,13);writeln('----------------------------');
															GotoXY(29,14);write('>>> ');
															Readln(opcao);
															Case(opcao)Of
																1: Begin
																			ClrScr;
																			Assign(arq2, 'Produtos.dat');
																			Existe_Produto(arq2);
																			if(Existe_Produto(arq2) = true)Then
																				Begin
																					Assign(arq2, 'Produtos.dat');
																					incluir_produtos(arq2);
																					goto stock;
																				End
																			Else
																				 Begin
																				 	 Assign(arq2, 'Produtos.dat');
																					 Registar_produto(arq2);
																					 goto stock;
																				 End;
																	 End;
																2: Begin
																			ClrScr;
																			Assign(arq2, 'Produtos.dat');
																			Existe_Produto(arq2);
																			if(Existe_Produto(arq2) = true)Then
																				Begin
																					ClrScr;
																					Assign(arq2, 'Produtos.dat');
																					Listar_Produtos(arq2);
																					writeln('Produtos disponiveis: ', prod.cont);
																					writeln('Quantidade disponivel: ', prod.quant);
																					writeln('Valor total: ', prod.cashtotal:0:2);
																					writeln('--------------------------------');
																					writeln('Clique enter para sair');
																					readln;Goto stock;
																				End
																			Else
																				Begin
																					ClrScr;
																					textcolor(lightred);gotoxy(22,8);writeln('Sem produto(s) registado(s).');
																					textcolor(white);gotoxy(22,9);writeln('Clique enter para voltar ao menu de stock.');
																					readln; goto stock;
																				End;
																	 End;
																3: Begin
																			ClrScr;
																			Assign(arq2, 'Produtos.dat');
																			Existe_Produto(arq2);
																			if(Existe_Produto(arq2) = true)Then
																				Begin
																					ClrScr;
																					Assign(arq2, 'Produtos.dat');
																					Alterar_Produto(arq2);
																					Goto stock;
																				End
																			Else
																				Begin
																					ClrScr;
																					textcolor(lightred);gotoxy(22,8);writeln('Sem produto(s) registado(s).');
																					textcolor(white);gotoxy(22,9);writeln('Clique enter para voltar ao menu de stock.');
																					readln; goto stock;
																				End;
																	 End;
																4: Begin
																			ClrScr;
																			Assign(arq2, 'Produtos.dat');
																			Existe_Produto(arq2);
																			if(Existe_Produto(arq2) = true)Then
																				Begin
																					ClrScr;
																					Assign(arq2, 'Produtos.dat');
																					Remover_Produto(arq2);
																					Goto stock;
																				End
																			Else
																				Begin
																					ClrScr;
																					textcolor(lightred);gotoxy(22,8);writeln('Sem produto(s) registado(s).');
																					textcolor(white);gotoxy(22,9);writeln('Clique enter para voltar ao menu de stock.');
																					readln; goto stock;
																				End;
																	 End;
																5: Goto menu
																Else goto stock;
															End;
													 End;
												3: Goto inicio
												Else Goto menu;
											End;
											autentica_user := True;
										End
									Else autentica_user := False;
								End;
								Close(arq1);
							if (autentica_user = False)Then
								Begin
									gotoxy(25,12);textcolor(red);writeln('Username ou password incorrecto.');
									gotoxy(25,13);textcolor(white);writeln('Tentar novamente?[S/N]');
									tecla := readkey;
									tecla := upcase(tecla);
									if(tecla = 'S') then goto login
									else
										Begin
											If(tecla = 'N')then goto inicio
											else RunError;
										end;
								End;
						End
					Else
						Begin
							ClrScr;
							textcolor(lightred);gotoxy(22,8);writeln('Sem administrador(es) registado(s).');
							textcolor(white);gotoxy(22,9);writeln('Clique enter para voltar ao menu inicial.');
							readln; goto inicio;
						End;
			 End;
		2: Begin
					ClrScr;
					Assign(arq1, 'Administrador.dat');
					Existe_Administrador(arq1);
					if(Existe_Administrador(arq1) = True)Then
						Begin
							Assign(arq1, 'Administrador.dat');
							Incluir_Administrador(arq1);
							ClrScr;
							Progress_Bar;
							ClrScr;
							gotoxy(22,8);textcolor(lightgreen);writeln('Administrador registado com sucesso.');
							gotoxy(22,9);textcolor(white);writeln('Clique enter para voltar ao menu incial');
							readln; goto inicio;
						End
					Else
						Begin
							Assign(arq1, 'Administrador.dat');
							Registar_Administrador(arq1);
							ClrScr;
							Progress_Bar;
							ClrScr;
							gotoxy(22,8);textcolor(lightgreen);writeln('Administrador registado com sucesso.');
							gotoxy(22,9);textcolor(white);writeln('Clique enter para voltar ao menu incial');
							readln; goto inicio;
						End;
			 End;
		3: Begin
					ClrScr;
					Assign(arq1, 'Administrador.dat');
					Existe_Administrador(arq1);
					if(Existe_Administrador(arq1) = True)Then
						Begin
							Assign(arq1, 'Administrador.dat');
							Menu_Administrador(arq1);
							goto inicio;
						End
					Else
						Begin
							ClrScr;
							textcolor(lightred);gotoxy(22,8);writeln('Sem administrador(es) registrado(s).');
							textcolor(white);gotoxy(22,9);writeln('Clique enter para voltar ao menu inicial.');
							readln; goto inicio;
						End;
			 End;
		4: Exit
		Else goto inicio;
	End;
End.