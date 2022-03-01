const Competence = require('../models/competence');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {
  async findAll(request, response) {
    try {
      const allCompetences = await Competence.findAll();
      const token = jwt.makeToken(request.userId);
      response.setHeader('Authorization', jwt.makeToken(request.userId));
      await dbCache.set('user-0' + request.userId, token, {
        EX: 4 * 60 * 60,
        NX: false,
      });
      response.status(201).json(allCompetences);
    } catch (error) {
      console.log(error);
      response.status(500).json(error.message);
    }
  },
};
