DATADIR=${CURDIR}/sql
DB=shark_attack
CSV='${DATADIR}/attacks.csv'
BUILD=${DATADIR}/build.sql
MASTER=${DATADIR}/import.sql
NORMALIZE=${DATADIR}/normalize.sql

all: normalize
	psql $(DB) -f $(BUILD)

master: clean
	@cat $(MASTER) >> $(BUILD)

import: master
	@echo "COPY import.attacks FROM $(CSV) WITH DELIMITER ',' HEADER CSV;" >> $(BUILD)

normalize: import
	@cat $(NORMALIZE) >> $(BUILD)

clean:
	@rm -rf $(BUILD)