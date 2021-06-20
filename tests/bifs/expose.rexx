/* rexx
 * this procedure tests the expose lists feature
 * which was a later addition, not yet available
 * in Rexx 3.40
 */    
say 'exposetest v1'

aap = 'noot'
say testex1()
say testex2()
x= 'aap'
say testex3()
exit

testex1: procedure expose aap
return aap

testex2: procedure
return aap

testex3: procedure expose (x)
return aap