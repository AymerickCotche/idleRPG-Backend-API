-- Verify idlerpg:entityfunctions on pg

BEGIN;

SELECT * FROM entity_wit_all where false;

ROLLBACK;
