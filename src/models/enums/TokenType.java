package models.enums;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public enum TokenType {
    // IDENTIFIER
    IDENTIFIER(Type.IDENTIFIER, "none"),

    // RESERVED WORDS
    PROGRAM(Type.KEYWORD, "PROGRAM"),
    BEGIN(Type.KEYWORD, "BEGIN"),
    END(Type.KEYWORD, "END"),
    IF(Type.KEYWORD, "IF"),
    THEN(Type.KEYWORD, "THEN"),
    ELSE(Type.KEYWORD, "ELSE"),
    PROCEDURE(Type.KEYWORD, "PROCEDURE"),
    FUNCTION(Type.KEYWORD, "FUNCTION"),
    VAR(Type.KEYWORD, "VAR"),
    TYPE(Type.KEYWORD, "TYPE"),
    OF(Type.KEYWORD, "OF"),
    WRITE(Type.KEYWORD, "WRITE"),
    WRITELN(Type.KEYWORD, "WRITELN"),
    READ(Type.KEYWORD, "READ"),
    NOT(Type.KEYWORD, "NOT"),
    WHILE(Type.KEYWORD, "WHILE"),
    DO(Type.KEYWORD, "DO"),
    FOR(Type.KEYWORD, "FOR"),

    // RELATIONAL OPERATOR
    AND(Type.RELATIONAL_OPERATOR, "AND"),
    OR(Type.RELATIONAL_OPERATOR, "OR"),
    EQUAL(Type.RELATIONAL_OPERATOR, "="),
    DIFFERENT(Type.RELATIONAL_OPERATOR, "<>"),
    GREATER_THAN(Type.RELATIONAL_OPERATOR, ">"),
    LESS_THAN(Type.RELATIONAL_OPERATOR, "<"),
    GREATER_THAN_OR_EQUAL_TO(Type.RELATIONAL_OPERATOR, ">="),
    LESS_THAN_OR_EQUAL_TO(Type.RELATIONAL_OPERATOR, "<="),

    //ARITHMETIC OPERATOR
    ATTRIBUTION(Type.ARITHMETIC_OPERATOR, ":="),
    PLUS(Type.ARITHMETIC_OPERATOR, "+"),
    MINUS(Type.ARITHMETIC_OPERATOR, "-"),
    MULTIPLICATION(Type.ARITHMETIC_OPERATOR, "*"),
    DIVISION(Type.ARITHMETIC_OPERATOR, "/"),
    INT_DIVISION(Type.ARITHMETIC_OPERATOR, "DIV"),

    // DATA TYPE
    ARRAY(Type.DATA_TYPE, "ARRAY"), // vector, arraylist
    INTEGER(Type.DATA_TYPE, "INTEGER"),
    REAL(Type.DATA_TYPE, "REAL"),
    STRING(Type.DATA_TYPE, "STRING"),
    CHAR(Type.DATA_TYPE, "CHAR"),
    BOOLEAN(Type.DATA_TYPE, "BOOLEAN"),

    // SPECIAL SYMBOL
    COMMA(Type.SPECIAL_SYMBOL, ","),
    SEMICOLON(Type.SPECIAL_SYMBOL, ";"),
    LEFT_PAREN(Type.SPECIAL_SYMBOL, "("),
    RIGHT_PAREN(Type.SPECIAL_SYMBOL, ")"),
    LEFT_BRACKET(Type.SPECIAL_SYMBOL, "["),
    RIGHT_BRACKET(Type.SPECIAL_SYMBOL, "]"),
    COLON(Type.SPECIAL_SYMBOL, ":"),
    DOT(Type.SPECIAL_SYMBOL, "."),
    SINGLE_QUOTE(Type.SPECIAL_SYMBOL, "'"),
    DOUBLE_DOT(Type.SPECIAL_SYMBOL, "..");

    private final Type type;
    private final String value;

    TokenType(Type type, String value) {
        this.type = type;
        this.value = value;
    }

    public Type getType() {
        return type;
    }

    public String getValue() {
        return value;
    }

    public static List<String> list(Type type) {
        return Arrays.stream(TokenType.values())
                .filter(tokenType -> tokenType.type == type)
                .map(TokenType::getValue)
                .collect(Collectors.toList());
    }
}
