const db = require('../database');

class Character {

    constructor(obj={}) {
        for (const prop in obj) {
            this[prop] = obj[prop];
        }
    }

    static async findOne() {
        try {
            const {rows} = await db.query('SELECT * FROM getCharacter($1);', [Number(this.id)]);
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
            const {rows} = await db.query('SELECT * FROM createCharacter($1, $2, $3)', [this.name, this.id, this.img_path])
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
}

module.exports = Character;