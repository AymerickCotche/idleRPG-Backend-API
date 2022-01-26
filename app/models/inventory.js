const db = require('../database');

class Inventory {

    constructor(obj={}) {
        for (const prop in obj) {
            this[prop] = obj[prop];
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
}

module.exports = Inventory;