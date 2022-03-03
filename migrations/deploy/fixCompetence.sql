-- Deploy idlerpg:fixCompetence to pg

BEGIN;

ALTER TABLE "competence"
  ALTER COLUMN increment_effect
  TYPE DECIMAL;

COMMIT;
