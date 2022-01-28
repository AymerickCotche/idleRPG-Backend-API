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
            await db.query('SELECT * FROM updateEquipment($1, $2, $3)', [Number(this.itemId), Number(this.inventoryId), Number(this.characterId)]);
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