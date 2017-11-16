package decaf;
import org.antlr.symtab.FunctionSymbol;
import org.antlr.symtab.GlobalScope;
import org.antlr.symtab.LocalScope;
import org.antlr.symtab.Scope;
import org.antlr.symtab.VariableSymbol;
import org.antlr.symtab.Symbol;
import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.tree.ParseTreeProperty;


/**
 * This class defines basic symbols and scopes for Decaf language
 */
public class DecafSymbolsAndScopes extends DecafParserBaseListener {
    ParseTreeProperty<Scope> scopes = new ParseTreeProperty<Scope>();
    GlobalScope globals;
    Scope currentScope; // define symbols in this scope

    @Override
    public void enterProgram(DecafParser.ProgramContext ctx) {
        globals = new GlobalScope(null);
        pushScope(globals);
    }

    @Override
    public void exitProgram(DecafParser.ProgramContext ctx) {
        System.out.println(globals);
    }

    @Override
    public void enterMethod_decl(DecafParser.Method_declContext ctx) {

        String name = ctx.ID().getText();
        //int typeTokenType = ctx.type().start.getType();
        //DecafSymbol.Type type = this.getType(typeTokenType);

        // push new scope by making new one that points to enclosing scope
        FunctionSymbol function = new FunctionSymbol(name);
        //function.setType(type); // Set symbol type

        currentScope.define(function); // Define function in current scope
        saveScope(ctx, function);
        pushScope(function);
    }

    @Override
    public void exitMethod_decl(DecafParser.Method_declContext ctx) {
	System.out.println(currentScope);        
	popScope();
    }

    @Override
    public void enterBlock(DecafParser.BlockContext ctx) {
        LocalScope l = new LocalScope(currentScope);
        saveScope(ctx, currentScope);
        pushScope(l);
    }

    @Override
    public void exitBlock(DecafParser.BlockContext ctx) {
        popScope();
    }

    @Override
    public void enterField_decl(DecafParser.Field_declContext ctx) {
        defineVar(ctx.type(), ctx.ID().getSymbol());
    }

    @Override
    public void exitField_decl(DecafParser.Field_declContext ctx) {
        String name = ctx.ID().getSymbol().getText();
        Symbol var = currentScope.resolve(name);
        if ( var==null ) {
            this.error(ctx.ID().getSymbol(), "no such variable: "+name);
        }
        if ( var instanceof FunctionSymbol ) {
            this.error(ctx.ID().getSymbol(), name+" is not a variable");
        }
    }

	@Override 
	public void enterVar_decl(DecafParser.Var_declContext ctx) { }
	@Override 
	public void exitVar_decl(DecafParser.Var_declContext ctx) { }

	@Override public void enterType(DecafParser.TypeContext ctx) { }
	@Override public void exitType(DecafParser.TypeContext ctx) { }
	@Override public void enterStatement(DecafParser.StatementContext ctx) { }
	@Override public void exitStatement(DecafParser.StatementContext ctx) { }
	@Override public void enterAssing_op(DecafParser.Assing_opContext ctx) { }
	@Override public void exitAssing_op(DecafParser.Assing_opContext ctx) { }
	@Override public void enterMethod_call(DecafParser.Method_callContext ctx) { }
	@Override public void exitMethod_call(DecafParser.Method_callContext ctx) { }
	@Override public void enterMethod_name(DecafParser.Method_nameContext ctx) { }
	@Override public void exitMethod_name(DecafParser.Method_nameContext ctx) { }
	@Override public void enterLocation(DecafParser.LocationContext ctx) { }
	@Override public void exitLocation(DecafParser.LocationContext ctx) { }
	@Override public void enterExpr(DecafParser.ExprContext ctx) { }
	@Override public void exitExpr(DecafParser.ExprContext ctx) { }
	@Override public void enterCallout_arg(DecafParser.Callout_argContext ctx) { }
	@Override public void exitCallout_arg(DecafParser.Callout_argContext ctx) { }
	@Override public void enterBin_op(DecafParser.Bin_opContext ctx) { }
	@Override public void exitBin_op(DecafParser.Bin_opContext ctx) { }
	@Override public void enterArith_op(DecafParser.Arith_opContext ctx) { }
	@Override public void exitArith_op(DecafParser.Arith_opContext ctx) { }
	@Override public void enterRel_op(DecafParser.Rel_opContext ctx) { }
	@Override public void exitRel_op(DecafParser.Rel_opContext ctx) { }
	@Override public void enterEq_op(DecafParser.Eq_opContext ctx) { }
	@Override public void exitEq_op(DecafParser.Eq_opContext ctx) { }
	@Override public void enterCond_op(DecafParser.Cond_opContext ctx) { }
	@Override public void exitCond_op(DecafParser.Cond_opContext ctx) { }
	@Override public void enterLiteral(DecafParser.LiteralContext ctx) { }
	@Override public void exitLiteral(DecafParser.LiteralContext ctx) { }
	@Override public void enterDecimal_literal(DecafParser.Decimal_literalContext ctx) { }
	@Override public void exitDecimal_literal(DecafParser.Decimal_literalContext ctx) { }
	@Override public void enterHex_digit(DecafParser.Hex_digitContext ctx) { }
	@Override public void exitHex_digit(DecafParser.Hex_digitContext ctx) { }
	@Override public void enterInt_literal(DecafParser.Int_literalContext ctx) { }
	@Override public void exitInt_literal(DecafParser.Int_literalContext ctx) { }
	@Override public void enterHex_literal(DecafParser.Hex_literalContext ctx) { }
	@Override public void exitHex_literal(DecafParser.Hex_literalContext ctx) { }
	@Override public void enterBool_literal(DecafParser.Bool_literalContext ctx) { }
	@Override public void exitBool_literal(DecafParser.Bool_literalContext ctx) { }
	@Override public void enterChar_literal(DecafParser.Char_literalContext ctx) { }
	@Override public void exitChar_literal(DecafParser.Char_literalContext ctx) { }
	@Override public void enterString_literal(DecafParser.String_literalContext ctx) { }

	@Override public void exitString_literal(DecafParser.String_literalContext ctx) { }

    void defineVar(DecafParser.TypeContext typeCtx, Token nameToken) {
        //int typeTokenType = typeCtx.start.getType();
        VariableSymbol var = new VariableSymbol(nameToken.getText());

        // DecafSymbol.Type type = this.getType(typeTokenType);
        //var.setType(type);

        currentScope.define(var); // Define symbol in current scope
    }

    /**
     * Método que atuliza o escopo para o atual e imprime o valor
     *
     * @param s
     */
    private void pushScope(Scope s) {
        currentScope = s;
        System.out.println("entering: "+currentScope.getName()+":"+s);
    }

    /**
     * Método que cria um novo escopo no contexto fornecido
     *
     * @param ctx
     * @param s
     */
    void saveScope(ParserRuleContext ctx, Scope s) {
        scopes.put(ctx, s);
    }

    /**
     * Muda para o contexto superior e atualia o escopo
     */
    private void popScope() {
        System.out.println("leaving: "+currentScope.getName()+":"+currentScope);
        currentScope = currentScope.getEnclosingScope();
    }

    public static void error(Token t, String msg) {
        System.err.printf("line %d:%d %s\n", t.getLine(), t.getCharPositionInLine(),
                msg);
    }

    /**
     * Valida tipos encontrados na linguagem para tipos reais
     *
     * @param tokenType
     * @return
     */
    public static DecafSymbol.Type getType(int tokenType) {
        switch ( tokenType ) {
            case DecafParser.LIMBO :  return DecafSymbol.Type.tVOID;
            case DecafParser.INT_LITERAL :   return DecafSymbol.Type.tINT;
        }
        return DecafSymbol.Type.tINVALID;
    }


}
