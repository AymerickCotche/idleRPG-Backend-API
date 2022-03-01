const db = require('../database');

class Character {
  constructor(obj = {}) {
    for (const prop in obj) {
      this[prop] = obj[prop];
    }
  }

  static async findOne(id) {
    try {
      const { rows } = await db.query('SELECT * FROM getCharacter($1)', [id]);
      if (rows[0]) {
        return new Character(rows[0]);
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

  async create() {
    try {
      const { rows } = await db.query(
        'SELECT * FROM createCharacter($1, $2, $3)',
        [this.name, this.id, this.img_path]
      );
      this.id = rows[0].id;
      return this;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }

  async updateGold() {
    try {
      await db.query('UPDATE character SET gold = gold + $1 WHERE id = $2', [
        this.goldValue,
        this.characterId,
      ]);
      return null;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }

  async updateExp() {
    try {
      await db.query('UPDATE character SET exp = exp + $1 WHERE id = $2', [
        this.expValue,
        this.characterId,
      ]);
      return null;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }

  async updateNbFought() {
    try {
      await db.query(
        'UPDATE character SET nb_entity = nb_entity + 1 WHERE id = $1',
        [this.characterId]
      );
      return null;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }
  async updateNbMineral() {
    try {
      await db.query(
        'UPDATE character SET nb_mineral = nb_mineral + $1 WHERE id = $2',
        [this.quantity, this.characterId]
      );
      return null;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }
  async updateNbFish() {
    try {
      await db.query(
        'UPDATE character SET nb_fish = nb_fish + $1 WHERE id = $2',
        [this.quantity, this.characterId]
      );
      return null;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }
  async updateNbPurchase() {
    try {
      console.log('on est la');
      await db.query(
        'UPDATE character SET nb_purchase = nb_purchase + 1 WHERE id = $1',
        [this.characterId]
      );
      return null;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }
  async updateNbCraft() {
    try {
      await db.query(
        'UPDATE character SET nb_craft = nb_craft + 1 WHERE id = $1',
        [this.characterId]
      );
      return null;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }

  async getLevelCharacter() {
    try {
      const { rows } = await db.query('SELECT * FROM getLevelCharacter($1)', [
        this.characterId,
      ]);
      return rows[0];
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }

  async doRebirth() {
    try {
      await db.query('SELECT * FROM doRebirth($1, $2)', [
        this.characterId,
        this.nbFruit,
      ]);
      return null;
    } catch (error) {
      console.log(error);
      if (error.detail) {
        throw new Error(error.detail);
      }
      throw error;
    }
  }

  async learnCompetence() {
    try {
      await db.query('SELECT * FROM learnCompetence($1, $2, $3)', [
        this.characterId,
        this.competenceId,
        this.nbFruit,
      ]);
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

module.exports = Character;
