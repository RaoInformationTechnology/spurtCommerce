const { series, rimraf, } = require('nps-utils');

module.exports = {
    scripts: {
        default: 'nps start',
        /**
         * Starts the builded app from the dist directory.
         */
        start: {
            script: 'cross-env NODE_ENV=production node dist/app.js',
            description: 'Starts the builded app',
        },
        /**
         * Serves the current app and watches for changes to restart it
         */
        serve: {
            inspector: {
                script: series(
                    'nps banner.serve',
                    'apidoc -i src -o src/public/apidoc',
                    'nodemon --watch src --watch .env --inspect'
                ),
                description: 'Serves the current app and watches for changes to restart it, you may attach inspector to it.'
            },
            script: series(
                'nps banner.serve',
                'apidoc -i src -o src/public/apidoc',
                'nodemon --watch src --watch .env'
            ),
            description: 'Serves the current app and watches for changes to restart it'
        },
        /**
         * Setup of the development environment
         */
        setup: {
            script: series(
                'npm install',
                'nps db.setup'
            ),
            description: 'Setup`s the development environment(npm & database)'
        },
        
        build: {
            script: series(
                'nps banner.build',
                'nps config',
                'nps lint',
                'nps clean.dist',
                'nps transpile',
                'nps copy',
                'nps copy.tmp',
                'nps clean.tmp'
            ),
            description: 'Builds the app into the dist directory'
        },
        
        clean: {
            default: {
                script: series(
                    `nps banner.clean`,
                    `nps clean.dist`
                ),
                description: 'Deletes the ./dist folder'
            },
            dist: {
                script: rimraf('./dist'),
                hiddenFromHelp: true
            },
            tmp: {
                script: rimraf('./.tmp'),
                hiddenFromHelp: true
            }
        },
        /**
         * Copies static files to the build folder
         */
        copy: {
            default: {
                script: series(
                    `nps copy.public`,
                    `nps copy.swagger`
                ),
                hiddenFromHelp: true
            },
            swagger: {
                script: copyDir(
                    './src/public/apidoc/',
                    './dist/public/apidoc/'
                ),
                hiddenFromHelp: true
            },
            public: {
                script: copy(
                    './src/public/*',
                    './dist'
                ),
                hiddenFromHelp: true
            },
            tmp: {
                script: copyDir(
                    './.tmp/src',
                    './dist'
                ),
                hiddenFromHelp: true
            }
        },
        /**
         * Database scripts
         */
        db: {
            migrate: {
                script: series(
                    'nps banner.migrate',
                    'nps config',
                    runFast('./node_modules/typeorm/cli.js migration:run')
                ),
                description: 'Migrates the database to newest version available'
            },
            revert: {
                script: series(
                    'nps banner.revert',
                    'nps config',
                    runFast('./node_modules/typeorm/cli.js migration:revert')
                ),
                description: 'Downgrades the database'
            },
            
            drop: {
                script: runFast('./node_modules/typeorm/cli.js schema:drop'),
                description: 'Drops the schema of the database'
            },
            setup: {
                script: series(
                    'nps db.drop',
                    'nps db.migrate',
                    'nps db.seed'
                ),
                description: 'Recreates the database with seeded data'
            }
        },
        
    }
};

function banner(name) {
    return {
        hiddenFromHelp: true,
        silent: true,
        description: `Shows ${name} banners to the console`,
        script: runFast(`./commands/banner.ts ${name}`),
    };
}

function copy(source, target) {
    return `copyfiles --up 1 ${source} ${target}`;
}

function copyDir(source, target) {
    return `ncp ${source} ${target}`;
}

function run(path) {
    return `ts-node ${path}`;
}

function runFast(path) {
    return `ts-node --transpileOnly ${path}`;
}

function tslint(path) {
    return `tslint -c ./tslint.json ${path} --format stylish`;
}
