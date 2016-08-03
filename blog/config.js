// # Ghost Configuration
// Setup your Ghost install for various [environments](http://support.ghost.org/config/#about-environments).

// Ghost runs in `development` mode by default. Full documentation can be found at http://support.ghost.org/config/

var path = require('path'),
    config;

config = {
    production: {
        url: 'http://my-ghost-blog.com',
        mail: {},
        database: {
            client: 'mysql',
            connection: {
                host     : 'mysql-dev',
                user     : 'root',
                password : 'nmrony',
                database : 'ghost_nmrony_info',
                charset  : 'utf8'
            }
        },
        server: {
            host: '0.0.0.0',
            port: '2368'
        }
    },

    // ### Development **(default)**
    development: {
        url: 'http://blog.nmrony.docker',
        database: {
            client: 'mysql',
            connection: {
                host     : 'mysql-dev',
                user     : 'root',
                password : 'nmrony',
                database : 'ghost_nmrony_info',
                charset  : 'utf8'
            }
        },
        server: {
            // Host to be passed to node's `net.Server#listen()`
            host: '0.0.0.0',
            // Port to be passed to node's `net.Server#listen()`, for iisnode set this to `process.env.PORT`
            port: '2368'
        },
        paths: {
            contentPath: path.join(__dirname, '/')
        }
    }
};

module.exports = config;
