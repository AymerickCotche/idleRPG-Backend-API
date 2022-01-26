-- Revert idlerpg:functions from pg

BEGIN;

DROP FUNCTION getCharacter(user_id INT);

DROP FUNCTION createCharacter(name TEXT, user_id INT, img_path TEXT);

COMMIT;
