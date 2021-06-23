 /**/
say date('S',0,'B')
say GoodDate(3652059,'B')
say date('S',3652058,'B')
say date('B',"99991231",'S')
say date('B',"00010101",'S')
say GoodDate("00001231",'S')
say '0 seconds is' TIME('C',0,'S')
say GoodTime(-1,'S')
say '3600*24-1 seconds is' TIME('C',3600*24-1,'S')
say GoodTime(3600*24,'S')
say '0 seconds is' TIME('C',0,'S')
say '60 seconds is' TIME('C',60,'S')
say '3600*12-60 seconds is' TIME('C',3600*12-60,'S')
say '3600*12 seconds is' TIME('C',3600*12,'S')
say '3600*12+60 seconds is' TIME('C',3600*12+60,'S')
say '3600*24-60 seconds is' TIME('C',3600*24-60,'S')
if GoodTime(1,'S') then nop;else say "Bad 0 using GoodTime"
if GoodTime(-1,'S') then say "Bad 1 using GoodTime"
if GoodDate("19890827",'S') then nop;else say "Bad 0 using GoodDate"
if GoodDate("19890837",'S') then say "Bad 1 using GoodDate"
if 'TIME'() == time() then nop;else say "Bad using time()"
parse version v .
if v="OBJREXX" then do
  do j=1 to 6
    InLet=substr("CHLMNS",j,1)
    t='TIME'(InLet)
    do k=1 to 6
    OutLet=substr("CHLMNS",k,1)
    if 'TIME'(OutLet,t,Inlet) == time(OutLet,t,InLet) then nop;else
       say "Bad time" InLet "convert" OutLet
    end k
  end j
  t=0;InLet='S'
  do k=1 to 6
    OutLet=substr("CHLMNS",k,1)
    if 'TIME'(OutLet,t,Inlet) == time(OutLet,t,InLet) then nop;else
     say "Bad time 0" InLet "convert" OutLet
  end k
  t=3600*24-1;InLet='S'
  do k=1 to 6
    OutLet=substr("CHLMNS",k,1)
    if 'TIME'(OutLet,t,Inlet) == time(OutLet,t,InLet) then nop;else
     say "Bad time Max" InLet "convert" OutLet
  end k
  if 'DATE'() == date() then nop;else say "Bad using date()"
  do j=1 to 6
  /* Had to take D out because OOREXX won't take it. */
    InLet=substr("BENOSU",j,1)
    t='DATE'(InLet)
    do k=1 to 7
    OutLet=substr("BDENOSU",k,1)
    if 'DATE'(OutLet,t,Inlet) == date(OutLet,t,InLet) then nop;else
     say "Bad date" InLet "convert" OutLet
    end k
  end j
  t="00010101";InLet='S'
  do k=1 to 6
   /* Take 'S' out because of OOREXX bug. */
    OutLet=substr("BDENOU",k,1)
    if 'DATE'(OutLet,t,Inlet) == date(OutLet,t,InLet) then nop;else
     say "Bad date 0" InLet "convert" OutLet
  end k
  t="99991231";InLet='S'
  do k=1 to 7
    OutLet=substr("BDENOSU",k,1)
    if 'DATE'(OutLet,t,Inlet) == date(OutLet,t,InLet) then nop;else
     say "Bad date Max" InLet "convert" OutLet
  end k
end /* ObjRexx comparisons. */
/* Sparse test of separators */
 if date('S',"99991231",'S','-') == "9999-12-31" then nop;else signal error
 if date('S',"99991231",'S',' ','') == "9999 12 31" then nop;else signal error
 if date('S',"9999 12 31",'S','',' ') == "99991231" then nop;else signal error
 if date('S',"9999-12-31",'S','','-') == "99991231" then nop;else signal error
 if date('B',"9999-12-31",'S',  ,'-') == "3652058" then nop;else signal error
 signal on syntax name toolong
 date('S',"99991231",'S','--')
toolong:
 signal on syntax name alphan
 date('S',"99991231",'S','x')
alphan:
 signal on syntax name nosep
 date('B',"9999-12-31",'S','','-')
nosep:
  say 'Done'
return


Time: procedure
/* This routine is essentially the code from the standard, put in
stand-alone form.  The only 'tricky bit' is that there is no Rexx way
for it to fail with the same error codes as a "real" implementation
would.  It can however give a SYNTAX error, albeit not the desirable
one.  This causing of an error is done by returning with no value.
Since the routine will have been called as a function, this produces
an error. */
/* Backslash is avoided as some systems don't handle that negation sign. */
  if arg()>3 then return
  numeric digits 18
  if arg(1,'E') then
    if pos(translate(left(arg(1),1)),"CEHLMNRS")=0 then return
  /* (The standard would also allow 'O' but what this code is running
  on would not.) */
  if arg(3,'E') then
    if pos(translate(left(arg(3),1)),"CHLMNS")=0 then return
  /* If the third argument is given then the second is mandatory. */
  if arg(3,'E') & arg(2,'E')=0 then return
  /* Default the first argument. */
  if arg(1,'E') then Option = translate(left(arg(1),1))
                else Option = 'N'
  /* If there is no second argument, the current time is returned. */
  if arg(2,'E') = 0 then if arg(1,'E') then return 'TIME'(arg(1))
                                       else return 'TIME'()
  /* One cannot convert to elapsed times. */
  if pos(Option, 'ERO') > 0 then return
  InValue = arg(2)
  if arg(3,'E') then InOption = arg(3)
                else InOption = 'N'
  HH = 0
  MM = 0
  SS = 0
  HourAdjust = 0
  select
    when InOption == 'C' then do
      parse var InValue HH ':' . +1 MM +2 XX
      if HH=12 then HH=0
      if XX == 'pm' then HourAdjust = 12
      end
    when InOption == 'H' then HH = InValue
    when InOption == 'L' | InOption == 'N' then
      parse var InValue HH ':' MM ':' SS
    when InOption == 'M' then MM = InValue
    otherwise SS = InValue
    end
  if datatype(HH,'W')=0 | datatype(MM,'W')=0 | datatype(SS,'N')=0 then
    return
  HH = HH + HourAdjust
  /* Convert to microseconds */
  Micro = trunc((((HH * 60) + MM) * 60 + SS) * 1000000)
  /* There is no special message for time-out-of-range; the bad-format
  message is used. */
  if Micro<0 | Micro > 24*3600*1000000 then return
  /* Reconvert to further check the original. */
  if TimeFormat(Micro,InOption) == InValue then
    return TimeFormat(Micro, Option)
  return

TimeFormat:procedure
  /* Convert from microseconds to given format. */
  /* The day will be irrelevant; actually it will be the first day possible. */
  x = Time2Date2(arg(1))
  parse value x with,
       Year Month Day Hour Minute Second Microsecond Base Days
  select
    when arg(2) == 'C' then
       select
         when Hour>12 then return Hour-12':'right(Minute,2,'0')'pm'
         when Hour=12 then return '12:'right(Minute,2,'0')'pm'
         when Hour>0  then return Hour':'right(Minute,2,'0')'am'
         when Hour=0  then return '12:'right(Minute,2,'0')'am'
         end
    when arg(2) == 'H' then return Hour
    when arg(2) == 'L' then
       return right(Hour,2,'0')':'right(Minute,2,'0')':'right(Second,2,'0'),
         || '.'right(Microsecond,6,'0')
    when arg(2) == 'M' then return 60*Hour+Minute
    when arg(2) == 'N' then
       return right(Hour,2,'0')':'right(Minute,2,'0')':'right(Second,2,'0')
    otherwise /* arg(2) == 'S' */
      return 3600*Hour+60*Minute+Second
    end

Time2Date:
   /* These are checks on the range of the date. */
   if arg(1) < 0 then
     return 'Bad'
   if arg(1) >= 315537897600000000 then
     return 'Bad'
   return Time2Date2(arg(1))

Time2Date2:Procedure
   /*  Convert a timestamp to a date.
   Argument is a timestamp (the number of microseconds relative to
   0001 01 01 00:00:00.000000)
   Returns a date in the form
     year month day hour minute second microsecond base days     */
   /* Argument is relative to the virtual date 0001 01 01 00:00:00.000000 */
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

return Year Month Day Hour Minute Second Microsecond BaseDays YearDays

Leap: procedure
   /* Return 1 if the year given as argument is a leap year, or 0
   otherwise. */
   return (arg(1)//4 = 0) & ((arg(1)//100 <> 0) | (arg(1)//400 = 0))

date:procedure
  /* cf commentary on TIME. */
  if arg() > 5 then return
  numeric digits 18
  if arg(1,'E') then
    if pos(translate(left(arg(1),1)),"BDEMNOSUW")=0 then return
  if arg(3,'E') then
    if pos(translate(left(arg(3),1)),"BDENOSU")=0 then return
  /* If the third argument is given then the second is mandatory. */
  if arg(3,'E') & arg(2,'E')=0 then return
  /* Default the first argument. */
  if arg(1,'E') then Option = translate(left(arg(1),1))
                else Option = 'N'
  /* If there is no second argument, the current time is returned. */
  if arg() <= 1 then if arg(1,'E') then return 'DATE'(arg(1))
                                   else return 'DATE'()
  if arg(3,'E') then InOption = arg(3)
                else InOption = 'N'
/* In September 97 the standardizing committee decided how DATE should
be extended to generalize the separators used. */
  if Option == 'S' then OutSeparator = ''
                   else OutSeparator = translate(Option,"xx/x //x","BDEMNOUW")
  if arg(4,'E') then do
/* The text for the following error 40.46 is '<bif> argument <argnumber>,
"<value>", is a format incompatible with separator specified in argument
<argnumber>'
*/
    if OutSeparator == 'x' then return
    OutSeparator = arg(4)
/* The text for the following error 40.45 is '<bif> argument <argnumber>
must be a single non-alphanumeric character or the null string; found <value>"'
*/
    if length(OutSeparator) > 1 | datatype(OutSeparator,'A') then return
    end
  if InOption == 'S' then InSeparator = ''
                     else InSeparator = translate(InOption,"xx/ //","BDENOU")
  if arg(5,'E') then do
    if InSeparator == 'x' then return
    InSeparator = arg(5)
    if length(InSeparator) > 1 | datatype(InSeparator,'A') then return
    end

  /* English spellings are used, even if messages not in English are
used. */
  Months = 'January February March April May June July',
           'August September October November December'
  WeekDays = 'Monday Tuesday Wednesday Thursday Friday Saturday Sunday'

  Value = arg(2)
  /* First try for Year Month Day */
  Logic = 'NS'
  select
    when InOption == 'N' then do
      if InSeparator == '' then do
          if length(Value)<8 then return
          Year = right(Value,4)
          MonthIs = substr(right(Value,7),1,3)
          Day = left(Value,length(Value)-7)
          end
      else parse var Value Day (InSeparator) MonthIs (InSeparator) Year
      do Month = 1 to 12
        if left(word(Months, Month), 3) == MonthIs then leave
        end Month
      end
    when InOption == 'S' then
      if InSeparator == '' then parse var Value Year +4 Month +2 Day
      else parse var Value Year (InSeparator) Month (InSeparator) Day
    otherwise Logic = 'EOU' /* or BD */
    end
  /* Next try for year without century */
  if logic = 'EOU' then
    Select
      when InOption == 'E' then
        if InSeparator == '' then parse var Value Day +3 Month +3 YY
        else parse var Value Day (InSeparator) Month (InSeparator) YY
      when InOption == 'O' then
        if InSeparator == '' then parse var Value YY +3 Month +3 Day
        else parse var Value YY (InSeparator) Month (InSeparator) Day
      when InOption == 'U' then
        if InSeparator == '' then parse var Value Month +3 Day +3 YY
        else parse var Value Month (InSeparator) Day (InSeparator) YY
      otherwise Logic = 'BD'
      end
  if Logic = 'EOU' then do
    /* The century is assumed, on the basis of the current year. */
    if datatype(YY,'W')=0 then return
    YearNow = left('DATE'('S'),4)
    Year = YY
    do while Year < YearNow-50
      Year = Year + 100
      end
    end /* Century assumption */
  if Logic <> 'BD' then do
    /* Convert Month & Day to Days of year. */
    if datatype(Month,'W')=0 | datatype(Day,'W')=0 | datatype(Year,'W')=0 then
       return
    Days = word('0 31 59 90 120 151 181 212 243 273 304 334',Month) +,
      (Month>2)*Leap(Year) + Day-1
    end
  else
    if datatype(Value,'W')=0 then return
  if InOption == 'D' then do
    Year = left('DATE'('S'),4)
    Days = Value - 1 /* 'D' includes current day */
    end
  /* Convert to BaseDays */
  if InOption <> 'B' then
    BaseDays = (Year-1)*365 + (Year-1)%4 - (Year-1)%100 + (Year-1)%400,
               + Days
  else Basedays = Value
  /* Convert to microseconds from 0001 */
  Micro = BaseDays * 86400 * 1000000
  /* Reconvert to check the original. (eg for Month = 99) */
  if DateFormat(Micro,InOption,InSeparator) == Value then
    return DateFormat(Micro,Option,OutSeparator)
  return
DateFormat:
    /* Convert from microseconds to given format and separator. */
  x = Time2Date(arg(1))
  if x='Bad' then return 'Bad'
  parse value x with,
       Year Month Day Hour Minute Second Microsecond Base Days
  select
    when arg(2) == 'B' then
      return Base
    when arg(2) == 'D' then
      return Days
    when arg(2) == 'E' then return,
      right(Day,2,'0')(arg(3))right(Month,2,'0')(arg(3))right(Year,2,'0')
    when arg(2) == 'M' then
      return word(Months,Month)
    when arg(2) == 'N' then
      return Day left(word(Months,Month),3) right(Year,4,'0')
    when arg(2) == 'O' then return,
      right(Year,2,'0')(arg(3))right(Month,2,'0')(arg(3))right(Day,2,'0')
    when arg(2) == 'S' then return,
      right(Year,4,'0')(arg(3))right(Month,2,'0')(arg(3))right(Day,2,'0')
    when arg(2) == 'U' then return,
      right(Month,2,'0')(arg(3))right(Day,2,'0')(arg(3))right(Year,2,'0')
    otherwise /* arg(2) == 'W' */
      return word(Weekdays,1+Base//7)
    end

/* It must be a variant of Murphy's law that if you write some code that
others might use it turns out that the code depends on something that
different interpreters treat differently.  In this particular case,
interpreters differ on whether the error of a function failing to
return a result is an error that the level calling the function sees,
or an error that the function itself sees. */

GoodDate: procedure
 signal on syntax name Better_Be_Unique1
 /* Next two clauses are deliberately on the same line. */
 GoodDateSigl = RecordSigl();GoodDateResult = date(arg(2),arg(1),arg(2))
 if GoodDateResult='*' then return 0
 return 1
Better_Be_Unique1:
 if sigl==GoodDateSigl then
   /* This code being run by interpreter that raises error in the caller */
   return 0
   /* This code being run by interpreter that raises error in the callee */
 return '*'

RecordSigl:return sigl

GoodTime: procedure
 signal on syntax name Better_Be_Unique2
 /* Next two clauses are deliberately on the same line. */
 GoodTimeSigl = RecordSigl();GoodTimeResult = time(arg(2),arg(1),arg(2))
 if GoodTimeResult='*' then return 0
 return 1
Better_Be_Unique2:
 if sigl==GoodTimeSigl then
   /* This code being run by interpreter that raises error in the caller */
   return 0
   /* This code being run by interpreter that raises error in the callee */
 return '*'
