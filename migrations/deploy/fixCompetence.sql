-- Deploy idlerpg:fixCompetence to pg

BEGIN;

ALTER TABLE "competence"
  ALTER COLUMN increment_effect
  TYPE DECIMAL;

ALTER TABLE "competence"
  ALTER COLUMN increment_cost
  TYPE DECIMAL;

COMMIT;
