/* -------------------------------------------------------------------------------
 * Generate Instruction Set, generated on 11 May 2021 AT 21:39:39
 * -------------------------------------------------------------------------------
 */
MAP_ADDR("iadd", OP_REG, OP_REG, OP_REG, &&IADD_REG_REG_REG, "Integer Add (op1=op2+op3)")
MAP_ADDR("iadd", OP_REG, OP_REG, OP_INT, &&IADD_REG_REG_INT, "Integer Add (op1=op2+op3)")
MAP_ADDR("addi", OP_REG, OP_REG, OP_REG, &&ADDI_REG_REG_REG, "Convert and Add to Integer (op1=op2+op3)")
MAP_ADDR("addi", OP_REG, OP_REG, OP_INT, &&ADDI_REG_REG_INT, "Convert and Add to Integer (op1=op2+op3)")
MAP_ADDR("isub", OP_REG, OP_REG, OP_REG, &&ISUB_REG_REG_REG, "Integer Subtract (op1=op2-op3)")
MAP_ADDR("isub", OP_REG, OP_REG, OP_INT, &&ISUB_REG_REG_INT, "Integer Subtract (op1=op2-op3)")
MAP_ADDR("subi", OP_REG, OP_REG, OP_REG, &&SUBI_REG_REG_REG, "Convert and Subtract to Integer (op1=op2-op3)")
MAP_ADDR("subi", OP_REG, OP_REG, OP_INT, &&SUBI_REG_REG_INT, "Convert and Subtract to Integer (op1=op2-op3)")
MAP_ADDR("imult", OP_REG, OP_REG, OP_REG, &&IMULT_REG_REG_REG, "Integer Multiply (op1=op2*op3)")
MAP_ADDR("imult", OP_REG, OP_REG, OP_INT, &&IMULT_REG_REG_INT, "Integer Multiply (op1=op2*op3)")
MAP_ADDR("multi", OP_REG, OP_REG, OP_REG, &&MULTI_REG_REG_REG, "Convert and Multiply to Integer (op1=op2*op3)")
MAP_ADDR("multi", OP_REG, OP_REG, OP_INT, &&MULTI_REG_REG_INT, "Convert and Multiply to Integer (op1=op2*op3)")
MAP_ADDR("idiv", OP_REG, OP_REG, OP_REG, &&IDIV_REG_REG_REG, "Integer Divide (op1=op2/op3)")
MAP_ADDR("idiv", OP_REG, OP_REG, OP_INT, &&IDIV_REG_REG_INT, "Integer Divide (op1=op2/op3)")
MAP_ADDR("divi", OP_REG, OP_REG, OP_REG, &&DIVI_REG_REG_REG, "Convert and Divide to Integer (op1=op2/op3)")
MAP_ADDR("divi", OP_REG, OP_REG, OP_INT, &&DIVI_REG_REG_INT, "Convert and Divide to Integer (op1=op2/op3)")
MAP_ADDR("fadd", OP_REG, OP_REG, OP_REG, &&FADD_REG_REG_REG, "Float Add (op1=op2+op3)")
MAP_ADDR("fadd", OP_REG, OP_REG, OP_FLOAT, &&FADD_REG_REG_FLOAT, "Float Add (op1=op2+op3)")
MAP_ADDR("addf", OP_REG, OP_REG, OP_REG, &&ADDF_REG_REG_REG, "Convert and Add to Float (op1=op2+op3)")
MAP_ADDR("addf", OP_REG, OP_REG, OP_FLOAT, &&ADDF_REG_REG_FLOAT, "Convert and Add to Float (op1=op2+op3)")
MAP_ADDR("fsub", OP_REG, OP_REG, OP_REG, &&FSUB_REG_REG_REG, "Float Subtract (op1=op2-op3)")
MAP_ADDR("fsub", OP_REG, OP_REG, OP_FLOAT, &&FSUB_REG_REG_FLOAT, "Float Subtract (op1=op2-op3)")
MAP_ADDR("fsub", OP_REG, OP_FLOAT, OP_REG, &&FSUB_REG_FLOAT_REG, "Float Subtract (op1=op2-op3)")
MAP_ADDR("subf", OP_REG, OP_REG, OP_REG, &&SUBF_REG_REG_REG, "Convert and Subtract to Float (op1=op2-op3)")
MAP_ADDR("subf", OP_REG, OP_REG, OP_FLOAT, &&SUBF_REG_REG_FLOAT, "Convert and Subtract to Float (op1=op2-op3)")
MAP_ADDR("subf", OP_REG, OP_FLOAT, OP_REG, &&SUBF_REG_FLOAT_REG, "Convert and Subtract to Float (op1=op2-op3)")
MAP_ADDR("fmult", OP_REG, OP_REG, OP_REG, &&FMULT_REG_REG_REG, "Float Multiply (op1=op2*op3)")
MAP_ADDR("fmult", OP_REG, OP_REG, OP_FLOAT, &&FMULT_REG_REG_FLOAT, "Float Multiply (op1=op2*op3)")
MAP_ADDR("multf", OP_REG, OP_REG, OP_REG, &&MULTF_REG_REG_REG, "Convert and Multiply to Float (op1=op2*op3)")
MAP_ADDR("multf", OP_REG, OP_REG, OP_FLOAT, &&MULTF_REG_REG_FLOAT, "Convert and Multiply to Float (op1=op2*op3)")
MAP_ADDR("fdiv", OP_REG, OP_REG, OP_REG, &&FDIV_REG_REG_REG, "Float Divide (op1=op2/op3)")
MAP_ADDR("fdiv", OP_REG, OP_REG, OP_FLOAT, &&FDIV_REG_REG_FLOAT, "Float Divide (op1=op2/op3)")
MAP_ADDR("fdiv", OP_REG, OP_FLOAT, OP_REG, &&FDIV_REG_FLOAT_REG, "Float Divide (op1=op2/op3)")
MAP_ADDR("divf", OP_REG, OP_REG, OP_REG, &&DIVF_REG_REG_REG, "Convert and Divide to Float (op1=op2/op3)")
MAP_ADDR("divf", OP_REG, OP_REG, OP_FLOAT, &&DIVF_REG_REG_FLOAT, "Convert and Divide to Float (op1=op2/op3)")
MAP_ADDR("divf", OP_REG, OP_FLOAT, OP_REG, &&DIVF_REG_FLOAT_REG, "Convert and Divide to Float (op1=op2/op3)")
MAP_ADDR("sconcat", OP_REG, OP_REG, OP_REG, &&SCONCAT_REG_REG_REG, "String Concat with space (op1=op2||op3)")
MAP_ADDR("sconcat", OP_REG, OP_REG, OP_STRING, &&SCONCAT_REG_REG_STRING, "String Concat with space (op1=op2||op3)")
MAP_ADDR("sconcat", OP_REG, OP_STRING, OP_REG, &&SCONCAT_REG_STRING_REG, "String Concat with space (op1=op2||op3)")
MAP_ADDR("concat", OP_REG, OP_REG, OP_REG, &&CONCAT_REG_REG_REG, "String Concat (op1=op2||op3)")
MAP_ADDR("concat", OP_REG, OP_REG, OP_STRING, &&CONCAT_REG_REG_STRING, "String Concat (op1=op2||op3)")
MAP_ADDR("concat", OP_REG, OP_STRING, OP_REG, &&CONCAT_REG_STRING_REG, "String Concat (op1=op2||op3)")
MAP_ADDR("inc", OP_REG, OP_NONE, OP_NONE, &&INC_REG, "Increment Int (op1++)")
MAP_ADDR("dec", OP_REG, OP_NONE, OP_NONE, &&DEC_REG, "Decrement Int (op1--)")
MAP_ADDR("inc0", OP_NONE, OP_NONE, OP_NONE, &&INC0, "Increment R0++ Int")
MAP_ADDR("dec0", OP_NONE, OP_NONE, OP_NONE, &&DEC0, "Decrement R0-- Int")
MAP_ADDR("inc1", OP_NONE, OP_NONE, OP_NONE, &&INC1, "Increment R0++ Int")
MAP_ADDR("dec1", OP_NONE, OP_NONE, OP_NONE, &&DEC1, "Decrement R0-- Int")
MAP_ADDR("inc2", OP_NONE, OP_NONE, OP_NONE, &&INC2, "Increment R0++ Int")
MAP_ADDR("dec2", OP_NONE, OP_NONE, OP_NONE, &&DEC2, "Decrement R0-- Int")
MAP_ADDR("triml", OP_REG, OP_REG, OP_NONE, &&TRIML_REG_REG, "Trim String (op1) from Left by (op2) Chars")
MAP_ADDR("trimr", OP_REG, OP_REG, OP_NONE, &&TRIMR_REG_REG, "Trim String (op1) from Right by (op2) Chars")
MAP_ADDR("strlen", OP_REG, OP_REG, OP_NONE, &&STRLEN_REG_REG, "String Length op1 = length(op2)")
MAP_ADDR("str2char", OP_REG, OP_REG, OP_REG, &&STR2CHAR_REG_REG_REG, "String to Char op1 = op2[op3]")
MAP_ADDR("str2int", OP_REG, OP_REG, OP_REG, &&STR2INT_REG_REG_REG, "String to Int op1 = op2[op3]")
MAP_ADDR("ieq", OP_REG, OP_REG, OP_REG, &&IEQ_REG_REG_REG, "Int Equals op1=(op2==op3)")
MAP_ADDR("ieq", OP_REG, OP_REG, OP_INT, &&IEQ_REG_REG_INT, "Int Equals op1=(op2==op3)")
MAP_ADDR("ine", OP_REG, OP_REG, OP_REG, &&INE_REG_REG_REG, "Int Not equals op1=(op2!=op3)")
MAP_ADDR("ine", OP_REG, OP_REG, OP_INT, &&INE_REG_REG_INT, "Int Not equals op1=(op2!=op3)")
MAP_ADDR("igt", OP_REG, OP_REG, OP_REG, &&IGT_REG_REG_REG, "Int Greater than op1=(op2>op3)")
MAP_ADDR("igt", OP_REG, OP_REG, OP_INT, &&IGT_REG_REG_INT, "Int Greater than op1=(op2>op3)")
MAP_ADDR("igt", OP_REG, OP_INT, OP_REG, &&IGT_REG_INT_REG, "Int Greater than op1=(op2>op3)")
MAP_ADDR("igte", OP_REG, OP_REG, OP_REG, &&IGTE_REG_REG_REG, "Int Greater than equals op1=(op2>=op3)")
MAP_ADDR("igte", OP_REG, OP_REG, OP_INT, &&IGTE_REG_REG_INT, "Int Greater than equals op1=(op2>=op3)")
MAP_ADDR("igte", OP_REG, OP_INT, OP_REG, &&IGTE_REG_INT_REG, "Int Greater than equals op1=(op2>=op3)")
MAP_ADDR("ilt", OP_REG, OP_REG, OP_REG, &&ILT_REG_REG_REG, "Int Less than op1=(op2<op3)")
MAP_ADDR("ilt", OP_REG, OP_REG, OP_INT, &&ILT_REG_REG_INT, "Int Less than op1=(op2<op3)")
MAP_ADDR("ilt", OP_REG, OP_INT, OP_REG, &&ILT_REG_INT_REG, "Int Less than op1=(op2<op3)")
MAP_ADDR("ilte", OP_REG, OP_REG, OP_REG, &&ILTE_REG_REG_REG, "Int Less than equals op1=(op2<=op3)")
MAP_ADDR("ilte", OP_REG, OP_REG, OP_INT, &&ILTE_REG_REG_INT, "Int Less than equals op1=(op2<=op3)")
MAP_ADDR("ilte", OP_REG, OP_INT, OP_REG, &&ILTE_REG_INT_REG, "Int Less than equals op1=(op2<=op3)")
MAP_ADDR("iprime", OP_REG, OP_NONE, OP_NONE, &&IPRIME_REG, "Int Prime op1 (depreciated)")
MAP_ADDR("fprime", OP_REG, OP_NONE, OP_NONE, &&FPRIME_REG, "Float Prime op1 (depreciated)")
MAP_ADDR("sprime", OP_REG, OP_NONE, OP_NONE, &&SPRIME_REG, "String Prime op1 (depreciated)")
MAP_ADDR("cprime", OP_REG, OP_NONE, OP_NONE, &&CPRIME_REG, "Char Prime op1 (depreciated)")
MAP_ADDR("imaster", OP_REG, OP_NONE, OP_NONE, &&IMASTER_REG, "Make int the master value for op1 (depreciated)")
MAP_ADDR("fmaster", OP_REG, OP_NONE, OP_NONE, &&FMASTER_REG, "Make float the master value for op1 (depreciated)")
MAP_ADDR("smaster", OP_REG, OP_NONE, OP_NONE, &&SMASTER_REG, "Make string the master value for op1 (depreciated)")
MAP_ADDR("time", OP_REG, OP_NONE, OP_NONE, &&TIME_REG, "Put time into op1")
MAP_ADDR("map", OP_REG, OP_REG, OP_NONE, &&MAP_REG_REG, "Map op1 to var name in op2")
MAP_ADDR("map", OP_REG, OP_STRING, OP_NONE, &&MAP_REG_STRING, "Map op1 to var name op2")
MAP_ADDR("amap", OP_REG, OP_REG, OP_NONE, &&AMAP_REG_REG, "Map op1 to arg register index in op2")
MAP_ADDR("amap", OP_REG, OP_INT, OP_NONE, &&AMAP_REG_INT, "Map op1 to arg register index  op2")
MAP_ADDR("pmap", OP_REG, OP_REG, OP_NONE, &&PMAP_REG_REG, "Map op1 to parent var name in op2")
MAP_ADDR("pmap", OP_REG, OP_STRING, OP_NONE, &&PMAP_REG_STRING, "Map op1 to parent var name op2")
MAP_ADDR("gmap", OP_REG, OP_REG, OP_NONE, &&GMAP_REG_REG, "Map op1 to global var name in op2")
MAP_ADDR("gmap", OP_REG, OP_STRING, OP_NONE, &&GMAP_REG_STRING, "Map op1 to global var name op2")
MAP_ADDR("nsmap", OP_REG, OP_REG, OP_REG, &&NSMAP_REG_REG_REG, "Map op1 to namespace in op2 var name in op3")
MAP_ADDR("nsmap", OP_REG, OP_REG, OP_STRING, &&NSMAP_REG_REG_STRING, "Map op1 to namespace in op2 var name op3")
MAP_ADDR("nsmap", OP_REG, OP_STRING, OP_STRING, &&NSMAP_REG_STRING_STRING, "Map op1 to namespace op2 var name op3")
MAP_ADDR("nsmap", OP_REG, OP_STRING, OP_REG, &&NSMAP_REG_STRING_REG, "Map op1 to namespace op2 var name in op3")
MAP_ADDR("unmap", OP_REG, OP_NONE, OP_NONE, &&UNMAP_REG, "Unmap op1")
MAP_ADDR("call", OP_FUNC, OP_NONE, OP_NONE, &&CALL_FUNC, "Call procedure (op1())")
MAP_ADDR("call", OP_REG, OP_FUNC, OP_NONE, &&CALL_REG_FUNC, "Call procedure (op1=op2())")
MAP_ADDR("call", OP_REG, OP_FUNC, OP_REG, &&CALL_REG_FUNC_REG, "Call procedure (op1=op2(op3...) )")
MAP_ADDR("ret", OP_NONE, OP_NONE, OP_NONE, &&RET, "Return NULL")
MAP_ADDR("ret", OP_REG, OP_NONE, OP_NONE, &&RET_REG, "Return op1")
MAP_ADDR("ret", OP_INT, OP_NONE, OP_NONE, &&RET_INT, "Return op1")
MAP_ADDR("ret", OP_FLOAT, OP_NONE, OP_NONE, &&RET_FLOAT, "Return op1")
MAP_ADDR("ret", OP_CHAR, OP_NONE, OP_NONE, &&RET_CHAR, "Return op1")
MAP_ADDR("ret", OP_STRING, OP_NONE, OP_NONE, &&RET_STRING, "Return op1")
MAP_ADDR("br", OP_ID, OP_NONE, OP_NONE, &&BR_ID, "Branch to op1")
MAP_ADDR("brt", OP_ID, OP_REG, OP_NONE, &&BRT_ID_REG, "Branch to op1 if op2 true")
MAP_ADDR("brf", OP_ID, OP_REG, OP_NONE, &&BRF_ID_REG, "Branch to op1 if op2 false")
MAP_ADDR("move", OP_REG, OP_REG, OP_NONE, &&MOVE_REG_REG, "Move op2 to op1")
MAP_ADDR("copy", OP_REG, OP_REG, OP_NONE, &&COPY_REG_REG, "Copy op2 to op1")
MAP_ADDR("link", OP_REG, OP_REG, OP_NONE, &&LINK_REG_REG, "Link op2 to op1")
MAP_ADDR("unlink", OP_REG, OP_NONE, OP_NONE, &&UNLINK_REG, "Unlink op1")
MAP_ADDR("null", OP_REG, OP_NONE, OP_NONE, &&NULL_REG, "Null op1")
MAP_ADDR("load", OP_REG, OP_INT, OP_NONE, &&LOAD_REG_INT, "Load op1 with op2")
MAP_ADDR("load", OP_REG, OP_FLOAT, OP_NONE, &&LOAD_REG_FLOAT, "Load op1 with op2")
MAP_ADDR("load", OP_REG, OP_STRING, OP_NONE, &&LOAD_REG_STRING, "Load op1 with op2")
MAP_ADDR("load", OP_REG, OP_CHAR, OP_NONE, &&LOAD_REG_CHAR, "Load op1 with op2")
MAP_ADDR("say", OP_REG, OP_NONE, OP_NONE, &&SAY_REG, "Say op1")
MAP_ADDR("say", OP_INT, OP_NONE, OP_NONE, &&SAY_INT, "Say op1")
MAP_ADDR("say", OP_FLOAT, OP_NONE, OP_NONE, &&SAY_FLOAT, "Say op1")
MAP_ADDR("say", OP_STRING, OP_NONE, OP_NONE, &&SAY_STRING, "Say op1")
MAP_ADDR("say", OP_CHAR, OP_NONE, OP_NONE, &&SAY_CHAR, "Say op1")
MAP_ADDR("exit", OP_NONE, OP_NONE, OP_NONE, &&EXIT, "Exit")
MAP_ADDR("exit", OP_REG, OP_NONE, OP_NONE, &&EXIT_REG, "Exit op1")
MAP_ADDR("exit", OP_INT, OP_NONE, OP_NONE, &&EXIT_INT, "Exit op1")
