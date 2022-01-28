const db = require('../database');

class CharAttribute {

    constructor(obj={}) {
        for (const prop in obj) {
            this[prop] = obj[prop];
        }
    }

    async updateIncrement() {
        try {
            await db.query('SELECT * FROM updateAttribute($1, $2)', [Number(this.attributeId), Number(this.characterId)]);
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }
}

module.exports = CharAttribute;