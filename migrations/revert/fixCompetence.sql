-- Revert idlerpg:fixCompetence from pg

BEGIN;

ALTER TABLE "competence"
  ALTER COLUMN increment_effect
  SET TYPE INT;

COMMIT;
