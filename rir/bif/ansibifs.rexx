  say "Ansibifs called"
  exit
/* Some of the code for running the test will not be in the standard. */
   !NotJ18=0
   signal Bottom

 /************************************************************************
 *.  Introduction - see 9.1                                              *
 ************************************************************************/

 /* 9.2.1 Argument checking */
 /* Check arguments. Some further checks will be made in particular built-ins.*/
 /* The argument to CheckArgs is a checklist for the allowable arguments. */
 /* NUM and WHOLE have a side-effect, 'normalizing' the number. */
 /* Calls to raise syntax conditions will not return. */

 CheckArgs:
    CheckList = arg(1)  /* This refers to the argument of CheckArgs. */

    /* Move the checklist information from a string to individual variables */
    ArgType. = ''
    ArgPos = 0  /* To count arguments */
    MinArgs  = 0
    do j = 1 to length(CheckList)
       ArgPos = ArgPos+1
       /* Count the required arguments. */
       if substr(CheckList,j,1) == 'r' then MinArgs = MinArgs + 1
       /* Collect type information. */
       do while j < length(CheckList)
         j = j + 1
         t = substr(CheckList,j,1)
         if t==' ' then leave
         ArgType.ArgPos = ArgType.ArgPos || t
         end
       /* A single space delimits parts. */
       end j
    MaxArgs = ArgPos

 /* Check the number of arguments to the built-in, in this instance. */
    NumArgs  = !Bif_Arg.0
    if NumArgs < MinArgs then call Raise 40.3, MinArgs
    if NumArgs > MaxArgs then call Raise 40.4, MaxArgs

 /* Check the type(s) of the arguments to the built-in. */
    do ArgPos = 1 to NumArgs
       if !Bif_ArgExists.ArgPos then
          call CheckType
       else
          if ArgPos <= MinArgs then call Raise 40.5, ArgPos
       end ArgPos

    /* No errors found by CheckArgs. */
    return

 CheckType:

    Value = !Bif_Arg.ArgPos
    Type  = ArgType.ArgPos

    select
       when Type == 'ANY' then nop                         /* Any string */

       when Type == 'NUM' then do                          /* Any number */
          /* This check is made with the caller's digits setting. */
          if \Cdatatype(Value, 'N') then
             if !DatatypeResult=='E' then call Raise 40.9, ArgPos, Value
                                     else call Raise 40.11, ArgPos, Value
          !Bif_Arg.ArgPos=!DatatypeResult /* Update argument copy. */
          end

       when Type == 'WHOLE' then do                      /* Whole number */
          /* This check is made with digits setting for the built-in. */
          if \Edatatype(Value,'W') then
             call Raise 40.12, ArgPos, Value
          !Bif_Arg.ArgPos=!DatatypeResult
          end

       when Type == 'WHOLE>=0' then do      /* Non-negative whole number */
          if \Edatatype(Value,'W') then
             call Raise 40.12, ArgPos, Value
          if !DatatypeResult < 0 then
             call Raise 40.13, ArgPos, Value
          !Bif_Arg.ArgPos=!DatatypeResult
          end

       when Type == 'WHOLE>0' then do           /* Positive whole number */
          if \Edatatype(Value,'W') then
             call Raise 40.12, ArgPos, Value
          if !DatatypeResult <= 0 then
             call Raise 40.14, ArgPos, Value
          !Bif_Arg.ArgPos=!DatatypeResult
          end

       when Type == 'WHOLENUM' then do                /* D2 Whole number */
          /* This check is made with digits setting of the caller. */
          if \Cdatatype(Value,'W') then
             call Raise 40.12, ArgPos, Value
          !Bif_Arg.ArgPos=!DatatypeResult
          end

       when Type == 'WHOLENUM>=0' then do /* D2 Non-negative whole number */
          if \Cdatatype(Value,'W') then
             call Raise 40.12, ArgPos, Value
          if !DatatypeResult < 0 then
             call Raise 40.13, ArgPos, Value
          !Bif_Arg.ArgPos=!DatatypeResult
          end

       when Type == '0_90' then do                          /* Errortext */
          if \Edatatype(Value,'N') then
             call Raise 40.11, ArgPos, Value
          Value=!DatatypeResult
          !Bif_Arg.ArgPos=Value
          Major=Value % 1
          Minor=Value - Major
          if Major < 0 | Major > 90 | Minor > .9 | pos('E',Value)>0 then
             call Raise 40.16, Value  /* ArgPos will be 1 */
          end

       when Type == 'PAD' then do    /* Single character, usually a pad. */
          if length(Value) \= 1 then
             call Raise 40.23, ArgPos, Value
          end

       when Type == 'HEX' then                     /* Hexadecimal string */
          if \datatype(Value, 'X') then
             call Raise 40.25, Value    /* ArgPos will be 1 */

       when Type == 'BIN' then                          /* Binary string */
          if \datatype(Value,'B') then
             call Raise 40.24, Value    /* ArgPos will be 1 */

       when Type = 'SYM' then                                 /* Symbol */
          if \datatype(Value, 'S') then
             call Raise 40.26, Value   /* ArgPos will be 1 */

       when Type = 'ACEFILNOR' then do                         /* Trace */
          /* Allow leading '?'s */
          Val = strip(Value,'Left','?')
          if pos(translate(left(Val, 1)), 'ACEFILNOR') = 0 then
             call Raise 40.28, ArgPos, Type, Value
          end

       otherwise do                                           /* Options */
          /* The checklist item is a list of allowed characters */
          if Value == '' then
             call Raise 40.21, ArgPos
          !Bif_Arg.ArgPos = translate(left(Value, 1))
          if pos(!Bif_Arg.ArgPos, Type) = 0 then
             call Raise 40.28, ArgPos, Type, Value
          end

    end   /* Select */

    return

Cdatatype:
 /* This check is made with the digits setting of the caller. */
 /* !DatatypeResult will be set by use of datatype() */
          numeric digits !Digits.!Level
          numeric form value !Form.!Level
          return datatype(arg(1), arg(2))

Edatatype:
 /* This check is made with digits setting for the particular built-in. */
 /* !DatatypeResult will be set by use of datatype() */
          numeric digits !Config_Digits.!Bif
          numeric form scientific
          return datatype(arg(1),arg(2))
 /************************************************************************
 *.  ReRadix                                                           ) *
 ************************************************************************/
ReRadix: /* Converts Arg(1) from radix Arg(2) to radix Arg(3) */
   procedure
   Subject=arg(1)
   FromRadix=arg(2)
   ToRadix=arg(3)
   /* Radix range is 2-16.  Conversion is via decimal */
   Integer=0
  do j=1 to length(Subject)
    /* Individual digits have already been checked for range. */
    Integer=Integer*FromRadix+pos(substr(Subject,j,1),'0123456789ABCDEF')-1
    /* This test not for standard. */
    if pos('E',Integer)>0 then do
      say "ReRadix unable"
      return '?'
      end
    end
  r=''
  if Integer=0 then r='0'
  do while Integer>0
    r=substr('0123456789ABCDEF',1+Integer//ToRadix,1)||r
    Integer=Integer%ToRadix
    end
  /* When between 2 and 16, there is no zero suppression. */
    if FromRadix=2 & ToRadix=16 then
      r=right(r,(length(Subject)+3)%4,'0')
    else if FromRadix=16 & ToRadix=2 then
      r=right(r,length(Subject)*4,'0')
  return r

Time2Date:
   if arg(1) < 0 then
     call Raise 40.18
   if arg(1) >= 315537897600000000 then
     call Raise 40.18
   return Time2Date2(arg(1))

Time2Date2:Procedure
   /*  Convert a timestamp to a date.
   Argument is a timestamp (the number of microseconds relative to
   0001 01 01 00:00:00.000000)
   Returns a date in the form
     year month day hour minute second microsecond base days     */
   numeric digits 18
   /* Adjust to the virtual date 0001 01 01 00:00:00.000000 */
   Time=arg(1)

   Second = Time   % 1000000    ; Microsecond = Time   // 1000000
   Minute = Second %      60    ; Second      = Second //      60
   Hour   = Minute %      60    ; Minute      = Minute //      60
   Day    = Hour   %      24    ; Hour        = Hour   //      24
   /* At this point, the days are the days since the 0001 base date. */
   BaseDays = Day
   Day = Day + 1
   /* Compute either the fitting year, or some year not too far earlier.
   Compute the number of days left on the first of January of this
   year. */
   Year   = Day % 366
   Day    = Day - (Year*365 + Year%4 - Year%100 + Year%400)
   Year   = Year + 1
   /* Now if the number of days left is larger than the number of days
   in the year we computed, increment the year, and decrement the
   number of days accordingly. */
   do while Day > (365 + Leap(Year))
     Day = Day - (365 + Leap(Year))
     Year = Year + 1
   end
   /* At this point, the days left pertain to this year. */
   YearDays = Day
   /* Now step through the months, increment the number of the month,
   and decrement the number of days accordingly (taking into
   consideration that in a leap year February has 29 days), until
   further reducing the number of days and incrementing the month
   would lead to a negative number of days */
   Days = '31 28 31 30 31 30 31 31 30 31 30 31'
   do Month = 1 to words(Days)
     ThisMonth = Word(Days, Month) + (Month = 2) * Leap(Year)
     if Day <= ThisMonth then leave
     Day = Day - ThisMonth
   end

Return Year Month Day Hour Minute Second Microsecond BaseDays YearDays

Leap: Procedure
   /* Return 1 if the year given as argument is a leap year, or 0
   otherwise. */
   Return (arg(1)//4 = 0) & ((arg(1)//100 \= 0) | (arg(1)//400 = 0))

 /***********************************************************************
 *.  Raise
 ***********************************************************************/
 Raise:
/* These 40.nn messages always include the built-in name as an insert.*/
    call !Raise 'SYNTAX', arg(1), !Bif, arg(2), arg(3), arg(4)
    /* !Raise does not return. */


 /************************************************************************
 *.  A B B R E V  9.3.1                                                  *
 ************************************************************************/
 _abbrev:

    call CheckArgs 'rANY rANY oWHOLE>=0'

    Subject = !Bif_Arg.1
    Subj    = !Bif_Arg.2
    if !Bif_ArgExists.3 then Length = !Bif_Arg.3
                        else Length = length(Subj)
    Cond1 = length(Subject) >= length(Subj)
    Cond2 = length(Subj) >= Length
    Cond3 = substr(Subject, 1, length(Subj)) == Subj
    return Cond1 & Cond2 & Cond3

 /************************************************************************
 *.  C E N T E R  9.3.2
 ************************************************************************/
 _centre:
 _center:

    call CheckArgs   'rANY rWHOLE>=0 oPAD'

    String = !Bif_Arg.1
    Length = !Bif_Arg.2
    if !Bif_ArgExists.3 then Pad = !Bif_Arg.3
                        else Pad = ' '

    Trim = length(String) - Length

    if Trim > 0 then
       return substr(String, Trim % 2 + 1, Length)

    return overlay(String, copies(Pad, Length), -Trim % 2 + 1)

 /************************************************************************
 *.  C H A N G E S T R
 ************************************************************************/
 _changestr:

    call CheckArgs   'rANY rANY rANY'

    Output = ''
    Position = 1
    do forever
      FoundPos = pos(!Bif_Arg.1, !Bif_Arg.2, Position)
      if FoundPos = 0 then leave
      Output = Output || substr(!Bif_Arg.2, Position, FoundPos - Position),
               || !Bif_Arg.3
      Position = FoundPos + length(!Bif_Arg.1)
      end
    return Output || substr(!Bif_Arg.2, Position)

 /************************************************************************
 *.  C O M P A R E  9.3.4
 ************************************************************************/
 _compare:

    call CheckArgs  'rANY rANY oPAD'

    Str1 = !Bif_Arg.1
    Str2 = !Bif_Arg.2
    if !Bif_ArgExists.3 then Pad = !Bif_Arg.3
                        else Pad = ' '

    /* Compare the strings from left to right one character at a time */
    if length(Str1) > length(Str2) then do
      Length = length(Str1)
      Str2=left(Str2,Length,Pad)
      end
    else do
      Length = length(Str2)
      Str1=left(Str1,Length,Pad)
      end

    Str1=translate(Str1, ,!AllBlanks,' ')
    Str2=translate(Str2, ,!AllBlanks,' ')

    do i = 1 to Length
      if substr(Str1, i, 1) \== substr(Str2, i, 1) then return i
      end
    return 0

 /************************************************************************
 *.  C O P I E S   9.3.5
 ************************************************************************/
 _copies:

    call CheckArgs   'rANY rWHOLE>=0'

    Output = ''
    do !Bif_Arg.2
      Output = Output || !Bif_Arg.1
      end
    return Output

 /************************************************************************
 *.  C O U N T S T R
 ************************************************************************/
 _countstr:

    call CheckArgs   'rANY rANY'

    Output = 0
    Position = pos(!Bif_Arg.1,!Bif_Arg.2)
    do while Position > 0
      Output = Output + 1
      Position = pos(!Bif_Arg.1, !Bif_Arg.2, Position + length(!Bif_Arg.1))
      end
    return Output

 /************************************************************************
 *.  D A T A T Y P E  9.3.6
 ************************************************************************/
 _datatype:

  call CheckArgs  'rANY oABLMNSUWX'
  /* As well as returning the type, the value for a 'NUM' is set in
  !DatatypeResult.  This is a convenience when DATATYPE is used
  by CHECKARGS. */

  String = !Bif_Arg.1

  /* If no second argument, DATATYPE checks whether the first is a number. */
  if \!Bif_ArgExists.2 then return DtypeOne()

  Type = !Bif_Arg.2

  /* Null strings are a special case. */
  if String == '' then do
    if Type == "X" then return 1
    if Type == "B" & \!NotJ18 then return 1
    return 0
    end

  /* Several of the options are shorthands for VERIFY */
  azl="abcdefghijklmnopqrstuvwxyz"
  AZU="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
  D09="0123456789"
  if Type == "A" then return verify(String,azl||AZU||D09)=0
  if Type == "B" then do
    if !NotJ18 then return verify(String,"01")=0
    /* Check blanks in allowed places. */
    if pos(left(String,1),!AllBlanks)>0 then return 0
    if pos(right(String,1),!AllBlanks)>0 then return 0
    BinaryDigits=0
    do j = length(String) by -1 to 1
      c = substr(String,j,1)
      if pos(c,!AllBlanks)>0 then do
        /* Blanks need four BinaryDigits to the right of them. */
        if BinaryDigits//4 \= 0 then return 0
        end
      else do
        if verify(c,"01") \= 0  then return 0
        BinaryDigits = BinaryDigits + 1
        end
      end j
    return 1
    end /* B */
  if Type == "L" then return(verify(String,azl)=0)
  if Type == "M" then return(verify(String,azl||AZU)=0)
  if Type == "N" then return(datatype(String)=="NUM")
  if Type == "S" then return(symbol(String)\=='BAD')
  if Type == "U" then return(verify(String,AZU)=0)
  if Type == "W" then do
    /* It may not be a number. */
    if DtypeOne(String) == 'CHAR' then return '0'
    /* It can be "Whole" even if originally in exponential notation. */
    /* BLM Nov 98 */
    /* Before, After and Exponent are byproducts of DtypeOne. */
    if !NotJ18 then do
    /* Allow 1.0000000003 if fraction lost by DIGITS setting. */
      String=Plus0(String)
      InFraction='0'
      do j = 1 to length(String)
        c = substr(String,j,1)
        if pos(c,'Ee')>0 then return 0
        if InFraction & pos(c,'+-')>0 then return 0
        if c == '.' then InFraction='1'
                    else if InFraction & c\=='0' then return 0
        end j
      !DatatypeResult = !DatatypeResult % 1
      return 1
      end
    /* BLM Jun 99 */
    /* It won't be "Whole" if DtypeOne needed to give it an exponent. */
    if pos('E',!DataTypeResult) > 0 then return 0
    /* It won't be "Whole" if there is a non-zero after the decimal point. */
    /* This test has to be against the original string, not !DataTypeResult
    which has had zero added. */
    String = Before||After
    j = length(Before)+ExpWas
    if j<0 then j = 0
    if verify(substr(String,j+1),'0') > 0 then return 0
    /* All tests for Whole passed. */
    !DatatypeResult = !DatatypeResult % 1
    return 1
    end /* W */
  /* Type will be "X" */
  if pos(left(String,1),!AllBlanks)>0 then return 0
  if pos(right(String,1),!AllBlanks)>0 then return 0
  HexDigits=0
  do j=length(String) by -1 to 1
    c=substr(String,j,1)
    if pos(c,!AllBlanks)>0 then do
      /* Blanks need a pair of HexDigits to the right of them. */
      if HexDigits//2 \= 0 then return 0
      end
    else do
      if verify(c,"abcdefABCDEF"D09) \= 0  then return 0
      HexDigits=HexDigits+1
      end
    end
  return 1
  /* end X */

Plus0:                   /* Just for NotJ18 */
 /* This check is made with the digits setting of the caller. */
          numeric digits !Digits.!Level
          numeric form value !Form.!Level
          return 0+arg(1)

DtypeOne:
  /* See section 7 for the syntax of a number. */
  !DatatypeResult = 'S' /* If not syntactically a number */
  Residue = strip(String) /* Blanks are allowed at both ends. */
  if Residue == '' then return "CHAR"
  Sign = ''
  if left(Residue,1) == '+' | left(Residue,1) == '-' then do
    Sign = left(Residue, 1)
    Residue = strip(substr(Residue,2),'L') /* Blanks after sign */
    end
  if Residue == '' then return "CHAR"
  /* Now testing Number, section 6.2.2.35 */
  if left(Residue,1) == '.' then do
    Residue = substr(Residue, 2)
    Before = ''
    After = DigitRun()
    if After == '' then return "CHAR"
    end
  else do
    After='' /* BLM Nov 98. Needed as byproduct */
    Before = DigitRun()
    if Before == '' then return "CHAR"
    if left(Residue,1) == '.' then do
      Residue = substr(Residue, 2)
      After = DigitRun()
      end
    end
  Exponent = 0
  if Residue \== '' then do
    if left(Residue, 1) \== 'e' & left(Residue, 1) \== 'E' then
       return "CHAR"
    Residue = substr(Residue, 2)
    if Residue == '' then return "CHAR"
    Esign = ''
    if left(Residue, 1) == '+' | left(Residue, 1) == '-' then do
      Esign = left(Residue, 1)
      Residue = substr(Residue, 2)
      if Residue == '' then return "CHAR"
      end
    Exponent = DigitRun()
    if Exponent == '' then return "CHAR"
    Exponent = Esign || Exponent
    end
  if Residue \== '' then return "CHAR"
  ExpWas=Exponent /* BLM for Datatype 'W' */

/*DATATYPE tests for exponent out of range. */
  !DatatypeResult = 'E' /* If exponent out of range */
  Before = strip(Before,'L','0')
  if Before == '' then Before = '0'
  Exponent = Exponent + length(Before) -1   /* For SCIENTIFIC */

  /* "Engineering notation causes powers of ten to expressed as a
  multiple of 3 - the integer part may therefore range from 1 through 999." */
  g = 1
  if !Form.!Level == 'E' then do
    /* Adjustment to make exponent a multiple of 3 */
    g = Exponent//3
    if g < 0 then g = g + 3
    Exponent = Exponent - g
    end

  /* Check on the exponent. */
  g = length(Exponent)
  if Exponent<0 then g=g-1
  if g > !Limit_ExponentDigits then return "CHAR"

  /* Format to the numeric setting of the caller of DATATYPE */
  numeric digits !Digits.!Level
  numeric form value !Form.!Level
  !DatatypeResult = 0 + !Bif_Arg.1
  return "NUM"

 DigitRun:
   Outcome = ''
   do while Residue \== ''
     if pos(left(Residue, 1), '0123456789') = 0 then leave
     Outcome = Outcome || left(Residue, 1)
     Residue = substr(Residue, 2)
     end
   return Outcome

 /************************************************************************
 *.  D E L S T R  9.3.7
 ************************************************************************/
 _delstr:
    call CheckArgs  'rANY rWHOLE>0 oWHOLE>=0'

    String = !Bif_Arg.1
    Num    = !Bif_Arg.2
    if !Bif_ArgExists.3 then Len = !Bif_Arg.3

    if Num > length(String) then return String

    Output = substr(String, 1, Num - 1)
    if !Bif_ArgExists.3 then
      if Num + Len <= length(String) then
        Output = Output || substr(String, Num + Len)
    return Output

 /************************************************************************
 *.  D E L W O R D  9.3.8
 ************************************************************************/
 _delword:

    call CheckArgs 'rANY rWHOLE>0 oWHOLE>=0'

    String = !Bif_Arg.1
    Num    = !Bif_Arg.2
    if !Bif_ArgExists.3 then Len = !Bif_Arg.3

    if Num > words(String) then return String

    EndLeft = wordindex(String, Num) - 1
    Output = left(String, EndLeft)
    if !Bif_ArgExists.3 then do
       BeginRight = wordindex(String, Num + Len)
       if BeginRight>0 then
          Output = Output || substr(String, BeginRight)
       end
    return Output

 /************************************************************************
 *.  I N S E R T    9.3.9
 ************************************************************************/
 _insert:

    call CheckArgs 'rANY rANY oWHOLE>=0 oWHOLE>=0 oPAD'

    New    = !Bif_Arg.1
    Target = !Bif_Arg.2
    if !Bif_ArgExists.3 then Num = !Bif_Arg.3
                        else Num = 0
    if !Bif_ArgExists.4 then Length = !Bif_Arg.4
                        else Length = length(New)
    if !Bif_ArgExists.5 then Pad = !Bif_Arg.5
                        else Pad = ' '

    return left(Target, Num, Pad),        /* To left of insert   */
       || left(New, Length, Pad),         /* New string inserted */
       || substr(Target, Num + 1)         /* To right of insert  */

 /************************************************************************
 *.  L A S T P O S    9.3.10
 ************************************************************************/
 _lastpos:

    call CheckArgs 'rANY rANY oWHOLE>0'

    Needle   = !Bif_Arg.1
    Haystack = !Bif_Arg.2
    if !Bif_ArgExists.3 then Start = !Bif_Arg.3
                        else Start = length(Haystack)

    NeedleLength = length(Needle)
    if NeedleLength = 0 then return 0
    Start = Start - NeedleLength + 1
    do i = Start by -1 while i > 0
      if substr(Haystack, i, NeedleLength) == Needle then return i
      end i
    return 0

 /************************************************************************
 *.  L E F T     9.3.11
 ************************************************************************/
 _left:

    call CheckArgs 'rANY rWHOLE>=0 oPAD'

    if !Bif_ArgExists.3 then Pad = !Bif_Arg.3
                        else Pad = ' '

    return substr(!Bif_Arg.1, 1, !Bif_Arg.2, Pad)

 /************************************************************************
 *.  L E N G T H   9.3.12
 ************************************************************************/
 _length:
    call CheckArgs 'rANY'

    String = !Bif_Arg.1

    Indication = Config_Length(String)
    Length = !Outcome
    call Config_Substr Indication, 1
    if !Outcome \== 'E' then return Length
    /* Here if argument was not a character string. */
    call Config_C2B String
    call !Raise 'SYNTAX', 23.1, b2x(!Outcome)
    /* No return to here */

 /************************************************************************
 *.  O V E R L A Y   9.3.13
 ************************************************************************/
 _overlay:

    call CheckArgs 'rANY rANY oWHOLE>0 oWHOLE>=0 oPAD'

    New    = !Bif_Arg.1
    Target = !Bif_Arg.2
    if !Bif_ArgExists.3 then Num = !Bif_Arg.3
                        else Num = 1
    if !Bif_ArgExists.4 then Length = !Bif_Arg.4
                        else Length = length(New)
    if !Bif_ArgExists.5 then Pad = !Bif_Arg.5
                        else Pad = ' '

    return left(Target, Num - 1, Pad),    /* To left of overlay  */
       || left(New, Length, Pad),         /* New string overlaid */
       || substr(Target, Num + Length)    /* To right of overlay */

 /************************************************************************
 *.  P O S    9.3.14
 ************************************************************************/
 _pos:
    call CheckArgs 'rANY rANY oWHOLE>0'

    Needle   = !Bif_Arg.1
    Haystack = !Bif_Arg.2
    if !Bif_ArgExists.3 then Start = !Bif_Arg.3
                        else Start = 1

    if length(Needle) = 0 then return 0
    do i = Start to length(Haystack)+1-length(Needle)
      if substr(Haystack, i, length(Needle)) == Needle then return i
      end i
    return 0

 /************************************************************************
 *.  R E V E R S E    9.3.15
 ************************************************************************/
 _reverse:

    call CheckArgs 'rANY'

    String = !Bif_Arg.1

    Output = ''
    do i = 1 to length(String)
      Output = substr(String,i,1) || Output
      end
    return Output

 /************************************************************************
 *.  R I G H T      9.3.16
 ************************************************************************/
 _right:

    call CheckArgs 'rANY rWHOLE>=0 oPAD'

    String = !Bif_Arg.1
    Length = !Bif_Arg.2
    if !Bif_ArgExists.3 then Pad = !Bif_Arg.3
                        else Pad = ' '

    Trim = length(String) - Length
    if Trim >= 0 then return substr(String,Trim + 1)
    return copies(Pad, -Trim) || String    /* Pad string on the left */

 /************************************************************************
 *.  S P A C E   9.3.17
 ************************************************************************/
 _space:

    call CheckArgs 'rANY oWHOLE>=0 oPAD'

    String = !Bif_Arg.1
    if !Bif_ArgExists.2 then Num = !Bif_Arg.2
                        else Num = 1
    if !Bif_ArgExists.3 then Pad  = !Bif_Arg.3
                        else Pad = ' '

    Padding = copies(Pad, Num)
    Output = subword(String, 1, 1)
    do i = 2 to words(String)
       Output = Output || Padding || subword(String, i, 1)
    end
    return Output

 /************************************************************************
 *.  S T R I P   9.3.18
 ************************************************************************/
 _strip:

    call CheckArgs 'rANY oLTB oPAD'

    String = !Bif_Arg.1
    if !Bif_ArgExists.2 then Option = !Bif_Arg.2
                        else Option = 'B'
    if !Bif_ArgExists.3 then Unwanted = !Bif_Arg.3
                        else Unwanted = !AllBlanks

    if Option == 'L' | Option == 'B' then do
       /* Strip leading characters */
       do while String \== '' & pos(left(String, 1), Unwanted) > 0
         String = substr(String, 2)
         end
       end

    if Option == 'T' | Option == 'B' then do
       /* Strip trailing characters */
       do while String \== '' & pos(right(String, 1), Unwanted) > 0
         String = left(String, length(String)-1)
         end
       end
    return String

 /*************************************************************************
 *.  S U B S T R     9.3.19
 ************************************************************************/
 _substr:

    call CheckArgs 'rANY rWHOLE>0 oWHOLE>=0 oPAD'

    String = !Bif_Arg.1
    Num    = !Bif_Arg.2
    if !Bif_ArgExists.3 then Length = !Bif_Arg.3
                        else Length = length(String)+1-Num
    if !Bif_ArgExists.4 then Pad = !Bif_Arg.4
                        else Pad = ' '

    Output = ''
    do Length
      Indication = Config_Substr(String,Num) /* Attempt to fetch character.*/
      Character = !Outcome
      Num = Num + 1
      call Config_Substr Indication,1 /* Was there such a character? */
      if !Outcome == 'E' then do
        /* Here if argument was not a character string. */

        call Config_C2B String
        call !Raise 'SYNTAX', 23.1, b2x(!Outcome)
        /* No return to here */
        end
      if !Outcome == 'M' then Character = Pad
      Output=Output||Character
      end
    return Output

 /************************************************************************
 *.  S U B W O R D  9.3.20
 ************************************************************************/
 _subword:

    call CheckArgs 'rANY rWHOLE>0 oWHOLE>=0'

    String = !Bif_Arg.1
    Num    = !Bif_Arg.2
    if !Bif_ArgExists.3 then Length = !Bif_Arg.3
                        else Length = length(String) /* Avoids call  */
                                                     /*  to WORDS() */
    if Length = 0 then return ''
    /* Find position of first included word */
    Start = wordindex(String,Num)
    if Start = 0 then return ''                   /* Start is beyond end */

    /* Find position of first excluded word */
    End = wordindex(String,Num+Length)
    if End = 0 then End = length(String)+1

    Output=substr(String,Start,End-Start)

    /* Drop trailing blanks */
    do while Output \== ''
      if pos(right(Output,1),!AllBlanks) = 0 then leave
      Output = left(Output,length(Output)-1)
      end
    return Output

 /************************************************************************
 *.  T R A N S L A T E   9.3.21
 ************************************************************************/
 _translate:

    call CheckArgs 'rANY oANY oANY oPAD'
    String = !Bif_Arg.1
    /* If neither input nor output tables, uppercase. */
    if \!Bif_ArgExists.2 & \!Bif_ArgExists.3 then do
      Output = ''
      do j=1 to length(String)
        Indication = Config_Upper(substr(String,j,1))
        Output = Output || !Outcome
        end j
      return Output
      end
    /* The input table defaults to all characters. */
    if \!Bif_ArgExists.3 then do
      Indication = Config_Xrange()
      Tablei = !Outcome
      end
    else Tablei = !Bif_Arg.3
    /* The output table defaults to null */
    if !Bif_ArgExists.2 then Tableo = !Bif_Arg.2
                        else Tableo = ''
    /* The tables are made the same length */
    if !Bif_ArgExists.4 then Pad = !Bif_Arg.4
                        else Pad = ' '
    Tableo=left(Tableo,length(Tablei),Pad)

    Output=''
    do j=1 to length(String)
      c=substr(String,j,1)
      k=pos(c,Tablei)
      if k=0 then Output=Output||c
             else Output=Output||substr(Tableo,k,1)
      end j
    return Output

 /************************************************************************
 *.  V E R I F Y    9.3.22
 ************************************************************************/
 _verify:

    call CheckArgs 'rANY rANY oMN oWHOLE>0'

    String    = !Bif_Arg.1
    Reference = !Bif_Arg.2
    if !Bif_ArgExists.3 then Option = !Bif_Arg.3
                        else Option = 'N'
    if !Bif_ArgExists.4 then Start = !Bif_Arg.4
                        else Start = 1

    Last = length(String)
    if Start > Last then return 0
    if Reference == '' then
       if Option == 'N' then return Start
                        else return 0

    do i = Start to Last
       t = pos(substr(String, i, 1), Reference)
       if Option == 'N' then do
         if t = 0 then return i  /* Return position of NoMatch character. */
         end
       else
         if t > 0 then return i  /* Return position of Matched character. */
       end i
    return 0

 /************************************************************************
 *.  W O R D   9.3.23
 ************************************************************************/
 _word:

    call CheckArgs 'rANY rWHOLE>0'

    return subword(!Bif_Arg.1, !Bif_Arg.2, 1)

 /************************************************************************
 *.  W O R D I N D E X    9.3.24
 ************************************************************************/
 _wordindex:

    call CheckArgs 'rANY rWHOLE>0'

    String = !Bif_Arg.1
    Num    = !Bif_Arg.2

    /* Find starting position */
    Start = 1
    Count = 0
    do forever
       Start = verify(String, !AllBlanks, 'N', Start)  /* Find non-blank */
       if Start = 0 then return 0                   /* Start is beyond end */
       Count = Count + 1                                /* Words found */
       if Count = Num then leave
       Start = verify(String, !AllBlanks, 'M', Start + 1) /* Find blank  */
       if Start = 0 then return 0                 /* Start is beyond end */
    end
    return Start

 /************************************************************************
 *.  W O R D L E N G T H   9.3.25
 ************************************************************************/
 _wordlength:

    call CheckArgs 'rANY rWHOLE>0'

    return length(subword(!Bif_Arg.1, !Bif_Arg.2, 1))

 /************************************************************************
 *.  W O R D P O S  9.3.26
 ************************************************************************/
 _wordpos:

    call CheckArgs 'rANY rANY oWHOLE>0'

    Phrase = !Bif_Arg.1
    String = !Bif_Arg.2
    if !Bif_ArgExists.3 then Start = !Bif_Arg.3
                        else Start = 1

    Phrase = space(Phrase)
    PhraseWords = words(Phrase)
    if PhraseWords = 0 then return 0
    String = space(String)
    StringWords = words(String)
    do WordNumber = Start to StringWords - PhraseWords + 1
      if Phrase == subword(String, WordNumber, PhraseWords) then
        return WordNumber
      end WordNumber
    return 0

 /************************************************************************
 *.  W O R D S    9.3.27
 ************************************************************************/
 _words:

    call CheckArgs 'rANY'

    do Count = 0 by 1
      if subword(!Bif_Arg.1, Count + 1) == '' then return Count
      end Count

 /************************************************************************
 *.  X R A N G E    9.8.28
 ************************************************************************/
 _xrange:

    call CheckArgs 'oPAD oPAD'

    if \!Bif_ArgExists.1 then !Bif_Arg.1 = ''
    if \!Bif_ArgExists.2 then !Bif_Arg.2 = ''
    Indication = Config_xrange(!Bif_Arg.1, !Bif_Arg.2)
    return !Outcome

 /************************************************************************
 *.  A B S  9.4.1
 ************************************************************************/
 _abs:

    call CheckArgs  'rNUM'

    Number=!Bif_Arg.1
    if left(Number,1) = '-' then Number = substr(Number,2)
    return Number

/************************************************************************
*.  F O R M A T   9.4.2
************************************************************************/
 _format:

    call CheckArgs,
      'rNUM oWHOLE>=0 oWHOLE>=0 oWHOLE>=0 oWHOLE>=0'

    if !Bif_ArgExists.2 then Before = !Bif_Arg.2
    if !Bif_ArgExists.3 then After  = !Bif_Arg.3
    if !Bif_ArgExists.4 then Expp   = !Bif_Arg.4
    if !Bif_ArgExists.5 then Expt   = !Bif_Arg.5
                        else Expt   = !Digits.!Level
    /* In the simplest case the first is the only argument. */
    Number=!Bif_Arg.1
    if !Bif_Arg.0 < 2 then return Number
    /* Dissect the Number. It is in the normal Rexx format. */
    parse var Number Mantissa 'E' Exponent
    if Exponent == '' then Exponent = 0
    Sign = 0
    if left(Mantissa,1) == '-' then do
      Sign = 1
      Mantissa = substr(Mantissa,2)
      end
    /* We are interested in the value of the number, not the input format.
    So we can put it in the form of an integer Mantissa and an Exponent. */
    parse var Mantissa Befo '.' Afte
    Mantissa = Befo||Afte
    Exponent=Exponent - length(Afte)
    /* Leading zeros could have come from 0.01 for example. */
    do while length(Mantissa)>1 & left(Mantissa,1)=='0'
      Mantissa=substr(Mantissa,2)
      end
    Point = length(Mantissa)
    /* Sign Mantissa and Exponent now reflect the Number. */

    /* Decide whether exponential form to be used, setting ShowExp. */
    /* These tests have to be on the number before any rounding since
    decision on whether to have exponent affects what digits surround
    the decimal point. */
    /* Only after this decision can Before and After arguments be checked. */
    ShowExp = 0
    /* There is a test about maximum number of digits in the part before
    the decimal point, if non-exponential is to be used. */
    /* eg 123.4E+3 becomes 1234E+2 by point removal, 123400 non-floating */
    if (length(Mantissa) + Exponent) > Expt then ShowExp = 1
    /* Also a test on digits after the point. */
    /* If the Exponent is negative at this point in the calculation there
    is a possibility that the non-exponential form would have too many
    zeros after the decimal point. */
    /* For classic this test is: */
    if !NotJ18 then if -Exponent > 2*Expt then
                         if -Exponent >= length(Mantissa) then ShowExp = 1
    /* For modern it is: */
    /* The non-exponential value needs to be at least a millionth. */
    if \!NotJ18 then if (-Exponent - length(Mantissa)) >= 6 then ShowExp = 1
    /* An over-riding rule for exponential form: */
    if !Bif_ArgExists.4 then if Expp = 0 then ShowExp = 0

    /* ShowExp now indicates whether to show an exponent. */
    if ShowExp then do
      /* Construct the exponential part of the result. */
      /* Exponent at this point in the calculation reflects an integer
      mantissa.  It has to be changed to reflect a decimal point at
      Point from the left. */
      Point = 1 /* As required for 'SCIENTIFIC' */
      Exponent = Exponent + length(Mantissa) - 1
      if !Form.!Level == 'ENGINEERING' then
      do while Exponent//3  \=  0
        Point = Point + 1
        Exponent = Exponent-1
        Mantissa=Mantissa'0'
        end
      end
    else do /* Force the exponent to zero for non-exponential format. */
      Point = length(Mantissa)
      do while Exponent>0
        Mantissa=Mantissa'0'
        Point=Point+1
        Exponent=Exponent-1
        end
      do while Exponent<0
        Point=Point-1
        if Point < 1 then do
          Mantissa='0'Mantissa
          Point = Point + 1
          end
        Exponent=Exponent+1
        end
      /* Now Exponent is Zero and Mantissa with Point reflects Number */
      end

    /* Deal with right of decimal point first since that can affect the
    left. Ensure the requested number of digits there. */
    Afters = length(Mantissa)-Point
    if !Bif_ArgExists.3 = 0 then After = Afters  /* Note default. */
    /* Make Afters match the requested After */
    do while Afters < After
      Afters = Afters+1
      Mantissa = Mantissa'0'
      end
    if Afters > After then do
      /* Round by adding 5 at the right place. */
      r=substr(Mantissa, Point + After + 1, 1)
      Mantissa = left(Mantissa, Point + After)
      MantLen = length(Mantissa)

      if r >= '5' then Mantissa = Mantissa + 1
      /* This can leave the result zero. */
      if Mantissa = 0 then Sign = 0
      /* This rounding could have made the mantissa shorter. */
      if length(Mantissa) < MantLen then
         Mantissa = copies('0',MantLen-length(Mantissa))||Mantissa
      /* The case when rounding makes the mantissa longer is an awkward
      one. The exponent will have to be adjusted. */
      if length(Mantissa) > MantLen then do
        Point = Point+1
        if Point>Expt then ShowExp = 1
        end
      if ShowExp = 1 then do
         Exponent=Exponent + (Point - 1)
         Point = 1 /* As required for 'SCIENTIFIC' */
         if !Form.!Level == 'ENGINEERING' then
           do while Exponent//3  \=  0
             Point = Point+1
             Exponent = Exponent-1
             end
         end
      end /* Rounded */
    /* Right part is final now.  Set it into Afte */
    if After > 0 then Afte = '.'||substr(Mantissa,Point+1,After)
                 else Afte = ''

    /* Now deal with the part of the result before the decimal point. */
    Mantissa = left(Mantissa,Point)
    if !Bif_ArgExists.2  =  0 then Before  =  Point + Sign /* Note default. */
    /* Make Point match Before */
    if Point > Before - Sign then call Raise  40.38, 2, !Bif_Arg.1
    do while Point<Before
       Point = Point+1
       Mantissa = '0'Mantissa
       end

    /* Find the Sign position and blank leading zeroes. */
    r = ''
    Triggered = 0
    do j = 1 to length(Mantissa)
      Digit = substr(Mantissa,j,1)
      /* Triggered is set when sign inserted or blanking finished. */
      if Triggered = 1 then do
        r = r||Digit
        iterate
        end
      /* If before sign insertion point then blank out zero. */
      if Digit = '0' then
         if substr(Mantissa,j+1,1) = '0' & j+1<length(Mantissa) then do
           r = r||' '
           iterate
           end
      /* j is the sign insertion point. */
      if Digit = '0' & j \= length(Mantissa) then Digit = ' '
      if Sign = 1 then Digit = '-'
      r = r||Digit
      Triggered = 1
      end j
    Number = r||Afte

    if ShowExp = 1 then do
      /* Format the exponent. */
      Expart = ''
      SignExp = 0
      if Exponent<0 then do
        SignExp = 1
        Exponent = -Exponent
        end
      /* Make the exponent to the requested width. */
      if !Bif_ArgExists.4 = 0 then Expp = length(Exponent)
      if length(Exponent) > Expp then
        call Raise 40.38, 4, !Bif_Arg.1
      Exponent=right(Exponent,Expp,'0')
      if Exponent = 0 then do
        if !Bif_ArgExists.4 then Expart = copies(' ',Expp+2)
        end
      else if SignExp = 0 then Expart = 'E+'Exponent
                          else Expart = 'E-'Exponent
      Number = Number||Expart
      end
    return Number

 /************************************************************************
 *.  M A X  9.4.3
 ************************************************************************/
 _max:

    if !Bif_Arg.0 <1 then
      call Raise 40.3, 1
    call CheckArgs 'rNUM'||copies(' rNUM', !Bif_Arg.0 - 1)

    Max = !Bif_Arg.1
    do i = 2 to !Bif_Arg.0 by 1
      Next = !Bif_Arg.i
      if Max < Next then Max = Next
      end i
    return Max

 /***********************************************************************
 *.  M I N    9.4.4
 ***********************************************************************/
 _min:

    if !Bif_Arg.0 <1 then
      call Raise 40.3, 1
    call CheckArgs 'rNUM'||copies(' rNUM', !Bif_Arg.0 - 1)

    Min = !Bif_Arg.1
    do i = 2 to !Bif_Arg.0 by 1
      Next = !Bif_Arg.i
      if Min > Next then Min = Next
      end i
    return Min

 /************************************************************************
 *.  S I G N    9.4.5
 ************************************************************************/
 _sign:

    call CheckArgs 'rNUM'

    Number = !Bif_Arg.1

    select
       when Number < 0 then Output = -1
       when Number = 0 then Output =  0
       when Number > 0 then Output =  1
    end
    return Output

 /************************************************************************
 *.  T R U N C   9.4.6
 ************************************************************************/
 _trunc:

    call CheckArgs 'rNUM oWHOLE>=0'

    Number = !Bif_Arg.1
    if !Bif_ArgExists.2 then Num=!Bif_Arg.2
                        else Num=0

    Integer =(10**Num  * Number)%1
    if Num=0 then return Integer

    t=length(Integer)-Num
    if t<=0 then return '0.'right(Integer,Num,'0')
                 return insert('.',Integer,t)

 /************************************************************************
 *.  A D D R E S S   9.5.1
 ************************************************************************/
 _address:

    /* No second option allowed if first is 'N' or equivalent, otherwise
    second option is required.
    if \!Bif_ArgExists.1 | translate(left(!Bif_Arg.1,1)) == 'N' then
      call CheckArgs  'oN'
    else
      call CheckArgs  'rEIO rANPT'
     */

    if !Bif_ArgExists.1 then Option1 = !Bif_Arg.1
                        else Option1='N'

    if Option1 == 'N' then return !Env_Name.ACTIVE.!Level

    Tail = 'ACTIVE.'Option1'.'!Level
    select
      when !Bif_Arg.2='T' then Info = !Env_Type.Tail
      when !Bif_Arg.2='P' then Info = !Env_Position.Tail
      when !Bif_Arg.2='N' then Info = !Env_Resource.Tail
      when !Bif_Arg.2='A' then
        Info = !Env_Type.Tail !Env_Position.Tail !Env_Resource.Tail
      end
    return Info

 /************************************************************************
 *.  A R G  9.5.2
 ************************************************************************/
 _arg:

    ArgData = 'oWHOLE>0 oENO'
    if !Bif_ArgExists.2 then ArgData = 'rWHOLE>0 rENO'
    call CheckArgs ArgData

    if \!Bif_ArgExists.1 then return !Arg.!Level.0

    ArgNum=!Bif_Arg.1
    if \!Bif_ArgExists.2 then return !Arg.!Level.ArgNum
    if !Bif_Arg.2 =='O' then return \!ArgExists.!Level.ArgNum
                        else return !ArgExists.!Level.ArgNum

 /************************************************************************
 *.  C O N D I T I O N   9.5.3
 ************************************************************************/
 _condition:

    call CheckArgs 'oCDEIS'

    Option=!Bif_Arg.1
    if Option=='C' then return !Condition.!Level
    if Option=='D' then return !ConditionDescription.!Level
    if Option=='E' then return !ConditionExtra.!Level
    if Option=='I' then return !ConditionInstruction.!Level
    /* S */             return !ConditionState.!Level

 /************************************************************************
 *.  D I G I T S    9.5.4
 ************************************************************************/
 _digits:

    call CheckArgs ''

    return !Digits.!Level

 /************************************************************************
 *.  E R R O R T E X T    9.5.5
 ************************************************************************/
 _errortext:

    call CheckArgs 'r0_90 oSN'

    msgcode = !Bif_Arg.1
    if !Bif_ArgExists.2 then Option = !Bif_Arg.2
                        else Option = 'N'
    if Option=='S' then return !ErrorText.msgcode
    return !ErrorText.msgcode

 /************************************************************************
 *.  F O R M    9.5.6
 ************************************************************************/
 _form:

    call CheckArgs ''

    return !Form.!Level

 /************************************************************************
 *.  F U Z Z   9.5.7
 ************************************************************************/
 _fuzz:

    call CheckArgs ''

    return !Fuzz.!Level

 /************************************************************************
 *.  S O U R C E L I N E  9.5.8
 ************************************************************************/
 _sourceline:

    call CheckArgs 'oWHOLE>0'

    if \!Bif_ArgExists.1 then return !Sourceline.0
    Num = !Bif_Arg.1
    if Num > !Sourceline.0 then
       call Raise 40.34, Num, !Sourceline.0
    return !Sourceline.Num

 /************************************************************************
 *.  T R A C E   9.5.9
 ************************************************************************/
 _trace:

    call CheckArgs 'oACEFILNOR'      /* Also checks for '?' */

    /* With no argument, this a simple query. */
    Output=!Tracing.!Level
    if !Interacting.!Level then Output='?'||Output
    if \!Bif_ArgExists.1 then return Output

    Value=!Bif_Arg.1
    if Value=='' then !Interacting.!Level='0'

    /* Each question mark toggles the interacting. */
    do while left(Value,1)=='?'
      !Interacting.!Level = \!Interacting.!Level
      Value=substr(Value,2)
      end
    /* The default setting is 'Normal' */
    if Value=='' then Value='N'
    Value=translate(left(Value,1))
    if Value=='O' then !Interacting.!Level='0'
    !Tracing.!Level = Value
    return Output

 /************************************************************************
 *.  B 2 X   9.6.1
 ************************************************************************/
 _b2x:
    call CheckArgs  'rBIN'

    String=space(!Bif_Arg.1,0)
    return ReRadix(String,2,16)


 /************************************************************************
 *.  B I T A N D    9.6.2
 ************************************************************************/
 _bitand:
 /************************************************************************
 *.  B I T O R   9.6.3
 ************************************************************************/
 _bitor:
 /************************************************************************
 *.  B I T X O R    9.6.4
 ************************************************************************/
 _bitxor:

    call CheckArgs  'rANY oANY oPAD'

    String1 = !Bif_Arg.1
    if !Bif_ArgExists.2 then String2 = !Bif_Arg.2
                        else String2 = ''

    /* Presence of a pad implies character strings. */
    if !Bif_ArgExists.3 then
      if length(String1) > length(String2) then
        String2=left(String2,length(String1),!Bif_Arg.3)
      else
        String1=left(String1,length(String2),!Bif_Arg.3)

    /* Change to manifest bit representation. */
    Indication=Config_C2B(String1)
    String1=!Outcome
    Indication=Config_C2B(String2)
    String2=!Outcome
    /* Exchange if necessary to make shorter second. */
    if length(String1)<length(String2) then do
      t=String1
      String1=String2
      String2=t
      end

    /* Operate on common length of those bit strings. */
    r=''
    do j=1 to length(String2)
      b1=substr(String1,j,1)
      b2=substr(String2,j,1)
      select
        when !Bif='BITAND' then
          b1=b1&b2
        when !Bif='BITOR' then
          b1=b1|b2
        when !Bif='BITXOR' then
          b1=b1&&b2
        end
      r=r||b1
      end j
    r=r || right(String1,length(String1)-length(String2))

    /* Convert back to encoded characters. */
    return x2c(b2x(r))

 /************************************************************************
 *.  C 2 D   9.6.5
 ************************************************************************/
 _c2d:

    call CheckArgs 'rANY oWHOLE>=0'

    if length(!Bif_Arg.1)=0 then return 0

    if !Bif_ArgExists.2 then do
      /* Size specified */
      Size = !Bif_Arg.2
      if Size = 0 then return 0
      /* Pad will normally be zeros */
      t=right(!Bif_Arg.1,Size,left(xrange(),1))
      /* Convert to manifest bit */
      call Config_C2B t
      /* And then to signed decimal. */
      Sign = Left(!Outcome,1)
      !Outcome = substr(!Outcome,2)
      t=ReRadix(!Outcome,2,10)
      /* Sign indicates 2s-complement. */
      if Sign then t=t-2**length(!Outcome)
      if abs(t) > 10**!Digits.!Level-1 then call Raise 40.35,t
      return t
      end
    /* Size not specified. */
    call Config_C2B !Bif_Arg.1
    t=ReRadix(!Outcome,2,10)
    if t > 10**!Digits.!Level-1 then call Raise 40.35,t
    return t

 /************************************************************************
 *.  C 2 X   9.6.6
 ************************************************************************/
 _c2x:

    call CheckArgs 'rANY'

    if length(!Bif_Arg.1) = 0 then return ''
    call Config_C2B !Bif_Arg.1
    return ReRadix(!Outcome,2,16)

 /************************************************************************
 *.  D 2 C   9.6.7
 ************************************************************************/
 _d2c:
    if \!Bif_ArgExists.2 then ArgData = 'rWHOLENUM>=0'
                         else ArgData = 'rWHOLENUM rWHOLE>=0'
    call CheckArgs ArgData

    /* Convert to manifest binary */
    Subject = abs(!Bif_Arg.1)
    r = ReRadix(Subject,10,2)
    /* Make length a multiple of 8, as required for Config_B2C */
    Length = length(r)
    do while Length//8 \= 0
       Length = Length+1
       end
    r = right(r,Length,'0')
    /* 2s-complement for negatives. */
    if !Bif_Arg.1<0 then do
      Subject = 2**length(r)-Subject
      r = ReRadix(Subject,10,2)
      end
    /* Convert to characters */
    Indication = Config_B2C(r)
    Output = !Outcome
    if \!Bif_ArgExists.2 then return Output

    /* Adjust the length with appropriate characters. */
    if !Bif_Arg.1>=0 then return right(Output,!Bif_Arg.2,left(xrange(),1))
                     else return right(Output,!Bif_Arg.2,right(xrange(),1))

/************************************************************************
 *.  D 2 X   9.6.8
 ************************************************************************/
_d2x:
    if \!Bif_ArgExists.2 then ArgData = 'rWHOLENUM>=0'
                         else ArgData = 'rWHOLENUM rWHOLE>=0'
    call CheckArgs ArgData

    /* Convert to manifest hexadecimal */
    Subject = abs(!Bif_Arg.1 )
    r = ReRadix(Subject,10,16)
    /* Twos-complement for negatives */
    if !Bif_Arg.1<0 then do
      Subject = 16**length(r)-Subject
      r = ReRadix(Subject,10,16)
      end
    if \!Bif_ArgExists.2 then return r
    /* Adjust the length with appropriate characters. */
    if !Bif_Arg.1>=0 then return right(r,!Bif_Arg.2,'0')
                     else return right(r,!Bif_Arg.2,'F')

 /************************************************************************
 *.  X 2 B   9.6.9
 ************************************************************************/
_x2b:
   call CheckArgs 'rHEX'

   Subject = !Bif_Arg.1
   if Subject == '' then return ''
   /* Blanks were checked by CheckArgs, here they are ignored. */
   Subject = space(Subject,0)
   return ReRadix(translate(Subject),16,2)

 /************************************************************************
 *.  X 2 C   9.6.10
 ************************************************************************/
_x2c:
   call CheckArgs 'rHEX'

   Subject = !Bif_Arg.1
   if Subject == '' then return ''
   Subject = space(Subject,0)
   /* Convert to manifest binary */
   r = ReRadix(translate(Subject),16,2)
   /* Convert to character */
   Length = 8*((length(Subject)+1)%2)
   Indication = Config_B2C(right(r,Length,'0'))
   return !Outcome

 /************************************************************************
 *.  X 2 D   9.6.11
 ************************************************************************/
_x2d:
   call CheckArgs 'rHEX oWHOLE>=0'
   Subject = !Bif_Arg.1
   if Subject == '' then return '0'

   Subject = translate(space(Subject,0))
/* We put a MIN in here as a practical consideration. Not for Standard. */
   if !Bif_ArgExists.2 then
     Subject = right(Subject,min(!Bif_Arg.2,length(Subject)+1),'0')
   if Subject =='' then return '0'
   /* Note the sign */
   if !Bif_ArgExists.2 then SignBit = left(x2b(Subject),1)
                       else SignBit = '0'
   /* Convert to decimal */
   r = ReRadix(Subject,16,10)
   /* Twos-complement */
   if SignBit then r = r - 2**(4*!Bif_Arg.2)
   if abs(r)>10**!Digits.!Level-1 then call Raise 40.35,t
   return r

 /************************************************************************
 *.  C H A R I N   9.7.1
 ************************************************************************/
 _charin:

    call CheckArgs 'oANY oWHOLE>0 oWHOLE>=0'

    if !Bif_ArgExists.1 then Stream  = !Bif_Arg.1
                        else Stream  = ''
    if !Bif_ArgExists.2 then do
      Charpos = !Bif_Arg.2
      /* Already tested for > 0 */
/* ??      if Charpos > chars(Stream,'C') then
     Chars w/o close doesn't work on OS/2 anyway
      if Charpos > chars(Stream) then
        call Raise 40.41,!Bif_Arg.2  */
      Indication = Config_Position(Stream,'CHARIN',Charpos)
      if left(Indication,1) == 'B' then call Raise 40.27,1,Stream
      end
    if !Bif_ArgExists.3 then Count = !Bif_Arg.3
                        else Count = 1
    if Count = 0 then do
      call Config_Charin Stream, 'NULL' /* "Touch" the stream */
      return ''
      end
  /* The unit may be eight bits or one character. */
  call Config_StreamQuery Stream
  Mode = !Outcome
  r = ''
  do until Count = 0
     call Config_Charin Stream, 'CHARIN'
     if !This_Exception \== 'READY' then do
       call !Raise 'NOTREADY', Stream
       leave
       end
     r = r||!Outcome
     Count = Count-1
     end
  if Mode == 'B' then do
    call Config_B2C r
    r = !Outcome
    end
  return r

 /************************************************************************
 *.  C H A R O U T   9.7.2
 ************************************************************************/
 _charout:

    call CheckArgs 'oANY oANY oWHOLE>0'

    if !Bif_ArgExists.1 then Stream  = !Bif_Arg.1
                        else Stream  = ''
    if !Bif_ArgExists.3 then do
      Charpos = !Bif_Arg.3
/* ??      if Charpos > 1+chars(Stream,'C') then
      if Charpos > 1+chars(Stream) then
        call Raise 40.41,!Bif_Arg.2    */
      call Config_Position Stream,'CHAROUT',Charpos
      end
    if \!Bif_ArgExists.2 then do
      if !Bif_ArgExists.3 then return 0
      /* Position to end of stream. */
      do until left(Indication,1) \== 'N'
        Indication = Config_Charin(Stream,'CHARIN')
        end
      return 0
      end
    String = !Bif_Arg.2
    Stride = 1
    Residue = length(String)
    call Config_StreamQuery Stream
    Mode = !Outcome
    if Mode == 'B' then do
      call Config_C2B String
      String = !Outcome
      Stride = 8
      Residue = length(String)/8
      end
    Cursor = 1
    do while Residue>0
      Piece = substr(String,Cursor,Stride)
      Cursor = Cursor+Stride
      call Config_Charout Stream,Piece
      if !This_Exception \== 'READY' then do
        call !Raise !This_Exception  /* Which may not return */
        return Residue
        end
      Residue = Residue-1
      end
    return 0
 /************************************************************************
 *.  C H A R S  9.7.3
 ************************************************************************/
 _chars:

    call CheckArgs 'oANY oNIC'

    if !Bif_ArgExists.1 then Stream = !Bif_Arg.1
                        else Stream = ''
    if !Bif_ArgExists.2 then Option = !Bif_Arg.2
                        else Option = 'N'

    Call Config_StreamCount Stream, 'CHARIN', Option
    return !Outcome

 /************************************************************************
 *.  L I N E I N   9.7.4
 ************************************************************************/
 _linein:

  call CheckArgs 'oANY oWHOLE>0 oWHOLE>=0'

  if !Bif_ArgExists.1 then Stream = !Bif_Arg.1
                      else Stream = ''
  if !Bif_ArgExists.2 then do
    linepos  = !Bif_Arg.2
    /* Already rested for > 0 */
    /* May fail with 40.41 */
    call Config_Position Stream,'LINEIN',linepos
    end
  if !Bif_ArgExists.3 then Count = !Bif_Arg.3
                      else Count = 1
  if Count>1 then call Raise 40.42, Count
  if Count = 0 then return ''
  /* A configuration may recognise lines even in 'binary' mode. */
  call Config_StreamQuery Stream
  Mode = !Outcome
  r = ''
  t = !Linein_Position.Stream
  do until t \= !Linein_Position.Stream
     do until left(Indication,1) \== 'T'
       Indication = Config_Charin(Stream,'LINEIN')
       end
     if !This_Exception \== 'READY' then do
       call !Raise !This_Exception  /* Which may not return */
       return ""
       end
     r = r||!Outcome
     end
  if Mode == 'B' then do
    call Config_B2C r
    r = !Outcome
    end
  return r

 /************************************************************************
 *.  L I N E O U T   9.7.5
 ************************************************************************/
 _lineout:

    call CheckArgs 'oANY oANY oWHOLE>0'

    if !Bif_ArgExists.1 then Stream  = !Bif_Arg.1
                        else Stream  = ''
    if !Bif_ArgExists.3 then do
      Linepos = !Bif_Arg.3
      call Config_Position Stream,'LINEOUT',linepos   /* May fail with 40.41 */
      end
    if \!Bif_ArgExists.2 then do
      if !Bif_ArgExists.3 then return 0
      /* Position to end of stream. */
      do until left(Indication,1) \== 'N'
        Indication = Config_Charin(Stream,'LINEIN')
        end
      return 0
      end
    String = !Bif_Arg.2
    Stride = 1
    Residue = length(String)
    call Config_StreamQuery Stream
    Mode = !Outcome
    if Mode == 'B' then do
      call Config_C2B String
      String = !Outcome
      Stride = 8
      Residue = length(String)/8
      end
    Cursor = 1
    do while Residue > 0
      Piece = substr(String,Cursor,Stride)
      Cursor = Cursor+Stride
      call Config_Charout Stream,Piece
      if !This_Exception \== 'READY' then do
        call !Raise !This_Exception  /* Which may not return */
        return 1
        end
      Residue = Residue-1
      end
    return 0
 /************************************************************************
 *.  L I N E S    9.7.6
 ************************************************************************/
 _lines:

    call CheckArgs 'oANY oCNI'

    if !Bif_ArgExists.1 then Stream = !Bif_Arg.1
                        else Stream = ''
    if !Bif_ArgExists.2 then Option = !Bif_Arg.2
                        else Option = 'N'

    Call Config_StreamCount Stream, 'LINEIN', Option
    return !Outcome

 /************************************************************************
 *.  Q U A L I F Y   9.7.7
 ************************************************************************/
_Qualify:

    call CheckArgs 'oANY'

    if !Bif_ArgExists.1 then Stream  = !Bif_Arg.1
                        else Stream  = ''

    Indication = Config_Qualified_Name(Stream)
    return !Outcome

 /************************************************************************
 *.  S T R E A M    9.7.8
 ************************************************************************/
 _stream:
    /* Third argument is only correct with 'C' */
    if !Bif_ArgExists.2 & translate(left(!Bif_Arg.2, 1)) == 'C' then
       ArgData = 'rANY rCDS rANY'
    else
       ArgData = 'rANY oCDS'
    call CheckArgs ArgData

    Stream = !Bif_Arg.1

    if !Bif_ArgExists.2 then Operation = !Bif_Arg.2
                        else Operation = 'S'

   Select
   when Operation == 'C' then do
     call Config_StreamCommand Stream,!Bif_Arg.3
     return !Outcome
     end
   when Operation == 'D' then do
     call Config_StreamState Stream
     return !Description
     end
   when Operation == 'S' then do
     call Config_StreamState Stream
     return !This_Exception
     end
   end

 /************************************************************************
 *.  D A T E     9.8.1
 ************************************************************************/
 _date:

    call CheckArgs 'oBDEMNOSUW oANY oBDENOSU'
    /* If the third argument is given then the second is mandatory. */
    if !Bif_ArgExists.3 & \!Bif_ArgExists.2 then
      call Raise 40.19, '', !Bif_Arg.3

    if !Bif_ArgExists.1 then Option = !Bif_Arg.1
                        else Option = 'N'

    /* The date/time is 'frozen' throughout a clause. */
    if !ClauseTime.!Level == '' then do
      !Response = Config_Time()
      !ClauseTime.!Level = !Time
      !ClauseLocal.!Level = !Time + !Adjust
      end
    /* English spellings are used, even if messages not in English are
used. */
    Months = 'January February March April May June July',
             'August September October November December'
    WeekDays = 'Monday Tuesday Wednesday Thursday Friday Saturday Sunday'

    /* If there is no second argument, the current date is returned. */
    if \!Bif_ArgExists.2 then
      return DateFormat(!ClauseLocal.!Level, Option)

    /* If there is a second argument it provides the date to be
    converted. */
    Value = !Bif_Arg.2
    if !Bif_ArgExists.3 then InOption = !Bif_Arg.3
                        else InOption = 'N'
    /* First try for Year Month Day */
    Logic = 'NS'
    select
      when InOption == 'N' then do
        parse var Value Day MonthIs Year
        do Month = 1 to 12
          if left(word(Months, Month), 3) == MonthIs then leave
          end Month
        end
      when InOption == 'S' then parse var Value Year +4 Month +2 Day
      otherwise Logic = 'EOU' /* or BD */
      end
    /* Next try for year without century */
    if logic = 'EOU' then
    Select
      when InOption == 'E' then parse var Value Day '/' Month '/' YY
      when InOption == 'O' then parse var Value YY '/' Month '/' Day
      when InOption == 'U' then parse var Value Month '/' Day '/' YY
      otherwise Logic = 'BD'
      end
    if Logic = 'EOU' then do
      /* The century is assumed, on the basis of the current year. */
      if \datatype(YY,'W') then
        call Raise 40.19, Value, InOption
      parse value Time2Date(!ClauseLocal.!Level) with YearNow .
      Year = YY
      do while Year < YearNow-50
        Year = Year + 100
        end
      end /* Century assumption */
    if Logic \= 'BD' then do
      /* Convert Month & Day to Days of year. */
      if \datatype(Month,'W') | \datatype(Day,'W') | \datatype(Year,'W') then
        call Raise 40.19, Value, InOption
      Days = word('0 31 59 90 120 151 181 212 243 273 304 334',Month) +,
        (Month>2)*Leap(Year) + Day-1
      end
    else
      if \datatype(Value,'W') then
        call Raise 40.19, Value, InOption
    if InOption == 'D' then do
      parse value Time2Date(!ClauseLocal.!Level) with Year .
      Days = Value - 1 /* 'D' includes current day */
      end
    /* Convert to BaseDays */
    if InOption \== 'B' then
      BaseDays = (Year-1)*365 + (Year-1)%4 - (Year-1)%100 + (Year-1)%400,
                 + Days
    else Basedays = Value
    /* Convert to microseconds from 0001 */
    Micro = BaseDays * 86400 * 1000000
    /* Reconvert to check the original. (eg for Month = 99) */
    if DateFormat(Micro,InOption) \== Value then
      call Raise 40.19, Value, InOption
    return DateFormat(Micro, Option)

DateFormat:
    /* Convert from microseconds to given format. */
    parse value Time2Date(arg(1)) with,
         Year Month Day Hour Minute Second Microsecond Base Days
    select
      when arg(2) == 'B' then
        return Base
      when arg(2) == 'D' then
        return Days
      when arg(2) == 'E' then
        return right(Day,2,'0')'/'right(Month,2,'0')'/'right(Year,2,'0')
      when arg(2) == 'M' then
        return word(Months,Month)
      when arg(2) == 'N' then
        return Day left(word(Months,Month),3) right(Year,4,'0')
      when arg(2) == 'O' then
        return right(Year,2,'0')'/'right(Month,2,'0')'/'right(Day,2,'0')
      when arg(2) == 'S' then
        return right(Year,4,'0')||right(Month,2,'0')||right(Day,2,'0')
      when arg(2) == 'U' then
        return right(Month,2,'0')'/'right(Day,2,'0')'/'right(Year,2,'0')
      otherwise /* arg(2) == 'W' */
        return word(Weekdays,1+Base//7)
      end
   return

 /************************************************************************
 *.  Q U E U E D   9.8.2
 ************************************************************************/
 _queued:
     call CheckArgs ''
     Indication = Config_Queued()
     return !Outcome
 /************************************************************************
 *.  R A N D O M   9.8.3
 ************************************************************************/
_random:

    call CheckArgs  'oWHOLE>=0 oWHOLE>=0 oWHOLE>=0'

    if !Bif_Arg.0 = 1 then do
       Minimum = 0
       Maximum = !Bif_Arg.1
       if Maximum>100000 then
          call Raise 40.31, Maximum
       end
    else do
       if !Bif_ArgExists.1 then Minimum = !Bif_Arg.1
                           else Minimum = 0
       if !Bif_ArgExists.2 then Maximum = !Bif_Arg.2
                           else Maximum = 999
       end

    if Maximum-Minimum>100000 then
       call Raise 40.32, Minimum, Maximum

    if Maximum-Minimum<0 then
       call Raise 40.33, Minimum, Maximum

    if !Bif_ArgExists.3 then call Config_Random_Seed !Bif_Arg.3
    call Config_Random_Next Minimum, Maximum
    return !Outcome
 /************************************************************************
 *.  S Y M B O L    9.8.4
 ************************************************************************/
 _symbol:
 /************************************************************************
 *.  T I M E  9.8.5
 ************************************************************************/
 _time:

    call CheckArgs 'oCEHLMNORS oANY oCHLMNS'
    /* If the third argument is given then the second is mandatory. */
    if !Bif_ArgExists.3 & \!Bif_ArgExists.2 then
      call Raise 40.19, '', !Bif_Arg.3

    if !Bif_ArgExists.1 then Option = !Bif_Arg.1
                        else Option = 'N'

    /* The date/time is 'frozen' throughout a clause. */
    if !ClauseTime.!Level == '' then do
       !Response = Config_Time()
       !ClauseTime.!Level = !Time
       !ClauseLocal.!Level = !Time + !Adjust
       end

    /* If there is no second argument, the current time is returned. */
    if \!Bif_ArgExists.2 then
      return TimeFormat(!ClauseLocal.!Level, Option)

    /* If there is a second argument it provides the time to be
    converted. */
    if pos(Option, 'ERO') > 0 then
      call Raise 40.29, Option
    InValue = !Bif_Arg.2
    if !Bif_ArgExists.3 then InOption = !Bif_Arg.3
                        else InOption = 'N'
    HH = 0
    MM = 0
    SS = 0
    HourAdjust = 0
    select
      when InOption == 'C' then do
        parse var InValue HH ':' . +1 MM +2 XX
        if HH=12 then HH=0;
        if XX == 'pm' then HourAdjust = 12
        end
      when InOption == 'H' then HH = InValue
      when InOption == 'L' | InOption == 'N' then
        parse var InValue HH ':' MM ':' SS
      when InOption == 'M' then MM = InValue
      otherwise SS = InValue
      end
    if \datatype(HH,'W') | \datatype(MM,'W') | \datatype(SS,'N') then
      call Raise 40.19, InValue, InOption
    HH = HH + HourAdjust
    /* Convert to microseconds */
    Micro = trunc((((HH * 60) + MM) * 60 + SS) * 1000000)
    /* Reconvert to check the original. (eg for hour = 99) */
    if TimeFormat(Micro,InOption) \== InValue then
      call Raise 40.19, InValue, InOption
    return TimeFormat(Micro, Option)

TimeFormat:
    /* Convert from microseconds to given format. */
    parse value Time2Date(arg(1)) with,
         Year Month Day Hour Minute Second Microsecond Base Days
    select
      when arg(2) == 'C' then
        select
          when Hour>12 then
            return Hour-12':'right(Minute,2,'0')'pm'
          when Hour=12 then
            return '12:'right(Minute,2,'0')'pm'
          when Hour>0 then
            return Hour':'right(Minute,2,'0')'am'
          when Hour=0 then
            return '12:'right(Minute,2,'0')'am'
        end
      when arg(2) == 'E' | arg(2) == 'R' then do
         /* Special case first time */
         if !StartTime.!Level == '' then do
            !StartTime.!Level = !ClauseTime.!Level
            return '0'
            end
         Output = !ClauseTime.!Level-!StartTime.!Level
         if arg(2) == 'R' then
           !StartTime.!Level = !ClauseTime.!Level
         return Output * 1E-6
         end  /* E or R */
      when arg(2) == 'H' then return Hour
      when arg(2) == 'L' then
         return right(Hour,2,'0')':'right(Minute,2,'0')':'right(Second,2,'0'),
            || '.'right(Microsecond,6,'0')
      when arg(2) == 'M' then return 60*Hour+Minute
      when arg(2) == 'N' then
         return right(Hour,2,'0')':'right(Minute,2,'0')':'right(Second,2,'0')
      when arg(2) == 'O' then
         return trunc(!ClauseLocal.!Level - !ClauseTime.!Level)
      otherwise /* arg(2) == 'S' */
        return 3600*Hour+60*Minute+Second
      end

 /************************************************************************
 *.  V A L U E   9.8.6
 ************************************************************************/
 _value:

    if !Bif_ArgExists.3 then ArgData = 'rANY oANY oANY'
                        else ArgData = 'rSYM oANY oANY'
    call CheckArgs ArgData

    Subject = !Bif_Arg.1
    if !Bif_ArgExists.3 then do  /* An external pool. */
      /* Fetch the original value */
      Pool = !Bif_Arg.3
      Indication = Config_Get(Pool,Subject)
      Indicator = left(Indication,1)
      if Indicator == 'F' then
         call Raise 40.36, Subject
      if Indicator == 'P' then
         call Raise 40.37, Pool
      Value = !Outcome
      if !Bif_ArgExists.2 then do
         /* Set the new value. */
         Indication = Config_Set(Pool,Subject,!Bif_Arg.2)
         if Indicator == 'P' then
           call Raise 40.37, Pool
         if Indicator == 'F' then
           call Raise 40.36, Subject
         end
      /* Return the original value. */
      return Value
      end
    /* Not external */
    Subject = translate(Subject)
    /* See 7.3 */
    p = pos(Subject,'.')
    if p = 0 | p = length(Subject) then do
      /* Not compound */
      Indication = Var_Value(!Pool, Subject, '0')
      Value = !Outcome
      if !Bif_ArgExists.2 then
         Indication = Var_Set(!Pool, Subject, '0', !Bif_Arg.2)
      return Value
      end
    /* Compound */
    Expanded = left(Subject,p-1)  /* The stem */
    do forever
      Start = p+1
      p = pos(Subject,'.',Start)
      if p = 0 then p = length(Subject)
      Item = substr(Subject,Start,p-Start) /* Tail component symbol */
      if Item\=='' then if pos(left(Item,1),'0123456789') = 0 then do
         Indication = Var_Value(!Pool, Item, '0')
         Item = !Outcome
         end
      /* Add tail component. */
      Expanded = Expanded'.'Item
      end
    Indication = Var_Value(!Pool, Expanded, '1')
    Value = !Outcome
    if !Bif_ArgExists.2 then
       Indication = Var_Set(!Pool, Expanded, '1', !Bif_Arg.2)
    return Value

 /************************************************************************
 *.  C O N F I G _       substitutes.
 ************************************************************************/
/* For testing, the Config_ routines are simulated. */
Config_Upper:!Outcome = translate(arg(1))
    return 'N'
Config_B2C:!Outcome = x2c(b2x(Arg(1)))
    return 'N'
Config_C2B:!Outcome = x2b(C2X(Arg(1)))
    return 'N'
Config_Substr:
    s = Arg(1)
    p = Arg(2)
    if p>length(s) then do
       !Outcome = ''
       return 'M'
       end
    !Outcome = substr(s,p,1)
    return 'N'
Config_Length:
    !Outcome=length(arg(1))
    return 'N'
Config_Queued:
    !Outcome = queued()
    return 'N'
Config_Charin:StreamName=Arg(1)
    if stream(StreamName) \== 'READY' then do
      !Outcome=''
      !This_Exception='NOTREADY'
      return 'N'
      end
    !Outcome=charin(StreamName)
    if !Outcome='0C'X then
       !Linein_Position.StreamName=!Linein_Position.StreamName+1
    !This_Exception='READY'
    return 'N'
Config_Position:
    s=Arg(1)
    p=Arg(3)
    if Arg(2)='CHARIN' then do
       call charin s,p,0
       !Charin_Position.s=p
       end
    else if Arg(2)='LINEIN' then do
       call linein s,p,0
       !Linein_Position.s=p
       end
    else if Arg(2)='CHAROUT' then do
       call charout s,'',p
       !Charout_Position.s=p
       end
    else do
       call lineout s,'',p
       !Lineout_Position.s=p
       end
    return 'N'
Config_StreamCommand:!Outcome='Done'
    return 'N'
Config_StreamState:!Outcome=stream(Arg(1),'S')
    !Description=stream(Arg(1),'D')
    return 'N'
Config_Charout:StreamName=Arg(1)
    call charout StreamName, Arg(2)
    !This_Exception='READY'
    return 'N'
Config_Qualified_Name:!Outcome=Arg(1)
    return 'N'
Config_StreamQuery:!Outcome='C'
    return 'N'
Config_StreamClose:call lineout arg(1)
    return 'N'
Config_StreamCount:!Outcome=??
    return 'N'
Config_Get:!Outcome=??
    return 'N'
Config_Set:!Outcome=??
    return 'N'
 Config_Time:
    t=translate(date('O') time('L'),,'/:.')
    if left(t,1)=='0' then t='20't; else t='19't
    !Time = Date2Time(t)
    !Adjust = 0
    return 'N'

Date2Time:Procedure
/* ---------------------------------------------------------------------
** Convert a date to a timestamp.
**
** Argument is a date in the range of
**   0001 01 01 00:00:00.000000
**   9999 12 31 23:59:59.999999
**
** Returns a timestamp (the number of microseconds relative to
** 0001 01 01 00:00:00.000000).
** ---------------------------------------------------------------------
*/

Numeric Digits 18
Parse Arg Year Month Day Hour Minute Second Microsecond .

Return ((               ,
         (Year-1)*365 + ,
         (Year-1)%4   - ,
         (Year-1)%100 + ,
         (Year-1)%400 + ,
         word('0 31 59 90 120 151 181 212 243 273 304 334',Month) +,
         (Month>2)*Leap(Year) + ,
         Day-1 ,
        )*86400 + Hour*3600 + Minute*60 + Second ,
       )*1000000 + Microsecond
 Config_Random_Seed:
    call random 0,0,time('S')      /* Test equivalent */
    return 'N'
 Config_Random_Next:
    !Outcome=random(arg(1),arg(2))
    return 'N'
Config_Xrange:lb=arg(1);hb=arg(2)
    if lb='' then lb='00'X
    if hb='' then hb='FF'X
    !Outcome=xrange(lb,hb)
    return 'N'

Var_Value:
Var_Set:
  say "Sorry, can't do things that require keeping history from call to call."
  exit

 Datatype:/* Made to work like standard's */
   /* Not right for 'W" anyway */
   if arg()=1 then do
     if 'DATATYPE'(arg(1))\=='NUM' then return 'CHAR'
   numeric digits !Digits.!Level
   numeric form value !Form.!Level
     !DatatypeResult=arg(1)+0
     return 'NUM'
     end

   if arg(2)='B' then if arg(1)=='' then return 1
                 else do
                   if left(arg(1),1)=' '|right(arg(1),1)=' ' then return 0
                   return 'DATATYPE'(space(arg(1),0),'B')
                   end
   if arg(2)='W' | arg(2)='N' then
      if 'DATATYPE'(arg(1),arg(2)) then do
         !DatatypeResult=arg(1)+0
         if arg(2)='W' then !DatatypeResult=!DatatypeResult%1
         end
   return 'DATATYPE'(arg(1),arg(2))

 /************************************************************************
 *.  Set up for testing.
 ************************************************************************/
Bottom:
/* For testing, this routine is setup so that it can be called
as an external routine servicing the builtin function
calls of any testcase.  In that role, some code must be added to that
testcase to catch the builtin function calls and direct them here. */

    numeric digits 999           /* Emulating 'as much as needed' */
    if queued()=0 then do
      say "This version is not conversational"
      exit
      end
    /* Program code invocation */
     signal on syntax
     signal on novalue

/* Since we initialize everytime this external routine is called, it
won't allow testing where history is needed, eg I/O */
     call global_vars       /* Other initialization */

     /* Retrieve the caller's numeric settings etc. */
     parse pull !Bif .
     parse pull !Digits.!Level .
     parse pull !Form.!Level .
     parse pull !Fuzz.!Level .
 /* Make the state reflect the arguments on the original bif call. */
     !Bif_ArgExists.='0'
     !Bif_Arg.=''
     parse pull !Bif_Arg.0 .
     do j=1 to !Bif_Arg.0
       parse pull !Bif_ArgExists.j .
       if !Bif_ArgExists.j='1' then parse pull !Bif_Arg.j
       end
     dynamic="answer=_"!Bif"()"
 /* Some have extra stuff stacked. */
     if !Bif='SOURCELINE' then do
       !Sourceline.=''
       pull !Sourceline.0
       do i=!Sourceline.0 by -1 to 1
         pull !Sourceline.i
         end i
       end
     interpret dynamic
     return answer

 /************************************************************************
 *.  Global_Vars
 ************************************************************************/
 Global_Vars:

    !DatatypeResult=''
    !AllBlanks=' '
    !Pool = 13 /* Say */
    !Limit_Digits=999
    !Limit_String = 999999
    !Limit_Literal = 250
    !Limit_Name = 250
    !Limit_EnvironmentName = 250
    !Limit_ExponentDigits = 9
    !Digits. = 777 /* Will be fixed. */
    !level = 99 /* Perhaps */
    !ArgExists.='0'
    !Arg.=''
    !ArgExists.!Level.0=2 /* Perhaps */
    !ArgExists.!Level.2='1' /* Perhaps */
    !Arg.!Level.2='Whatever' /* Perhaps */
    index = 0
    condition = ''
    !StartTime.=''
    !ClauseTime.=''
    !Condition.!Level = ''
    !ConditionDescription.!Level = ''
    !ConditionInstruction.!Level = ''
    !ConditionState.!Level = ''

    !Config_Digits.=9 /* Pretend Config_Digits call */
    !tracing.!Level = trace()
    !Env_Name.!Level= address()
    !Env_SourceType.!Level='ECST'
    !Env_SourcePosition.!Level='ECSP'
    !Env_SourceName.!Level='ECSN'
    !Env_DestinationType.!Level='ECDT'
    !Env_DestinationPosition.!Level='ECDP'
    !Env_DestinationName.!Level='ECDN'

    !Charin_Position.=1
    !Charout_Position.=1
    !Linein_Position.=1
    !Lineout_Position.=1
    !enabling.!Level.ERROR    = 'OFF'
    !enabling.!Level.FAILURE  = 'OFF'
    !enabling.!Level.HALT     = 'OFF'
    !enabling.!Level.NOVALUE  = 'OFF'
    !enabling.!Level.NOTREADY = 'OFF'
    !enabling.!Level.SYNTAX   = 'OFF'
    !condition.!Level         = ''
    !description.!Level       = ''
    !instruction.!Level       = ''
    !state.!Level             = ''
    !trapname.!Level.ERROR    = 'ERROR'
    !trapname.!Level.FAILURE  = 'FAILURE'
    !trapname.level.HALT     = 'HALT'
    !trapname.!Level.NOVALUE  = 'NOVALUE'
    !trapname.!Level.NOTREADY = 'NOTREADY'
    !trapname.!Level.SYNTAX   = 'SYNTAX'

   !ErrorText.    = ''

   !ErrorText.0.1 = 'Error <value> running <source>, line <linenumber>:'
   !ErrorText.0.2 = 'Error <value> in interactive trace:'
   !ErrorText.0.3 = 'Interactive trace.  "Trace Off" to end debug. ',
                    'ENTER to continue.'
   !ErrorText.2   = 'Failure during finalization'
   !ErrorText.2.1 = 'Failure during finalization: <description>'

   !ErrorText.3   = 'Failure during initialization'
   !ErrorText.3.1 = 'Failure during initialization: <description>'

   !ErrorText.4   = 'Program interrupted'
   !ErrorText.4.1 = 'Program interrupted with HALT condition'

   !ErrorText.5   = 'System resources exhausted'
   !ErrorText.5.1 = 'System resources exhausted: <description>'

   !ErrorText.6   = 'Unmatched "/*" or quote'
   !ErrorText.6.1 = 'Unmatched comment delimiter ("/*")'
   !ErrorText.6.2 = "Unmatched single quote (')"
   !ErrorText.6.3 = 'Unmatched double quote (")'

   !ErrorText.7   = 'WHEN or OTHERWISE expected'
   !ErrorText.7.1 = 'SELECT on line <linenumber> requires WHEN;',
                    'found "<token>"'
   !ErrorText.7.2 = 'SELECT on line <linenumber> requires WHEN, OTHERWISE,',
                    'or END; found "<token>"'
   !ErrorText.7.3 = 'All WHEN expressions of SELECT on line <linenumber> are',
                    'false; OTHERWISE expected'

   !ErrorText.8   = 'Unexpected THEN or ELSE'
   !ErrorText.8.1 = 'THEN has no corresponding IF or WHEN clause'
   !ErrorText.8.2 = 'ELSE has no corresponding THEN clause'

   !ErrorText.9   = 'Unexpected WHEN or OTHERWISE'
   !ErrorText.9.1 = 'WHEN has no corresponding SELECT'
   !ErrorText.9.2 = 'OTHERWISE has no corresponding SELECT'

   !ErrorText.10  = 'Unexpected or unmatched END'
   !ErrorText.10.1= 'END has no corresponding DO or SELECT'
   !ErrorText.10.2= 'END corresponding to DO on line <linenumber>',
                    'must have a symbol following that matches',
                    'the control variable (or no symbol);',
                    'found "<token>"'
   !ErrorText.10.3= 'END corresponding to DO on line <linenumber>',
                    'must not have a symbol following it because',
                    'there is no control variable;',
                    'found "<token>"'
   !ErrorText.10.4= 'END corresponding to SELECT on line <linenumber>',
                    'must not have a symbol following;',
                    'found "<token>"'
   !ErrorText.10.5= 'END must not immediately follow THEN'
   !ErrorText.10.6= 'END must not immediately follow ELSE'

   !ErrorText.13  = 'Invalid character in program'
   !ErrorText.13.1= 'Invalid character in program "<character>"',
                    "('<hex-encoding>'X)"

   !ErrorText.14  = 'Incomplete DO/SELECT/IF'
   !ErrorText.14.1= 'DO instruction requires a matching END'
   !ErrorText.14.2= 'SELECT instruction requires a matching END'
   !ErrorText.14.3= 'THEN requires a following instruction'
   !ErrorText.14.4= 'ELSE requires a following instruction'

   !ErrorText.15  = 'Invalid hexadecimal or binary string'
   !ErrorText.15.1= 'Invalid location of blank in position',
                    '<position> in hexadecimal string'
   !ErrorText.15.2= 'Invalid location of blank in position',
                    '<position> in binary string'
   !ErrorText.15.3= 'Only 0-9, a-f, A-F, and blank are valid in a',
                    'hexadecimal string; found "<char>"'
   !ErrorText.15.4= 'Only 0, 1, and blank are valid in a',
                    'binary string; found "<char>"'

   !ErrorText.16  = 'Label not found'
   !ErrorText.16.1= 'Label "<name>" not found'
   !ErrorText.16.2= 'Cannot SIGNAL to label "<name>" because it is',
                    'inside an IF, SELECT or DO group'
   !ErrorText.16.3= 'Cannot invoke label "<name>" because it is',
                    'inside an IF, SELECT or DO group'

   !ErrorText.17  = 'Unexpected PROCEDURE'
   !ErrorText.17.1= 'PROCEDURE is valid only when it is the first',
                    'instruction executed after an internal CALL',
                    'or function invocation'

   !ErrorText.18  = 'THEN expected'
   !ErrorText.18.1= 'IF keyword on line <linenumber> requires',
                    'matching THEN clause; found "<token>"'
   !ErrorText.18.2= 'WHEN keyword on line <linenumber> requires',
                    'matching THEN clause; found "<token>"'

   !ErrorText.19  = 'String or symbol expected'
   !ErrorText.19.1= 'String or symbol expected after ADDRESS keyword;',
                    'found "<token>"'
   !ErrorText.19.2= 'String or symbol expected after CALL keyword;',
                    'found "<token>"'
   !ErrorText.19.3= 'String or symbol expected after NAME keyword;',
                    'found "<token>"'
   !ErrorText.19.4= 'String or symbol expected after SIGNAL keyword;',
                    'found "<token>"'
   !ErrorText.19.6= 'String or symbol expected after TRACE keyword;',
                    'found "<token>"'
   !ErrorText.19.7= 'Symbol expected in parsing pattern;',
                    'found "<token>"'

   !ErrorText.20  = 'Name expected'
   !ErrorText.20.1= 'Name required; found "<token>"'
   !ErrorText.20.2= 'Found "<token>" where only a name is valid'

   !ErrorText.21  = 'Invalid data on end of clause'
   !ErrorText.21.1= 'The clause ended at an unexpected token;',
                         'found "<token>"'

   !ErrorText.22  = 'Invalid character string'
   !ErrorText.22.1= "Invalid character string '<hex-encoding>'X"

   !ErrorText.23  = 'Invalid data string'
   !ErrorText.23.1= "Invalid data string '<hex-encoding>'X"

   !ErrorText.24  = 'Invalid TRACE request'
   !ErrorText.24.1= 'TRACE request must be one character of',
                    '"ACEFILNOR"; found "<value>"'

   !ErrorText.25  = 'Invalid sub-keyword found'
   !ErrorText.25.1= 'CALL ON must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.2= 'CALL OFF must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.3= 'SIGNAL ON must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.4= 'SIGNAL OFF must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.5= 'ADDRESS WITH must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.6= 'INPUT must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.7= 'OUTPUT must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.8= 'APPEND must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.9= 'REPLACE must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.11='NUMERIC FORM must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.12='PARSE must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.13='UPPER must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.14='ERROR must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.15='NUMERIC must be followed by one of the',
                    'keywords <keywords>; found "<token>"'
   !ErrorText.25.16='FOREVER must be followed by one of the',
                    'keywords <keywords> or nothing; found "<token>"'
   !ErrorText.25.17='PROCEDURE must be followed by the keyword',
                    'EXPOSE or nothing; found "<token>"'

   !ErrorText.26  = 'Invalid whole number'
   !ErrorText.26.1= 'Whole numbers must fit within current DIGITS',
                    'setting(<value>); found "<value>"'
   !ErrorText.26.2= 'Value of repetition count expression in DO instruction',
                    'must be zero or a positive whole number;',
                    'found "<value>"'
   !ErrorText.26.3= 'Value of FOR expression in DO instruction',
                    'must be zero or a positive whole number;',
                    'found "<value>"'
   !ErrorText.26.4= 'Positional pattern of parsing template',
                    'must be a whole number; found "<value>"'
   !ErrorText.26.5= 'NUMERIC DIGITS value',
                    'must be a positive whole number; found "<value>"'
   !ErrorText.26.6= 'NUMERIC FUZZ value',
                    'must be zero or a positive whole number;',
                    'found "<value>"'
   !ErrorText.26.7= 'Number used in TRACE setting',
                    'must be a whole number; found "<value>"'
   !ErrorText.26.8= 'Operand to right of the power operator ("**")',
                    'must be a whole number; found "<value>"'
   !ErrorText.26.11='Result of <value> % <value> operation would need',
                    'exponential notation at current NUMERIC DIGITS <value>'
   !ErrorText.26.12='Result of % operation used for <value> // <value>',
                    'operation would need',
                    'exponential notation at current NUMERIC DIGITS <value>'

   !ErrorText.27  = 'Invalid DO syntax'
   !ErrorText.27.1= 'Invalid use of keyword <token> in DO clause'

   !ErrorText.28  = 'Invalid LEAVE or ITERATE'
   !ErrorText.28.1= 'LEAVE is valid only within a repetitive DO loop'
   !ErrorText.28.2= 'ITERATE is valid only within a repetitive DO loop'
   !ErrorText.28.3= 'Symbol following LEAVE ("<token>") must',
                    'either match control variable of a current',
                    'DO loop or be omitted'
   !ErrorText.28.4= 'Symbol following ITERATE ("<token>") must',
                    'either match control variable of a current',
                    'DO loop or be omitted'

   !ErrorText.29  = 'Environment name longer than',
                    !Limit_EnvironmentName 'characters'
   !ErrorText.29.1= 'Environment name exceeds',
                    !Limit_EnvironmentName 'characters "<name>"'

   !ErrorText.30  = 'Name or string too long'
   !ErrorText.30.1= 'Name exceeds' !Limit_Name 'characters'
   !ErrorText.30.2= 'Literal string exceeds' !Limit_Literal 'characters'

   !ErrorText.31  = 'Name starts with number or "."'
   !ErrorText.31.1= 'A value cannot be assigned to a number;',
                    'found "<token>"'
   !ErrorText.31.2= 'Variable symbol must not start with a number;',
                    'found "<token>"'
   !ErrorText.31.3= 'Variable symbol must not start with a ".";',
                    'found "<token>"'

   !ErrorText.33  = 'Invalid expression result'
   !ErrorText.33.1= 'Value of NUMERIC DIGITS ("<value>")',
                    'must exceed value of NUMERIC FUZZ "(<value>)"'
   !ErrorText.33.2= 'Value of NUMERIC DIGITS ("<value>")',
                    'must not exceed' !Limit_Digits
   !ErrorText.33.6= 'Result of expression following NUMERIC FORM',
                    'must start with "E" or "S"; found "<value>"'

   !ErrorText.34  = 'Logical value not "0" or "1"'
   !ErrorText.34.1= 'Value of expression following IF keyword',
                    'must be exactly "0" or "1"; found "<value>"'
   !ErrorText.34.2= 'Value of expression following WHEN keyword',
                    'must be exactly "0" or "1"; found "<value>"'
   !ErrorText.34.3= 'Value of expression following WHILE keyword',
                    'must be exactly "0" or "1"; found "<value>"'
   !ErrorText.34.4= 'Value of expression following UNTIL keyword',
                    'must be exactly "0" or "1"; found "<value>"'
   !ErrorText.34.5= 'Value of expression to left',
                    'of logical operator "<operator>"',
                    'must be exactly "0" or "1"; found "<value>"'
   !ErrorText.34.6= 'Value of expression to right',
                    'of logical operator "<operator>"',
                    'must be exactly "0" or "1"; found "<value>"'

   !ErrorText.35  = 'Invalid expression'
   !ErrorText.35.1= 'Invalid expression detected at "<token>"'

   !ErrorText.36  = 'Unmatched "(" in expression'

   !ErrorText.37  = 'Unexpected "," or ")"'
   !ErrorText.37.1= 'Unexpected ","'
   !ErrorText.37.2= 'Unmatched ")" in expression'

   !ErrorText.38  = 'Invalid template or pattern'
   !ErrorText.38.1= 'Invalid parsing template detected at "<token>"'
   !ErrorText.38.2= 'Invalid parsing position detected at "<token>"'
   !ErrorText.38.3= 'PARSE VALUE instruction requires WITH keyword'

   !ErrorText.40  = 'Incorrect call to routine'
   !ErrorText.40.1= 'External routine <name> failed'
   !ErrorText.40.3= 'Not enough arguments in invocation of <bif>;',
                    'minimum expected is <argnumber>'
   !ErrorText.40.4= 'Too many arguments in invocation of <bif>;',
                    'maximum expected is <argnumber>'
   !ErrorText.40.5= 'Missing argument in invocation of <bif>;',
                    'argument <argnumber> is required'
   !ErrorText.40.9= '<bif> argument <argnumber>',
                    'Exponent exceeds' !Limit_ExponentDigits 'digits'
   !ErrorText.40.11='<bif> argument <argnumber>',
                    'must be a number; found "<value>"'
   !ErrorText.40.12='<bif> argument <argnumber>',
                    'must be a whole number; found "<value>"'
   !ErrorText.40.13='<bif> argument <argnumber>',
                    'must be zero or positive; found "<value>"'
   !ErrorText.40.14='<bif> argument <argnumber>',
                    'must be positive; found "<value>"'
   !ErrorText.40.15='<bif> argument <argnumber>',
                    'must fit in <value> digits; found "<value>"'
   !ErrorText.40.16='<bif> argument <argnumber>',
                    'Requires a whole number fitting within',
                    'DIGITS(<value>); found "<value>"'
   !ErrorText.40.17='<bif> argument 1',
                    'must have an integer part in the range 0:90 and a',
                    'decimal part no larger than .9; found "<value>"'
   !ErrorText.40.18='<bif> conversion must',
                    'have a year in the range 0001 to 9999'
   !ErrorText.40.19='<bif> argument 2, "<value>", is not in the format',
                     'described by argument 3, "<value>"'
   !ErrorText.40.21='<bif> argument <argnumber> must not be null'
   !ErrorText.40.22='<bif> argument <argnumber>',
                    'must be a single character or null;',
                    'found "<value>"'
   !ErrorText.40.23='<bif> argument <argnumber>',
                    'must be a single character; found "<value>"'
   !ErrorText.40.24='<bif> argument 1',
                    'must be a binary string; found "<value>"'
   !ErrorText.40.25='<bif> argument 1',
                    'must be a hexadecimal string; found "<value>"'
   !ErrorText.40.26='<bif> argument 1',
                    'must be a valid symbol; found "<value>"'
   !ErrorText.40.27='<bif> argument 1',
                    'must be a valid stream name; found "<value>"'
   !ErrorText.40.28='<bif> argument <argnumber>',
                    'must start with one of "<optionslist>";',
                    'found "<value>"'
   !ErrorText.40.29='<bif> conversion to format "<value>" is not allowed'
   !ErrorText.40.31='<bif> argument 1 ("<value>") must not exceed 100000'
   !ErrorText.40.32='<bif> the difference between argument 1 ("<value>") and',
                    'argument 2 ("<value>") must not exceed 100000'
   !ErrorText.40.33='<bif> argument 1 ("<value>") must be less than',
                    'or equal to argument 2 ("<value>")'
   !ErrorText.40.34='<bif> argument 1 ("<value>") must be less than',
                    'or equal to the number of lines',
                    'in the program (<sourceline()>)'
   !ErrorText.40.35='<bif> argument 1 cannot be expressed as a whole number;',
                    'found "<value>"'
   !ErrorText.40.36='<bif> argument 1',
                    'must be the name of a variable in the pool;',
                    'found "<value>"'
   !ErrorText.40.37='<bif> argument 3',
                    'must be the name of a pool; found "<value>"'
   !ErrorText.40.38='<bif> argument <argnumber>',
                    'is not large enough to format "<value>"'
   !ErrorText.40.41='<bif> argument <argnumber>',
                    'must be within the bounds of the stream;',
                    'found "<value>"'
   !ErrorText.40.42='<bif> argument 3 is not zero or one; found "<value>"'

   !ErrorText.41  = 'Bad arithmetic conversion'
   !ErrorText.41.1= 'Non-numeric value ("<value>")',
                    'to left of arithmetic operation "<operator>"'
   !ErrorText.41.2= 'Non-numeric value ("<value>")',
                    'to right of arithmetic operation "<operator>"'
   !ErrorText.41.3= 'Non-numeric value ("<value>")',
                    'used with prefix operator "<operator>"'
   !ErrorText.41.4= 'Value of TO expression in DO instruction',
                    'must be numeric; found "<value>"'
   !ErrorText.41.5= 'Value of BY expression in DO instruction',
                    'must be numeric; found "<value>"'
   !ErrorText.41.6= 'Value of control variable expression of DO instruction',
                    'must be numeric; found "<value>"'
   !ErrorText.41.7= 'Exponent exceeds' !Limit_ExponentDigits 'digits;',
                    'found "<value>"'

   !ErrorText.42  = 'Arithmetic overflow/underflow'
   !ErrorText.42.1= 'Arithmetic overflow detected at',
                    '"<value> <operation> <value>";',
                    'exponent of result requires more than',
                    !Limit_ExponentDigits 'digits'
   !ErrorText.42.2= 'Arithmetic underflow detected at',
                    '"<value> <operation> <value>";',
                    'exponent of result requires more than',
                    !Limit_ExponentDigits 'digits'
   !ErrorText.42.3= 'Arithmetic overflow; divisor must not be zero'

   !ErrorText.43  = 'Routine not found'
   !ErrorText.43.1= 'Could not find routine "<name>"'

   !ErrorText.44  = 'Function did not return data'
   !ErrorText.44.1= 'No data returned from function "<name>"'

   !ErrorText.45  = 'No data specified on function RETURN'
   !ErrorText.45.1= 'Data expected on RETURN instruction because',
                    'routine "<name>" was called as a function'

   !ErrorText.46  = 'Invalid variable reference'
   !ErrorText.46.1= 'Extra token ("<token>") found in variable',
                    'reference; ")" expected'

   !ErrorText.47  = 'Unexpected label'
   !ErrorText.47.1= 'INTERPRET data must not contain labels;',
                    'found "<name>"'

   !ErrorText.48  = 'Failure in system service'
   !ErrorText.48.1= 'Failure in system service: <description>'

   !ErrorText.49  = 'Interpretation Error'
   !ErrorText.49.1= 'Interpretation Error: <description>'

   !ErrorText.50  = 'Unrecognized reserved symbol'
   !ErrorText.50.1= 'Unrecognized reserved symbol "<token>"'

   !ErrorText.51  = 'Invalid function name'
   !ErrorText.51.1= 'Unquoted function names must not end with a period;',
                    'found "<token>"'

   !ErrorText.52  = 'Result returned by <name> is longer than',
                    !Limit_String 'characters'

   !ErrorText.53  = 'Invalid option'
   !ErrorText.53.1= 'String or symbol or variable reference expected',
                    'after STREAM keyword; found "<token>"'
   !ErrorText.53.2= 'Symbol or variable reference expected',
                    'after STEM keyword; found "<token>"'
   !ErrorText.53.3= 'Argument to STEM must have one period,',
                    'as its last character; found "<name>"'
   !ErrorText.54  = 'Invalid STEM value'
   !ErrorText.54.1= 'For this STEM APPEND, the value of "<name>" must be a',
                    'count of lines; found: "<value>"'
    return 0


 /************************************************************************
 *.  Novalue/Syntax   (If this is reached, something wrong with ChipLind.)
 ************************************************************************/
 Novalue:
 Syntax:
    say sigl;trace ?r
    cond = condition('C')
    desc = condition('D')
    parse value sourceline(sigl) with label .
    say "Line" sigl":" cond "condition raised:" errorText(rc)"."
    say desc
    say sourceline(sigl)
    exit

 /***********************************************************************
 *.  !Raise
 ***********************************************************************/
 !Raise:
 /*      say sigl
    trace ?r
 */
    Cond     = arg(1)
    ErrorNumber = arg(2)
    Insert.1 = arg(3)
    Insert.2 = arg(4)
    Insert.3 = arg(5)
    Insert.4 = arg(6)

    Text = !ErrorText.ErrorNumber
    Expanded = ''
    do i = 1
       parse var Text Begin '<' Insert '>' +1 Text
       if Insert = '' then leave
       if length(Insert.i) > 50 then t=left(Insert.i,50)
                                else t=Insert.i
       Expanded = Expanded || Begin || t
    end

    Expanded = Expanded || Begin
    exit '$SYN$'ErrorNumber  Expanded

