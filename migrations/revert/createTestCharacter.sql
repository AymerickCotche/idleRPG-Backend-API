-- Revert idlerpg:createTestCharacter from pg

BEGIN;

DROP FUNCTION createTestCharacter(name TEXT, user_id INT, img_path TEXT);

COMMIT;
