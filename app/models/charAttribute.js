const db = require('../database');

class CharAttribute {

    constructor(obj={}) {
        for (const prop in obj) {
            this[prop] = obj[prop];
        }
    }

    async updateIncrement() {
        try {
            await db.query('SELECT * FROM updateAttribute($1, $2, $3)', [Number(this.attributeId), Number(this.characterId), Number(this.quantity)]);
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

    async updateHp() {
        try {
            await db.query('SELECT * FROM updateHp($1, $2)', [Number(this.characterId), Number(this.newHp)]);
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

    async augmentHp() {
        try {
            await db.query('SELECT * FROM updateAttribute(11, $1, $2)', [Number(this.characterId), Number(this.plusHp)]);
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