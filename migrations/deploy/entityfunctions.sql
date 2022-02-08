-- Deploy idlerpg:entityfunctions to pg

BEGIN;

CREATE OR REPLACE FUNCTION getAllEntities()
	RETURNS TABLE (
		"id" INT,
		"name" TEXT,
		"level" INT,
		"image_url" TEXT,
		"reward_exp" INT,
		"reward_gold" INT,
		"created_at" TIMESTAMPTZ,
		"updated_at" TIMESTAMPTZ,
		attributes JSONB,
		rewards_items JSONB
		)
		AS $$
		WITH entity_att AS
			(SELECT entity_attribute.id, entity_attribute.value, entity_attribute.entity_id, attribute.name AS attribute_name FROM entity_attribute
			JOIN attribute ON attribute.id = entity_attribute.attribute_id
			),
			rewards_items AS
			(WITH item_att AS
				(SELECT item_attribute.id, item_attribute.value, item_attribute.item_id, attribute.name FROM item_attribute
					JOIN attribute ON attribute.id = item_attribute.attribute_id 
				)
			SELECT entity_reward_item.id, entity_reward_item.quantity, entity_reward_item.entity_id, entity_reward_item.drop_rate, item.name AS item_name, item.id AS item_id, item_type.id AS item_type_id, item_type.name AS item_type_name, item.desc AS item_desc,
			jsonb_agg(DISTINCT to_jsonb(item_att) - 'item_id') AS attributes
			FROM entity_reward_item
			JOIN item ON item.id = entity_reward_item.item_id
			JOIN item_type ON item_type.id = item.item_type_id
			JOIN item_att  ON item_att.item_id = item.id
			 GROUP BY entity_reward_item.id, item.name, item.id, item_type.id
			)
		SELECT entity.*,
			jsonb_agg(DISTINCT to_jsonb(entity_att) - 'entity_id') AS attributes,
			jsonb_agg(DISTINCT to_jsonb(rewards_items) - 'entity_id') AS rewards_items
		FROM entity
		JOIN entity_att ON entity_att.entity_id = entity.id
		JOIN rewards_items ON rewards_items.entity_id = entity.id
		GROUP BY entity.id
	$$
LANGUAGE sql;

COMMIT;
