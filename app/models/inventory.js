const db = require('../database');

class Inventory {

    constructor(obj={}) {
        for (const prop in obj) {
            this[prop] = obj[prop];
        }
    }
    async checkExists() {
        try {
            const {rows} = await db.query('SELECT EXISTS(SELECT 1 FROM inventory WHERE character_id = $1 AND item_id = $2)', [this.characterId, this.itemId]);
            return rows[0].exists;
    } catch (error) {
        console.log(error);
        if (error.detail) {
            throw new Error(error.detail)
        }
        throw error
    }
    }

    async save(exists) {
        try {
            if (exists) {
                // Si l'enregistrement existe en base on update la quantité
                await db.query('SELECT * FROM update_inventory($1, $2, $3)', [this.characterId, this.itemId, this.quantity])
            } else {
                const {rows} = await db.query('SELECT * FROM add_inventory($1, $2, $3)', [this.characterId, this.itemId, this.quantity])
                this.id = rows[0].id;
                return this;
            }
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }


    async addItem() {
        try {
            const {rows} = await db.query('INSERT INTO "inventory"(character_id, item_id) VALUES($1, $2) RETURNING id', [this.character_id, this.item_id]);
            this.id = rows[0].id;
            return this;

        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

    async removeItem() {
        try {
            await db.query('DELETE FROM "inventory" WHERE character_id = $1 AND inventory.id = $2', [this.character_id, this.id]);
            return;

        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

    async updateComponent() {
        try {
            return await db.query('SELECT * FROM update_inventory($1, $2, $3)', [this.characterId, this.componentId, this.componentQuantity]);
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }
}

module.exports = Inventory;