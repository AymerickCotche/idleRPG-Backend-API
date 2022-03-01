const db = require('../database');

class CharCompetence {
  constructor(obj = {}) {
    for (const prop in obj) {
      this[prop] = obj[prop];
    }
  }

  static async findAll() {
    try {
      const { rows } = await db.query('SELECT * FROM character_competence');
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
  static async findAllByCharacterId(id) {
    try {
      const { rows } = await db.query(
        'SELECT * FROM character_competence WHERE character_id=$1',
        [id]
      );
      return rows;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }
}

module.exports = CharCompetence;
