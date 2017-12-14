const { environment } = require('@rails/webpacker');
const sharedConfig = require('./shared');

environment.config.merge(sharedConfig);

module.exports = environment;
