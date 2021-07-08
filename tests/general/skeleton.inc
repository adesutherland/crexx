* cREXX Assembler Test Suite - Common

.globals=2
g0 .expose=tests.success
g1 .expose=tests.failure

main()         .locals=1
               say "cREXX Assembler Test Suite - Common - Version cREXX-Phase-0 v0.1.6-f0022\n"

               * Zero result count
               load g0,0
               load g1,0

               * Run Tests
               call test_seq()
               call test_sne()

               * Print Results
               iadd r0, g0, g1
               itos r0
               ssay r0
               say " tests run\n"
               brt failures, g1

               * No failures
               say "Success\n"
               ret 0

failures:      * There were failures
               itos g1
               say "*** "
               ssay g1
               say " tests failed ***\n"
               ret 1

expect_true()  .locals=0
               brt expect_true_ok,a1
               iadd g1,g1,1 * Failure
               say " FAILED\n"
               ret
expect_true_ok:
               iadd g0,g0,1 * Success
               say " ok\n"
               ret

expect_false() .locals=0
               brf expect_false_ok,a1
               iadd g1,g1,1 * Failure
               say " FAILED\n"
               ret
expect_false_ok:
               iadd g0,g0,1 * Success
               say " ok\n"
               ret
