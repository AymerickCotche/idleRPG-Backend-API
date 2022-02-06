-- Deploy idlerpg:entityWithAll to pg

BEGIN;

CREATE OR REPLACE VIEW entity_wit_all AS
    WITH entity_att AS
                (SELECT entity_attribute.id, entity_attribute.value, entity_attribute.entity_id, attribute.name AS attribute_name FROM entity_attribute
                JOIN attribute ON attribute.id = entity_attribute.attribute_id
                ),
                rewards_items AS
                (SELECT entity_reward_item.id, entity_reward_item.quantity, entity_reward_item.entity_id, entity_reward_item.drop_rate, item.name AS item_name, item.id AS item_id, item_type.id AS item_type_id, item_type.name AS item_type_name  FROM entity_reward_item
                JOIN item ON item.id = entity_reward_item.item_id
                JOIN item_type ON item_type.id = item.item_type_id
                )
            SELECT entity.*,
                jsonb_agg(DISTINCT to_jsonb(entity_att) - 'entity_id') AS attributes,
                jsonb_agg(DISTINCT to_jsonb(rewards_items) - 'entity_id') AS rewards_items
            FROM entity
            JOIN entity_att ON entity_att.entity_id = entity.id
            JOIN rewards_items ON rewards_items.entity_id = entity.id
            GROUP BY entity.id;
COMMIT;
