const CharSuccess = require('../models/charSuccess');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {
  async add(request, response) {
    try {
      const charSuccess = await new CharSuccess(request.body).add();
      const token = jwt.makeToken(request.userId);
      response.setHeader('Authorization', jwt.makeToken(request.userId));
      await dbCache.set('user-0' + request.userId, token, {
        EX: 4 * 60 * 60,
        NX: false,
      });
      response.status(201).json(charSuccess);
    } catch (error) {
      console.log(error);
      response.status(500).json(error.message);
    }
  },
};
