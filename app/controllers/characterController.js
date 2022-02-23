const Character = require('../models/character');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {
  async findOne(request, response) {
    try {
      const user = response.locals.user;
      const items = response.locals.items;
      const entities = response.locals.entities;
      const allSuccess = response.locals.allSuccess;
      let id;
      if (user) id = Number(user.id);
      if (request.userId) id = request.userId;
      const character = await Character.findOne(id);
      if (!character)
        return response
          .status(404)
          .json(`No character found for the user with id ${id}`);
      const token = jwt.makeToken(id);
      response.setHeader('Authorization', token);
      await dbCache.set('user-0' + id, token, { EX: 4 * 60 * 60, NX: false });
      response
        .status(200)
        .json({ user, character, items, entities, allSuccess });
    } catch (error) {
      console.log(error);
      response.status(500).json(error.message);
    }
  },

  async create(request, response) {
    try {
      const user = response.locals.user;
      const items = response.locals.items;
      const entities = response.locals.entities;
      const character = await new Character(request.body).create();
      const token = jwt.makeToken(request.userId);
      response.setHeader('Authorization', jwt.makeToken(request.userId));
      await dbCache.set('user-0' + request.userId, token, {
        EX: 4 * 60 * 60,
        NX: false,
      });
      response.status(201).json({ user, character, items, entities });
    } catch (error) {
      console.log(error);
      response.status(500).json(error.message);
    }
  },

  async updateGold(request, response, next) {
    try {
      const character = await new Character(request.body).updateGold();
      next();
    } catch (error) {
      console.log(error);
      response.status(500).json(error.message);
    }
  },

  async updateExp(request, response, next) {
    try {
      await new Character(request.body).updateExp();
      next();
    } catch (error) {
      console.log(error);
      response.status(500).json(error.message);
    }
  },

  async updateNbFought(request, response, next) {
    try {
      await new Character(request.body).updateNbFought();
      next();
    } catch (error) {
      console.log(error);
      response.status(500).json(error.message);
    }
  },

  async updateNbPurchase(request, response, next) {
    try {
      await new Character(request.body).updateNbPurchase();
      next();
    } catch (error) {
      console.log(error);
      response.status(500).json(error.message);
    }
  },

  async updateNbCraft(request, response, next) {
    try {
      await new Character(request.body).updateNbCraft();
      next();
    } catch (error) {
      console.log(error);
      response.status(500).json(error.message);
    }
  },

  async getLevelCharacter(request, response, next) {
    try {
      if (request.body.hasLoot === false) {
        const level = await new Character(request.body).getLevelCharacter();
        const token = jwt.makeToken(request.userId);
        response.setHeader('Authorization', jwt.makeToken(request.userId));
        await dbCache.set('user-0' + request.userId, token, {
          EX: 4 * 60 * 60,
          NX: false,
        });
        return response.status(200).json(level);
      }
      const level = await new Character(request.body).getLevelCharacter();
      response.locals.characterLevel = level;
      next();
    } catch (error) {
      console.log(error);
      response.status(500).json(error.message);
    }
  },

  async updateNbJob(request, response, next) {
    try {
      if (request.body.jobId === 1) {
        await new Character(request.body).updateNbMineral();
        next();
      } else if (request.body.jobId === 2) {
        await new Character(request.body).updateNbFish();
        next();
      }
    } catch (error) {
      console.log(error);
      response.status(500).json(error.message);
    }
  },
};
