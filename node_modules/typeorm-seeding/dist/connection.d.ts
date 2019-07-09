import { Connection } from 'typeorm';
/**
 * Returns a TypeORM database connection for our entity-manager
 */
export declare const loadConnection: () => Promise<Connection>;
