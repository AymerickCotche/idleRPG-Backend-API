const Inventory = require('../models/inventory');
const jwt = require('../services/jwt');
const dbCache = require('../services/cache');

module.exports = {

    async checkExists (request, response, next) {
        try {
            if(response.locals.equExists === false) {
                response.locals.nothingToDo = true;
                next();
            } else if (response.locals.equExists === true) {
                response.locals.nothingToDo = false;
                const exists = await new Inventory(request.body).checkExists();
                response.locals.exists = exists;
                request.body.quantity = 1;
                next();
            } else {
                if(request.body.plusExp) response.locals.nothingToDo = false;
                const exists = await new Inventory(request.body).checkExists();
                response.locals.exists = exists;
                next();
            }
            
        } catch (error) {
            console.log(error);
            response.status(500).json(error.message)
        }
}
}