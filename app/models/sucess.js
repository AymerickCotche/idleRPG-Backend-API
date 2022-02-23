const db = require('../database');

class Sucess {
  constructor(obj = {}) {
    for (const prop in obj) {
      this[prop] = obj[prop];
    }
  }
  static async findAll() {
    try {
      const { rows } = await db.query('SELECT * FROM success');
      if (rows) return rows.map((row) => new Sucess(row));
      return null;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }

  static async findOne(id) {
    try {
      const { rows } = await db.query('SELECT * FROM success where id=$1', [
        id,
      ]);
      if (rows[0]) {
        return new Sucess(rows[0]);
      }
      return null;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }
}

module.exports = Sucess;
