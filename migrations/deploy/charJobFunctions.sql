-- Deploy idlerpg:charJobFunctions to pg

BEGIN;

CREATE OR REPLACE FUNCTION getJobLevelCharacter(id_character INT, id_job INT)
	RETURNS INT
		AS $$
		SELECT
			(select min (level_job.level) AS level
			from level_job
			where level_job.exp_req >= character_job.exp)
			FROM character_job
			LEFT JOIN job ON job.id = character_job.job_id
			WHERE character_id = id_character
			AND job.id = id_job
		$$
LANGUAGE sql;

COMMIT;
