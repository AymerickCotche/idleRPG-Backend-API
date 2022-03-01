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
        `SELECT competence.id, competence.name, competence.desc, competence.effect, competence.increment_effect, competence.effect_type, competence.effect_stat, competence.cost, competence.increment_cost, character_competence.character_id, character_competence.level AS level_competence
        FROM character_competence
        LEFT JOIN competence ON competence.id = character_competence.competence_id
        WHERE character_id=$1`,
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
