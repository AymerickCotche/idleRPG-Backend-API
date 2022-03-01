const db = require('../database');

class Competence {
  constructor(obj = {}) {
    for (const prop in obj) {
      this[prop] = obj[prop];
    }
  }

  static async findAll() {
    try {
      const { rows } = await db.query('SELECT * FROM competence');
      if (rows) return rows.map((row) => new Competence(row));
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
      const { rows } = await db.query(
        'SELECT * FROM competence WHERE id=($1)',
        [id]
      );
      if (rows[0]) {
        return new Competence(rows[0]);
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

module.exports = Competence;
