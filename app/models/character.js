const db = require('../database');

class Character {

    constructor(obj={}) {
        for (const prop in obj) {
            this[prop] = obj[prop];
        }
    }

    static async findOne(id) {
        try {
            const {rows} = await db.query('SELECT * FROM getCharacter($1)', [id]);
            if (rows[0]) {
                return new Character(rows[0]);
            }
            return null;
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

    async create() {
        try {
            const {rows} = await db.query('SELECT * FROM createTestCharacter($1, $2, $3)', [this.name, this.id, this.img_path])
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

    async updateGold() {
        try {
            await db.query('UPDATE character SET gold = gold + $1 WHERE id = $2', [this.goldValue, this.characterId]);
            return null;
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

    async updateExp() {
        try {
            await db.query('UPDATE character SET exp = exp + $1 WHERE id = $2', [this.expValue, this.characterId]);
            return null;
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

    async updateLastFought() {
        try {
            await db.query('UPDATE character SET last_entity_fought = last_entity_fought + 1 WHERE id = $1', [this.characterId]);
            return null;
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

    async getLevelCharacter() {
        try {
            const {rows} = await db.query('SELECT * FROM getLevelCharacter($1)', [this.characterId]);
            return rows[0];
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

}

module.exports = Character;