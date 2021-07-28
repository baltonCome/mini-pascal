package lexical;

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import lexical.enums.LexicalGrammar;
import models.enums.TokenType;
import models.enums.Type;

public class Analyzer {

    private Lexeme lexeme = new Lexeme();
    private List<String> lines = new ArrayList<>();

    /**
     * Este metodo faz scan de um ficheiro txt com codigo escrito em pascal
     * e quebra os simbolos especiais e armazena num array list
     * @param path
     */
    public void scanPascalFile(Path path) {
        try(BufferedReader readFile = Files.newBufferedReader(path)){

            String line;
            while((line = readFile.readLine()) != null){
                for (String s: line.split("[\\s]")) {
                    if (!s.isEmpty()) {
                        final String symbol = String.valueOf(s.charAt(s.length() - 1));

                        if (TokenType.list(Type.SPECIAL_SYMBOL).contains(symbol) ||
                            TokenType.list(Type.ARITHMETIC_OPERATOR).contains(symbol) ||
                                TokenType.list(Type.RELATIONAL_OPERATOR).contains(symbol)) {

                            final String[] ss = s.trim().split("[" + symbol + "]");

                            if (ss.length > 0)
                                lines.add(ss[0].trim());
                            lines.add(symbol.trim());
                        } else {
                            /*for (String ss: Symbol.load()) {
                                if (s.trim().contains(ss)) {
                                    String[] _ss = s.trim().split("[" + ss + "]");
                                    if (_ss.length > 0)
                                        lines.add(_ss[0].trim()).add("\n");
                                    lines.add(ss.trim()).add("\n");
                                }
                            }*/
                            lines.add(s.trim());
                        }
                    }
                }
            }
        }catch(IOException e){
            Logger.getLogger("FileNotFound").log(Level.INFO, "Erro na leitura do ficheiro!\n===>  {0}", e.getMessage());
        }
    }
    
    public List<String> scan(String[] lines) {
        for (String s: lines) {
            for (String str: s.split("[\\s]")) {
                if (!str.isEmpty()) {
                    final String symbol = String.valueOf(str.charAt(str.length() - 1));

                    if (TokenType.list(Type.SPECIAL_SYMBOL).contains(symbol) ||
                        TokenType.list(Type.ARITHMETIC_OPERATOR).contains(symbol) ||
                            TokenType.list(Type.RELATIONAL_OPERATOR).contains(symbol)) {

                        final String[] ss = str.trim().split("[" + symbol + "]");

                        if (ss.length > 0)
                            this.lines.add(ss[0].trim());
                        this.lines.add(symbol.trim());
                    } else {
                        this.lines.add(str.trim());
                    }
                }
            }
        }
        return this.lines;
    }

    public Type getTokenType(String line) {
        if (TokenType.list(Type.KEYWORD).contains(line.toUpperCase()))
            return Type.KEYWORD;
        else if ((TokenType.list(Type.IDENTIFIER).contains(line) ||
                lexeme.matches(lexeme.getRegex(LexicalGrammar.IDENTIFIER), line)) &&
                !TokenType.list(Type.DATA_TYPE).contains(line.toUpperCase()))
            return Type.IDENTIFIER;
        else if (TokenType.list(Type.SPECIAL_SYMBOL).contains(line))
            return Type.SPECIAL_SYMBOL;
        else if (TokenType.list(Type.DATA_TYPE).contains(line.toUpperCase()))
            return Type.DATA_TYPE;
        else if (TokenType.list(Type.ARITHMETIC_OPERATOR).contains(line))
            return Type.ARITHMETIC_OPERATOR;
        else if (TokenType.list(Type.RELATIONAL_OPERATOR).contains(line))
            return Type.RELATIONAL_OPERATOR;
        else if ((line.startsWith("\"") && line.endsWith("\"")) ||
                (line.startsWith("'") && line.endsWith("'")))
            return Type.LITERAL;
        else if (lexeme.matches(lexeme.getRegex(LexicalGrammar.LETTER), line))
            return Type.LETTER;
        else if (lexeme.matches(lexeme.getRegex(LexicalGrammar.DIGIT), line))
            return Type.DIGIT;
        else if ((line.startsWith("//") && line.endsWith("//")) ||
                (line.startsWith("/*") && line.endsWith("*/")))
            return Type.COMMENTS;
        /*else {
            TokenType.list(Type.SPECIAL_SYMBOL).forEach(ss -> {

                if (line.contains(ss)) {

                    final String[] symbol = line.trim().split(String.format("[\\%s", ss +"]"));

                    for (String tk: symbol) {
                        //System.err.println(tk);
                        if (!tk.isEmpty() && !(tk.startsWith("\"") && tk.endsWith(ss)))
                            //if (sb.indexOf(ss) == -1)
                                word.append(tk).append("\n").append(ss).append("\n");
                            //else sb.append(tk).append("\n");
                        else if (tk.startsWith("\"") && tk.endsWith(ss)) {
                            System.err.println("1");
                            word.append(line, 0, line.indexOf(ss)).append("\n").append(ss).append("\n");
                        }
                    }
                } /*else if (line.contains("\"") && line.endsWith(ss)) {
                    System.err.println("1");
                    word.append(line, 0, line.indexOf(ss)).append("\n").append(ss).append("\n");
                }*/
            //});
        //}*/
        return Type.UNDEFINED;
    }
}
