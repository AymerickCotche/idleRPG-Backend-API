-- Deploy idlerpg:characterWithAll to pg

BEGIN;

CREATE VIEW character_with_all AS
    WITH char_att AS
                (SELECT character_attribute.id, character_attribute.value, character_attribute.character_id, attribute.name FROM character_attribute
                JOIN attribute ON attribute.id = character_attribute.attribute_id
                ),
                char_equ AS
                (WITH item_att AS
                    (SELECT item_attribute.id, item_attribute.value, item_attribute.item_id, attribute.name FROM item_attribute
                        LEFT JOIN attribute ON attribute.id = item_attribute.attribute_id 
                    )
                SELECT character_equipment.id, character_equipment.character_id, equipment_slot.id AS slot_id, equipment_slot.name AS slot_name, character_equipment.item_id, item.name AS item_name,
                jsonb_agg(DISTINCT to_jsonb(item_att) - 'item_id') AS attributes
                FROM character_equipment
                LEFT JOIN equipment_slot ON equipment_slot.id = character_equipment.equipment_slot_id
                LEFT JOIN item ON item.id = character_equipment.item_id
                LEFT JOIN item_att  ON item_att.item_id = item.id
                GROUP BY character_equipment.id, equipment_slot.id, item.name
                ),
                char_inv AS
                (WITH item_att AS
                    (SELECT item_attribute.id, item_attribute.value, item_attribute.item_id, attribute.name FROM item_attribute
                        JOIN attribute ON attribute.id = item_attribute.attribute_id 
                    )
                SELECT inventory.character_id, inventory.item_id, item.name, item.item_type_id AS type_id, item_type.name AS type_name, inventory.quantity,
                jsonb_agg(DISTINCT to_jsonb(item_att) - 'item_id') AS attributes
                FROM inventory
                LEFT JOIN item ON item.id = inventory.item_id
                JOIN item_type ON item_type.id = item.item_type_id
                JOIN item_att  ON item_att.item_id = item.id
                GROUP BY inventory.character_id, inventory.item_id, item.name, item.item_type_id, item_type.name
                ),
                char_job AS
                (SELECT job.id, job.name, character_job.character_id, character_job.exp,
                    (select min (level_job.level) AS level
                    from level_job
                    where level_job.exp_req >= character_job.exp)
                FROM character_job
                LEFT JOIN job ON job.id = character_job.job_id
                )
            SELECT character.*,
                (select min (level_character.level) AS level
                from level_character
                where level_character.exp_req >= character.exp),
                (select min (level_character.exp_req) AS exp_up
                from level_character
                where level_character.exp_req >= character.exp),
                jsonb_agg(DISTINCT to_jsonb(char_att) - 'character_id') AS attributes,
                jsonb_agg(DISTINCT to_jsonb(char_equ) - 'character_id') AS equipments,
                jsonb_agg(DISTINCT to_jsonb(char_inv) - 'character_id') AS inventory,
                jsonb_agg(DISTINCT to_jsonb(char_job) - 'character_id') AS jobs
            FROM character
            JOIN char_att  ON char_att .character_id = character.id
            JOIN char_equ ON char_equ.character_id = character.id
            JOIN char_inv ON char_inv.character_id = character.id
            JOIN char_job ON char_job.character_id = character.id
            GROUP BY character.id;

COMMIT;
