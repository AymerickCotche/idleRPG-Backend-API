const db = require('../database');

class Entity {

    constructor(obj={}) {
        for (const prop in obj) {
            this[prop] = obj[prop];
        }
    }

    static async findAll() {
        try {
            const {rows} = await db.query('SELECT * FROM getAllEntities()');
            return rows.map(row => new Entity(row));
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }

}

module.exports = Entity;