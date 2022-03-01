const CharCompetence = require('../models/charCompetence');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {
  async findAllByCharacterId(request, response) {
    try {
      const charCompetence = await CharCompetence.findAllByCharacterId(
        request.body.characterId
      );
      const token = jwt.makeToken(request.userId);
      response.setHeader('Authorization', jwt.makeToken(request.userId));
      await dbCache.set('user-0' + request.userId, token, {
        EX: 4 * 60 * 60,
        NX: false,
      });
      response.status(201).json(charCompetence);
    } catch (error) {
      console.log(error);
      response.status(500).json(error.message);
    }
  },
};
