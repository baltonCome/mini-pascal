package models;

import models.enums.TokenType;
import models.enums.Type;

public class Token {
    private int row;
    private int column;

    private Type type;
    private TokenType tokenType;

    private String value;

    public Token() {
    }

    public Token(String value, Type type, int row, int column) {
        this.value = value;
        this.type = type;
        this.row = row;
        this.column = column;
    }
    
    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }
    
    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public TokenType getTokenType() {
        return tokenType;
    }

    public void setTokenType(TokenType tokenType) {
        this.tokenType = tokenType;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String rowByColumn() {
        return "("+row+":"+column+")";
    }

    @Override
    public String toString() {
        return "Token{" + "row=" + row + ", column=" + column + ", type=" + type + ", tokenType=" + tokenType + ", value=" + value + '}';
    }

}
