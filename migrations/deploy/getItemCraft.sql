-- Deploy idlerpg:get_item_craft to pg

BEGIN;

CREATE OR REPLACE FUNCTION getItemCraft()
	RETURNS TABLE (
		id INT,
		name TEXT,
		item_type_id INT,
		img_path TEXT,
		created_at TIMESTAMPTZ,
		updated_at TIMESTAMPTZ,
		type INT,
		ingredients JSONB
		)
		AS $$
			WITH craft_plan AS
			(SELECT craft_plan.id, item.name, craft_plan.quantity, craft_item.item_id FROM craft_item
				JOIN craft_plan ON craft_item.craft_plan_id = craft_plan.id
				JOIN item ON item.id = craft_plan.component_id
			)
			SELECT item.*, item_type_id AS type,
			jsonb_agg(DISTINCT to_jsonb(craft_plan) - 'img_path') AS ingredients
			FROM item
			JOIN item_type ON item.item_type_id = item_type.id
			JOIN craft_plan  ON craft_plan.item_id = item.id
			GROUP BY item.id
		$$
LANGUAGE sql;

COMMIT;
