 /************************************************************************
 *.  W O R D   9.3.23
 ************************************************************************/
 call CheckArgs 'rANY rWHOLE>0'
 
 return subword(!Bif_Arg.1, !Bif_Arg.2, 1)