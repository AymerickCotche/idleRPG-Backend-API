const Sucess = require('../models/sucess');

module.exports = {
  async findAll(request, response, next) {
    try {
      const allSuccess = await Sucess.findAll();
      response.locals.allSuccess = allSuccess;
      next();
    } catch (error) {
      console.log(error);
      response.status(500).json(error.message);
    }
  },
};
