rm *ucdb
make cli TEST_SEED=11 BATCH_DO_COMMANDS='-do "set NoQuitOnFinish 1; run -a; coverage attribute -name TESTNAME -value $(TEST_NAME).$(TEST_SEED); coverage save $(TEST_NAME).$(TEST_SEED).ucdb; quit -f"'
make run_cli TEST_SEED=211 BATCH_DO_COMMANDS='-do "set NoQuitOnFinish 1; run -a; coverage attribute -name TESTNAME -value $(TEST_NAME).$(TEST_SEED); coverage save $(TEST_NAME).$(TEST_SEED).ucdb; quit -f"'
make merge_coverage
