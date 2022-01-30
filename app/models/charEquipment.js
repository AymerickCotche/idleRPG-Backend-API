const db = require('../database');

class CharEquipment {

    constructor(obj={}) {
        for (const prop in obj) {
            this[prop] = obj[prop];
        }
    }
    async unequipItem() {
        try {
            await db.query('SELECT * FROM unequipItem($1, $2)', [this.itemId, this.characterId]);
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

    async equipItem() {
        try {
            await db.query('SELECT * FROM equipItem($1, $2)', [this.newItemId, this.characterId]);
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

    async checkEquipment() {
        try {
            const {rows} = await db.query('SELECT * FROM checkEquipment($1, $2)', [this.itemId, this.characterId]);
            return rows[0].checkequipment;
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

    async getOldItemId() {
        try {
            const {rows} = await db.query('SELECT * FROM getOldItemId($1, $2)', [this.itemId, this.characterId]);
            return rows[0].getolditemid;
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }
}

module.exports = CharEquipment;