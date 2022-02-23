const db = require('../database');

class CharSuccess {
  constructor(obj = {}) {
    for (const prop in obj) {
      this[prop] = obj[prop];
    }
  }
  static async findAll() {
    try {
      const { rows } = await db.query('SELECT * FROM character_success');
      if (rows) return rows.map((row) => new CharSuccess(row));
      return null;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }

  static async findOne(characterId, successId) {
    try {
      const { rows } = await db.query(
        'SELECT * FROM character_success where character_id=$1 AND success_id=$2',
        [characterId, successId]
      );
      if (rows[0]) {
        return new CharSuccess(rows[0]);
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

  async add() {
    try {
      const { rows } = await db.query(
        'INSERT INTO "character_success"(character_id, success_id) VALUES($1, $2)',
        [this.characterId, this.successId]
      );
      return this;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }
}

module.exports = CharSuccess;
