package lexical;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import lexical.enums.LexicalGrammar;

public class Lexeme {

    private LexicalGrammar lexicalGrammar;

    public Lexeme() {
    }

    public LexicalGrammar getLexicalGrammar() {
        return lexicalGrammar;
    }

    public void setLexicalGrammar(LexicalGrammar lexicalGrammar) {
        this.lexicalGrammar = lexicalGrammar;
    }

    public String getRegex(LexicalGrammar lexicalGrammar) {
        return lexicalGrammar.getRegex();
    }

    public boolean matches(String regex, String expression) {
        Matcher matcher = Pattern.compile(regex).matcher(expression);
        return matcher.matches();
    }
}
