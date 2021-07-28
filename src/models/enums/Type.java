package models.enums;

public enum Type {
    IDENTIFIER("identifier"),
    KEYWORD("keyword"),
    SPECIAL_SYMBOL("special symbol"),
    DATA_TYPE("data type"),
    ARITHMETIC_OPERATOR("Arithmetic operator"),
    RELATIONAL_OPERATOR("relational operator"),
    LITERAL("Literal"),
    COMMENTS("Comments"),
    LETTER("Letter"),
    DIGIT("Digit"),
    UNDEFINED("Undefined");

    private final String TYPE;

    Type(String TYPE) {
        this.TYPE = TYPE;
    }

    public String getTYPE() {
        return TYPE;
    }
}
