-- Verify idlerpg:itemWithAll on pg

BEGIN;

SELECT * FROM item_with_all WHERE false;	

ROLLBACK;
