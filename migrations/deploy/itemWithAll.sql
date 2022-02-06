-- Deploy idlerpg:itemWithAll to pg

BEGIN;

CREATE OR REPLACE VIEW item_with_all AS
WITH craft_plan AS
			(SELECT craft_plan.id, item.name, craft_plan.quantity, craft_item.item_id, craft_plan.component_id AS component_id FROM craft_item
				JOIN craft_plan ON craft_item.craft_plan_id = craft_plan.id
				JOIN item ON item.id = craft_plan.component_id
			),
			item_att AS
			(SELECT item_attribute.id, item_attribute.value, item_attribute.item_id, attribute.name FROM item_attribute
				JOIN attribute ON attribute.id = item_attribute.attribute_id 
			)
			SELECT item.*, item_type.name AS type,
			jsonb_agg(DISTINCT to_jsonb(craft_plan) - 'img_path' - 'item_id') AS ingredients,
			jsonb_agg(DISTINCT to_jsonb(item_att) - 'item_id') AS attributes
			FROM item
			JOIN item_type ON item.item_type_id = item_type.id
			JOIN item_att  ON item_att.item_id = item.id
			LEFT JOIN craft_plan  ON craft_plan.item_id = item.id
			GROUP BY item.id, item_type.name;

COMMIT;
