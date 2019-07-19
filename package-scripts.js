const { series, rimraf, } = require('nps-utils');

module.exports = {
    scripts: {
        default: 'nps start',        
        start: {
            script: 'cross-env NODE_ENV=production node server.js',
            description: 'Starts the builded app',
        },
    }
};


