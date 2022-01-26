const db = require('../database');

class Item {

    constructor(obj={}) {
        for (const prop in obj) {
            this[prop] = obj[prop];
        }
    }

    static async findAll() {
        try {
            const {rows} = await db.query('SELECT * getAllItems()');
            return rows.map(row => new Item(row));
        } catch (error) {
            console.log(error);
            if (error.detail) {
                throw new Error(error.detail)
            }
            throw error
        }
    }
}

module.exports = Item;